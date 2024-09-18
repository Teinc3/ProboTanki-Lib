package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import §for package case§.§for else§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecCountryInfo implements ICodec
   {
      private var §`#I§:ICodec;
      
      private var §&!P§:ICodec;
      
      public function CodecCountryInfo(param1:§?"s§)
      {
         super();
         this.§`#I§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§&!P§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§for else§ = new §for else§();
         _loc2_.§throw const var§ = this.§`#I§.decode(param1) as String;
         _loc2_.countryName = this.§&!P§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§for else§ = §for else§(param2);
         this.§`#I§.encode(param1,_loc3_.§throw const var§);
         this.§&!P§.encode(param1,_loc3_.countryName);
         return 4;
      }
   }
}

