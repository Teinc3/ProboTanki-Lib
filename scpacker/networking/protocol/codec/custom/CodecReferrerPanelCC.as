package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   import Renamed420.Renamed8195;
   
   public class CodecReferrerPanelCC implements ICodec
   {
      private var Renamed10710:ICodec;
      
      private var Renamed10711:ICodec;
      
      public function CodecReferrerPanelCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10710 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10711 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed8195 = new Renamed8195();
         _loc2_.hash = this.Renamed10710.decode(param1) as String;
         _loc2_.host = this.Renamed10711.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed8195 = Renamed8195(param2);
         this.Renamed10710.encode(param1,_loc3_.hash);
         this.Renamed10711.encode(param1,_loc3_.host);
         return 4;
      }
   }
}

