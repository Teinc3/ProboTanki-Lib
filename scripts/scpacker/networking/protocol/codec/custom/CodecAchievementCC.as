package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   import scpacker.networking.protocol.CodecRegisterer;
   import Renamed416.Renamed7589;
   
   public class CodecAchievementCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10534:ICodec;
      
      public function CodecAchievementCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10534 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecAchievement");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed7589 = new Renamed7589();
         _loc2_.Renamed2076 = this.Renamed10534.decode(param1) as Vector.<Renamed2072>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed7589 = Renamed7589(param2);
         this.Renamed10534.encode(param1,_loc3_.Renamed2076);
         return 4;
      }
   }
}

