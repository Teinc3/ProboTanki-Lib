package Renamed202
{
   import Renamed136.Renamed663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed6022 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6023;
      
      private var client:Renamed4569;
      
      private var modelId:Long;
      
      private var Renamed6024:Long;
      
      private var Renamed6025:ICodec;
      
      private var Renamed6026:ICodec;
      
      private var Renamed6027:Long;
      
      private var Renamed6028:ICodec;
      
      private var Renamed6029:ICodec;
      
      private var 3DPositionVector0:Long;
      
      private var 3DPositionVector1:ICodec;
      
      private var 3DPositionVector2:ICodec;
      
      private var 3DPositionVector3:Long;
      
      private var 3DPositionVector4:ICodec;
      
      private var 3DPositionVector5:ICodec;
      
      private var 3DPositionVector6:Long;
      
      private var 3DPositionVector7:ICodec;
      
      private var 3DPositionVector8:ICodec;
      
      private var 3DPositionVector9:ICodec;
      
      private var Renamed6040:Long;
      
      private var Renamed6041:ICodec;
      
      public function Renamed6022()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4569(this);
         this.modelId = Long.getLong(183455729,-2099733819);
         this.Renamed6024 = Long.getLong(1367071399,-1702461867);
         this.Renamed6027 = Long.getLong(1479921566,-1347191967);
         this.3DPositionVector0 = Long.getLong(1581597391,-963196943);
         this.3DPositionVector3 = Long.getLong(1345957775,1774893408);
         this.3DPositionVector6 = Long.getLong(386945968,-373481329);
         this.Renamed6040 = Long.getLong(184857581,1110813993);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6023(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed6015
      {
         return Renamed6015(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6024:
               this.client.Renamed6020(Renamed663(this.Renamed6025.decode(param2)),int(this.Renamed6026.decode(param2)));
               break;
            case this.Renamed6027:
               this.client.Renamed5744(Renamed4207(this.Renamed6028.decode(param2)),Renamed663(this.Renamed6029.decode(param2)));
               break;
            case this.3DPositionVector0:
               this.client.Renamed5745(this.3DPositionVector1.decode(param2) as Vector.<Renamed4207>,Renamed663(this.3DPositionVector2.decode(param2)));
               break;
            case this.3DPositionVector3:
               this.client.Renamed6021(this.3DPositionVector4.decode(param2) as Vector.<Renamed4207>,this.3DPositionVector5.decode(param2) as Vector.<Renamed4207>);
               break;
            case this.3DPositionVector6:
               this.client.userConnect(String(this.3DPositionVector7.decode(param2)),this.3DPositionVector8.decode(param2) as Vector.<Renamed2737>,Renamed663(this.3DPositionVector9.decode(param2)));
               break;
            case this.Renamed6040:
               this.client.Renamed5747(String(this.Renamed6041.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

