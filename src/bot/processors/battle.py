from bot.enums import ProcessorIDs
from .abstractprocessor import AbstractProcessor


class BattleProcessor(AbstractProcessor):
    processorID = ProcessorIDs.P_BATTLE

    def process_packets(self):
        pass
