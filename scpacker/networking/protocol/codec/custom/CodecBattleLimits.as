package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed312.Renamed1585;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecBattleLimits implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10583:ICodec;
      
      private var Renamed10584:ICodec;
      
      public function CodecBattleLimits(param1:Renamed536)
      {
         super();
         this.Renamed10583 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10584 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed1585 = new Renamed1585();
         _loc2_.scoreLimit = this.Renamed10583.decode(param1) as int;
         _loc2_.timeLimitInSec = this.Renamed10584.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed1585 = Renamed1585(param2);
         var _loc4_:int = 0;
         return (_loc4_ = _loc4_ + this.Renamed10583.encode(param1,_loc3_.scoreLimit)) + this.Renamed10584.encode(param1,_loc3_.timeLimitInSec);
      }
   }
}

