import enum

class ProcessorIDs(enum.Enum):
    P_ENTRY = 0
    P_LOBBY = 1
    P_BATTLE = 2

class ProcessorCodes(enum.Enum):
    SOCKET_ERROR = "Socket error."
    INVITE_CODE_REQUIRED = "Invite code is required."
    WRONG_CREDENTIALS = "Wrong credentials. Socket aborted."
    STAFF_SCRAPER_ERROR = "No staff members scraped. Socket aborted."