package §break set function§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §1# § extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§'!<§;
      
      private var client:§'!`§;
      
      private var modelId:Long;
      
      public function §1# §()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §'!`§(this);
         this.modelId = Long.getLong(0,300050032);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §'!<§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         var _loc3_:* = param1;
         var _loc4_:int = 0;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

