package scpacker.networking.protocol.codec.custom
{
   import §'!@§.§'"a§;
   import §'!@§.§,!;§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecTargetTankDamage implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §&!x§:ICodec;
      
      private var §9!n§:ICodec;
      
      private var §include catch function§:ICodec;
      
      public function CodecTargetTankDamage(param1:§?"s§)
      {
         super();
         this.§&!x§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§9!n§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDamageIndicatorType");
         this.§include catch function§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§,!;§ = new §,!;§();
         _loc2_.§package for§ = this.§&!x§.decode(param1) as Number;
         _loc2_.§case const package§ = this.§9!n§.decode(param1) as §'"a§;
         _loc2_.target = this.§include catch function§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:§,!;§ = §,!;§(param2);
         _loc3_ += this.§&!x§.encode(param1,_loc4_.§package for§);
         _loc3_ += this.§9!n§.encode(param1,_loc4_.§case const package§);
         return _loc3_ + this.§include catch function§.encode(param1,_loc4_.target);
      }
   }
}

