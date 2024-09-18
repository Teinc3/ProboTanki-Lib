package Renamed350
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class Renamed4450 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8074;
      
      private var client:Renamed4449;
      
      private var modelId:Long;
      
      private var Renamed8076:Long;
      
      private var Renamed8077:ICodec;
      
      private var Renamed8078:Long;
      
      private var Renamed8079:Long;
      
      private var Renamed8080:ICodec;
      
      public function Renamed4450()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4449(this);
         this.modelId = Long.getLong(0,300070012);
         this.Renamed8076 = Long.getLong(0,300070011);
         this.Renamed8078 = Long.getLong(0,300070012);
         this.Renamed8079 = Long.getLong(0,300070013);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8074(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8076:
               this.client.beginLayoutSwitch(LayoutState(this.Renamed8077.decode(param2)));
               break;
            case this.Renamed8078:
               this.client.cancelPredictedLayoutSwitch();
               break;
            case this.Renamed8079:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

