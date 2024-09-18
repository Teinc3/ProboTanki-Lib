package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBonusInfoCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10608:ICodec;
      
      private var Renamed10609:ICodec;
      
      private var Renamed10610:ICodec;
      
      public function CodecBonusInfoCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10608 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10609 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10610 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:BonusInfoCC = new BonusInfoCC();
         _loc2_.bottomText = this.Renamed10608.decode(param1) as String;
         _loc2_.image = this.Renamed10609.decode(param1) as ImageResource;
         _loc2_.topText = this.Renamed10610.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:BonusInfoCC = BonusInfoCC(param2);
         this.Renamed10608.encode(param1,_loc3_.bottomText);
         this.Renamed10609.encode(param1,_loc3_.image);
         this.Renamed10610.encode(param1,_loc3_.topText);
         return 4;
      }
   }
}

