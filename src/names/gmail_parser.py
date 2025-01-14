import os
import json
import re
import base64
import logging
from typing import List, Dict, Optional
from bs4 import BeautifulSoup  # Requires installation
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build

# --------------------------
# Execution Mode
# 0 -> Load/email registrations (old functionality)
# 1 -> Fetch "Nickname Change Warning" emails (new functionality)
# --------------------------
MODE = 1

# If modifying these SCOPES, delete the file token.json.
SCOPES = ['https://www.googleapis.com/auth/gmail.modify']  # Changed scope to allow modifying emails

# Paths
CREDENTIALS_PATH = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'gmail_client_secret.json')
)
VALUABLE_NICKS_PATH = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '..', '..', 'data', 'valuablenicks.txt')
)
TOKEN_PATH = os.path.abspath(
    os.path.join(os.path.dirname(CREDENTIALS_PATH), 'token.json')
)
OUTPUT_PATH = os.path.abspath(
    os.path.join(os.path.dirname(CREDENTIALS_PATH), 'email_registrations.json')
)
LOG_PATH = os.path.abspath(
    os.path.join(os.path.dirname(CREDENTIALS_PATH), 'gmail_parser.log')
)

# Configure logging
logging.basicConfig(
    filename=LOG_PATH,
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s'
)

def authenticate_gmail() -> Optional[object]:
    creds = None
    if os.path.exists(TOKEN_PATH):
        creds = Credentials.from_authorized_user_file(TOKEN_PATH, SCOPES)
    # If there are no (valid) credentials available, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            try:
                creds.refresh(Request())
                logging.info("Credentials refreshed successfully.")
            except Exception as e:
                logging.error(f"Failed to refresh credentials: {e}")
                creds = None
        if not creds:
            try:
                flow = InstalledAppFlow.from_client_secrets_file(CREDENTIALS_PATH, SCOPES)
                creds = flow.run_local_server(port=0)
                logging.info("Authenticated via OAuth flow.")
            except Exception as e:
                logging.error(f"Authentication failed: {e}")
                return None
        # Save the credentials for the next run
        with open(TOKEN_PATH, 'w') as token:
            token.write(creds.to_json())
            logging.info("Saved new credentials to token.json.")
    try:
        service = build('gmail', 'v1', credentials=creds)
        logging.info("Gmail service built successfully.")
        return service
    except Exception as e:
        logging.error(f"Failed to build Gmail service: {e}")
        return None

def get_all_email_messages(service, custom_query: str = "") -> List[Dict]:
    """
    Fetch all email messages matching the given query.
    """
    results = []
    try:
        query = f"from:no-reply@pro-tanki.com {custom_query}".strip()
        response = service.users().messages().list(userId='me', q=query).execute()
        messages = response.get('messages', [])
        logging.info(f"Fetched {len(messages)} messages from no-reply@pro-tanki.com.")
        while 'nextPageToken' in response:
            page_token = response['nextPageToken']
            response = service.users().messages().list(
                userId='me',
                q=query,
                pageToken=page_token
            ).execute()
            fetched = response.get('messages', [])
            messages.extend(fetched)
            logging.info(f"Fetched additional {len(fetched)} messages.")
        return messages
    except Exception as e:
        logging.error(f"An error occurred while fetching messages: {e}")
        return results

def get_email_content(service, msg_id: str) -> str:
    try:
        message = service.users().messages().get(userId='me', id=msg_id, format='full').execute()
        payload = message.get('payload', {})
        
        # Check if the email has 'parts'
        if 'parts' in payload:
            parts = payload.get('parts', [])
            
            # Recursive function to extract text from parts
            def extract_text(parts) -> str:
                for part in parts:
                    if part.get('parts'):
                        text = extract_text(part.get('parts'))
                        if text:
                            return text
                    elif part.get('mimeType') == 'text/plain':
                        data = part.get('body', {}).get('data', '')
                        try:
                            decoded_data = base64.urlsafe_b64decode(data).decode('utf-8')
                            return decoded_data
                        except Exception as e:
                            logging.error(f"Error decoding text/plain part: {e}")
                            return ""
                    elif part.get('mimeType') == 'text/html':
                        data = part.get('body', {}).get('data', '')
                        try:
                            decoded_data = base64.urlsafe_b64decode(data).decode('utf-8')
                            # Parse HTML to extract text
                            soup = BeautifulSoup(decoded_data, 'html.parser')
                            text = soup.get_text(separator='\n')
                            return text
                        except Exception as e:
                            logging.error(f"Error decoding text/html part: {e}")
                            return ""
                return ""
            
            email_body = extract_text(parts)
            if not email_body:
                logging.warning(f"No text/plain or text/html parts found in email {msg_id}.")
            return email_body
        
        else:
            # Emails without 'parts' have the body directly under 'payload.body'
            body = payload.get('body', {}).get('data', '')
            if body:
                try:
                    decoded_body = base64.urlsafe_b64decode(body).decode('utf-8')
                    # Determine the MIME type to decide if parsing as HTML
                    mime_type = payload.get('mimeType', '')
                    if mime_type == 'text/html':
                        soup = BeautifulSoup(decoded_body, 'html.parser')
                        return soup.get_text(separator='\n')
                    else:
                        return decoded_body
                except Exception as e:
                    logging.error(f"Error decoding body of email {msg_id}: {e}")
                    return ""
            else:
                logging.warning(f"No body found in email {msg_id}.")
                return ""

    except Exception as e:
        logging.error(f"Failed to retrieve email {msg_id}: {e}")
        return ""

