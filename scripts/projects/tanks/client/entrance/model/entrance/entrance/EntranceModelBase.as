package projects.tanks.client.entrance.model.entrance.entrance
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.impl.Model;
   
   public class EntranceModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      private var client:IEntranceModelBase;
      
      private var modelId:Long;
      
      public function EntranceModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IEntranceModelBase(this);
         this.modelId = Long.getLong(0,300020011);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
      }
      
      protected function getInitParam() : EntranceModelCC
      {
         return EntranceModelCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         var _loc3_:* = param1;
         var _loc4_:int = 0;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

