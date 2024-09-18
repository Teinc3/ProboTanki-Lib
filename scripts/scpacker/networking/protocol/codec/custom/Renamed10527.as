package scpacker.networking.protocol.codec.custom
{
   import Renamed602.3DPositionVector;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battlefield.models.bonus.battle.Renamed7400;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class Renamed10527 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10771:ICodec;
      
      private var Renamed10772:ICodec;
      
      private var Renamed10773:ICodec;
      
      private var Renamed10774:ICodec;
      
      public function Renamed10527(param1:CodecRegisterer)
      {
         super();
         this.Renamed10771 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10772 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10773 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10774 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed4159 = new Renamed4159();
         _loc2_.bonusId = this.Renamed10772.decode(param1) as String;
         _loc2_.Renamed4164 = this.Renamed10773.decode(param1) as int;
         _loc2_.Renamed4165 = this.Renamed10774.decode(param1) as 3DPositionVector;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed4159 = Renamed4159(param2);
         this.Renamed10771.encode(param1,_loc3_.Renamed4163);
         this.Renamed10772.encode(param1,_loc3_.bonusId);
         this.Renamed10773.encode(param1,_loc3_.Renamed4164);
         this.Renamed10774.encode(param1,_loc3_.Renamed4165);
         return 4;
      }
   }
}

