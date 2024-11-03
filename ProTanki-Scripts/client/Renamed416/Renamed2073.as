package Renamed416
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   
   public class Renamed2073 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8660;
      
      private var client:Renamed2074;
      
      private var modelId:Long;
      
      private var Renamed8661:Long;
      
      private var Renamed8662:ICodec;
      
      private var Renamed8663:Long;
      
      private var Renamed8664:ICodec;
      
      private var Renamed8665:ICodec;
      
      private var Renamed8666:ICodec;
      
      public function Renamed2073()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2074(this);
         this.modelId = Long.getLong(0,300110001);
         this.Renamed8661 = Long.getLong(0,300110000);
         this.Renamed8663 = Long.getLong(0,300110001);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8660(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed7589
      {
         return Renamed7589(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8661:
               this.client.activateAchievement(Renamed2072(this.Renamed8662.decode(param2)));
               break;
            case this.Renamed8663:
               this.client.completeAchievement(Renamed2072(this.Renamed8664.decode(param2)),String(this.Renamed8665.decode(param2)),int(this.Renamed8666.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

