package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.dailyquest.Renamed4365;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecDailyQuestPrizeInfo implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10659:ICodec;
      
      private var Renamed10015:ICodec;
      
      public function CodecDailyQuestPrizeInfo(param1:Renamed536)
      {
         super();
         this.Renamed10659 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10015 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed4365 = new Renamed4365();
         _loc2_.count = this.Renamed10659.decode(param1) as int;
         _loc2_.name = this.Renamed10015.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed4365 = Renamed4365(param2);
         this.Renamed10659.encode(param1,_loc3_.count);
         this.Renamed10015.encode(param1,_loc3_.name);
         return 4;
      }
   }
}

