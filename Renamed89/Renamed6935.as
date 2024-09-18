package Renamed89
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.weapon.shared.Renamed3388;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import Renamed366.Renamed3387;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import Renamed373.Renamed666;
   
   public class Renamed6935 extends Renamed1444 implements Renamed609
   {
      private static const Renamed784:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const Renamed10423:int = 20;
      
      private static const Renamed10424:Number = 3;
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed689:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const Renamed6987:Vector3 = new Vector3();
      
      private static const Renamed848:Vector3 = new Vector3();
      
      private static const Renamed6988:Vector3 = new Vector3();
      
      private static const intersection:RayHit = new RayHit();
      
      private var _range:Number;
      
      private var Renamed10425:Number;
      
      private var particleSpeed:Number;
      
      private var Renamed6990:Vector3;
      
      private var turret:Object3D;
      
      private var sfxData:Renamed9469;
      
      private var collisionDetector:CollisionDetector;
      
      private var Renamed10426:Vector.<Renamed3388>;
      
      private var Renamed10427:Number;
      
      private var Renamed10428:Number;
      
      private var time:int;
      
      private var Renamed10429:int;
      
      private var Renamed10430:int;
      
      private var container:Renamed908;
      
      private var dead:Boolean;
      
      private var Renamed10431:Renamed10432;
      
      private var Renamed6056:Body;
      
      private var Renamed10433:Number;
      
      private var Renamed10434:Number;
      
      private var Renamed10435:Number;
      
      private var Renamed10436:Number;
      
      public function Renamed6935(param1:Renamed1443)
      {
         this.Renamed6990 = new Vector3();
         this.Renamed10426 = new Vector.<Renamed3388>(Renamed10423);
         super(param1);
         this.Renamed10431 = new Renamed10432();
      }
      
      public function init(param1:Body, param2:Number, param3:Number, param4:Number, param5:Vector3, param6:Object3D, param7:Renamed9469, param8:CollisionDetector, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         this.Renamed6056 = param1;
         this._range = param2;
         this.Renamed10425 = Math.tan(0.5 * param3);
         this.particleSpeed = param4;
         this.Renamed6990.copy(param5);
         this.turret = param6;
         this.sfxData = param7;
         this.collisionDetector = param8;
         this.Renamed10433 = param11;
         this.Renamed10434 = param12;
         this.Renamed10435 = param13;
         this.Renamed10436 = param14;
         this.Renamed10431.resize(param9,param10);
         this.Renamed10427 = 2 * (param12 - param11) / param2;
         this.Renamed10428 = 1000 * param2 / (Renamed10423 * param4);
         this.Renamed10430 = 0;
         this.time = this.Renamed10429 = getTimer();
         this.Renamed10437(param7);
         this.dead = false;
      }
      
      private function Renamed10437(param1:Renamed9469) : void
      {
         var _loc2_:Renamed3387 = null;
         var _loc3_:ColorTransform = null;
         this.Renamed10431.init(param1.Renamed9492);
         if(param1.Renamed10438 != null)
         {
            _loc2_ = param1.Renamed10438[0];
            _loc3_ = this.Renamed10431.colorTransform == null ? new ColorTransform() : this.Renamed10431.colorTransform;
            _loc3_.alphaMultiplier = _loc2_.alphaMultiplier;
            _loc3_.alphaOffset = _loc2_.alphaOffset;
            _loc3_.redMultiplier = _loc2_.redMultiplier;
            _loc3_.redOffset = _loc2_.redOffset;
            _loc3_.greenMultiplier = _loc2_.greenMultiplier;
            _loc3_.greenOffset = _loc2_.greenOffset;
            _loc3_.blueMultiplier = _loc2_.blueMultiplier;
            _loc3_.blueOffset = _loc2_.blueOffset;
            this.Renamed10431.colorTransform = _loc3_;
         }
         else
         {
            this.Renamed10431.colorTransform = null;
         }
      }
      
      public function destroy() : void
      {
         while(this.Renamed10430 > 0)
         {
            this.Renamed10439(0);
         }
         this.container.removeChild(this.Renamed10431);
         this.Renamed10431.clear();
         this.container = null;
         this.Renamed6056 = null;
         this.turret = null;
         this.sfxData = null;
         this.collisionDetector = null;
         recycle();
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Renamed3388 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         this.Renamed6992();
         _loc3_ = param1 / Renamed784.getInt();
         if(this.collisionDetector.raycastStatic(Renamed689,direction,Renamed666.Renamed690,this.Renamed6990.y + this.Renamed10431.length,null,intersection))
         {
            this.Renamed10431.visible = false;
         }
         else
         {
            this.Renamed10431.visible = true;
            this.Renamed10431.update(_loc3_,this.sfxData.Renamed9492.fps);
            Renamed6378.Renamed6415(this.Renamed10431,Renamed6988,direction,param2.position);
         }
         if(!this.dead && this.Renamed10430 < Renamed10423 && this.time >= this.Renamed10429)
         {
            this.Renamed10429 += this.Renamed10428;
            this.Renamed10440();
         }
         var _loc7_:int = 0;
         while(_loc7_ < this.Renamed10430)
         {
            _loc4_ = this.Renamed10426[_loc7_];
            Renamed848.x = _loc4_.x;
            Renamed848.y = _loc4_.y;
            Renamed848.z = _loc4_.z;
            if(_loc4_.Renamed3391 > this._range || this.collisionDetector.raycastStatic(Renamed848,_loc4_.velocity,Renamed666.WEAPON,_loc3_,null,intersection))
            {
               this.Renamed10439(_loc7_--);
            }
            else
            {
               _loc5_ = _loc4_.velocity;
               _loc4_.x += _loc5_.x * _loc3_;
               _loc4_.y += _loc5_.y * _loc3_;
               _loc4_.z += _loc5_.z * _loc3_;
               _loc4_.Renamed3391 += this.particleSpeed * _loc3_;
               _loc4_.rotation += Renamed10424 * _loc3_ * _loc4_.Renamed3393;
               _loc4_.Renamed1653(_loc4_.Renamed3392);
               _loc4_.Renamed3392 += this.sfxData.Renamed9490.fps * _loc3_;
               _loc6_ = this.Renamed10433 + this.Renamed10427 * _loc4_.Renamed3391;
               if(_loc6_ > this.Renamed10434)
               {
                  _loc6_ = this.Renamed10434;
               }
               _loc4_.width = _loc6_;
               _loc4_.height = _loc6_;
               _loc4_.Renamed3397(this._range,this.sfxData.Renamed10262);
            }
            _loc7_++;
         }
         this.time += param1;
         return !this.dead || this.Renamed10430 > 0;
      }
      
      public function kill() : void
      {
         if(!this.dead)
         {
            this.dead = true;
            this.container.removeChild(this.Renamed10431);
         }
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed10431);
      }
      
      private function Renamed6992() : void
      {
         var _loc1_:Number = NaN;
         Renamed1273.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         Renamed6987.x = Renamed1273.m00;
         Renamed6987.y = Renamed1273.m10;
         Renamed6987.z = Renamed1273.m20;
         direction.x = Renamed1273.m01;
         direction.y = Renamed1273.m11;
         direction.z = Renamed1273.m21;
         Renamed1273.transformVector(this.Renamed6990,Renamed6988);
         _loc1_ = this.Renamed6990.y;
         Renamed689.x = Renamed6988.x - _loc1_ * direction.x;
         Renamed689.y = Renamed6988.y - _loc1_ * direction.y;
         Renamed689.z = Renamed6988.z - _loc1_ * direction.z;
      }
      
      private function Renamed10440() : void
      {
         var _loc1_:Number = this.Renamed10435 + Math.random() * this.Renamed10436;
         if(!this.Renamed10431.visible && intersection.t < this.Renamed6990.y + _loc1_)
         {
            return;
         }
         var _loc2_:Renamed3388 = Renamed3388.Renamed3394();
         _loc2_.Renamed1651(this.sfxData.Renamed9490);
         _loc2_.rotation = Math.random() * Math.PI * 2;
         _loc2_.Renamed3392 = Math.random() * _loc2_.getNumFrames();
         this.Renamed10441(direction);
         _loc2_.velocity.x = this.particleSpeed * direction.x;
         _loc2_.velocity.y = this.particleSpeed * direction.y;
         _loc2_.velocity.z = this.particleSpeed * direction.z;
         _loc2_.velocity.add(this.Renamed6056.state.velocity);
         _loc2_.Renamed3391 = _loc1_;
         _loc2_.x = Renamed6988.x + _loc1_ * direction.x;
         _loc2_.y = Renamed6988.y + _loc1_ * direction.y;
         _loc2_.z = Renamed6988.z + _loc1_ * direction.z;
         _loc2_.Renamed3393 = Math.random() < 0.5 ? int(1) : int(-1);
         var _loc3_:* = this.Renamed10430++;
         this.Renamed10426[_loc3_] = _loc2_;
         this.container.addChild(_loc2_);
      }
      
      private function Renamed10439(param1:int) : void
      {
         var _loc2_:Renamed3388 = this.Renamed10426[param1];
         this.Renamed10426[param1] = this.Renamed10426[--this.Renamed10430];
         this.Renamed10426[this.Renamed10430] = null;
         this.container.removeChild(_loc2_);
         _loc2_.dispose();
      }
      
      private function Renamed10441(param1:Vector3) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = 2 * Math.PI * Math.random();
         matrix.fromAxisAngle(param1,_loc3_);
         Renamed6987.transform3(matrix);
         _loc2_ = this._range * this.Renamed10425 * Math.random();
         param1.x = param1.x * this._range + Renamed6987.x * _loc2_;
         param1.y = param1.y * this._range + Renamed6987.y * _loc2_;
         param1.z = param1.z * this._range + Renamed6987.z * _loc2_;
         param1.normalize();
      }
      
      public function get Renamed6943() : Vector.<Renamed3388>
      {
         return this.Renamed10426;
      }
      
      public function get Renamed6942() : int
      {
         return this.Renamed10430;
      }
      
      public function get range() : Number
      {
         return this._range;
      }
   }
}

