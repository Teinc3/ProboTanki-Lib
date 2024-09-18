package projects.tanks.client.battlefield.models.battle.battlefield
{
   import §@$ §.§for var finally§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §try const get§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§"%§;
      
      private var client:§include set final§;
      
      private var modelId:Long;
      
      private var §extends get§:Long;
      
      private var §="4§:Long;
      
      private var §each continue§:Long;
      
      private var §=!M§:ICodec;
      
      private var §catch const return§:Long;
      
      private var §include catch null§:ICodec;
      
      public function §try const get§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §include set final§(this);
         this.modelId = Long.getLong(1723277227,1936126557);
         this.§extends get§ = Long.getLong(1285984840,1983429603);
         this.§="4§ = Long.getLong(1210824392,-987670337);
         this.§each continue§ = Long.getLong(180030714,353397522);
         this.§catch const return§ = Long.getLong(711773257,1091256454);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §"%§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §for var finally§
      {
         return §for var finally§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§extends get§:
            case this.§="4§:
            case this.§each continue§:
               break;
            case this.§catch const return§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

