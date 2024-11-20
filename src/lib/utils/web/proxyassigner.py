import os
import json
import requests

WEBSHARE_API = "https://proxy.webshare.io/api/v2/proxy/list/?mode=direct&page=1&page_size=25"
# Yes I will write down the token here bcz its a free account + private project so who cares
WEBSHARE_TOKEN = "q5op7rl3joa4c8syvyvdco5jwylznuvyktcbsk3s"

if __name__ == "__main__":
    path_to_file = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..", "..", "credentials.json"))
    
    with open(path_to_file, "r") as f:
        credentials = json.load(f)
    new_credentials = { "accounts": [] }

    # Make a request to the Webshare API
    response = requests.get(WEBSHARE_API, headers={ "Authorization": f"Token {WEBSHARE_TOKEN}" })
    if response.status_code != 200:
        print("Failed to fetch proxies from Webshare")
        exit(1)

    proxies = response.json()['results']
    proxy_count = len(proxies)

    current_proxy_index = 0
    current_proxy_usage = 1
    for credential in credentials['accounts']:
        # Add a designated IP
        if proxies[current_proxy_index]["valid"] == True:
            credential["proxy"] = proxies[current_proxy_index]["proxy_address"]
            credential["port"] = proxies[current_proxy_index]["port"]
            new_credentials["accounts"].append(credential)

        current_proxy_usage += 1
        if current_proxy_usage >= 5:
            current_proxy_index += 1
            current_proxy_usage = 1
        
        if current_proxy_index >= proxy_count:
            # Write back all other existing credentials that don't have a proxy assigned
            new_credentials["accounts"].extend(credentials['accounts'][len(new_credentials["accounts"]):])
            break

    # Write the new credentials to a file
    with open(path_to_file, "w") as f:
        json.dump(new_credentials, f, indent=2)
    
    print("New credentials written")