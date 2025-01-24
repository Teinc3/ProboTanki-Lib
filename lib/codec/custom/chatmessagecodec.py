from lib.codec.base import CustomBaseCodec
from lib.codec.complex import StringCodec
from lib.codec.primitive import BoolCodec
from .userstatuscodec import UserStatusCodec


class ChatMessageCodec(CustomBaseCodec):
    attributes = ["authorStatus", "systemMessage", "targetStatus", "message", "warning"]
    codecs = [UserStatusCodec, BoolCodec, UserStatusCodec, StringCodec, BoolCodec]
