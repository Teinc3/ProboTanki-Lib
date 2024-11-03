package Renamed341
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed7072 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7938;
      
      private var client:Renamed4478;
      
      private var modelId:Long;
      
      public function Renamed7072()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4478(this);
         this.modelId = Long.getLong(113911774,-312236140);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7938(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed7433
      {
         return Renamed7433(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         if(Boolean(0))
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

