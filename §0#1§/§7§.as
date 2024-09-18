package §0#1§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §7§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§case for catch§;
      
      private var client:§try catch static§;
      
      private var modelId:Long;
      
      private var §null set var§:Long;
      
      private var §dynamic const if§:ICodec;
      
      private var §^!S§:Long;
      
      private var §implements package set§:ICodec;
      
      private var §1!w§:Long;
      
      private var §+!<§:ICodec;
      
      private var §8#"§:ICodec;
      
      private var §else catch return§:Long;
      
      private var §1I§:ICodec;
      
      private var §+!-§:ICodec;
      
      private var §9#3§:ICodec;
      
      private var §0#K§:ICodec;
      
      private var §["3§:ICodec;
      
      public function §7§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §try catch static§(this);
         this.modelId = Long.getLong(505740619,208573179);
         this.§null set var§ = Long.getLong(1314377165,-137514211);
         this.§^!S§ = Long.getLong(1283643622,1059974789);
         this.§1!w§ = Long.getLong(954743485,-2074939053);
         this.§else catch return§ = Long.getLong(954743485,-2063362954);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §case for catch§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§null set var§:
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

