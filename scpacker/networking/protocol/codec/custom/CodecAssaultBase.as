package scpacker.networking.protocol.codec.custom
{
   import Renamed4594.Renamed6340;
   import Renamed602.Renamed603;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecAssaultBase implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed8880:ICodec;
      
      private var Renamed10535:ICodec;
      
      public function CodecAssaultBase(param1:Renamed536)
      {
         super();
         this.Renamed8880 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10535 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6340 = new Renamed6340();
         _loc2_.id = this.Renamed8880.decode(param1) as int;
         _loc2_.position = this.Renamed10535.decode(param1) as Renamed603;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6340 = Renamed6340(param2);
         this.Renamed8880.encode(param1,_loc3_.id);
         this.Renamed10535.encode(param1,_loc3_.position);
         return 4;
      }
   }
}

