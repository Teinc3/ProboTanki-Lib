package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBonusInfoCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §,!d§:ICodec;
      
      private var §6Z§:ICodec;
      
      private var §set set var§:ICodec;
      
      public function CodecBonusInfoCC(param1:§?"s§)
      {
         super();
         this.§,!d§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§6Z§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§set set var§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BonusInfoCC = new BonusInfoCC();
         _loc2_.bottomText = this.§,!d§.decode(param1) as String;
         _loc2_.image = this.§6Z§.decode(param1) as ImageResource;
         _loc2_.topText = this.§set set var§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BonusInfoCC = BonusInfoCC(param2);
         this.§,!d§.encode(param1,_loc3_.bottomText);
         this.§6Z§.encode(param1,_loc3_.image);
         this.§set set var§.encode(param1,_loc3_.topText);
         return 4;
      }
   }
}

