package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.uid.UidNotifierData;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class Renamed10528 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10745:ICodec;
      
      private var Renamed10607:ICodec;
      
      public function Renamed10528(param1:CodecRegisterer)
      {
         super();
         this.Renamed10745 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10607 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:UidNotifierData = new UidNotifierData();
         _loc2_.uid = this.Renamed10745.decode(param1) as String;
         _loc2_.userId = this.Renamed10607.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UidNotifierData = UidNotifierData(param2);
         this.Renamed10745.encode(param1,_loc3_.uid);
         this.Renamed10607.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

