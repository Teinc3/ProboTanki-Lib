package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import §class const var§.§6z§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecWeeklyQuestRewardItem implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §8;§:ICodec;
      
      private var §static set catch§:ICodec;
      
      public function CodecWeeklyQuestRewardItem(param1:§?"s§)
      {
         super();
         this.§8;§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§static set catch§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§6z§ = new §6z§();
         _loc2_.count = this.§8;§.decode(param1) as int;
         _loc2_.§super const return§ = this.§static set catch§.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§6z§ = §6z§(param2);
         this.§8;§.encode(param1,_loc3_.count);
         this.§static set catch§.encode(param1,_loc3_.§super const return§);
         return 4;
      }
   }
}

