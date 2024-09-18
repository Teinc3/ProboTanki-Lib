package scpacker.networking.protocol.codec.custom
{
   import Renamed602.Renamed603;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import Renamed349.Renamed3105;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecTargetHit implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed2775:TankUsersRegistry;
      
      private var Renamed10732:ICodec;
      
      private var Renamed10733:ICodec;
      
      private var Renamed10734:ICodec;
      
      private var Renamed10735:ICodec;
      
      public function CodecTargetHit(param1:Renamed536)
      {
         super();
         this.Renamed2775 = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.Renamed10732 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10733 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10734 = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.Renamed10735 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed3105 = new Renamed3105();
         _loc2_.direction = this.Renamed10732.decode(param1) as Renamed603;
         _loc2_.Renamed3116 = this.Renamed10733.decode(param1) as Renamed603;
         _loc2_.Renamed3448 = this.Renamed10734.decode(param1) as int;
         _loc2_.target = this.Renamed2775.Renamed695(this.Renamed10735.decode(param1) as String);
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Renamed3105 = Renamed3105(param2);
         _loc3_ += this.Renamed10732.encode(param1,_loc4_.direction);
         _loc3_ += this.Renamed10733.encode(param1,_loc4_.Renamed3116);
         _loc3_ += this.Renamed10734.encode(param1,_loc4_.Renamed3448);
         return _loc3_ + this.Renamed10735.encode(param1,_loc4_.target);
      }
   }
}

