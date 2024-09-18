package §set catch if§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   
   public class §false var class§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§return set native§;
      
      private var client:§import var true§;
      
      private var modelId:Long;
      
      private var §[T§:Long;
      
      private var §finally set in§:ICodec;
      
      private var §##+§:Long;
      
      private var §0K§:ICodec;
      
      private var §`!p§:ICodec;
      
      private var §&"1§:ICodec;
      
      public function §false var class§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §import var true§(this);
         this.modelId = Long.getLong(0,300110001);
         this.§[T§ = Long.getLong(0,300110000);
         this.§##+§ = Long.getLong(0,300110001);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §return set native§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §false for else§
      {
         return §false for else§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§[T§:
               this.client.activateAchievement(§null package extends§(this.§finally set in§.decode(param2)));
               break;
            case this.§##+§:
               this.client.completeAchievement(§null package extends§(this.§0K§.decode(param2)),String(this.§`!p§.decode(param2)),int(this.§&"1§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

