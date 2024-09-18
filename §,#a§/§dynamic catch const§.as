package §,#a§
{
   import § !g§.§class for case§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §dynamic catch const§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§else catch function§;
      
      private var client:§!"3§;
      
      private var modelId:Long;
      
      private var §8"V§:Long;
      
      private var §%!^§:ICodec;
      
      private var §!#<§:Long;
      
      private var §@q§:ICodec;
      
      private var §83§:Long;
      
      private var §0!R§:ICodec;
      
      private var §4#D§:ICodec;
      
      private var §2!x§:ICodec;
      
      private var §function package super§:Long;
      
      private var §7<§:ICodec;
      
      private var §'#k§:ICodec;
      
      private var §var catch use§:Long;
      
      private var §default function§:Long;
      
      private var §use const null§:ICodec;
      
      private var §package for try§:ICodec;
      
      private var §use package case§:Long;
      
      private var §""K§:ICodec;
      
      private var §if package dynamic§:ICodec;
      
      public function §dynamic catch const§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §!"3§(this);
         this.modelId = Long.getLong(375259874,-2064506790);
         this.§8"V§ = Long.getLong(113336798,-635616124);
         this.§!#<§ = Long.getLong(113336798,-648481992);
         this.§83§ = Long.getLong(1656540814,-150441162);
         this.§function package super§ = Long.getLong(93222359,396117780);
         this.§var catch use§ = Long.getLong(1109525934,-1995327689);
         this.§default function§ = Long.getLong(1209531510,1444573534);
         this.§use package case§ = Long.getLong(1944648201,859419652);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §else catch function§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §7N§
      {
         return §7N§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§8"V§:
               this.client.§super const implements§(§class for case§(this.§%!^§.decode(param2)));
               break;
            case this.§!#<§:
               this.client.§'#V§(§class for case§(this.§@q§.decode(param2)));
               break;
            case this.§83§:
               this.client.§<"L§(int(this.§0!R§.decode(param2)),Number(this.§4#D§.decode(param2)),Number(this.§2!x§.decode(param2)));
               break;
            case this.§function package super§:
               this.client.§return var each§(int(this.§7<§.decode(param2)),§each package default§(this.§'#k§.decode(param2)));
               break;
            case this.§var catch use§:
               this.client.§null var while§();
               break;
            case this.§default function§:
               this.client.§5"0§(int(this.§use const null§.decode(param2)),String(this.§package for try§.decode(param2)));
               break;
            case this.§use package case§:
               this.client.§import var class§(int(this.§""K§.decode(param2)),String(this.§if package dynamic§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

