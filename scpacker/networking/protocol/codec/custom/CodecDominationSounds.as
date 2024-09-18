package scpacker.networking.protocol.codec.custom
{
   import Renamed289.Renamed6109;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecDominationSounds implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10672:ICodec;
      
      private var Renamed10673:ICodec;
      
      private var Renamed10674:ICodec;
      
      private var Renamed10675:ICodec;
      
      private var Renamed10676:ICodec;
      
      private var Renamed10677:ICodec;
      
      private var Renamed10678:ICodec;
      
      private var Renamed10679:ICodec;
      
      private var Renamed10680:ICodec;
      
      private var Renamed10681:ICodec;
      
      public function CodecDominationSounds(param1:Renamed536)
      {
         super();
         this.Renamed10672 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10673 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10674 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10675 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10676 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10677 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10678 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10679 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10680 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10681 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6109 = new Renamed6109();
         _loc2_.Renamed7353 = this.Renamed10672.decode(param1) as SoundResource;
         _loc2_.Renamed7354 = this.Renamed10673.decode(param1) as SoundResource;
         _loc2_.Renamed7355 = this.Renamed10674.decode(param1) as SoundResource;
         _loc2_.Renamed7356 = this.Renamed10675.decode(param1) as SoundResource;
         _loc2_.Renamed7357 = this.Renamed10676.decode(param1) as SoundResource;
         _loc2_.Renamed7358 = this.Renamed10677.decode(param1) as SoundResource;
         _loc2_.Renamed7359 = this.Renamed10678.decode(param1) as SoundResource;
         _loc2_.Renamed7360 = this.Renamed10679.decode(param1) as SoundResource;
         _loc2_.Renamed7361 = this.Renamed10680.decode(param1) as SoundResource;
         _loc2_.Renamed7362 = this.Renamed10681.decode(param1) as SoundResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6109 = Renamed6109(param2);
         this.Renamed10672.encode(param1,_loc3_.Renamed7353);
         this.Renamed10673.encode(param1,_loc3_.Renamed7354);
         this.Renamed10674.encode(param1,_loc3_.Renamed7355);
         this.Renamed10675.encode(param1,_loc3_.Renamed7356);
         this.Renamed10676.encode(param1,_loc3_.Renamed7357);
         this.Renamed10677.encode(param1,_loc3_.Renamed7358);
         this.Renamed10678.encode(param1,_loc3_.Renamed7359);
         this.Renamed10679.encode(param1,_loc3_.Renamed7360);
         this.Renamed10680.encode(param1,_loc3_.Renamed7361);
         this.Renamed10681.encode(param1,_loc3_.Renamed7362);
         return 4;
      }
   }
}

