package scpacker.networking.protocol.codec.custom
{
   import §1!R§.§throw package static§;
   import §?"a§.§finally for do§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import §break for null§.§'B§;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.§9"B§;
   import projects.tanks.client.battleservice.§<#p§;
   import projects.tanks.client.battleservice.§final package import§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleCreateParameters implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §&"<§:ICodec;
      
      private var §,N§:ICodec;
      
      private var §set const class§:ICodec;
      
      private var §<!z§:ICodec;
      
      private var §with package dynamic§:ICodec;
      
      private var §static package native§:ICodec;
      
      private var §2!R§:ICodec;
      
      private var §!U§:ICodec;
      
      private var §3$$§:ICodec;
      
      private var §+#!§:ICodec;
      
      private var §0#J§:ICodec;
      
      private var §`"+§:ICodec;
      
      private var §'!w§:ICodec;
      
      private var §"^§:ICodec;
      
      private var §%#v§:ICodec;
      
      private var §?#8§:ICodec;
      
      private var §const set for§:ICodec;
      
      private var §+#K§:ICodec;
      
      private var §switch set static§:ICodec;
      
      private var §in catch with§:ICodec;
      
      public function CodecBattleCreateParameters(param1:§?"s§)
      {
         super();
         this.§&"<§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§set const class§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.§<!z§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§with package dynamic§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecEquipmentConstraintsMode");
         this.§static package native§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§2!R§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleLimits");
         this.§!U§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§3$$§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§+#!§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§0#J§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§`"+§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§'!w§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§"^§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecRange");
         this.§%#v§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§?#8§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecMapTheme");
         this.§const set for§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§+#K§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§switch set static§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§in catch with§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§9"B§ = new §9"B§();
         _loc2_.autoBalance = this.§&"<§.decode(param1) as Boolean;
         _loc2_.battleMode = this.§set const class§.decode(param1) as §final package import§;
         _loc2_.equipmentConstraintsMode = this.§with package dynamic§.decode(param1) as §throw package static§;
         _loc2_.friendlyFire = this.§static package native§.decode(param1) as Boolean;
         _loc2_.§function function§ = this.§2!R§.decode(param1) as §'B§;
         _loc2_.mapId = this.§!U§.decode(param1) as String;
         _loc2_.maxPeopleCount = this.§3$$§.decode(param1) as int;
         _loc2_.name = this.§+#!§.decode(param1) as String;
         _loc2_.parkourMode = this.§0#J§.decode(param1) as Boolean;
         _loc2_.privateBattle = this.§`"+§.decode(param1) as Boolean;
         _loc2_.proBattle = this.§'!w§.decode(param1) as Boolean;
         _loc2_.rankRange = this.§"^§.decode(param1) as §<#p§;
         _loc2_.reArmorEnabled = this.§%#v§.decode(param1) as Boolean;
         _loc2_.theme = this.§?#8§.decode(param1) as §finally for do§;
         _loc2_.withoutBonuses = this.§const set for§.decode(param1) as Boolean;
         _loc2_.withoutCrystals = this.§+#K§.decode(param1) as Boolean;
         _loc2_.withoutSupplies = this.§switch set static§.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = 0;
         var _loc4_:§9"B§ = §9"B§(param2);
         _loc3_ += this.§&"<§.encode(param1,_loc4_.autoBalance);
         _loc3_ += this.§set const class§.encode(param1,_loc4_.battleMode);
         _loc3_ += this.§with package dynamic§.encode(param1,_loc4_.equipmentConstraintsMode);
         _loc3_ += this.§static package native§.encode(param1,_loc4_.friendlyFire);
         _loc3_ += this.§2!R§.encode(param1,_loc4_.§function function§);
         _loc3_ += this.§!U§.encode(param1,_loc4_.mapId);
         _loc3_ += this.§3$$§.encode(param1,_loc4_.maxPeopleCount);
         _loc3_ += this.§+#!§.encode(param1,_loc4_.name);
         _loc3_ += this.§0#J§.encode(param1,_loc4_.parkourMode);
         _loc3_ += this.§`"+§.encode(param1,_loc4_.privateBattle);
         _loc3_ += this.§'!w§.encode(param1,_loc4_.proBattle);
         _loc3_ += this.§"^§.encode(param1,_loc4_.rankRange);
         _loc3_ += this.§%#v§.encode(param1,_loc4_.reArmorEnabled);
         _loc3_ += this.§?#8§.encode(param1,_loc4_.theme);
         _loc3_ += this.§const set for§.encode(param1,_loc4_.withoutBonuses);
         _loc3_ += this.§+#K§.encode(param1,_loc4_.withoutCrystals);
         _loc3_ += this.§switch set static§.encode(param1,_loc4_.withoutSupplies);
         return _loc3_ + this.§in catch with§.encode(param1,_loc4_.§4#W§);
      }
   }
}

