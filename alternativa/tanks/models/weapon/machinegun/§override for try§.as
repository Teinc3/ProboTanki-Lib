package alternativa.tanks.models.weapon.machinegun
{
   import §1#c§.§-"c§;
   import §]#R§.§try set for§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import §if package do§.§'!L§;
   import §with for class§.§native var else§;
   import §with for class§.§null var§;
   
   public class §override for try§ implements §4"3§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static var §=#0§:§ !8§ = new § !8§();
      
      private var §finally for var§:§try set for§;
      
      private var tank:Tank;
      
      private var §%!6§:TankSpecification;
      
      private var §override var catch§:Number;
      
      private var §=#S§:Number;
      
      private var _state:Number = 0;
      
      private var §try do§:§1"o§;
      
      private var §#"W§:§'!L§;
      
      private var §,n§:§2!s§;
      
      private var params:§-"c§;
      
      private var sfxData:§null var§;
      
      private var effects:§native var else§;
      
      private var object:ClientObject;
      
      public function §override for try§(param1:ClientObject, param2:§-"c§, param3:§null var§, param4:§'!L§)
      {
         super();
         this.object = param1;
         this.§,n§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         this.§%!6§ = this.§,n§.getTankData(this.object).§import extends§;
         this.sfxData = param3;
         this.§override var catch§ = 1 / param2.spinUpTime;
         this.§=#S§ = 1 / param2.spinDownTime;
         this.params = param2;
         this.§#"W§ = param4;
         this._state = this.params.state;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.effects = new §native var else§(param1,this.params,this.sfxData);
      }
      
      public function activate() : void
      {
         this.§finally for var§ = §try set for§(this.object.getParams(§try set for§));
         this.tank = this.§,n§.getTank(this.object);
      }
      
      public function start() : void
      {
      }
      
      public function stop() : void
      {
      }
      
      public function get state() : Number
      {
         return this._state;
      }
      
      public function §do const const§(param1:int, param2:Boolean) : void
      {
         this.updateState(param1,param2);
         this.§true const catch§();
         this.effects.update(param1,this.state,param2);
      }
      
      public function §5$ §() : § !8§
      {
         this.§try do§.§get var switch§(§=#0§);
         return §=#0§;
      }
      
      public function §set package true§(param1:Vector3, param2:Number) : void
      {
         this.§-!K§(this.tank.§0"t§(),§=#0§.§6u§,param1,-this.§#"W§.§get package set§() * param2);
      }
      
      public function §set package each§(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         this.§-!K§(param1,param2,param3,this.§#"W§.§include package finally§() * param4);
      }
      
      public function §each for if§(param1:int, param2:int, param3:int) : Number
      {
         return Math.max(param1 + Math.min(param2 - param3,0),0) / 1000;
      }
      
      public function §get catch switch§(param1:Vector3, param2:Boolean) : void
      {
         if(this.§override var include§())
         {
            this.effects.§get catch switch§(param1,param2);
         }
         else
         {
            this.effects.§return const switch§(true);
         }
      }
      
      public function §return const switch§() : void
      {
         this.effects.§return const switch§(!this.§override var include§());
      }
      
      public function reset() : void
      {
         this._state = 0;
         if(this.§finally for var§ != null)
         {
            this.§finally for var§.§!!3§(0);
         }
      }
      
      public function destroy() : void
      {
         this.effects.destroy();
         this.effects = null;
         if(this.§try do§ != null)
         {
            this.§try do§ = null;
         }
         if(this.§finally for var§ != null)
         {
            this.§finally for var§ = null;
         }
         if(this.tank != null)
         {
            this.tank = null;
         }
         this.§,n§ = null;
         this.§%!6§ = null;
         this.sfxData = null;
         this.params = null;
         this.§#"W§ = null;
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      private function §-!K§(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.addWorldForceScaled(param2,param3,param4);
         var _loc5_:Tank = param1.tank;
         var _loc6_:int;
         if((_loc6_ = _loc5_.§catch set if§().§continue const override§ + _loc5_.§!"b§().§continue const override§) == 0 || §+$%§.§dynamic package import§(param1))
         {
            param1.addScaledForce(param3,-param4);
         }
      }
      
      private function §override var include§() : Boolean
      {
         return §+$%§.§override var include§(this.§try do§.§0"t§(),§=#0§);
      }
      
      private function updateState(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this._state = Math.min(1,this.state + param1 * this.§override var catch§);
         }
         else
         {
            this._state = Math.max(0,this.state - param1 * this.§=#S§);
         }
      }
      
      private function §true const catch§() : void
      {
         var _loc1_:Number = this.params.weaponTurnDecelerationCoeff + this.§implements const default§() * (1 - this.params.weaponTurnDecelerationCoeff);
         if(this.§finally for var§ != null)
         {
            this.§finally for var§.setMaxTurnSpeed(this.§%!6§.turretRotationSpeed * _loc1_,true);
            this.§finally for var§.setTurnAcceleration(this.§#"W§.§@[§() * _loc1_);
            this.§finally for var§.§!!3§(this.state);
         }
      }
      
      private function §implements const default§() : Number
      {
         return 1 - this.state;
      }
   }
}

