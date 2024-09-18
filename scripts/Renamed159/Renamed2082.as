package Renamed2081
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2082 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5236;
      
      private var client:Renamed2083;
      
      private var modelId:Long;
      
      private var Renamed5237:Long;
      
      private var Renamed5238:ICodec;
      
      private var Renamed5239:ICodec;
      
      private var Renamed5240:ICodec;
      
      private var Renamed5241:ICodec;
      
      public function Renamed2082()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2083(this);
         this.modelId = Long.getLong(0,300050019);
         this.Renamed5237 = Long.getLong(0,300050018);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5236(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed5242
      {
         return Renamed5242(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5237:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

