package §<"K§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §0!W§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§import set catch§;
      
      private var client:§0"D§;
      
      private var modelId:Long;
      
      private var §const const static§:Long;
      
      private var § #@§:ICodec;
      
      private var §else false§:Long;
      
      private var §switch var dynamic§:ICodec;
      
      private var §implements package throw§:Long;
      
      public function §0!W§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §0"D§(this);
         this.modelId = Long.getLong(1286074115,-176946994);
         this.§const const static§ = Long.getLong(343596326,-230405373);
         this.§else false§ = Long.getLong(208555485,-6667003);
         this.§implements package throw§ = Long.getLong(154981282,1951339013);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §import set catch§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§const const static§:
               break;
            case this.§else false§:
               this.client.§finally while§(int(this.§switch var dynamic§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

