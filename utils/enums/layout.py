from enum import Enum


class LayoutID(Enum):
    # Not autoenum as the values are given by the game
    ENTRY = -1
    LOBBY = 0
    GARAGE = 1
    BATTLE = 3