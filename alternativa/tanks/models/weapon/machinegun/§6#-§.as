package alternativa.tanks.models.weapon.machinegun
{
   import §1#c§.§-"c§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§4"z§;
   import §each throw§.§super set var§;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   import §if package do§.§'!L§;
   import §with for class§.§null var§;
   
   public class §6#-§ implements §;!t§, §4"3§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §]^§:Number = 1000000;
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private static const §3!<§:§4"z§ = new §4"z§();
      
      private var §=#0§:§ !8§;
      
      private var §!^§:int;
      
      private var lastTime:int;
      
      private var params:§-"c§;
      
      private var target:Tank;
      
      private var §4#r§:Vector3;
      
      private var §finally catch var§:Boolean;
      
      private var §try do§:§1"o§;
      
      private var § ]§:§override for try§;
      
      private var §finally package native§:int;
      
      private var §implements var set§:Boolean;
      
      public function §6#-§(param1:ClientObject, param2:§-"c§, param3:§null var§, param4:§'!L§)
      {
         super();
         this.§ ]§ = new §override for try§(param1,param2,param3,param4);
         this.lastTime = 0;
         this.params = param2;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§ ]§.init(param1);
         this.§try do§ = param1;
         battleService.§'x§().§%#9§(this);
      }
      
      public function destroy() : void
      {
         this.§ ]§.destroy();
         battleService.§'x§().§%"7§(this);
      }
      
      public function deactivate() : void
      {
         this.disable(false);
      }
      
      public function start() : void
      {
         this.§ ]§.start();
         this.§=#0§ = this.§ ]§.§5$ §();
         this.§finally catch var§ = true;
         this.§implements var set§ = false;
         this.lastTime = this.§ "6§();
         this.§!^§ = this.lastTime + this.params.spinUpTime;
      }
      
      public function §>!p§(param1:Vector3, param2:Vector.<§super set var§>) : void
      {
         this.§=#0§ = this.§ ]§.§5$ §();
         this.§4#r§ = null;
         this.target = null;
         this.§implements var set§ = true;
         this.§finally package native§ = this.§ "6§();
         var _loc3_:Boolean = false;
         if(param2.length == 0)
         {
            if(this.§]"Z§(param1))
            {
               this.§4#r§ = §extends const default§.position;
               _loc3_ = §+$%§.§ #T§(§extends const default§.shape.body);
            }
         }
         else
         {
            _loc3_ = true;
            this.§4#r§ = §+$%§.§?#T§(param2[0].§package var true§);
            this.target = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTank(param2[0].target);
         }
         this.§8@§(_loc3_);
      }
      
      public function stop() : void
      {
         this.§ ]§.stop();
         this.target = null;
         this.§finally catch var§ = false;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         this.§ ]§.§do const const§(param2,this.§finally catch var§);
         this.§=#0§ = this.§ ]§.§5$ §();
         if(this.§finally catch var§)
         {
            this.§,#Q§();
            _loc3_ = this.§ ]§.§each for if§(param2,this.lastTime,this.§!^§);
            if(_loc3_ > 0)
            {
               this.§ ]§.§set package true§(this.§=#0§.direction,_loc3_);
               if(Boolean(this.target) && this.§finally package native§ + 500 < this.§ "6§())
               {
                  this.target = null;
               }
               if(this.target != null && this.target.§0"t§() != null)
               {
                  this.§ ]§.§set package each§(this.target.§0"t§(),this.§4#r§,this.§=#0§.direction,_loc3_);
               }
            }
         }
         this.lastTime = param1;
      }
      
      public function activate() : void
      {
         this.§ ]§.activate();
         if(this.params.started)
         {
            this.params.started = false;
            this.start();
            this.§!^§ = this.lastTime + this.params.spinUpTime * (1 - this.params.state);
            this.§>!p§(this.§=#0§.direction,new Vector.<§super set var§>());
         }
      }
      
      public function enable() : void
      {
         this.§ ]§.enable();
      }
      
      public function disable(param1:Boolean) : void
      {
         this.stop();
      }
      
      public function reset() : void
      {
         this.§ ]§.reset();
         this.target = null;
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      private function § "6§() : int
      {
         return battleService.§'x§().§]"d§();
      }
      
      private function §,#Q§() : void
      {
         var _loc1_:Boolean = false;
         if(this.§ ]§.state == 1 && !this.§implements var set§)
         {
            this.§=#0§ = this.§ ]§.§5$ §();
            _loc1_ = false;
            if(this.§]"Z§(this.§=#0§.direction))
            {
               this.§4#r§ = §extends const default§.position;
               _loc1_ = §+$%§.§ #T§(§extends const default§.shape.body);
            }
            else
            {
               this.§4#r§ = null;
            }
            this.§8@§(_loc1_);
         }
      }
      
      private function §]"Z§(param1:Vector3) : Boolean
      {
         var _loc2_:§!"N§ = battleService.§'x§().§const const true§();
         §3!<§.§@"n§ = this.§try do§.§0"t§();
         return _loc2_.raycast(this.§=#0§.§if package var§,param1,§super const continue§.WEAPON,§]^§,§3!<§,§extends const default§);
      }
      
      private function §8@§(param1:Boolean) : void
      {
         if(this.§4#r§ != null)
         {
            this.§ ]§.§get catch switch§(this.§4#r§,param1);
         }
         else
         {
            this.§ ]§.§return const switch§();
         }
      }
   }
}

