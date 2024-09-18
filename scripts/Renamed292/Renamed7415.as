package Renamed292
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battlefield.models.bonus.battle.Renamed7400;
   
   public class Renamed7401 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7402;
      
      private var client:Renamed4613;
      
      private var modelId:Long;
      
      private var Renamed7403:Long;
      
      private var Renamed7404:ICodec;
      
      private var Renamed7405:Long;
      
      private var Renamed7406:ICodec;
      
      private var Renamed7407:Long;
      
      private var Renamed7408:ICodec;
      
      private var Renamed7409:Long;
      
      private var Renamed7410:ICodec;
      
      private var Renamed7411:Long;
      
      private var Renamed7412:ICodec;
      
      public function Renamed7401()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4613(this);
         this.modelId = Long.getLong(499495185,-1001709329);
         this.Renamed7403 = Long.getLong(1110230456,-1498226724);
         this.Renamed7405 = Long.getLong(947041522,265172046);
         this.Renamed7407 = Long.getLong(1746264244,602761789);
         this.Renamed7409 = Long.getLong(1980545667,907256776);
         this.Renamed7411 = Long.getLong(325483057,2045730824);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7402(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed7413
      {
         return Renamed7413(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7403:
            case this.Renamed7405:
            case this.Renamed7407:
            case this.Renamed7409:
               break;
            case this.Renamed7411:
               this.client.Renamed7414(this.Renamed7412.decode(param2) as Vector.<Renamed4159>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

