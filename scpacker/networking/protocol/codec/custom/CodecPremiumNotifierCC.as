package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierCC;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecPremiumNotifierCC implements ICodec
   {
      private var Renamed10704:ICodec;
      
      public function CodecPremiumNotifierCC(param1:Renamed536)
      {
         super();
         this.Renamed10704 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:PremiumNotifierCC = new PremiumNotifierCC();
         _loc2_.lifeTimeInSeconds = this.Renamed10704.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:PremiumNotifierCC = PremiumNotifierCC(param2);
         this.Renamed10704.encode(param1,_loc3_.lifeTimeInSeconds);
         return 4;
      }
   }
}

