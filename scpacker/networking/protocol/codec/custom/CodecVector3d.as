package scpacker.networking.protocol.codec.custom
{
   import Renamed602.Renamed603;
   import Renamed5811.Renamed9342;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecVector3d extends Renamed9342 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10762:ICodec;
      
      private var Renamed10763:ICodec;
      
      private var Renamed10764:ICodec;
      
      public function CodecVector3d(param1:Renamed536)
      {
         super();
         this.Renamed10762 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10763 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10764 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(Renamed9343(param1))
         {
            return null;
         }
         var _loc2_:Renamed603 = new Renamed603();
         _loc2_.x = this.Renamed10762.decode(param1) as Number;
         _loc2_.y = this.Renamed10763.decode(param1) as Number;
         _loc2_.z = this.Renamed10764.decode(param1) as Number;
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
         var _loc4_:Renamed603 = Renamed603(param2);
         _loc3_ += this.Renamed10762.encode(param1,_loc4_.x);
         _loc3_ += this.Renamed10763.encode(param1,_loc4_.y);
         return _loc3_ + this.Renamed10764.encode(param1,_loc4_.z);
      }
   }
}

