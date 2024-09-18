package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.§2$ §;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserReward implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var § 1§:ICodec;
      
      private var §try catch super§:ICodec;
      
      private var §3",§:ICodec;
      
      private var §'#X§:ICodec;
      
      public function CodecUserReward(param1:§?"s§)
      {
         super();
         this.§ 1§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§try catch super§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§3",§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§'#X§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§2$ § = new §2$ §();
         _loc2_.§true for try§ = this.§ 1§.decode(param1) as int;
         _loc2_.§do const use§ = this.§try catch super§.decode(param1) as int;
         _loc2_.reward = this.§3",§.decode(param1) as int;
         _loc2_.userId = this.§'#X§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§2$ § = §2$ §(param2);
         this.§ 1§.encode(param1,_loc3_.§true for try§);
         this.§try catch super§.encode(param1,_loc3_.§do const use§);
         this.§3",§.encode(param1,_loc3_.reward);
         this.§'#X§.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

