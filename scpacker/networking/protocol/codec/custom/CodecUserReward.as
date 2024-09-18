package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.Renamed4209;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecUserReward implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10757:ICodec;
      
      private var Renamed10758:ICodec;
      
      private var Renamed10759:ICodec;
      
      private var Renamed10607:ICodec;
      
      public function CodecUserReward(param1:Renamed536)
      {
         super();
         this.Renamed10757 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10758 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10759 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10607 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed4209 = new Renamed4209();
         _loc2_.Renamed4212 = this.Renamed10757.decode(param1) as int;
         _loc2_.Renamed4213 = this.Renamed10758.decode(param1) as int;
         _loc2_.reward = this.Renamed10759.decode(param1) as int;
         _loc2_.userId = this.Renamed10607.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed4209 = Renamed4209(param2);
         this.Renamed10757.encode(param1,_loc3_.Renamed4212);
         this.Renamed10758.encode(param1,_loc3_.Renamed4213);
         this.Renamed10759.encode(param1,_loc3_.reward);
         this.Renamed10607.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

