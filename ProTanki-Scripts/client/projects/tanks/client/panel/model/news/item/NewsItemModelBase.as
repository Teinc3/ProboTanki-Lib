package projects.tanks.client.panel.model.news.item
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.impl.Model;
   
   public class NewsItemModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:NewsItemModelServer;
      
      private var client:INewsItemModelBase;
      
      private var modelId:Long;
      
      public function NewsItemModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = INewsItemModelBase(this);
         this.modelId = Long.getLong(0,300050031);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
      }
      
      protected function getInitParam() : NewsItemCC
      {
         return NewsItemCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         var _loc3_:* = param1;
         var _loc4_:int = 0;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

