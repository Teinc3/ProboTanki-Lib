package scpacker.networking.protocol.codec.custom
{
   import §0#W§.§&h§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecWeeklyQuestDescription implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §3"i§:ICodec;
      
      private var §="#§:ICodec;
      
      private var §if const false§:ICodec;
      
      private var §var set break§:ICodec;
      
      private var §finally var finally§:ICodec;
      
      public function CodecWeeklyQuestDescription(param1:§?"s§)
      {
         super();
         this.§3"i§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§="#§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§if const false§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§var set break§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§finally var finally§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§&h§ = new §&h§();
         _loc2_.§dynamic for function§ = this.§3"i§.decode(param1) as int;
         _loc2_.§function for while§ = this.§="#§.decode(param1) as int;
         _loc2_.§3"a§ = this.§if const false§.decode(param1) as Boolean;
         _loc2_.§#"8§ = this.§var set break§.decode(param1) as ImageResource;
         _loc2_.§each const while§ = this.§finally var finally§.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§&h§ = §&h§(param2);
         this.§3"i§.encode(param1,_loc3_.§dynamic for function§);
         this.§="#§.encode(param1,_loc3_.§function for while§);
         this.§if const false§.encode(param1,_loc3_.§3"a§);
         this.§var set break§.encode(param1,_loc3_.§#"8§);
         this.§finally var finally§.encode(param1,_loc3_.§each const while§);
         return 4;
      }
   }
}

