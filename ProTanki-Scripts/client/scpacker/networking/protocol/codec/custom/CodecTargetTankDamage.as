package scpacker.networking.protocol.codec.custom
{
   import Renamed194.DamageType;
   import Renamed194.TargetTankDamage;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecTargetTankDamage implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10738:ICodec;
      
      private var DamageTypeCodec:ICodec;
      
      private var targetCodec:ICodec;
      
      public function CodecTargetTankDamage(param1:CodecRegisterer)
      {
         super();
         this.Renamed10738 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.DamageTypeCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDamageIndicatorType");
         this.targetCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:TargetTankDamage = new TargetTankDamage();
         _loc2_.damageAmount = this.Renamed10738.decode(param1) as Number;
         _loc2_.damageType = this.DamageTypeCodec.decode(param1) as DamageType;
         _loc2_.target = this.targetCodec.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:TargetTankDamage = TargetTankDamage(param2);
         _loc3_ += this.Renamed10738.encode(param1,_loc4_.damageAmount);
         _loc3_ += this.DamageTypeCodec.encode(param1,_loc4_.damageType);
         return _loc3_ + this.targetCodec.encode(param1,_loc4_.target);
      }
   }
}

