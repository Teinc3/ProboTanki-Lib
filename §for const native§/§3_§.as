package §for const native§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   
   public class §3_§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§7#u§;
      
      private var client:§#"6§;
      
      private var modelId:Long;
      
      private var §static set import§:Long;
      
      private var §3#i§:ICodec;
      
      public function §3_§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §#"6§(this);
         this.modelId = Long.getLong(0,300050003);
         this.§static set import§ = Long.getLong(0,300050005);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §7#u§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§static set import§:
               this.client.showAvailableItems(this.§3#i§.decode(param2) as Vector.<GarageItemInfo>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

