package §else const super§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class §5"'§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§'=§;
      
      private var client:§2"I§;
      
      private var modelId:Long;
      
      private var §with set include§:Long;
      
      private var §continue var throw§:ICodec;
      
      private var §>#6§:Long;
      
      private var §import const switch§:Long;
      
      private var §default package class§:ICodec;
      
      public function §5"'§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §2"I§(this);
         this.modelId = Long.getLong(0,300070012);
         this.§with set include§ = Long.getLong(0,300070011);
         this.§>#6§ = Long.getLong(0,300070012);
         this.§import const switch§ = Long.getLong(0,300070013);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §'=§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§with set include§:
               this.client.beginLayoutSwitch(LayoutState(this.§continue var throw§.decode(param2)));
               break;
            case this.§>#6§:
               this.client.cancelPredictedLayoutSwitch();
               break;
            case this.§import const switch§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

