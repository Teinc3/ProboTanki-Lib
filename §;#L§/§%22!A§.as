package §;#L§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battlefield.models.bonus.battle.§1§;
   
   public class §"!A§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§6#M§;
      
      private var client:§4#&§;
      
      private var modelId:Long;
      
      private var §include for for§:Long;
      
      private var §6"h§:ICodec;
      
      private var §;N§:Long;
      
      private var §`g§:ICodec;
      
      private var §false var static§:Long;
      
      private var §while catch else§:ICodec;
      
      private var §[#%§:Long;
      
      private var §dynamic package finally§:ICodec;
      
      private var §throw do§:Long;
      
      private var §%#c§:ICodec;
      
      public function §"!A§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §4#&§(this);
         this.modelId = Long.getLong(499495185,-1001709329);
         this.§include for for§ = Long.getLong(1110230456,-1498226724);
         this.§;N§ = Long.getLong(947041522,265172046);
         this.§false var static§ = Long.getLong(1746264244,602761789);
         this.§[#%§ = Long.getLong(1980545667,907256776);
         this.§throw do§ = Long.getLong(325483057,2045730824);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §6#M§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §throw var switch§
      {
         return §throw var switch§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§include for for§:
            case this.§;N§:
            case this.§false var static§:
            case this.§[#%§:
               break;
            case this.§throw do§:
               this.client.§6"Y§(this.§%#c§.decode(param2) as Vector.<§1#1§>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

