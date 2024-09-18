package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserStat implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §static var use§:ICodec;
      
      private var §0[§:ICodec;
      
      private var §each package do§:ICodec;
      
      private var §try set use§:ICodec;
      
      public function CodecUserStat(param1:§?"s§)
      {
         super();
         this.§static var use§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§0[§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§each package do§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§try set use§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§%q§ = new §%q§();
         _loc2_.deaths = this.§static var use§.decode(param1) as int;
         _loc2_.kills = this.§0[§.decode(param1) as int;
         _loc2_.score = this.§each package do§.decode(param1) as int;
         _loc2_.user = this.§try set use§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§%q§ = §%q§(param2);
         this.§static var use§.encode(param1,_loc3_.deaths);
         this.§0[§.encode(param1,_loc3_.kills);
         this.§each package do§.encode(param1,_loc3_.score);
         this.§try set use§.encode(param1,_loc3_.user);
         return 4;
      }
   }
}

