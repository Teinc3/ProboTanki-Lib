package alternativa.protocol.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.primitive.ByteCodec;
   import alternativa.protocol.codec.primitive.DoubleCodec;
   import alternativa.protocol.codec.primitive.FloatCodec;
   import alternativa.protocol.codec.primitive.IntCodec;
   import alternativa.protocol.codec.primitive.LongCodec;
   import alternativa.protocol.codec.primitive.ShortCodec;
   import alternativa.protocol.codec.primitive.UByteCodec;
   import alternativa.protocol.codec.primitive.UIntCodec;
   import alternativa.protocol.codec.primitive.UShortCodec;
   import alternativa.protocol.impl.Protocol;
   import alternativa.types.Byte;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import alternativa.types.Short;
   import alternativa.types.UByte;
   import alternativa.types.UShort;
   
   public class ProtocolActivator implements IBundleActivator
   {
      public function ProtocolActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:IProtocol = Protocol.defaultInstance;
         param1.registerService(IProtocol,_loc2_);
         _loc2_.registerCodecForType(Byte,new ByteCodec());
         _loc2_.registerCodecForType(Float,new FloatCodec());
         _loc2_.registerCodecForType(Long,new LongCodec());
         _loc2_.registerCodecForType(Short,new ShortCodec());
         _loc2_.registerCodecForType(UByte,new UByteCodec());
         _loc2_.registerCodecForType(UShort,new UShortCodec());
         _loc2_.registerCodecForType(uint,new UIntCodec());
         _loc2_.registerCodecForType(int,new IntCodec());
         _loc2_.registerCodecForType(Number,new DoubleCodec());
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

