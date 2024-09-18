package §^!f§
{
   import §;"?§.§#">§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import §each throw§.§super set var§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §throw const function§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§]!I§;
      
      private var client:§`!X§;
      
      private var modelId:Long;
      
      private var §implements var override§:Long;
      
      private var §for break§:Long;
      
      private var §include const null§:Long;
      
      private var §-!^§:ICodec;
      
      private var §-'§:ICodec;
      
      public function §throw const function§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §`!X§(this);
         this.modelId = Long.getLong(2040386917,729965137);
         this.§implements var override§ = Long.getLong(1582297866,2028596660);
         this.§for break§ = Long.getLong(2129251848,-1338052132);
         this.§include const null§ = Long.getLong(338478335,1466416629);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §]!I§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§implements var override§:
               this.client.startFire();
               break;
            case this.§for break§:
               this.client.§else package else§();
               break;
            case this.§include const null§:
               this.client.§>!p§(§#">§(this.§-!^§.decode(param2)),this.§-'§.decode(param2) as Vector.<§super set var§>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

