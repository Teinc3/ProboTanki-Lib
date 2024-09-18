package Renamed145
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed2177 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4974;
      
      private var client:Renamed2175;
      
      private var modelId:Long;
      
      private var Renamed4982:Long;
      
      private var Renamed4983:ICodec;
      
      private var Renamed4984:ICodec;
      
      private var Renamed4985:ICodec;
      
      private var Renamed4986:Long;
      
      private var Renamed4987:ICodec;
      
      public function Renamed2177()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2175(this);
         this.modelId = Long.getLong(1428989873,1951780812);
         this.Renamed4982 = Long.getLong(810018451,-1328707173);
         this.Renamed4986 = Long.getLong(826886748,-1809986386);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4974(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4982:
               break;
            case this.Renamed4986:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

