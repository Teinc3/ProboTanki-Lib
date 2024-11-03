package Renamed5317
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed5319 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5320;
      
      private var client:Renamed5318;
      
      private var modelId:Long;
      
      public function Renamed5319()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed5318(this);
         this.modelId = Long.getLong(1337638668,-1951387531);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5320(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed5321
      {
         return Renamed5321(initParams[Model.object]);
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

