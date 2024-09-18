package scpacker.networking.protocol.codec.custom
{
   import §>#m§.§5!"§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.dailyquest.§native const in§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecDailyQuestInfo implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §true return§:ICodec;
      
      private var §implements var extends§:ICodec;
      
      private var §null catch get§:ICodec;
      
      private var §6Z§:ICodec;
      
      private var §"O§:ICodec;
      
      private var §%#S§:ICodec;
      
      private var §!#U§:ICodec;
      
      private var §return implements§:ICodec;
      
      public function CodecDailyQuestInfo(param1:§?"s§)
      {
         super();
         this.§true return§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§implements var extends§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§null catch get§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§6Z§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§"O§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecDailyQuestPrizeInfo");
         this.§%#S§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§!#U§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§return implements§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§5!"§ = new §5!"§();
         _loc2_.§6#J§ = this.§true return§.decode(param1) as Boolean;
         _loc2_.description = this.§implements var extends§.decode(param1) as String;
         _loc2_.§2!O§ = this.§null catch get§.decode(param1) as int;
         _loc2_.image = this.§6Z§.decode(param1) as ImageResource;
         _loc2_.§,"5§ = this.§"O§.decode(param1) as Vector.<§native const in§>;
         _loc2_.progress = this.§%#S§.decode(param1) as int;
         _loc2_.questId = Long.getLong(0,this.§!#U§.decode(param1) as int);
         _loc2_.§6#6§ = this.§return implements§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§5!"§ = §5!"§(param2);
         this.§true return§.encode(param1,_loc3_.§6#J§);
         this.§implements var extends§.encode(param1,_loc3_.description);
         this.§null catch get§.encode(param1,_loc3_.§2!O§);
         this.§6Z§.encode(param1,_loc3_.image);
         this.§"O§.encode(param1,_loc3_.§,"5§);
         this.§%#S§.encode(param1,_loc3_.progress);
         this.§!#U§.encode(param1,_loc3_.questId.low);
         this.§return implements§.encode(param1,_loc3_.§6#6§);
         return 4;
      }
   }
}

