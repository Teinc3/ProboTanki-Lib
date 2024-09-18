package §]2§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §final const false§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§try const override§;
      
      private var client:§@#w§;
      
      private var modelId:Long;
      
      public function §final const false§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §@#w§(this);
         this.modelId = Long.getLong(2045216394,-936740390);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §try const override§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §+!§
      {
         return §+!§(initParams[Model.object]);
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

