package scpacker.networking.protocol.codec.custom
{
   import Renamed4594.Renamed6343;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecAssaultSoundFX implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10544:ICodec;
      
      private var Renamed10545:ICodec;
      
      private var Renamed10546:ICodec;
      
      private var Renamed10547:ICodec;
      
      public function CodecAssaultSoundFX(param1:CodecRegisterer)
      {
         super();
         this.Renamed10544 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10545 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10546 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10547 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6343 = new Renamed6343();
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
         var _loc3_:Renamed6343 = Renamed6343(param2);
         this.Renamed10544.encode(param1,_loc3_.Renamed5456);
         this.Renamed10545.encode(param1,_loc3_.Renamed5457);
         this.Renamed10546.encode(param1,_loc3_.Renamed5458);
         this.Renamed10547.encode(param1,_loc3_.Renamed5459);
         return 4;
      }
   }
}

