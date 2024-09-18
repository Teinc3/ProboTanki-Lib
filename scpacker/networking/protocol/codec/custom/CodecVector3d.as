package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.§#""§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecVector3d extends §#""§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §=!m§:ICodec;
      
      private var §#T§:ICodec;
      
      private var §-!k§:ICodec;
      
      public function CodecVector3d(param1:§?"s§)
      {
         super();
         this.§=!m§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§#T§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§-!k§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(§each catch else§(param1))
         {
            return null;
         }
         var _loc2_:§#">§ = new §#">§();
         _loc2_.x = this.§=!m§.decode(param1) as Number;
         _loc2_.y = this.§#T§.decode(param1) as Number;
         _loc2_.z = this.§-!k§.decode(param1) as Number;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 1;
         if(§%"s§(param1,param2))
         {
            return _loc3_;
         }
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:§#">§ = §#">§(param2);
         _loc3_ += this.§=!m§.encode(param1,_loc4_.x);
         _loc3_ += this.§#T§.encode(param1,_loc4_.y);
         return _loc3_ + this.§-!k§.encode(param1,_loc4_.z);
      }
   }
}

