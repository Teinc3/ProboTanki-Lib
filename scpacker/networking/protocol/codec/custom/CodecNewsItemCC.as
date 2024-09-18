package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.news.item.NewsItemCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecNewsItemCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §for catch do§:ICodec;
      
      private var §try for false§:ICodec;
      
      private var §@!=§:ICodec;
      
      public function CodecNewsItemCC(param1:§?"s§)
      {
         super();
         this.§for catch do§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§try for false§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§@!=§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:NewsItemCC = new NewsItemCC();
         _loc2_.imageUrl = this.§for catch do§.decode(param1) as String;
         _loc2_.newsDate = this.§try for false§.decode(param1) as String;
         _loc2_.newsText = this.§@!=§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:NewsItemCC = NewsItemCC(param2);
         this.§for catch do§.encode(param1,_loc3_.imageUrl);
         this.§try for false§.encode(param1,_loc3_.newsDate);
         this.§@!=§.encode(param1,_loc3_.newsText);
         return 4;
      }
   }
}

