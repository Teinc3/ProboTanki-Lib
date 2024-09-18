package scpacker.networking.protocol.codec.custom
{
   import Renamed4611.Renamed5433;
   import Renamed4611.Renamed5435;
   import Renamed4611.Renamed5436;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecCaptureTheFlagCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10611:ICodec;
      
      private var Renamed10612:ICodec;
      
      private var Renamed10613:ICodec;
      
      private var Renamed10614:ICodec;
      
      private var Renamed10615:ICodec;
      
      private var Renamed10616:ICodec;
      
      private var Renamed10617:ICodec;
      
      private var Renamed10618:ICodec;
      
      private var Renamed10543:ICodec;
      
      public function CodecCaptureTheFlagCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10611 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecClientFlag");
         this.Renamed10612 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10613 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10614 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10615 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecClientFlag");
         this.Renamed10616 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10617 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10618 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10543 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecCaptureTheFlagSoundFX");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed5435 = new Renamed5435();
         _loc2_.Renamed5475 = this.Renamed10611.decode(param1) as Renamed5436;
         _loc2_.Renamed5476 = this.Renamed10613.decode(param1) as ImageResource;
         _loc2_.Renamed5477 = this.Renamed10614.decode(param1) as Tanks3DSResource;
         _loc2_.Renamed5472 = this.Renamed10615.decode(param1) as Renamed5436;
         _loc2_.Renamed5473 = this.Renamed10617.decode(param1) as ImageResource;
         _loc2_.Renamed5474 = this.Renamed10618.decode(param1) as Tanks3DSResource;
         _loc2_.Renamed974 = this.Renamed10543.decode(param1) as Renamed5433;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Renamed5435 = Renamed5435(param2);
         _loc3_ += this.Renamed10611.encode(param1,_loc4_.Renamed5475);
         _loc3_ += this.Renamed10612.encode(param1,_loc4_.Renamed7271);
         _loc3_ += this.Renamed10613.encode(param1,_loc4_.Renamed5476);
         _loc3_ += this.Renamed10614.encode(param1,_loc4_.Renamed5477);
         _loc3_ += this.Renamed10615.encode(param1,_loc4_.Renamed5472);
         _loc3_ += this.Renamed10616.encode(param1,_loc4_.Renamed7272);
         _loc3_ += this.Renamed10617.encode(param1,_loc4_.Renamed5473);
         _loc3_ += this.Renamed10618.encode(param1,_loc4_.Renamed5474);
         return _loc3_ + this.Renamed10543.encode(param1,_loc4_.Renamed974);
      }
   }
}

