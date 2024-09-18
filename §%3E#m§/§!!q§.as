package §>#m§
{
   import §0#W§.§&h§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §!!q§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§package const in§;
      
      private var client:§&!b§;
      
      private var modelId:Long;
      
      private var §?#=§:Long;
      
      private var §import const try§:ICodec;
      
      private var §6"#§:ICodec;
      
      private var §true catch set§:Long;
      
      private var §native for native§:ICodec;
      
      private var §,!H§:Long;
      
      private var §extends set false§:ICodec;
      
      private var §2"d§:ICodec;
      
      private var §6"V§:Long;
      
      private var §@"L§:ICodec;
      
      public function §!!q§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §&!b§(this);
         this.modelId = Long.getLong(1726782619,1524609945);
         this.§?#=§ = Long.getLong(205404481,2036669945);
         this.§true catch set§ = Long.getLong(1555095151,929348553);
         this.§,!H§ = Long.getLong(1017385554,-1412933910);
         this.§6"V§ = Long.getLong(1483129213,1398282388);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §package const in§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§?#=§:
               this.client.§get package if§(this.§import const try§.decode(param2) as Vector.<§5!"§>,§&h§(this.§6"#§.decode(param2)));
               break;
            case this.§true catch set§:
               this.client.§[E§(§&h§(this.§native for native§.decode(param2)));
               break;
            case this.§,!H§:
               this.client.skipDailyQuest(Long(this.§extends set false§.decode(param2)),§5!"§(this.§2"d§.decode(param2)));
               break;
            case this.§6"V§:
               this.client.§0!3§(Long(this.§@"L§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

