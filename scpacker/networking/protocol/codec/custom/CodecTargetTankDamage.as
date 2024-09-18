package scpacker.networking.protocol.codec.custom
{
   import Renamed194.Renamed5918;
   import Renamed194.Renamed5920;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecTargetTankDamage implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10738:ICodec;
      
      private var Renamed10739:ICodec;
      
      private var Renamed10735:ICodec;
      
      public function CodecTargetTankDamage(param1:Renamed536)
      {
         super();
         this.Renamed10738 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10739 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDamageIndicatorType");
         this.Renamed10735 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed5920 = new Renamed5920();
         _loc2_.Renamed5923 = this.Renamed10738.decode(param1) as Number;
         _loc2_.Renamed5924 = this.Renamed10739.decode(param1) as Renamed5918;
         _loc2_.target = this.Renamed10735.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Renamed5920 = Renamed5920(param2);
         _loc3_ += this.Renamed10738.encode(param1,_loc4_.Renamed5923);
         _loc3_ += this.Renamed10739.encode(param1,_loc4_.Renamed5924);
         return _loc3_ + this.Renamed10735.encode(param1,_loc4_.target);
      }
   }
}

