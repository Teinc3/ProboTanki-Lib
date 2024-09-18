package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecUserStat implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10744:ICodec;
      
      private var Renamed10573:ICodec;
      
      private var Renamed10574:ICodec;
      
      private var Renamed10576:ICodec;
      
      public function CodecUserStat(param1:CodecRegisterer)
      {
         super();
         this.Renamed10744 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10573 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10574 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10576 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed4207 = new Renamed4207();
         _loc2_.deaths = this.Renamed10744.decode(param1) as int;
         _loc2_.kills = this.Renamed10573.decode(param1) as int;
         _loc2_.score = this.Renamed10574.decode(param1) as int;
         _loc2_.user = this.Renamed10576.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed4207 = Renamed4207(param2);
         this.Renamed10744.encode(param1,_loc3_.deaths);
         this.Renamed10573.encode(param1,_loc3_.kills);
         this.Renamed10574.encode(param1,_loc3_.score);
         this.Renamed10576.encode(param1,_loc3_.user);
         return 4;
      }
   }
}

