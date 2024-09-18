package scpacker.networking.protocol.codec.custom
{
   import Renamed206.Renamed6103;
   import Renamed206.Renamed5125;
   import Renamed602.3DPositionVector;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecClientPointData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed8880:ICodec;
      
      private var Renamed10015:ICodec;
      
      private var Renamed10535:ICodec;
      
      private var Renamed10574:ICodec;
      
      private var Renamed10644:ICodec;
      
      private var Renamed10645:ICodec;
      
      private var Renamed10646:ICodec;
      
      public function CodecClientPointData(param1:CodecRegisterer)
      {
         super();
         this.Renamed8880 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10015 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10535 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10574 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10644 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10645 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecControlPointState");
         this.Renamed10646 = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6103 = new Renamed6103();
         _loc2_.id = this.Renamed8880.decode(param1) as int;
         _loc2_.name = this.Renamed10015.decode(param1) as String;
         _loc2_.position = this.Renamed10535.decode(param1) as 3DPositionVector;
         _loc2_.score = this.Renamed10574.decode(param1) as Number;
         _loc2_.Renamed6106 = this.Renamed10644.decode(param1) as Number;
         _loc2_.state = this.Renamed10645.decode(param1) as Renamed5125;
         _loc2_.Renamed6107 = this.Renamed10646.decode(param1) as Vector.<String>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6103 = Renamed6103(param2);
         this.Renamed8880.encode(param1,_loc3_.id);
         this.Renamed10015.encode(param1,_loc3_.name);
         this.Renamed10535.encode(param1,_loc3_.position);
         this.Renamed10574.encode(param1,_loc3_.score);
         this.Renamed10644.encode(param1,_loc3_.Renamed6106);
         this.Renamed10645.encode(param1,_loc3_.state);
         this.Renamed10646.encode(param1,_loc3_.Renamed6107);
         return 4;
      }
   }
}

