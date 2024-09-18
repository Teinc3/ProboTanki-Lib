package scpacker.networking.protocol.codec.custom
{
   import Renamed602.Renamed603;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.utils.ByteArray;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecTargetPosition implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed2775:TankUsersRegistry;
      
      private var Renamed10736:ICodec;
      
      private var Renamed10693:ICodec;
      
      private var Renamed10535:ICodec;
      
      private var Renamed10735:ICodec;
      
      private var Renamed10737:ICodec;
      
      public function CodecTargetPosition(param1:Renamed536)
      {
         super();
         this.Renamed2775 = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.Renamed10736 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10693 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10535 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10735 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10737 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed667 = new Renamed667();
         _loc2_.Renamed3116 = this.Renamed10736.decode(param1) as Renamed603;
         _loc2_.orientation = this.Renamed10693.decode(param1) as Renamed603;
         _loc2_.position = this.Renamed10535.decode(param1) as Renamed603;
         _loc2_.target = this.Renamed2775.Renamed695(this.Renamed10735.decode(param1) as String);
         _loc2_.turretAngle = this.Renamed10737.decode(param1) as Number;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = 0;
         var _loc4_:Renamed667 = Renamed667(param2);
         _loc3_ += this.Renamed10736.encode(param1,_loc4_.Renamed3116);
         _loc3_ += this.Renamed10693.encode(param1,_loc4_.orientation);
         _loc3_ += this.Renamed10535.encode(param1,_loc4_.position);
         _loc3_ += this.Renamed10735.encode(param1,_loc4_.target == null ? null : _loc4_.target.id);
         return _loc3_ + this.Renamed10737.encode(param1,_loc4_.turretAngle);
      }
   }
}

