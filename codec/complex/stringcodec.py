from ..basecodec import BaseCodec
from ...utils import EByteArray


class StringCodec(BaseCodec[str]):
    """
    Codec for string values.

    1 Byte - Is string empty?
    (If empty, everything else is ignored)
    4 Bytes - String length
    Remaining Bytes - String value
    """

    def decode(self):
        is_empty = self._buffer.read_boolean()
        if is_empty:
            return ""
        length = self._buffer.read_int()
        return self._buffer.read_string(length)

    def encode(self, value):
        self._buffer.write_boolean(not value)
        if not value:
            return 1
        # NOTE: len() returns the length of the string in CHARS NOT BYTES!!!
        string_buffer = EByteArray().write_string(value)
        string_buffer_len = len(string_buffer)
        self._buffer.write_int(string_buffer_len)
        self._buffer.write(string_buffer)
        return 1 + 4 + string_buffer_len
