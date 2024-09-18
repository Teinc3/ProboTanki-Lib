package scpacker.networking.protocol.codec.custom
{
   import Renamed4594.Renamed6339;
   import Renamed4594.Renamed6340;
   import Renamed4594.Renamed6342;
   import Renamed4594.Renamed6343;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecAssaultCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10536:ICodec;
      
      private var Renamed10537:ICodec;
      
      private var Renamed10538:ICodec;
      
      private var Renamed10539:ICodec;
      
      private var Renamed10540:ICodec;
      
      private var Renamed10541:ICodec;
      
      private var Renamed10542:ICodec;
      
      private var Renamed10543:ICodec;
      
      public function CodecAssaultCC(param1:Renamed536)
      {
         super();
         this.Renamed10536 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecClientAssaultFlag");
         this.Renamed10537 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10538 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10539 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10540 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10541 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10542 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecAssaultBase");
         this.Renamed10543 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecAssaultSoundFX");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6339 = new Renamed6339();
         _loc2_.Renamed6358 = this.Renamed10536.decode(param1) as Vector.<Renamed6342>;
         _loc2_.Renamed6360 = this.Renamed10538.decode(param1) as Tanks3DSResource;
         _loc2_.Renamed6359 = this.Renamed10539.decode(param1) as ImageResource;
         _loc2_.Renamed6363 = this.Renamed10540.decode(param1) as ImageResource;
         _loc2_.Renamed6361 = this.Renamed10541.decode(param1) as Tanks3DSResource;
         _loc2_.Renamed6356 = this.Renamed10542.decode(param1) as Vector.<Renamed6340>;
         _loc2_.Renamed974 = this.Renamed10543.decode(param1) as Renamed6343;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6339 = Renamed6339(param2);
         this.Renamed10536.encode(param1,_loc3_.Renamed6358);
         this.Renamed10537.encode(param1,_loc3_.Renamed6750);
         this.Renamed10538.encode(param1,_loc3_.Renamed6360);
         this.Renamed10539.encode(param1,_loc3_.Renamed6359);
         this.Renamed10540.encode(param1,_loc3_.Renamed6363);
         this.Renamed10541.encode(param1,_loc3_.Renamed6361);
         this.Renamed10542.encode(param1,_loc3_.Renamed6356);
         this.Renamed10543.encode(param1,_loc3_.Renamed974);
         return 4;
      }
   }
}

