package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.utils.ByteArray;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecTargetPosition implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §9#A§:TankUsersRegistry;
      
      private var §super package class§:ICodec;
      
      private var §5!]§:ICodec;
      
      private var §static var true§:ICodec;
      
      private var §include catch function§:ICodec;
      
      private var §>#9§:ICodec;
      
      public function CodecTargetPosition(param1:§?"s§)
      {
         super();
         this.§9#A§ = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         this.§super package class§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§5!]§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§static var true§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§include catch function§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§>#9§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§default for break§ = new §default for break§();
         _loc2_.§package var true§ = this.§super package class§.decode(param1) as §#">§;
         _loc2_.orientation = this.§5!]§.decode(param1) as §#">§;
         _loc2_.position = this.§static var true§.decode(param1) as §#">§;
         _loc2_.target = this.§9#A§.§if for with§(this.§include catch function§.decode(param1) as String);
         _loc2_.turretAngle = this.§>#9§.decode(param1) as Number;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = 0;
         var _loc4_:§default for break§ = §default for break§(param2);
         _loc3_ += this.§super package class§.encode(param1,_loc4_.§package var true§);
         _loc3_ += this.§5!]§.encode(param1,_loc4_.orientation);
         _loc3_ += this.§static var true§.encode(param1,_loc4_.position);
         _loc3_ += this.§include catch function§.encode(param1,_loc4_.target == null ? null : _loc4_.target.id);
         return _loc3_ + this.§>#9§.encode(param1,_loc4_.turretAngle);
      }
   }
}

