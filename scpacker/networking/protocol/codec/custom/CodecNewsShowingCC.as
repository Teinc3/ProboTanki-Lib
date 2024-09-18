package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.news.item.NewsItemCC;
   import projects.tanks.client.panel.model.news.showing.NewsShowingCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecNewsShowingCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §"m§:ICodec;
      
      public function CodecNewsShowingCC(param1:§?"s§)
      {
         super();
         this.§"m§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecNewsItemCC");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:NewsShowingCC = new NewsShowingCC();
         _loc2_.newsItems = this.§"m§.decode(param1) as Vector.<NewsItemCC>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:NewsShowingCC = NewsShowingCC(param2);
         this.§"m§.encode(param1,_loc3_.newsItems);
         return 4;
      }
   }
}

