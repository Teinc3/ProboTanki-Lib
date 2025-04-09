from ...packets import AbstractPacket


class Completed_Mission(AbstractPacket):
    id = 1579425801
    description = "A mission was completed and is available to claim"


__all__ = ["Completed_Mission"]