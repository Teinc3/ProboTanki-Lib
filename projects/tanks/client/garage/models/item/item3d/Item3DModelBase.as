package projects.tanks.client.garage.models.item.item3d
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Item3DModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Item3DModelServer;
      
      private var client:IItem3DModelBase;
      
      private var modelId:Long;
      
      public function Item3DModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IItem3DModelBase(this);
         this.modelId = Long.getLong(0,300040012);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Item3DModelServer(IModel(this));
      }
      
      protected function getInitParam() : Item3DCC
      {
         return Item3DCC(initParams[Model.object]);
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

