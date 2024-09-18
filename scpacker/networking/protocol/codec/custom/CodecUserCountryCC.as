package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import §for package case§.§for else§;
   import §for package case§.§get var use§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserCountryCC implements ICodec
   {
      private var §%!F§:ICodec;
      
      private var §import var include§:ICodec;
      
      private var §,o§:ICodec;
      
      public function CodecUserCountryCC(param1:§?"s§)
      {
         super();
         this.§%!F§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecCountryInfo");
         this.§import var include§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§,o§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§get var use§ = new §get var use§();
         _loc2_.§override for extends§ = this.§%!F§.decode(param1) as Vector.<§for else§>;
         _loc2_.defaultCountryCode = this.§import var include§.decode(param1) as String;
         _loc2_.§final var false§ = this.§,o§.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§get var use§ = §get var use§(param2);
         this.§%!F§.encode(param1,_loc3_.§override for extends§);
         this.§import var include§.encode(param1,_loc3_.defaultCountryCode);
         this.§,o§.encode(param1,_loc3_.§final var false§);
         return 4;
      }
   }
}

