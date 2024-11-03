package alternativa.tanks.models.weapon.machinegun
{
   import Renamed23.Renamed24;
   import Renamed3069.Renamed3070;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.models.weapons.targeting.Renamed3072;
   import Renamed381.Renamed3073;
   import Renamed381.Renamed3045;
   import Renamed394.Renamed3074;
   import Renamed462.Renamed3075;
   
   public class Renamed3076 extends Renamed3070
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed3077:Renamed664;
      
      private var Renamed3078:Renamed3073;
      
      private var Renamed3079:Renamed3071;
      
      private var Renamed3080:Renamed3081;
      
      private var callback:Renamed3074;
      
      private var target:Tank;
      
      private var Renamed3082:Tank;
      
      private var weapon:Renamed3046;
      
      private var Renamed3083:int;
      
      private var temperatureHittingTime:int;
      
      private var params:Renamed24;
      
      private var lastTime:int;
      
      private var Renamed3084:int;
      
      private var Renamed3085:int;
      
      private var Renamed3086:Number;
      
      public function Renamed3076(param1:Renamed3071, param2:ClientObject, param3:Renamed24, param4:Renamed3075, param5:Renamed3045, param6:Renamed3074, param7:ClientObject)
      {
         this.Renamed3078 = new Renamed3073();
         this.Renamed3080 = new Renamed3081(param2,param3,param4,param5);
         this.Renamed3079 = param1;
         this.callback = param6;
         this.weapon = new Renamed3046(param7);
         this.params = param3;
         this.Renamed3084 = 0;
         this.lastTime = 0;
         this.Renamed3086 = 0;
         super(this.weapon);
      }
      
      override public function init(param1:Renamed925) : void
      {
         super.init(param1);
         this.Renamed3080.init(param1);
      }
      
      override public function activate() : void
      {
         super.activate();
         this.Renamed3080.activate();
      }
      
      override protected function start(param1:int) : void
      {
         super.start(param1);
         this.Renamed3080.start();
         this.lastTime = param1;
         this.Renamed3083 = param1 + this.params.spinUpTime;
         this.temperatureHittingTime = this.Renamed3083 + this.params.temperatureHittingTime;
         this.Renamed3077 = this.Renamed3080.Renamed3087();
         this.callback.Renamed3088(param1);
      }
      
      override protected function stop(param1:int, param2:Boolean) : void
      {
         var _loc3_:Number = this.getStatus();
         super.stop(param1,param2);
         this.Renamed3080.stop();
         var _loc4_:int = this.Renamed3080.state * this.params.spinDownTime;
         this.Renamed3084 = param1 + _loc4_;
         if(_loc4_ == 0)
         {
            this.Renamed3086 = 0;
         }
         else
         {
            this.Renamed3086 = (1 - _loc3_) / _loc4_;
         }
         if(param2)
         {
            this.callback.Renamed3089(param1);
         }
         this.Renamed3082 = null;
         this.target = null;
      }
      
      override public function Renamed769(param1:int, param2:int) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         super.Renamed769(param1,param2);
         this.Renamed3080.Renamed3090(param2,Renamed3091());
         if(Renamed3091())
         {
            this.Renamed3077 = this.Renamed3080.Renamed3087();
            _loc3_ = this.Renamed3092();
            _loc4_ = this.Renamed3080.Renamed3093(param2,this.lastTime,this.Renamed3083);
            if(_loc4_ > 0)
            {
               this.Renamed3080.Renamed3094(this.Renamed3077.direction,_loc4_);
               _loc5_ = Renamed668.Renamed688(this.Renamed3095().Renamed696(),this.Renamed3077);
               if((_loc5_) && this.target != null && this.target.Renamed695() != null)
               {
                  this.Renamed3080.Renamed3096(this.Renamed3078.body,this.Renamed3078.position,this.Renamed3077.direction,_loc4_);
               }
               else
               {
                  this.target = null;
               }
               if(this.target != this.Renamed3082 || param1 > this.Renamed3085 + 250)
               {
                  if(_loc5_)
                  {
                     this.callback.Renamed3097(param1,this.Renamed3078.direction,this.target,this.Renamed3078.position);
                  }
                  else
                  {
                     this.callback.Renamed3098(param1,this.Renamed3077.direction);
                  }
                  this.Renamed3085 = param1;
               }
            }
            if(_loc3_)
            {
               this.Renamed3080.Renamed3099(this.Renamed3078.position,this.target != null);
            }
            else
            {
               this.Renamed3080.Renamed3100();
            }
         }
         this.lastTime = param1;
      }
      
      private function Renamed3092() : Boolean
      {
         var _loc1_:RayHit = null;
         if(this.Renamed3080.state < 1)
         {
            return false;
         }
         var _loc2_:Renamed3072 = this.Renamed3079.target(this.Renamed3077);
         this.Renamed3078.setResult(this.Renamed3077,_loc2_);
         this.Renamed3082 = this.target;
         if(_loc2_.Renamed3101())
         {
            _loc1_ = _loc2_.Renamed3102();
            this.target = _loc1_.shape.body.tank;
         }
         else
         {
            this.target = null;
         }
         return _loc2_.Renamed3103();
      }
      
      override public function getStatus() : Number
      {
         if(Renamed3091())
         {
            return Math.max(Math.min((this.temperatureHittingTime - this.lastTime) / this.params.temperatureHittingTime,1),0);
         }
         return 1 - Math.max(this.Renamed3084 - this.lastTime,0) * this.Renamed3086;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.Renamed3080.reset();
         this.Renamed3082 = null;
         this.target = null;
      }
      
      override protected function Renamed3104() : Boolean
      {
         return this.lastTime >= this.Renamed3084;
      }
      
      override public function Renamed3095() : Renamed925
      {
         return super.Renamed3095();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.Renamed3080.destroy();
      }
   }
}

