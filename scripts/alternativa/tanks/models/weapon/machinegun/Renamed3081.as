package alternativa.tanks.models.weapon.machinegun
{
   import Renamed23.Renamed24;
   import Renamed479.Renamed915;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import Renamed381.Renamed3045;
   import Renamed462.Renamed3128;
   import Renamed462.Renamed3075;
   
   public class Renamed3081 implements Renamed990
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static var Renamed3077:Renamed664 = new Renamed664();
      
      private var Renamed991:Renamed915;
      
      private var tank:Tank;
      
      private var Renamed3129:TankSpecification;
      
      private var Renamed3130:Number;
      
      private var Renamed3131:Number;
      
      private var _state:Number = 0;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed3132:Renamed3045;
      
      private var Renamed2969:Renamed2407;
      
      private var params:Renamed24;
      
      private var sfxData:Renamed3075;
      
      private var effects:Renamed3128;
      
      private var object:ClientObject;
      
      public function Renamed3081(param1:ClientObject, param2:Renamed24, param3:Renamed3075, param4:Renamed3045)
      {
         super();
         this.object = param1;
         this.Renamed2969 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         this.Renamed3129 = this.Renamed2969.getTankData(this.object).Renamed2872;
         this.sfxData = param3;
         this.Renamed3130 = 1 / param2.spinUpTime;
         this.Renamed3131 = 1 / param2.spinDownTime;
         this.params = param2;
         this.Renamed3132 = param4;
         this._state = this.params.state;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.effects = new Renamed3128(param1,this.params,this.sfxData);
      }
      
      public function activate() : void
      {
         this.Renamed991 = Renamed915(this.object.getParams(Renamed915));
         this.tank = this.Renamed2969.getTank(this.object);
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
      
      public function Renamed3090(param1:int, param2:Boolean) : void
      {
         this.updateState(param1,param2);
         this.Renamed3133();
         this.effects.update(param1,this.state,param2);
      }
      
      public function Renamed3087() : Renamed664
      {
         this.Renamed3110.Renamed1054(Renamed3077);
         return Renamed3077;
      }
      
      public function Renamed3094(param1:Vector3, param2:Number) : void
      {
         this.Renamed3134(this.tank.Renamed696(),Renamed3077.Renamed693,param1,-this.Renamed3132.Renamed3068() * param2);
      }
      
      public function Renamed3096(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         this.Renamed3134(param1,param2,param3,this.Renamed3132.Renamed3067() * param4);
      }
      
      public function Renamed3093(param1:int, param2:int, param3:int) : Number
      {
         return Math.max(param1 + Math.min(param2 - param3,0),0) / 1000;
      }
      
      public function Renamed3099(param1:Vector3, param2:Boolean) : void
      {
         if(this.Renamed688())
         {
            this.effects.Renamed3099(param1,param2);
         }
         else
         {
            this.effects.Renamed3100(true);
         }
      }
      
      public function Renamed3100() : void
      {
         this.effects.Renamed3100(!this.Renamed688());
      }
      
      public function reset() : void
      {
         this._state = 0;
         if(this.Renamed991 != null)
         {
            this.Renamed991.Renamed3135(0);
         }
      }
      
      public function destroy() : void
      {
         this.effects.destroy();
         this.effects = null;
         if(this.Renamed3110 != null)
         {
            this.Renamed3110 = null;
         }
         if(this.Renamed991 != null)
         {
            this.Renamed991 = null;
         }
         if(this.tank != null)
         {
            this.tank = null;
         }
         this.Renamed2969 = null;
         this.Renamed3129 = null;
         this.sfxData = null;
         this.params = null;
         this.Renamed3132 = null;
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
      
      private function Renamed3134(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.addWorldForceScaled(param2,param3,param4);
         var _loc5_:Tank = param1.tank;
         var _loc6_:int;
         if((_loc6_ = _loc5_.Renamed856().Renamed1217 + _loc5_.Renamed857().Renamed1217) == 0 || Renamed668.Renamed700(param1))
         {
            param1.addScaledForce(param3,-param4);
         }
      }
      
      private function Renamed688() : Boolean
      {
         return Renamed668.Renamed688(this.Renamed3110.Renamed696(),Renamed3077);
      }
      
      private function updateState(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this._state = Math.min(1,this.state + param1 * this.Renamed3130);
         }
         else
         {
            this._state = Math.max(0,this.state - param1 * this.Renamed3131);
         }
      }
      
      private function Renamed3133() : void
      {
         var _loc1_:Number = this.params.weaponTurnDecelerationCoeff + this.Renamed3136() * (1 - this.params.weaponTurnDecelerationCoeff);
         if(this.Renamed991 != null)
         {
            this.Renamed991.setMaxTurnSpeed(this.Renamed3129.turretRotationSpeed * _loc1_,true);
            this.Renamed991.setTurnAcceleration(this.Renamed3132.Renamed3137() * _loc1_);
            this.Renamed991.Renamed3135(this.state);
         }
      }
      
      private function Renamed3136() : Number
      {
         return 1 - this.state;
      }
   }
}

