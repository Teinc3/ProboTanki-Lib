package Renamed4543
{
   import Renamed479.Renamed5281;
   import Renamed479.Renamed5258;
   import Renamed479.Renamed915;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.services.targeting.Renamed1497;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed4546 implements Renamed5258, Renamed1497, Renamed5281
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      private var Renamed5282:Boolean = false;
      
      private var Renamed991:Renamed915;
      
      private var Renamed5283:Number;
      
      private var speed:Number;
      
      private var Renamed5284:Vector3;
      
      private var Renamed5285:Number;
      
      private var Renamed5286:Matrix3;
      
      private var camera:Renamed842;
      
      public function Renamed4546(param1:Renamed915, param2:Number)
      {
         this.Renamed5284 = new Vector3();
         this.Renamed5286 = new Matrix3();
         super();
         this.Renamed991 = param1;
         this.Renamed5283 = param2;
         this.speed = this.Renamed5283;
         this.camera = battleService.Renamed621().Renamed739();
      }
      
      public function tick(param1:Number) : void
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(this.Renamed5282)
         {
            this.Renamed991.Renamed2848(0);
         }
         else
         {
            _loc2_ = Renamed775.Renamed824.tank.Renamed1075().Renamed1020();
            this.Renamed5286 = Renamed668.Renamed670;
            this.Renamed5286.setRotationMatrixForObject3D(_loc2_);
            _loc3_ = Renamed668.Renamed669;
            this.Renamed5286.transformVectorInverse(this.camera.Renamed596,_loc3_);
            _loc4_ = Math.atan2(-_loc3_.x,_loc3_.y) + this.Renamed991.Renamed1013();
            this.Renamed991.Renamed5262(_loc4_);
            _loc5_ = Math.atan2(_loc3_.z,_loc3_.y);
            if(Math.abs(_loc5_ - this.Renamed5285) > 0.0001)
            {
               _loc6_ = this.speed * param1;
               this.Renamed5285 = MathUtils.clamp(_loc5_,this.Renamed5285 - _loc6_,this.Renamed5285 + _loc6_);
            }
            this.Renamed5287();
         }
      }
      
      public function enter() : void
      {
         Renamed1499.addListener(this);
         this.Renamed5285 = 0;
         this.Renamed5282 = false;
         this.Renamed5287();
      }
      
      public function exit() : void
      {
         Renamed1499.removeListener(this);
         this.Renamed5285 = -Math.PI / 2;
         this.Renamed5284.x = 0;
         this.Renamed5284.y = 0;
         this.Renamed5284.z = -1;
      }
      
      public function mouseRightButton(param1:Boolean, param2:Boolean) : Boolean
      {
         this.Renamed5282 = param1;
         return true;
      }
      
      public function Renamed3352(param1:Vector3) : void
      {
         param1.copy(this.Renamed5284);
      }
      
      public function Renamed5288(param1:Number) : void
      {
         this.speed = this.Renamed5283 * param1;
      }
      
      private function Renamed5287() : void
      {
         var _loc1_:Vector3 = Renamed668.Renamed669;
         _loc1_.reset(0,Math.cos(this.Renamed5285),Math.sin(this.Renamed5285));
         this.Renamed5286.transformVector(_loc1_,this.Renamed5284);
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(param1:int) : void
      {
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
      }
   }
}

