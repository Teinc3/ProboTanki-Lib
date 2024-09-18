package scpacker.networking.protocol.codec.custom
{
   import Renamed602.3DPositionVector;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import Renamed349.TargetHitInfo;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecTargetHit implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed2775:TankUsersRegistry;
      
      private var diectionCodec:ICodec;
      
      private var localHitPointCodec:ICodec;
      
      private var numberHitsCodec:ICodec;
      
      private var targetCodec:ICodec;
      
      public function CodecTargetHit(param1:CodecRegisterer)
      {
         super();
         this.Renamed2775 = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.diectionCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.localHitPointCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.numberHitsCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.targetCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var thInfo:TargetHitInfo = new TargetHitInfo();
         thInfo.direction = this.diectionCodec.decode(param1) as 3DPositionVector;
         thInfo.localHitPoint = this.localHitPointCodec.decode(param1) as 3DPositionVector;
         thInfo.numberHits = this.numberHitsCodec.decode(param1) as int;
         thInfo.target = this.Renamed2775.Renamed695(this.targetCodec.decode(param1) as String);
         return thInfo;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var thInfo:TargetHitInfo = TargetHitInfo(param2);
         _loc3_ += this.diectionCodec.encode(param1,thInfo.direction);
         _loc3_ += this.localHitPointCodec.encode(param1,thInfo.localHitPoint);
         _loc3_ += this.numberHitsCodec.encode(param1,thInfo.numberHits);
         return _loc3_ + this.targetCodec.encode(param1,thInfo.target);
      }
   }
}

