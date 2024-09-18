package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import §break for null§.§'B§;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleLimits implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §use var get§:ICodec;
      
      private var §extends catch final§:ICodec;
      
      public function CodecBattleLimits(param1:§?"s§)
      {
         super();
         this.§use var get§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§extends catch final§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§'B§ = new §'B§();
         _loc2_.scoreLimit = this.§use var get§.decode(param1) as int;
         _loc2_.timeLimitInSec = this.§extends catch final§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§'B§ = §'B§(param2);
         var _loc4_:int = 0;
         return (_loc4_ = _loc4_ + this.§use var get§.encode(param1,_loc3_.scoreLimit)) + this.§extends catch final§.encode(param1,_loc3_.timeLimitInSec);
      }
   }
}

