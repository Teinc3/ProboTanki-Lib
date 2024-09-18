package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecStringPair implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed6549:ICodec;
      
      private var Renamed6550:ICodec;
      
      public function CodecStringPair(param1:CodecRegisterer)
      {
         super();
         this.Renamed6549 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed6550 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:StringPair = new StringPair();
         _loc2_.key = this.Renamed6549.decode(param1) as String;
         _loc2_.value = this.Renamed6550.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:StringPair = StringPair(param2);
         this.Renamed6549.encode(param1,_loc3_.key);
         this.Renamed6550.encode(param1,_loc3_.value);
         return 4;
      }
   }
}

