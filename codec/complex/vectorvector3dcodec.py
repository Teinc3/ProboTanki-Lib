from .vector3dcodec import Vector3DCodec
from ..factory import VectorCodecFactory

VectorVector3DCodec = VectorCodecFactory(dict, Vector3DCodec, True)
