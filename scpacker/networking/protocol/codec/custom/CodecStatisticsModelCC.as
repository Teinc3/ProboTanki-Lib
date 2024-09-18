package scpacker.networking.protocol.codec.custom
{
   import §1!R§.§throw package static§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import §break for null§.§'B§;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.client.battleservice.model.statistics.§final const finally§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecStatisticsModelCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §set const class§:ICodec;
      
      private var §with package dynamic§:ICodec;
      
      private var §for catch return§:ICodec;
      
      private var §2!R§:ICodec;
      
      private var §with for catch§:ICodec;
      
      private var §;#Q§:ICodec;
      
      private var §3$$§:ICodec;
      
      private var §9"e§:ICodec;
      
      private var §<!h§:ICodec;
      
      private var §0#J§:ICodec;
      
      private var §&"!§:ICodec;
      
      private var §import catch false§:ICodec;
      
      private var §else else§:ICodec;
      
      private var §>![§:ICodec;
      
      private var §catch for include§:ICodec;
      
      public function CodecStatisticsModelCC(param1:§?"s§)
      {
         super();
         this.§set const class§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.§with package dynamic§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecEquipmentConstraintsMode");
         this.§for catch return§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§2!R§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleLimits");
         this.§with for catch§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§;#Q§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§3$$§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§9"e§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§<!h§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§0#J§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§&"!§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§import catch false§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§else else§ = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
         this.§>![§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§catch for include§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§final const finally§ = new §final const finally§();
         _loc2_.battleMode = this.§set const class§.decode(param1) as §final package import§;
         _loc2_.equipmentConstraintsMode = this.§with package dynamic§.decode(param1) as §throw package static§;
         _loc2_.fund = this.§for catch return§.decode(param1) as int;
         _loc2_.§function function§ = this.§2!R§.decode(param1) as §'B§;
         _loc2_.mapName = this.§with for catch§.decode(param1) as String;
         _loc2_.maxPeopleCount = this.§3$$§.decode(param1) as int;
         _loc2_.parkourMode = this.§0#J§.decode(param1) as Boolean;
         _loc2_.§include const while§ = this.§&"!§.decode(param1) as int;
         _loc2_.spectator = this.§import catch false§.decode(param1) as Boolean;
         _loc2_.§`#L§ = this.§else else§.decode(param1) as Vector.<String>;
         _loc2_.§in if§ = this.§>![§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§final const finally§ = §final const finally§(param2);
         this.§with package dynamic§.encode(param1,_loc3_.equipmentConstraintsMode);
         this.§for catch return§.encode(param1,_loc3_.fund);
         this.§2!R§.encode(param1,_loc3_.§function function§);
         this.§with for catch§.encode(param1,_loc3_.mapName);
         this.§;#Q§.encode(param1,_loc3_.§-!=§);
         this.§3$$§.encode(param1,_loc3_.maxPeopleCount);
         this.§9"e§.encode(param1,_loc3_.§'"8§);
         this.§<!h§.encode(param1,_loc3_.§include catch get§);
         this.§0#J§.encode(param1,_loc3_.parkourMode);
         this.§&"!§.encode(param1,_loc3_.§include const while§);
         this.§import catch false§.encode(param1,_loc3_.spectator);
         this.§else else§.encode(param1,_loc3_.§`#L§);
         this.§>![§.encode(param1,_loc3_.§in if§);
         this.§catch for include§.encode(param1,_loc3_.§in continue§);
         return 4;
      }
   }
}

