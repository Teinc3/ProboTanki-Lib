package scpacker.networking.protocol.codec.custom
{
   import §5""§.§-k§;
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecAssaultBase implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §default set native§:ICodec;
      
      private var §static var true§:ICodec;
      
      public function CodecAssaultBase(param1:§?"s§)
      {
         super();
         this.§default set native§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§static var true§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§-k§ = new §-k§();
         _loc2_.id = this.§default set native§.decode(param1) as int;
         _loc2_.position = this.§static var true§.decode(param1) as §#">§;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§-k§ = §-k§(param2);
         this.§default set native§.encode(param1,_loc3_.id);
         this.§static var true§.encode(param1,_loc3_.position);
         return 4;
      }
   }
}

