package §8!2§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §,">§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§"!U§;
      
      private var client:§`!@§;
      
      private var modelId:Long;
      
      private var §,!p§:Long;
      
      private var §do set const§:ICodec;
      
      private var §catch set switch§:Long;
      
      private var §catch set§:ICodec;
      
      private var §extends else§:ICodec;
      
      private var §;#u§:ICodec;
      
      private var §static for import§:ICodec;
      
      public function §,">§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §`!@§(this);
         this.modelId = Long.getLong(0,300020004);
         this.§,!p§ = Long.getLong(0,300020000);
         this.§catch set switch§ = Long.getLong(0,300020001);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §"!U§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§,!p§:
               this.client.youAreBlocked(String(this.§do set const§.decode(param2)));
               break;
            case this.§catch set switch§:
               this.client.youWereKicked(String(this.§catch set§.decode(param2)),int(this.§extends else§.decode(param2)),int(this.§;#u§.decode(param2)),int(this.§static for import§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

