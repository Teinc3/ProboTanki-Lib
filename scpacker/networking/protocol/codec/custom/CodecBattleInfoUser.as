package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecBattleInfoUser implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10573:ICodec;
      
      private var Renamed10574:ICodec;
      
      private var Renamed10575:ICodec;
      
      private var Renamed10576:ICodec;
      
      public function CodecBattleInfoUser(param1:Renamed536)
      {
         super();
         this.Renamed10573 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10574 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10575 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10576 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BattleInfoUser = new BattleInfoUser();
         _loc2_.kills = this.Renamed10573.decode(param1) as int;
         _loc2_.score = this.Renamed10574.decode(param1) as int;
         _loc2_.suspicious = this.Renamed10575.decode(param1) as Boolean;
         _loc2_.user = this.Renamed10576.decode(param1) as String;
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
         return (_loc4_ = (_loc4_ = (_loc4_ = _loc4_ + this.Renamed10573.encode(param1,_loc3_.kills)) + this.Renamed10574.encode(param1,_loc3_.score)) + this.Renamed10575.encode(param1,_loc3_.suspicious)) + this.Renamed10576.encode(param1,_loc3_.user);
      }
   }
}

