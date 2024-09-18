package projects.tanks.client.panel.model.dailyquest
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §super package throw§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§continue var set§;
      
      private var client:§35§;
      
      private var modelId:Long;
      
      public function §super package throw§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §35§(this);
         this.modelId = Long.getLong(1302806391,660914812);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §continue var set§(IModel(this));
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

