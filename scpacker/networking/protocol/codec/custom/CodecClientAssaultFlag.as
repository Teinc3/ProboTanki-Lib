package scpacker.networking.protocol.codec.custom
{
   import §5""§.§`"'§;
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecClientAssaultFlag implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §throw const throw§:ICodec;
      
      private var §'"?§:ICodec;
      
      private var §0!F§:ICodec;
      
      private var §default set native§:ICodec;
      
      public function CodecClientAssaultFlag(param1:§?"s§)
      {
         super();
         this.§throw const throw§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§'"?§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§0!F§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§default set native§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§`"'§ = new §`"'§();
         _loc2_.§do const do§ = this.§throw const throw§.decode(param1) as §#">§;
         _loc2_.§=!u§ = this.§'"?§.decode(param1) as String;
         _loc2_.§final for each§ = this.§0!F§.decode(param1) as §#">§;
         _loc2_.id = this.§default set native§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§`"'§ = §`"'§(param2);
         this.§throw const throw§.encode(param1,_loc3_.§do const do§);
         this.§'"?§.encode(param1,_loc3_.§=!u§);
         this.§0!F§.encode(param1,_loc3_.§final for each§);
         this.§default set native§.encode(param1,_loc3_.id);
         return 4;
      }
   }
}

