package §catch set default§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §[w§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§^"r§;
      
      private var client:§"#,§;
      
      private var modelId:Long;
      
      private var §2";§:Long;
      
      private var §catch set set§:ICodec;
      
      private var §@"K§:Long;
      
      private var §@!<§:ICodec;
      
      private var §if if§:ICodec;
      
      private var §throw catch extends§:Long;
      
      private var §else for null§:ICodec;
      
      private var §with for final§:ICodec;
      
      private var §[!3§:ICodec;
      
      private var §7"L§:ICodec;
      
      private var §0!"§:ICodec;
      
      private var §8"j§:Long;
      
      private var §super for in§:ICodec;
      
      public function §[w§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §"#,§(this);
         this.modelId = Long.getLong(479007306,2075268288);
         this.§2";§ = Long.getLong(1090794095,949129477);
         this.§@"K§ = Long.getLong(1558315722,-513756959);
         this.§throw catch extends§ = Long.getLong(1130188491,-1001840691);
         this.§8"j§ = Long.getLong(1555952411,-2052736679);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §^"r§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §>"#§
      {
         return §>"#§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§2";§:
               this.client.§in import§(String(this.§catch set set§.decode(param2)));
               break;
            case this.§@"K§:
               this.client.§9!M§(String(this.§@!<§.decode(param2)),String(this.§if if§.decode(param2)));
               break;
            case this.§throw catch extends§:
               this.client.§=8§(String(this.§else for null§.decode(param2)),Number(this.§with for final§.decode(param2)),Number(this.§[!3§.decode(param2)),Number(this.§7"L§.decode(param2)),String(this.§0!"§.decode(param2)));
               break;
            case this.§8"j§:
               this.client.§static set package§(String(this.§super for in§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

