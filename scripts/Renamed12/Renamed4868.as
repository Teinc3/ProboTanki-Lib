package Renamed12
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4863 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4848;
      
      private var client:Renamed14;
      
      private var modelId:Long;
      
      private var Renamed4864:Long;
      
      private var Renamed4865:ICodec;
      
      private var Renamed4866:Long;
      
      private var Renamed4867:ICodec;
      
      public function Renamed4863()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed14(this);
         this.modelId = Long.getLong(2120141642,699496177);
         this.Renamed4864 = Long.getLong(1609604139,228512172);
         this.Renamed4866 = Long.getLong(1853038031,-1082989884);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4848(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed13
      {
         return Renamed13(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4864:
               break;
            case this.Renamed4866:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

