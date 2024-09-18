package Renamed383
{
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
   
   public class Renamed5729 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8344;
      
      private var client:Renamed4683;
      
      private var modelId:Long;
      
      private var Renamed6027:Long;
      
      private var Renamed8345:ICodec;
      
      private var 3DPositionVector0:Long;
      
      private var Renamed8346:ICodec;
      
      private var 3DPositionVector6:Long;
      
      private var 3DPositionVector7:ICodec;
      
      private var 3DPositionVector8:ICodec;
      
      private var Renamed6040:Long;
      
      private var Renamed6041:ICodec;
      
      public function Renamed5729()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4683(this);
         this.modelId = Long.getLong(575618390,177970779);
         this.Renamed6027 = Long.getLong(965223943,535616065);
         this.3DPositionVector0 = Long.getLong(2010192701,-2134483217);
         this.3DPositionVector6 = Long.getLong(825794462,-1556026223);
         this.Renamed6040 = Long.getLong(329840042,1301345271);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8344(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed6454
      {
         return Renamed6454(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6027:
               this.client.Renamed5744(Renamed4207(this.Renamed8345.decode(param2)));
               break;
            case this.3DPositionVector0:
               this.client.Renamed5745(this.Renamed8346.decode(param2) as Vector.<Renamed4207>);
               break;
            case this.3DPositionVector6:
               this.client.userConnect(String(this.3DPositionVector7.decode(param2)),this.3DPositionVector8.decode(param2) as Vector.<Renamed2737>);
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

