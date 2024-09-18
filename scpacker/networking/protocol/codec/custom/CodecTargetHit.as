package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import §each throw§.§super set var§;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecTargetHit implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §9#A§:TankUsersRegistry;
      
      private var §5p§:ICodec;
      
      private var §7#0§:ICodec;
      
      private var §try catch false§:ICodec;
      
      private var §include catch function§:ICodec;
      
      public function CodecTargetHit(param1:§?"s§)
      {
         super();
         this.§9#A§ = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.§5p§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§7#0§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§try catch false§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.§include catch function§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§super set var§ = new §super set var§();
         _loc2_.direction = this.§5p§.decode(param1) as §#">§;
         _loc2_.§package var true§ = this.§7#0§.decode(param1) as §#">§;
         _loc2_.§case const case§ = this.§try catch false§.decode(param1) as int;
         _loc2_.target = this.§9#A§.§if for with§(this.§include catch function§.decode(param1) as String);
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:§super set var§ = §super set var§(param2);
         _loc3_ += this.§5p§.encode(param1,_loc4_.direction);
         _loc3_ += this.§7#0§.encode(param1,_loc4_.§package var true§);
         _loc3_ += this.§try catch false§.encode(param1,_loc4_.§case const case§);
         return _loc3_ + this.§include catch function§.encode(param1,_loc4_.target);
      }
   }
}

