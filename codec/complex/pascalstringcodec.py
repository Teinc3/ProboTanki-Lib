from ..basecodec import BaseCodec
from ...utils import EByteArray


class PascalStringCodec(BaseCodec[str]):

    def decode(self):
        length = self._buffer.read_byte()
        if length < 0:
            length += 256
        if length == 0:
            return ""
        return self._buffer.read_string(length)

    def encode(self, value):
        string_buffer = EByteArray().write_string(value or "")
        length = len(string_buffer)
        if length > 255:
            raise ValueError(
                f"PascalStringCodec can only encode up to 255 bytes, got {length}"
            )

        self._buffer.write_byte(length if length <= 127 else length - 256)
        self._buffer.write(string_buffer)
        return 1 + length
