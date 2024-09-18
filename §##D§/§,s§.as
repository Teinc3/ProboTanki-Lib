package §##D§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §,s§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§throw const while§;
      
      private var client:§%"i§;
      
      private var modelId:Long;
      
      private var §,"w§:Long;
      
      private var §function catch while§:Long;
      
      private var §set var break§:Long;
      
      private var §>"u§:ICodec;
      
      private var §1D§:ICodec;
      
      private var §set each§:ICodec;
      
      private var §throw set package§:Long;
      
      private var §["T§:ICodec;
      
      private var §class catch finally§:Long;
      
      private var §dynamic var return§:ICodec;
      
      private var §[#!§:ICodec;
      
      private var §4#§:Long;
      
      private var §,"G§:ICodec;
      
      private var §native catch break§:Long;
      
      private var §static var for§:ICodec;
      
      private var §&#x§:Long;
      
      private var §var var include§:ICodec;
      
      public function §,s§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §%"i§(this);
         this.modelId = Long.getLong(500772743,-1275562344);
         this.§,"w§ = Long.getLong(1132148565,-1228176022);
         this.§function catch while§ = Long.getLong(1500025148,-1072265992);
         this.§set var break§ = Long.getLong(815803475,677498549);
         this.§throw set package§ = Long.getLong(815803475,677432898);
         this.§class catch finally§ = Long.getLong(1121481378,274069336);
         this.§4#§ = Long.getLong(1056545941,1597681057);
         this.§native catch break§ = Long.getLong(1235006804,1616331544);
         this.§&#x§ = Long.getLong(696094159,-894234735);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §throw const while§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         var _loc3_:* = param1;
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

