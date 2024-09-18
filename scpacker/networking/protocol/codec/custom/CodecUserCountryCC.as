package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import Renamed371.Renamed2242;
   import Renamed371.Renamed3644;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecUserCountryCC implements ICodec
   {
      private var Renamed10741:ICodec;
      
      private var Renamed10742:ICodec;
      
      private var Renamed10743:ICodec;
      
      public function CodecUserCountryCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10741 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecCountryInfo");
         this.Renamed10742 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10743 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed3644 = new Renamed3644();
         _loc2_.Renamed3652 = this.Renamed10741.decode(param1) as Vector.<Renamed2242>;
         _loc2_.defaultCountryCode = this.Renamed10742.decode(param1) as String;
         _loc2_.Renamed3651 = this.Renamed10743.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed3644 = Renamed3644(param2);
         this.Renamed10741.encode(param1,_loc3_.Renamed3652);
         this.Renamed10742.encode(param1,_loc3_.defaultCountryCode);
         this.Renamed10743.encode(param1,_loc3_.Renamed3651);
         return 4;
      }
   }
}

