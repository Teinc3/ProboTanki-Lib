package platform.client.models.commons.periodtime
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class TimePeriodModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:TimePeriodModelServer;
      
      private var client:ITimePeriodModelBase;
      
      private var modelId:Long;
      
      public function TimePeriodModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = ITimePeriodModelBase(this);
         this.modelId = Long.getLong(1870140649,1080360405);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new TimePeriodModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _loc1_.registerModelConstructorCodec(this.modelId,this._protocol.getCodec(new TypeCodecInfo(TimePeriodModelCC,false)));
      }
      
      protected function getInitParam() : TimePeriodModelCC
      {
         return TimePeriodModelCC(initParams[Model.object]);
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

