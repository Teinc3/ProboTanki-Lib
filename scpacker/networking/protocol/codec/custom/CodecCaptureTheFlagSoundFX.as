package scpacker.networking.protocol.codec.custom
{
   import Renamed4611.Renamed5433;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecCaptureTheFlagSoundFX implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10619:ICodec;
      
      private var Renamed10544:ICodec;
      
      private var Renamed10620:ICodec;
      
      private var Renamed10545:ICodec;
      
      private var Renamed10621:ICodec;
      
      private var Renamed10546:ICodec;
      
      private var Renamed10622:ICodec;
      
      private var Renamed10547:ICodec;
      
      public function CodecCaptureTheFlagSoundFX(param1:CodecRegisterer)
      {
         super();
         this.Renamed10619 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10544 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10620 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10545 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10621 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10546 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10622 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10547 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed5433 = new Renamed5433();
         _loc2_.Renamed5456 = this.Renamed10544.decode(param1) as SoundResource;
         _loc2_.Renamed5457 = this.Renamed10545.decode(param1) as SoundResource;
         _loc2_.Renamed5458 = this.Renamed10546.decode(param1) as SoundResource;
         _loc2_.Renamed5459 = this.Renamed10547.decode(param1) as SoundResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed5433 = Renamed5433(param2);
         this.Renamed10619.encode(param1,_loc3_.Renamed7255);
         this.Renamed10544.encode(param1,_loc3_.Renamed5456);
         this.Renamed10620.encode(param1,_loc3_.Renamed7256);
         this.Renamed10545.encode(param1,_loc3_.Renamed5457);
         this.Renamed10621.encode(param1,_loc3_.Renamed7257);
         this.Renamed10546.encode(param1,_loc3_.Renamed5458);
         this.Renamed10622.encode(param1,_loc3_.Renamed7258);
         this.Renamed10547.encode(param1,_loc3_.Renamed5459);
         return 4;
      }
   }
}

