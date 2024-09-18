package projects.tanks.client.tanksservices.model.notifier.online
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §else for get§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§throw for super§;
      
      private var client:§4"q§;
      
      private var modelId:Long;
      
      private var §<!y§:Long;
      
      private var §8#§:ICodec;
      
      public function §else for get§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §4"q§(this);
         this.modelId = Long.getLong(467887314,-1426971041);
         this.§<!y§ = Long.getLong(1815033699,-407485089);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §throw for super§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§<!y§:
               this.client.setOnline(this.§8#§.decode(param2) as Vector.<OnlineNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

