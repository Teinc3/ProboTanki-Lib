package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecPremiumNotifierCC implements ICodec
   {
      private var §[s§:ICodec;
      
      public function CodecPremiumNotifierCC(param1:§?"s§)
      {
         super();
         this.§[s§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:PremiumNotifierCC = new PremiumNotifierCC();
         _loc2_.lifeTimeInSeconds = this.§[s§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:PremiumNotifierCC = PremiumNotifierCC(param2);
         this.§[s§.encode(param1,_loc3_.lifeTimeInSeconds);
         return 4;
      }
   }
}

