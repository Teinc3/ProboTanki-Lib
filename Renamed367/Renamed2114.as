package Renamed367
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   
   public class Renamed2114 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8225;
      
      private var client:Renamed2113;
      
      private var modelId:Long;
      
      private var Renamed8226:Long;
      
      private var Renamed8227:ICodec;
      
      public function Renamed2114()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2113(this);
         this.modelId = Long.getLong(0,300050003);
         this.Renamed8226 = Long.getLong(0,300050005);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8225(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8226:
               this.client.showAvailableItems(this.Renamed8227.decode(param2) as Vector.<GarageItemInfo>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

