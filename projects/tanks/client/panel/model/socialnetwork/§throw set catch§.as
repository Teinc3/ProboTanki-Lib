package projects.tanks.client.panel.model.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §throw set catch§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§]#_§;
      
      private var client:§8k§;
      
      private var modelId:Long;
      
      private var §>#z§:Long;
      
      private var §9![§:ICodec;
      
      private var §&!%§:Long;
      
      private var §each if§:ICodec;
      
      private var §native const implements§:Long;
      
      private var §override catch for§:ICodec;
      
      private var §#!r§:Long;
      
      public function §throw set catch§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §8k§(this);
         this.modelId = Long.getLong(0,300050062);
         this.§>#z§ = Long.getLong(0,300050044);
         this.§&!%§ = Long.getLong(0,300050045);
         this.§native const implements§ = Long.getLong(0,300050046);
         this.§#!r§ = Long.getLong(0,300050047);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §]#_§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : SocialNetworkPanelCC
      {
         return SocialNetworkPanelCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§>#z§:
               this.client.linkAlreadyExists(String(this.§9![§.decode(param2)));
               break;
            case this.§&!%§:
               this.client.linkCreated(String(this.§each if§.decode(param2)));
               break;
            case this.§native const implements§:
               this.client.unlinkSuccess(String(this.§override catch for§.decode(param2)));
               break;
            case this.§#!r§:
               this.client.validationFailed();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

