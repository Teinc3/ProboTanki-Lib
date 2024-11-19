from .abstractprocessor import AbstractProcessor
from bot.enums import ProcessorCodes, ProcessorIDs
from lib.modules.packetmanager import packetManager


class BattleProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_BATTLE
    
    def process_packets(self):
        pass