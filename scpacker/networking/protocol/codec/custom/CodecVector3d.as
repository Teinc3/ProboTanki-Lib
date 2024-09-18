package scpacker.networking.protocol.codec.custom
{
   import Renamed602.3DPositionVector;
   import Renamed5811.Renamed9342;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecVector3d extends Renamed9342 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var vectorXCodec:ICodec;
      
      private var vectorYCodec:ICodec;
      
      private var vectorZCodec:ICodec;
      
      public function CodecVector3d(param1:CodecRegisterer)
      {
         super();
         this.vectorXCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.vectorYCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.vectorZCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(Renamed9343(param1))
         {
            return null;
         }
         var _loc2_:3DPositionVector = new 3DPositionVector();
         _loc2_.x = this.vectorXCodec.decode(param1) as Number;
         _loc2_.y = this.vectorYCodec.decode(param1) as Number;
         _loc2_.z = this.vectorZCodec.decode(param1) as Number;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 1;
         if(Renamed9344(param1,param2))
         {
            return _loc3_;
         }
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:3DPositionVector = 3DPositionVector(param2);
         _loc3_ += this.vectorXCodec.encode(param1,_loc4_.x);
         _loc3_ += this.vectorYCodec.encode(param1,_loc4_.y);
         return _loc3_ + this.vectorZCodec.encode(param1,_loc4_.z);
      }
   }
}

