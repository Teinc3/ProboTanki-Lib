package projects.tanks.client.users.model.friends
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §"!1§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§try catch while§;
      
      private var client:§0U§;
      
      private var modelId:Long;
      
      private var § u§:Long;
      
      private var §catch var while§:ICodec;
      
      private var §default const include§:Long;
      
      private var §%"Q§:ICodec;
      
      private var § "[§:ICodec;
      
      private var §case for break§:Long;
      
      private var §import const package§:ICodec;
      
      private var §super set case§:Long;
      
      private var §5!k§:Long;
      
      public function §"!1§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §0U§(this);
         this.modelId = Long.getLong(1693173045,628784534);
         this.§ u§ = Long.getLong(311681954,1684738000);
         this.§default const include§ = Long.getLong(348947857,-1693710961);
         this.§case for break§ = Long.getLong(444676649,1880663147);
         this.§super set case§ = Long.getLong(52539073,-1927628742);
         this.§5!k§ = Long.getLong(1823444363,-1655593141);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §try catch while§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §with var final§
      {
         return §with var final§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§ u§:
            case this.§default const include§:
            case this.§case for break§:
            case this.§super set case§:
               break;
            case this.§5!k§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

