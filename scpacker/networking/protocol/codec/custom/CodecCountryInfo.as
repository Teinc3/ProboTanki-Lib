package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import Renamed371.Renamed2242;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecCountryInfo implements ICodec
   {
      private var Renamed10651:ICodec;
      
      private var Renamed10652:ICodec;
      
      public function CodecCountryInfo(param1:Renamed536)
      {
         super();
         this.Renamed10651 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10652 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed2242 = new Renamed2242();
         _loc2_.Renamed2256 = this.Renamed10651.decode(param1) as String;
         _loc2_.countryName = this.Renamed10652.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed2242 = Renamed2242(param2);
         this.Renamed10651.encode(param1,_loc3_.Renamed2256);
         this.Renamed10652.encode(param1,_loc3_.countryName);
         return 4;
      }
   }
}

