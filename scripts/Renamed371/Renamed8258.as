package Renamed371
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed8258 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8246;
      
      private var client:Renamed4816;
      
      private var modelId:Long;
      
      private var Renamed8259:Long;
      
      private var Renamed8260:ICodec;
      
      private var Renamed8261:Long;
      
      public function Renamed8258()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4816(this);
         this.modelId = Long.getLong(484417400,-1976122270);
         this.Renamed8259 = Long.getLong(1625272162,1958733747);
         this.Renamed8261 = Long.getLong(432115653,1756131906);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8246(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed3644
      {
         return Renamed3644(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8259:
               this.client.Renamed6093(String(this.Renamed8260.decode(param2)));
               break;
            case this.Renamed8261:
               this.client.Renamed6094();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

