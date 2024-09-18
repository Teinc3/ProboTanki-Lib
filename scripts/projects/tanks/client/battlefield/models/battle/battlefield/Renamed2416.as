package projects.tanks.client.battlefield.models.battle.battlefield
{
   import Renamed306.Renamed2404;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2416 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4142;
      
      private var client:Renamed2415;
      
      private var modelId:Long;
      
      private var Renamed4153:Long;
      
      private var Renamed4154:Long;
      
      private var Renamed4155:Long;
      
      private var Renamed4156:ICodec;
      
      private var Renamed4157:Long;
      
      private var Renamed4158:ICodec;
      
      public function Renamed2416()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2415(this);
         this.modelId = Long.getLong(1723277227,1936126557);
         this.Renamed4153 = Long.getLong(1285984840,1983429603);
         this.Renamed4154 = Long.getLong(1210824392,-987670337);
         this.Renamed4155 = Long.getLong(180030714,353397522);
         this.Renamed4157 = Long.getLong(711773257,1091256454);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4142(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed2404
      {
         return Renamed2404(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4153:
            case this.Renamed4154:
            case this.Renamed4155:
               break;
            case this.Renamed4157:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

