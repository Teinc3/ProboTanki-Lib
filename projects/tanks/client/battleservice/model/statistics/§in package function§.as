package projects.tanks.client.battleservice.model.statistics
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §in package function§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§include catch with§;
      
      private var client:§case package class§;
      
      private var modelId:Long;
      
      private var §each var try§:Long;
      
      private var §case var final§:ICodec;
      
      private var §8"?§:Long;
      
      private var §]W§:Long;
      
      private var §const set set§:ICodec;
      
      private var §with null§:ICodec;
      
      private var §finally throw§:Long;
      
      private var §+"M§:ICodec;
      
      private var §finally set true§:ICodec;
      
      private var §8d§:ICodec;
      
      private var §do include§:Long;
      
      private var §finally var in§:ICodec;
      
      private var §,&§:ICodec;
      
      private var §each set switch§:Long;
      
      private var §throw for break§:Long;
      
      private var §"g§:ICodec;
      
      private var §each for include§:ICodec;
      
      public function §in package function§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §case package class§(this);
         this.modelId = Long.getLong(485575169,-17734339);
         this.§each var try§ = Long.getLong(2027633487,-2104416877);
         this.§8"?§ = Long.getLong(1618593100,700634933);
         this.§]W§ = Long.getLong(794588440,-1349024015);
         this.§finally throw§ = Long.getLong(1570125867,640719657);
         this.§do include§ = Long.getLong(2027560760,1768125684);
         this.§each set switch§ = Long.getLong(1312331174,-81511448);
         this.§throw for break§ = Long.getLong(844922966,157499169);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §include catch with§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §final const finally§
      {
         return §final const finally§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§each var try§:
               this.client.§`"G§(int(this.§case var final§.decode(param2)));
               break;
            case this.§8"?§:
               this.client.§override set catch§();
               break;
            case this.§]W§:
               break;
            case this.§finally throw§:
               this.client.roundFinish(Boolean(this.§+"M§.decode(param2)),this.§finally set true§.decode(param2) as Vector.<§2$ §>,int(this.§8d§.decode(param2)));
               break;
            case this.§do include§:
               this.client.roundStart(int(this.§finally var in§.decode(param2)),Boolean(this.§,&§.decode(param2)));
               break;
            case this.§each set switch§:
               this.client.§1#x§();
               break;
            case this.§throw for break§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

