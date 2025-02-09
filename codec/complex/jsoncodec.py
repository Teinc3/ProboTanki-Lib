import json

from .stringcodec import StringCodec
from ..basecodec import BaseCodec


class JsonCodec(BaseCodec[dict]):
    """Codec for JSON objects"""

    def decode(self):
        return json.loads(StringCodec(self._buffer).decode())

    def encode(self, value):
        return StringCodec(self._buffer).encode(json.dumps(value, separators=(',', ':')))
