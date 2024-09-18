package §return const for§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §%,§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§extends for override§;
      
      private var client:§4#a§;
      
      private var modelId:Long;
      
      private var §false null§:Long;
      
      private var §return set class§:Long;
      
      public function §%,§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §4#a§(this);
         this.modelId = Long.getLong(1044301282,-2025301046);
         this.§false null§ = Long.getLong(182699568,659372466);
         this.§return set class§ = Long.getLong(182698837,-1030515090);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §extends for override§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§false null§:
               this.client.§@"4§();
               break;
            case this.§return set class§:
               this.client.§?"9§();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

