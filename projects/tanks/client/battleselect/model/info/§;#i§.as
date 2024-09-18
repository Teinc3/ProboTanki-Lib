package projects.tanks.client.battleselect.model.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §;#i§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§7#w§;
      
      private var client:§ !t§;
      
      private var modelId:Long;
      
      private var §!!f§:Long;
      
      private var §return for include§:Long;
      
      private var §break set continue§:Long;
      
      private var §null package null§:ICodec;
      
      private var §finally throw§:Long;
      
      private var §do include§:Long;
      
      private var _updateNameId:Long;
      
      private var §<#U§:ICodec;
      
      private var §1v§:Long;
      
      private var §!!Q§:ICodec;
      
      private var §static package finally§:ICodec;
      
      public function §;#i§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = § !t§(this);
         this.modelId = Long.getLong(0,300090007);
         this.§!!f§ = Long.getLong(0,300090014);
         this.§return for include§ = Long.getLong(0,300090015);
         this.§break set continue§ = Long.getLong(0,300090016);
         this.§finally throw§ = Long.getLong(0,300090017);
         this.§do include§ = Long.getLong(0,300090018);
         this._updateNameId = Long.getLong(0,300090019);
         this.§1v§ = Long.getLong(0,300090020);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §7#w§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §?S§
      {
         return §?S§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§!!f§:
               this.client.battleStop();
               break;
            case this.§return for include§:
               this.client.§-#J§();
               break;
            case this.§break set continue§:
               break;
            case this.§finally throw§:
               this.client.roundFinish();
               break;
            case this.§do include§:
               this.client.roundStart();
               break;
            case this._updateNameId:
               this.client.updateName(String(this.§<#U§.decode(param2)));
               break;
            case this.§1v§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

