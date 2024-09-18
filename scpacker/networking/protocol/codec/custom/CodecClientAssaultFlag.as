package scpacker.networking.protocol.codec.custom
{
   import Renamed4594.Renamed6342;
   import Renamed602.Renamed603;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecClientAssaultFlag implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10641:ICodec;
      
      private var Renamed10642:ICodec;
      
      private var Renamed10643:ICodec;
      
      private var Renamed8880:ICodec;
      
      public function CodecClientAssaultFlag(param1:Renamed536)
      {
         super();
         this.Renamed10641 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10642 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10643 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed8880 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6342 = new Renamed6342();
         _loc2_.Renamed5499 = this.Renamed10641.decode(param1) as Renamed603;
         _loc2_.Renamed5500 = this.Renamed10642.decode(param1) as String;
         _loc2_.Renamed5406 = this.Renamed10643.decode(param1) as Renamed603;
         _loc2_.id = this.Renamed8880.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6342 = Renamed6342(param2);
         this.Renamed10641.encode(param1,_loc3_.Renamed5499);
         this.Renamed10642.encode(param1,_loc3_.Renamed5500);
         this.Renamed10643.encode(param1,_loc3_.Renamed5406);
         this.Renamed8880.encode(param1,_loc3_.id);
         return 4;
      }
   }
}

