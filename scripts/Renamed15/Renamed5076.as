package Renamed15
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed5076 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5075;
      
      private var client:Renamed4542;
      
      private var modelId:Long;
      
      private var Renamed5077:Long;
      
      private var Renamed5078:ICodec;
      
      public function Renamed5076()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4542(this);
         this.modelId = Long.getLong(118876660,-1267889929);
         this.Renamed5077 = Long.getLong(2126351838,-2114277847);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5075(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed16
      {
         return Renamed16(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5077:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

