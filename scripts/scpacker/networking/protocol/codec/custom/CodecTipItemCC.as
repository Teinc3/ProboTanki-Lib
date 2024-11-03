package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed341.Renamed7433;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecTipItemCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10688:ICodec;
      
      public function CodecTipItemCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10688 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed7433 = new Renamed7433();
         _loc2_.preview = this.Renamed10688.decode(param1) as LocalizedImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed7433 = Renamed7433(param2);
         this.Renamed10688.encode(param1,_loc3_.preview);
         return 4;
      }
   }
}

