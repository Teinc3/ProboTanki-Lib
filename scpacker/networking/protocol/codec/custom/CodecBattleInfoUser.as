package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleInfoUser implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §0[§:ICodec;
      
      private var §each package do§:ICodec;
      
      private var §1!O§:ICodec;
      
      private var §try set use§:ICodec;
      
      public function CodecBattleInfoUser(param1:§?"s§)
      {
         super();
         this.§0[§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§each package do§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§1!O§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§try set use§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleInfoUser = new BattleInfoUser();
         _loc2_.kills = this.§0[§.decode(param1) as int;
         _loc2_.score = this.§each package do§.decode(param1) as int;
         _loc2_.suspicious = this.§1!O§.decode(param1) as Boolean;
         _loc2_.user = this.§try set use§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BattleInfoUser = BattleInfoUser(param2);
         var _loc4_:int = 0;
         return (_loc4_ = (_loc4_ = (_loc4_ = _loc4_ + this.§0[§.encode(param1,_loc3_.kills)) + this.§each package do§.encode(param1,_loc3_.score)) + this.§1!O§.encode(param1,_loc3_.suspicious)) + this.§try set use§.encode(param1,_loc3_.user);
      }
   }
}

