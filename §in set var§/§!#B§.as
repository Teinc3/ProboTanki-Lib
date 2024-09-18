package §in set var§
{
   import §7"j§.§ q§;
   import §7"j§.§3!n§;
   import §7"j§.§8#n§;
   import §7"j§.§;!9§;
   import §7"j§.§<S§;
   import §7"j§.§extends super§;
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§else package false§;
   import §extends for const§.§import use§;
   import §if set import§.§3"3§;
   import §switch var return§.§%]§;
   import §switch var return§.§null package throw§;
   
   public class §!#B§ extends §else package false§ implements §3"3§, § q§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const §#"9§:Number = 100;
      
      private var §dynamic package set§:§import use§;
      
      private var range:Number;
      
      private var coneAngle:Number;
      
      private var sfxData:§null package throw§;
      
      private var §const set function§:§%]§;
      
      private var §7"o§:§;!9§;
      
      private var §catch package else§:§3!n§;
      
      private var §&#s§:§3!n§;
      
      public function §!#B§(param1:§import use§, param2:Number, param3:Number, param4:§null package throw§)
      {
         super();
         this.§dynamic package set§ = param1;
         this.range = param2;
         this.coneAngle = param3;
         this.sfxData = param4;
      }
      
      public function §else package while§(param1:Body, param2:Vector3, param3:Object3D) : void
      {
         var _loc4_:§implements for break§ = null;
         var _loc5_:§extends super§ = null;
         var _loc6_:Vector3 = null;
         var _loc7_:§extends super§ = null;
         var _loc8_:§8#n§ = null;
         var _loc9_:§<S§ = null;
         if(this.§const set function§ == null)
         {
            this.§const set function§ = §%]§(this.§dynamic package set§.getObject(§%]§));
            this.§const set function§.init(param1,this.range,this.coneAngle,§`#,§.§class catch dynamic§,param2,param3,this.sfxData,§'x§().§const const true§(),§`#,§.§if catch static§,§`#,§.§in static§,§`#,§.§return set in§,§`#,§.§?!-§,§`#,§.§true var native§,§`#,§.§package const implements§);
            battleService.§3l§().§7"0§(this.§const set function§);
            _loc4_ = §implements for break§.create(this.sfxData.§catch var super§,§`#,§.§final import§);
            this.§7"o§ = §;!9§(this.§dynamic package set§.getObject(§;!9§));
            this.§7"o§.§get set package§(_loc4_,param3,this);
            §'x§().§'M§().§each set set§(this.§7"o§);
            this.§catch package else§ = §3!n§(this.§dynamic package set§.getObject(§3!n§));
            _loc5_ = §extends super§(this.§dynamic package set§.getObject(§extends super§));
            _loc6_ = new Vector3();
            _loc6_.copy(param2);
            _loc6_.z += this.§#"9§;
            _loc5_.init(param3,param2);
            _loc5_.init(param3,param2,0);
            _loc7_ = §extends super§(this.§dynamic package set§.getObject(§extends super§));
            _loc7_.init(param3,_loc6_);
            _loc7_.init(param3,_loc6_,0);
            this.§catch package else§.init(_loc7_,this.sfxData.§function package use§,this.sfxData.§continue package false§);
            battleService.§3l§().§7"0§(this.§catch package else§);
            this.§&#s§ = §3!n§(this.§dynamic package set§.getObject(§3!n§));
            _loc8_ = §8#n§(this.§dynamic package set§.getObject(§8#n§));
            _loc8_.init(param3,param2,§'x§().§const const true§(),§`#,§.§super set set§);
            _loc9_ = §<S§(this.§dynamic package set§.getObject(§<S§));
            _loc9_.init(this.§const set function§,_loc8_);
            this.§&#s§.init(_loc9_,this.sfxData.§+#c§,this.sfxData.§break package implements§);
            battleService.§3l§().§7"0§(this.§&#s§);
         }
      }
      
      public function §while set use§() : void
      {
         if(this.§const set function§ != null)
         {
            this.§const set function§.kill();
            this.§const set function§ = null;
            this.§4"Z§();
            this.§catch package else§.stop();
            this.§catch package else§ = null;
            this.§&#s§.stop();
            this.§&#s§ = null;
         }
      }
      
      private function §4"Z§() : void
      {
         if(this.§7"o§ != null)
         {
            this.§7"o§.kill();
            this.§7"o§ = null;
         }
      }
      
      public function §dynamic var each§(param1:§final var super§) : void
      {
         if(this.§7"o§ == param1)
         {
            this.§7"o§ = null;
         }
      }
   }
}

