package §catch set dynamic§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §in const dynamic§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§with const while§;
      
      private var client:§@!Z§;
      
      private var modelId:Long;
      
      private var §^!S§:Long;
      
      private var §implements package set§:ICodec;
      
      private var §1!w§:Long;
      
      private var §+!<§:ICodec;
      
      private var §8#"§:ICodec;
      
      private var §else catch return§:Long;
      
      private var §1I§:ICodec;
      
      private var §+!-§:ICodec;
      
      private var §[t§:ICodec;
      
      public function §in const dynamic§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §@!Z§(this);
         this.modelId = Long.getLong(254322684,-956504003);
         this.§^!S§ = Long.getLong(1180507715,64759943);
         this.§1!w§ = Long.getLong(547115248,565846485);
         this.§else catch return§ = Long.getLong(547115248,577422584);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §with const while§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§^!S§:
            case this.§1!w§:
               break;
            case this.§else catch return§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

