package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecPremiumNotifierData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10705:ICodec;
      
      private var Renamed10607:ICodec;
      
      public function CodecPremiumNotifierData(param1:Renamed536)
      {
         super();
         this.Renamed10705 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10607 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:PremiumNotifierData = new PremiumNotifierData();
         _loc2_.premiumTimeLeftInSeconds = this.Renamed10705.decode(param1) as int;
         _loc2_.userId = this.Renamed10607.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:PremiumNotifierData = PremiumNotifierData(param2);
         this.Renamed10705.encode(param1,_loc3_.premiumTimeLeftInSeconds);
         this.Renamed10607.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

