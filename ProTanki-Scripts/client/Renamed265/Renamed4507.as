package Renamed265
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class Renamed4507 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6833;
      
      private var client:Renamed4506;
      
      private var modelId:Long;
      
      private var Renamed6834:Long;
      
      private var Renamed6835:ICodec;
      
      public function Renamed4507()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4506(this);
         this.modelId = Long.getLong(1543089237,611543143);
         this.Renamed6834 = Long.getLong(317069682,-1647554367);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6833(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed6831
      {
         return Renamed6831(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6834:
               this.client.validateResult(ValidationStatus(this.Renamed6835.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

