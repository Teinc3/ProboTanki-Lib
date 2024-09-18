package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   import §with const throw§.§^v§;
   
   public class CodecRotateTurretCommand implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §do case§:ICodec;
      
      private var §1#`§:ICodec;
      
      public function CodecRotateTurretCommand(param1:§?"s§)
      {
         super();
         this.§do case§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§1#`§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§^v§ = new §^v§();
         _loc2_.angle = this.§do case§.decode(param1) as Number;
         _loc2_.control = this.§1#`§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:§^v§ = §^v§(param2);
         _loc3_ += this.§do case§.encode(param1,_loc4_.angle);
         return _loc3_ + this.§1#`§.encode(param1,_loc4_.control);
      }
   }
}

