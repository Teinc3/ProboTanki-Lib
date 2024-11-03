package Renamed4594
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed6341 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6752;
      
      private var client:Renamed4595;
      
      private var modelId:Long;
      
      private var Renamed6753:Long;
      
      private var Renamed6754:ICodec;
      
      private var Renamed6755:ICodec;
      
      private var Renamed6756:Long;
      
      private var Renamed6757:ICodec;
      
      private var Renamed6758:ICodec;
      
      private var Renamed6759:ICodec;
      
      private var Renamed6760:Long;
      
      private var Renamed6761:ICodec;
      
      private var Renamed6762:ICodec;
      
      private var Renamed6763:Long;
      
      private var Renamed6764:ICodec;
      
      private var Renamed6765:ICodec;
      
      public function Renamed6341()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4595(this);
         this.modelId = Long.getLong(1012996430,-1521107309);
         this.Renamed6753 = Long.getLong(316505180,-455455939);
         this.Renamed6756 = Long.getLong(2051659052,-1157285002);
         this.Renamed6760 = Long.getLong(1221726371,2088665273);
         this.Renamed6763 = Long.getLong(266349932,2077700618);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6752(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed6339
      {
         return Renamed6339(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6753:
            case this.Renamed6756:
            case this.Renamed6760:
               break;
            case this.Renamed6763:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

