package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.§4%§;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§]!`§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.§@"e§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import §for set super§.§function set extends§;
   
   public class §2a§ extends §else package false§ implements §4%§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const §>#V§:Number = 2;
      
      private static const §with var package§:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const §final package break§:EncryptedInt = new EncryptedIntImpl(2000);
      
      private static const §]^§:Number = 500;
      
      private static const §["s§:Number = 200;
      
      private static const §break var dynamic§:Number = §]^§ * §]^§;
      
      private static const §with set set§:Number = 300000;
      
      private var tank:Tank;
      
      private var §7V§:int;
      
      private var §if catch true§:Vector3;
      
      private var §include catch else§:Number;
      
      private var § "G§:Dictionary;
      
      private var §+#&§:int;
      
      private var §5#[§:Boolean;
      
      private var §import for get§:Boolean;
      
      private var §"&§:§var use§;
      
      private var §'"&§:Boolean = false;
      
      public function §2a§(param1:Tank, param2:Dictionary)
      {
         this.§if catch true§ = new Vector3();
         super();
         this.tank = param1;
         this.§ "G§ = param2;
         this.§import for get§ = true;
         this.§"&§ = new §var use§(battleEventDispatcher);
         this.§"&§.§#"<§(§]!`§,this.§3"'§);
         this.§"&§.§throw var set§();
      }
      
      private function §3"'§(param1:Object) : void
      {
         this.§import for get§ = true;
      }
      
      public function reset() : void
      {
         this.§7V§ = §'x§().§]"d§();
         this.§if catch true§.copy(this.§&!#§());
         this.§+#&§ = this.tank.§catch set if§().§continue const override§ + this.tank.§!"b§().§continue const override§;
         this.§5#[§ = this.tank.§continue const§() || this.tank.§,%§();
         this.§include catch else§ = this.§6#r§();
      }
      
      public function §function const static§(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Boolean = this.§default for§() || this.§import for get§;
         this.§import for get§ = false;
         if(this.tank.§,%§())
         {
            for each(_loc2_ in this.tank.§%G§())
            {
            }
         }
         if(this.§5!Q§() || this.tank.§catch extends§())
         {
            this.§[8§();
         }
         if(_loc3_ || this.§4$§())
         {
            this.§2#R§(_loc3_);
            this.§'"&§ = false;
         }
      }
      
      private function §5!Q§() : Boolean
      {
         return §@"e§.§final var override§(this.§if catch true§,this.tank.§0"t§().state.position);
      }
      
      private function §[8§() : void
      {
         this.§7V§ = §'x§().§]"d§() - §class true§.§@"r§;
         this.§if catch true§.copy(this.§!!A§());
         this.§,n§().§+#+§(true);
      }
      
      private function §!!A§() : Vector3
      {
         return this.tank.§0"t§().prevState.position;
      }
      
      private function §4$§() : Boolean
      {
         return this.§<"7§() || this.§'"&§;
      }
      
      private function §default for§() : Boolean
      {
         return this.§override var extends§() || this.§include package get§() || this.§super var import§() || this.§continue for include§() || this.§null for set§() || this.§in const native§() || this.tank.§`#U§() || this.tank.§class var while§();
      }
      
      public function §@#b§() : void
      {
         this.§'"&§ = true;
      }
      
      private function §null for set§() : Boolean
      {
         var _loc1_:Boolean = this.tank.§continue const§() || this.tank.§,%§();
         return _loc1_ != this.§5#[§;
      }
      
      private function §continue for include§() : Boolean
      {
         var _loc1_:int = this.tank.§catch set if§().§continue const override§ + this.tank.§!"b§().§continue const override§;
         return this.§+#&§ == 0 && _loc1_ != 0 || this.§+#&§ != 0 && _loc1_ == 0;
      }
      
      private function §<"7§() : Boolean
      {
         return §'x§().§]"d§() - this.§7V§ >= §final package break§.getInt();
      }
      
      private function §override var extends§() : Boolean
      {
         return this.§if catch true§.distanceToXYSquared(this.§&!#§()) > §break var dynamic§;
      }
      
      private function §include package get§() : Boolean
      {
         return Math.abs(this.§if catch true§.z - this.§&!#§().z) > §["s§;
      }
      
      private function §2#R§(param1:Boolean) : void
      {
         this.reset();
         this.§,n§().§false set function§(param1);
      }
      
      private function §&!#§() : Vector3
      {
         return this.tank.§0"t§().state.position;
      }
      
      private function §in const native§() : Boolean
      {
         var _loc1_:Number = this.§6#r§() - this.§include catch else§;
         return _loc1_ > §with set set§;
      }
      
      private function §super var import§() : Boolean
      {
         var _loc1_:int = §with var package§.getInt();
         return this.§]"<§() && getTimer() - this.§7V§ > _loc1_;
      }
      
      private function §6#r§() : Number
      {
         var _loc1_:BodyState = this.tank.§0"t§().state;
         var _loc2_:Number = _loc1_.position.z * Math.abs(§'x§().§16§());
         var _loc3_:Number = _loc1_.velocity.length();
         var _loc4_:Number = _loc3_ * _loc3_ * 0.5;
         return _loc4_ + _loc2_;
      }
      
      private function §]"<§() : Boolean
      {
         var _loc1_:Tank = null;
         var _loc2_:Body = null;
         var _loc3_:BodyState = null;
         var _loc4_:Body = this.tank.§0"t§();
         var _loc5_:BodyState = _loc4_.state;
         var _loc6_:Number = this.tank.§&#[§();
         var _loc7_:Number = §>#V§;
         for each(var _loc10_ in this.§ "G§)
         {
            _loc1_ = _loc10_;
            _loc10_;
            if(this.tank != _loc1_)
            {
               _loc2_ = _loc1_.§0"t§();
               _loc3_ = _loc2_.state;
               if(§function set extends§.test(_loc5_.position,_loc5_.velocity,_loc6_,_loc3_.position,_loc3_.velocity,_loc1_.§&#[§(),_loc7_))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function §,n§() : §2!s§
      {
         return §2!s§(OSGi.getInstance().getService(§finally var return§));
      }
   }
}

