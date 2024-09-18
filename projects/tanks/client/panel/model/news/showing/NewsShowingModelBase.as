package projects.tanks.client.panel.model.news.showing
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class NewsShowingModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:NewsShowingModelServer;
      
      private var client:INewsShowingModelBase;
      
      private var modelId:Long;
      
      public function NewsShowingModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = INewsShowingModelBase(this);
         this.modelId = Long.getLong(0,300050034);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new NewsShowingModelServer(IModel(this));
      }
      
      protected function getInitParam() : NewsShowingCC
      {
         return NewsShowingCC(initParams[Model.object]);
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

