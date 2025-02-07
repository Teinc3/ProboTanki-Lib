from ..custombasecodec import CustomBaseCodec
from ..complex import StringCodec
from ..primitive import BoolCodec
from .userstatuscodec import UserStatusCodec


class ChatMessageCodec(CustomBaseCodec):
    attributes = ["authorStatus", "systemMessage", "targetStatus", "message", "warning"]
    codecs = [UserStatusCodec, BoolCodec, UserStatusCodec, StringCodec, BoolCodec]
