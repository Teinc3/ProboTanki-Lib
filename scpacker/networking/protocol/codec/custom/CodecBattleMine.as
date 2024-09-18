package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import §catch set default§.§%2§;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleMine implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §"#u§:ICodec;
      
      private var §set for package§:ICodec;
      
      private var §final catch true§:ICodec;
      
      private var §static var true§:ICodec;
      
      public function CodecBattleMine(param1:§?"s§)
      {
         super();
         this.§"#u§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§set for package§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§final catch true§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§static var true§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§%2§ = new §%2§();
         _loc2_.activated = true;
         _loc2_.mineId = this.§set for package§.decode(param1) as String;
         _loc2_.ownerId = this.§final catch true§.decode(param1) as String;
         _loc2_.position = this.§static var true§.decode(param1) as §#">§;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§%2§ = §%2§(param2);
         this.§"#u§.encode(param1,_loc3_.activated);
         this.§set for package§.encode(param1,_loc3_.mineId);
         this.§final catch true§.encode(param1,_loc3_.ownerId);
         this.§static var true§.encode(param1,_loc3_.position);
         return 4;
      }
   }
}

