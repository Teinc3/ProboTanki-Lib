package scpacker.networking.protocol.codec.custom
{
   import Renamed225.Renamed5522;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecWeeklyQuestDescription implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10765:ICodec;
      
      private var Renamed10766:ICodec;
      
      private var Renamed10767:ICodec;
      
      private var Renamed10768:ICodec;
      
      private var Renamed10769:ICodec;
      
      public function CodecWeeklyQuestDescription(param1:CodecRegisterer)
      {
         super();
         this.Renamed10765 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10766 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10767 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10768 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10769 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed5522 = new Renamed5522();
         _loc2_.Renamed6369 = this.Renamed10765.decode(param1) as int;
         _loc2_.Renamed6370 = this.Renamed10766.decode(param1) as int;
         _loc2_.Renamed6371 = this.Renamed10767.decode(param1) as Boolean;
         _loc2_.Renamed6372 = this.Renamed10768.decode(param1) as ImageResource;
         _loc2_.Renamed6373 = this.Renamed10769.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed5522 = Renamed5522(param2);
         this.Renamed10765.encode(param1,_loc3_.Renamed6369);
         this.Renamed10766.encode(param1,_loc3_.Renamed6370);
         this.Renamed10767.encode(param1,_loc3_.Renamed6371);
         this.Renamed10768.encode(param1,_loc3_.Renamed6372);
         this.Renamed10769.encode(param1,_loc3_.Renamed6373);
         return 4;
      }
   }
}

