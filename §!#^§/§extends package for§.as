package §!#^§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §extends package for§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§&!s§;
      
      private var client:§#"'§;
      
      private var modelId:Long;
      
      private var §`"?§:Long;
      
      private var §&#A§:ICodec;
      
      private var §continue var for§:ICodec;
      
      private var §case class§:ICodec;
      
      private var §-$#§:Long;
      
      private var §case set try§:ICodec;
      
      public function §extends package for§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §#"'§(this);
         this.modelId = Long.getLong(1428989873,1951780812);
         this.§`"?§ = Long.getLong(810018451,-1328707173);
         this.§-$#§ = Long.getLong(826886748,-1809986386);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §&!s§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§`"?§:
               break;
            case this.§-$#§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

