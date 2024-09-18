package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battlefield.models.bonus.battle.§1§;
   import scpacker.networking.protocol.§?"s§;
   
   public class §3!9§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §[$#§:ICodec;
      
      private var §="5§:ICodec;
      
      private var §4"7§:ICodec;
      
      private var §%R§:ICodec;
      
      public function §3!9§(param1:§?"s§)
      {
         super();
         this.§[$#§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§="5§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§4"7§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§%R§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§1#1§ = new §1#1§();
         _loc2_.bonusId = this.§="5§.decode(param1) as String;
         _loc2_.§function catch import§ = this.§4"7§.decode(param1) as int;
         _loc2_.§ !"§ = this.§%R§.decode(param1) as §#">§;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§1#1§ = §1#1§(param2);
         this.§[$#§.encode(param1,_loc3_.§extends catch extends§);
         this.§="5§.encode(param1,_loc3_.bonusId);
         this.§4"7§.encode(param1,_loc3_.§function catch import§);
         this.§%R§.encode(param1,_loc3_.§ !"§);
         return 4;
      }
   }
}

