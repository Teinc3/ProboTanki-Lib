package §set break§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §%#0§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§=!0§;
      
      private var client:§^z§;
      
      private var modelId:Long;
      
      private var §4#x§:Long;
      
      private var §continue set for§:Long;
      
      private var §2#i§:ICodec;
      
      private var §`!m§:ICodec;
      
      private var §6!F§:Long;
      
      public function §%#0§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §^z§(this);
         this.modelId = Long.getLong(1645686167,1474428435);
         this.§4#x§ = Long.getLong(1426613749,-669664322);
         this.§continue set for§ = Long.getLong(387341675,1817286639);
         this.§6!F§ = Long.getLong(877312902,1109359872);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §=!0§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §else package finally§
      {
         return §else package finally§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§4#x§:
            case this.§continue set for§:
               break;
            case this.§6!F§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

