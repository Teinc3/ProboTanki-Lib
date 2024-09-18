package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecImagePair implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed6549:ICodec;
      
      private var Renamed6550:ICodec;
      
      public function CodecImagePair(param1:Renamed536)
      {
         super();
         this.Renamed6549 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed6550 = param1.getCodec("scpacker.networking.protocol.codec.complex.ByteArrayCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ImagePair = new ImagePair();
         _loc2_.key = this.Renamed6549.decode(param1) as String;
         _loc2_.value = this.Renamed6550.decode(param1) as ByteArray;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ImagePair = ImagePair(param2);
         this.Renamed6549.encode(param1,_loc3_.key);
         this.Renamed6550.encode(param1,_loc3_.value);
         return 4;
      }
   }
}

