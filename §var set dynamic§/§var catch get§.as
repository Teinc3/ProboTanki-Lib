package §var set dynamic§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §var catch get§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§,#e§;
      
      private var client:§ "e§;
      
      private var modelId:Long;
      
      private var §'!?§:Long;
      
      private var §super var class§:Long;
      
      private var §import var continue§:Long;
      
      private var §7!r§:ICodec;
      
      public function §var catch get§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = § "e§(this);
         this.modelId = Long.getLong(0,300020019);
         this.§'!?§ = Long.getLong(0,300020045);
         this.§super var class§ = Long.getLong(0,300020046);
         this.§import var continue§ = Long.getLong(0,300020047);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §,#e§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§'!?§:
            case this.§super var class§:
               break;
            case this.§import var continue§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

