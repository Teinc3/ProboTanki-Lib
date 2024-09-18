package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import Renamed383.Renamed6454;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecStatisticsDMCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10718:ICodec;
      
      public function CodecStatisticsDMCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10718 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6454 = new Renamed6454();
         _loc2_.usersInfo = this.Renamed10718.decode(param1) as Vector.<Renamed2737>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6454 = Renamed6454(param2);
         this.Renamed10718.encode(param1,_loc3_.usersInfo);
         return 4;
      }
   }
}

