package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.news.item.NewsItemCC;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecNewsItemCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10694:ICodec;
      
      private var Renamed10695:ICodec;
      
      private var Renamed10696:ICodec;
      
      public function CodecNewsItemCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10694 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10695 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10696 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:NewsItemCC = new NewsItemCC();
         _loc2_.imageUrl = this.Renamed10694.decode(param1) as String;
         _loc2_.newsDate = this.Renamed10695.decode(param1) as String;
         _loc2_.newsText = this.Renamed10696.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:NewsItemCC = NewsItemCC(param2);
         this.Renamed10694.encode(param1,_loc3_.imageUrl);
         this.Renamed10695.encode(param1,_loc3_.newsDate);
         this.Renamed10696.encode(param1,_loc3_.newsText);
         return 4;
      }
   }
}

