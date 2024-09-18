package §in set else§
{
   import §7"j§.§ q§;
   import §7"j§.§;!9§;
   import §7"j§.§final var super§;
   import §7"j§.§implements for break§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import flash.media.Sound;
   import §with for class§.§null var§;
   
   public class §switch get§ implements § q§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §!#b§:int = 0;
      
      private static const §use var for§:int = 1;
      
      private static const §]#g§:int = 2;
      
      private static const §9#O§:int = 3;
      
      private static const §,!C§:int = 4;
      
      private static const §## §:Number = 0.7;
      
      private static const §null extends§:int = 115;
      
      private static const §4#l§:int = 3520;
      
      private static const §'"E§:int = 80;
      
      private static const §"@§:int = 100;
      
      private static const §import package var§:int = 27;
      
      private var _currentState:int = 0;
      
      private var _turret:Object3D;
      
      private var §5,§:Sound;
      
      private var §set set do§:Sound;
      
      private var §+!,§:Sound;
      
      private var §;m§:Sound;
      
      private var §=!_§:Sound;
      
      private var §6!3§:§implements for break§;
      
      private var §2#J§:§implements for break§;
      
      private var §3F§:§;!9§;
      
      private var §%"e§:§6",§;
      
      private var §<7§:Number;
      
      private var §9"D§:int;
      
      public function §switch get§(param1:Object3D, param2:§null var§, param3:Number)
      {
         super();
         this._turret = param1;
         this.§5,§ = param2.chainStartSound;
         this.§set set do§ = param2.turbineStartSound;
         this.§+!,§ = param2.shootSound;
         this.§;m§ = param2.shootEndSound;
         this.§=!_§ = param2.longFailSound;
         this.§6!3§ = this.§import set implements§(param2.hitSound);
         this.§2#J§ = this.§import set implements§(param2.tankHitSound);
         this.§<7§ = param3;
      }
      
      public function §native set null§(param1:int) : void
      {
         var _loc2_:§;!9§ = null;
         var _loc3_:§implements for break§ = null;
         if(this._currentState != §use var for§)
         {
            this._currentState = §use var for§;
            this.§`#y§(this.§set set do§,§4#l§ - this.§<7§);
            _loc2_ = §;!9§(battleService.§class while§().getObject(§;!9§));
            _loc3_ = §implements for break§.create(this.§5,§,§## §);
            _loc2_.init(_loc3_,this._turret,0,0,§null extends§);
            battleService.§"#D§(_loc2_);
         }
         this.§9"D§ = param1;
      }
      
      public function §7!-§() : void
      {
         if(this._currentState != §]#g§)
         {
            this._currentState = §]#g§;
            this.§`#y§(this.§+!,§,§'"E§,1000000);
         }
      }
      
      public function §include var override§() : void
      {
         if(this._currentState != §9#O§)
         {
            this._currentState = §9#O§;
            this.§`#y§(this.§;m§,§"@§);
         }
      }
      
      public function §true package package§(param1:int) : void
      {
         if(this._currentState != §,!C§)
         {
            this._currentState = §,!C§;
            this.§`#y§(this.§=!_§,this.§<7§ - this.§9"D§ + §import package var§,0,param1);
         }
      }
      
      public function §set const var§() : void
      {
         if(this._currentState != §!#b§)
         {
            this._currentState = §!#b§;
            this.§?!Z§();
         }
      }
      
      private function §`#y§(param1:Sound, param2:int, param3:int = 0, param4:int = 0) : void
      {
         this.§?!Z§();
         this.§3F§ = §;!9§(battleService.§class while§().getObject(§;!9§));
         var _loc5_:§implements for break§ = this.§import set implements§(param1);
         this.§3F§.init(_loc5_,this._turret,0,param3,param2,this);
         battleService.§"#D§(this.§3F§);
         if(param4 > 0)
         {
            this.§3F§.§'f§(param4);
         }
      }
      
      public function §9h§(param1:Vector3, param2:Boolean) : void
      {
         if(this.§%"e§ == null)
         {
            this.§%"e§ = §6",§(battleService.§class while§().getObject(§6",§));
            this.§%"e§.init(this.§6!3§,this.§2#J§);
            battleService.§"#D§(this.§%"e§);
         }
         this.§%"e§.§return const do§(param1,param2);
      }
      
      public function destroy() : void
      {
         this.§?!Z§();
         this.§1"0§();
         this.§5,§ = null;
         this.§set set do§ = null;
         this.§+!,§ = null;
         this.§;m§ = null;
         this.§=!_§ = null;
         this._turret = null;
      }
      
      private function §1"0§() : void
      {
         this.§false final§();
         §implements for break§.destroy(this.§6!3§);
         §implements for break§.destroy(this.§2#J§);
         this.§6!3§ = null;
         this.§2#J§ = null;
      }
      
      public function §false final§() : void
      {
         if(this.§%"e§ != null)
         {
            this.§%"e§.kill();
            this.§%"e§ = null;
         }
      }
      
      public function §dynamic var each§(param1:§final var super§) : void
      {
         if(this.§3F§ == param1)
         {
            this.§3F§ = null;
         }
      }
      
      private function §import set implements§(param1:Sound) : §implements for break§
      {
         return §implements for break§.create(param1,§## §);
      }
      
      private function §?!Z§() : void
      {
         if(this.§3F§ != null)
         {
            this.§3F§.kill();
            this.§3F§ = null;
         }
      }
   }
}

