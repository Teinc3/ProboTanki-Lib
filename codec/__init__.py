# As the base codecs should be imported directly through the file name
# If they import the base codecs from here, it will cause a circular import
# So only use this for AbstractPacket's importing of BaseCodec

from .basecodec import BaseCodec