def extract_name_link(email_body: str) -> Dict[str, str]:
    # Updated regex patterns to handle names with spaces and both http/https links
    name_pattern = r"Hello,\s*([A-Za-z\s\-]+)!"
    link_pattern = r"(https?://\S+)"
    
    name_match = re.search(name_pattern, email_body)
    link_match = re.search(link_pattern, email_body)
    
    name = name_match.group(1).strip() if name_match else ""
    link = link_match.group(1).strip() if link_match else ""
    
    return {"name": name, "link": link}

def extract_nickname_change_warning(email_body: str) -> Dict[str, str]:
    """
    Email Body:
    ...\n\nYour account \nToilet\n has not been used to play...
    """
    pattern = r"Your account \n([A-Za-z]+)\n has not been"
    match = re.search(pattern, email_body, flags=re.IGNORECASE)
    if match:
        return match.group(1).strip()
    return ""

def main():
    service = authenticate_gmail()
    if not service:
        logging.error("Gmail service authentication failed. Exiting script.")
        print("Authentication failed. Check the log for details.")
        return
    
    if MODE == 0:
        # ==================================================
        # OLD FUNCTIONALITY: Load and save email registrations
        # ==================================================

        messages = get_all_email_messages(service, "after: 2024/12/17 subject: Confirmation of")
        registrations = []

        # Load existing registrations to avoid duplicates
        if os.path.exists(OUTPUT_PATH):
            try:
                with open(OUTPUT_PATH, 'r') as f:
                    existing_registrations = json.load(f)
                    registrations.extend(existing_registrations)
                    logging.info(f"Loaded {len(existing_registrations)} existing registrations.")
            except Exception as e:
                logging.error(f"Failed to load existing registrations: {e}")

        new_registrations = 0

        for msg in messages:
            content = get_email_content(service, msg['id'])
            if not content:
                continue
            data = extract_name_link(content)
            if data["name"] and data["link"]:
                if data not in registrations:
                    registrations.append(data)
                    new_registrations += 1

        # Save updated registrations
        try:
            with open(OUTPUT_PATH, 'w') as f:
                json.dump(registrations, f, indent=4)
            logging.info(f"Saved {len(registrations)} total registrations to {OUTPUT_PATH}.")
            print(f"Saved {len(registrations)} total registrations to {OUTPUT_PATH}.")
            print(f"Added {new_registrations} new registrations.")
        except Exception as e:
            logging.error(f"Failed to save registrations: {e}")
            print("Failed to save registrations. Check the log for details.")

    elif MODE == 1:
        # ==================================================
        # NEW FUNCTIONALITY (MODE = 1):  
        # Search for nickname change warnings & save potential names
        # ==================================================

        messages = get_all_email_messages(service, 'subject: Nickname Change Warning')
        if not messages:
            print("No 'Nickname Change Warning' emails found.")
            return

        valuable_nicks = []
        for msg in messages:
            content = get_email_content(service, msg['id'])
            if not content:
                continue
            nickname = extract_nickname_change_warning(content)
            if nickname:
                valuable_nicks.append(nickname)

        # Write the discovered nicknames to valuablenicks.txt
        if valuable_nicks:
            try:
                with open(VALUABLE_NICKS_PATH, 'w') as f:
                    for nick in valuable_nicks:
                        f.write(f"{nick}\n")
                print(f"Saved {len(valuable_nicks)} nicknames to {VALUABLE_NICKS_PATH}.")
            except Exception as e:
                logging.error(f"Failed to save nicknames: {e}")
                print("Failed to save nicknames. Check the log for details.")
        else:
            print("No valid nicknames found in 'Nickname Change Warning' emails.")


if __name__ == '__main__':
    main()