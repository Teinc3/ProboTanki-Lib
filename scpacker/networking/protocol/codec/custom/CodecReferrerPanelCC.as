package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   import §static final§.§,"o§;
   
   public class CodecReferrerPanelCC implements ICodec
   {
      private var §break set try§:ICodec;
      
      private var §'#D§:ICodec;
      
      public function CodecReferrerPanelCC(param1:§?"s§)
      {
         super();
         this.§break set try§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§'#D§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§,"o§ = new §,"o§();
         _loc2_.hash = this.§break set try§.decode(param1) as String;
         _loc2_.host = this.§'#D§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§,"o§ = §,"o§(param2);
         this.§break set try§.encode(param1,_loc3_.hash);
         this.§'#D§.encode(param1,_loc3_.host);
         return 4;
      }
   }
}

