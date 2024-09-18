package §set implements§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §final set return§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§"#T§;
      
      private var client:§`!`§;
      
      private var modelId:Long;
      
      private var §-#W§:Long;
      
      private var §^!#§:ICodec;
      
      public function §final set return§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §`!`§(this);
         this.modelId = Long.getLong(2058573415,-746879275);
         this.§-#W§ = Long.getLong(888592950,-646476035);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §"#T§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§-#W§:
               this.client.show(String(this.§^!#§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

