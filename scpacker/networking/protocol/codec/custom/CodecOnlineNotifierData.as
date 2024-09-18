package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecOnlineNotifierData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10698:ICodec;
      
      private var Renamed10572:ICodec;
      
      private var Renamed10607:ICodec;
      
      public function CodecOnlineNotifierData(param1:Renamed536)
      {
         super();
         this.Renamed10698 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10572 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10607 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:OnlineNotifierData = new OnlineNotifierData();
         _loc2_.online = this.Renamed10698.decode(param1) as Boolean;
         _loc2_.serverNumber = this.Renamed10572.decode(param1) as int;
         _loc2_.userId = this.Renamed10607.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:OnlineNotifierData = OnlineNotifierData(param2);
         this.Renamed10698.encode(param1,_loc3_.online);
         this.Renamed10572.encode(param1,_loc3_.serverNumber);
         this.Renamed10607.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

