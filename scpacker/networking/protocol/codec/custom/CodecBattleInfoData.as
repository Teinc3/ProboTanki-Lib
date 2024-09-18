package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.§<#p§;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleInfoData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §set package finally§:ICodec;
      
      private var §with for catch§:ICodec;
      
      private var §=!D§:ICodec;
      
      private var §`"+§:ICodec;
      
      private var §'!w§:ICodec;
      
      private var §in var import§:ICodec;
      
      private var §9"[§:ICodec;
      
      private var §>!Y§:ICodec;
      
      public function CodecBattleInfoData(param1:§?"s§)
      {
         super();
         this.§set package finally§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§with for catch§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§=!D§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMode");
         this.§`"+§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§'!w§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§in var import§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecRange");
         this.§9"[§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§>!Y§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleInfoData = new BattleInfoData();
         _loc2_.battleId = this.§set package finally§.decode(param1) as String;
         _loc2_.mapName = this.§with for catch§.decode(param1) as String;
         _loc2_.mode = this.§=!D§.decode(param1) as §final package import§;
         _loc2_.privateBattle = this.§`"+§.decode(param1) as Boolean;
         _loc2_.proBattle = this.§'!w§.decode(param1) as Boolean;
         _loc2_.range = this.§in var import§.decode(param1) as §<#p§;
         _loc2_.serverNumber = this.§>!Y§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BattleInfoData = BattleInfoData(param2);
         this.§set package finally§.encode(param1,_loc3_.battleId);
         this.§with for catch§.encode(param1,_loc3_.mapName);
         this.§=!D§.encode(param1,_loc3_.mode);
         this.§`"+§.encode(param1,_loc3_.privateBattle);
         this.§'!w§.encode(param1,_loc3_.proBattle);
         this.§in var import§.encode(param1,_loc3_.range);
         this.§>!Y§.encode(param1,_loc3_.serverNumber);
         return 4;
      }
   }
}

