package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   import §with const throw§.§["R§;
   
   public class CodecMoveCommand implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §include else§:ICodec;
      
      private var §1#`§:ICodec;
      
      private var §throw catch null§:ICodec;
      
      private var §5!]§:ICodec;
      
      private var §static var true§:ICodec;
      
      public function CodecMoveCommand(param1:§?"s§)
      {
         super();
         this.§include else§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§1#`§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.§throw catch null§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§5!]§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§static var true§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§["R§ = new §["R§();
         _loc2_.angularVelocity = this.§include else§.decode(param1) as §#">§;
         _loc2_.control = this.§1#`§.decode(param1) as int;
         _loc2_.§const null§ = this.§throw catch null§.decode(param1) as §#">§;
         _loc2_.orientation = this.§5!]§.decode(param1) as §#">§;
         _loc2_.position = this.§static var true§.decode(param1) as §#">§;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:§["R§ = §["R§(param2);
         _loc3_ += this.§include else§.encode(param1,_loc4_.angularVelocity);
         _loc3_ += this.§1#`§.encode(param1,_loc4_.control);
         _loc3_ += this.§throw catch null§.encode(param1,_loc4_.§const null§);
         _loc3_ += this.§5!]§.encode(param1,_loc4_.orientation);
         return _loc3_ + this.§static var true§.encode(param1,_loc4_.position);
      }
   }
}

