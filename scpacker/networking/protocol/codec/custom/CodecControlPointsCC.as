package scpacker.networking.protocol.codec.custom
{
   import Renamed206.Renamed6103;
   import Renamed206.Renamed6110;
   import Renamed289.Renamed6109;
   import Renamed289.Renamed5084;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecControlPointsCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10647:ICodec;
      
      private var Renamed10648:ICodec;
      
      private var Renamed10649:ICodec;
      
      private var Renamed10650:ICodec;
      
      private var Renamed6814:ICodec;
      
      private var Renamed10543:ICodec;
      
      public function CodecControlPointsCC(param1:Renamed536)
      {
         super();
         this.Renamed10647 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10648 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10649 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10650 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecClientPointData");
         this.Renamed6814 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDominationResources");
         this.Renamed10543 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDominationSounds");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6110 = new Renamed6110();
         _loc2_.Renamed6116 = this.Renamed10647.decode(param1) as Number;
         _loc2_.Renamed6117 = this.Renamed10648.decode(param1) as Number;
         _loc2_.Renamed6118 = this.Renamed10649.decode(param1) as Number;
         _loc2_.Renamed6119 = this.Renamed10650.decode(param1) as Vector.<Renamed6103>;
         _loc2_.resources = this.Renamed6814.decode(param1) as Renamed5084;
         _loc2_.Renamed974 = this.Renamed10543.decode(param1) as Renamed6109;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6110 = Renamed6110(param2);
         this.Renamed10647.encode(param1,_loc3_.Renamed6116);
         this.Renamed10648.encode(param1,_loc3_.Renamed6117);
         this.Renamed10649.encode(param1,_loc3_.Renamed6118);
         this.Renamed10650.encode(param1,_loc3_.Renamed6119);
         this.Renamed6814.encode(param1,_loc3_.resources);
         this.Renamed10543.encode(param1,_loc3_.Renamed974);
         return 4;
      }
   }
}

