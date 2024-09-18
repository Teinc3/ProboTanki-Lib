package projects.tanks.client.panel.model.battleinvite
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §default package override§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§in for var§;
      
      private var client:§class set function§;
      
      private var modelId:Long;
      
      private var §<#b§:Long;
      
      private var §const var for§:ICodec;
      
      private var §2!'§:Long;
      
      private var §extends set null§:ICodec;
      
      private var §-"1§:ICodec;
      
      private var §+"o§:Long;
      
      private var §each for in§:ICodec;
      
      private var §4![§:Long;
      
      private var §each for default§:ICodec;
      
      private var §%!X§:Long;
      
      private var §while set if§:ICodec;
      
      private var §final native§:Long;
      
      private var §&#v§:ICodec;
      
      private var §6!a§:Long;
      
      private var §-L§:ICodec;
      
      private var §continue set true§:Long;
      
      private var §native package throw§:ICodec;
      
      public function §default package override§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §class set function§(this);
         this.modelId = Long.getLong(0,300050004);
         this.§<#b§ = Long.getLong(0,300050009);
         this.§2!'§ = Long.getLong(0,300050010);
         this.§+"o§ = Long.getLong(0,300050011);
         this.§4![§ = Long.getLong(0,300050012);
         this.§%!X§ = Long.getLong(0,300050013);
         this.§final native§ = Long.getLong(0,300050014);
         this.§6!a§ = Long.getLong(0,300050015);
         this.§continue set true§ = Long.getLong(0,300050016);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §in for var§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : § !&§
      {
         return § !&§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§<#b§:
            case this.§2!'§:
            case this.§+"o§:
            case this.§4![§:
            case this.§%!X§:
            case this.§final native§:
            case this.§6!a§:
               break;
            case this.§continue set true§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

