from ..basecodec import BaseCodec


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
        self._buffer.write_int(len(value))
        self._buffer.write_string(value)
        return 1 + 4 + len(value)
