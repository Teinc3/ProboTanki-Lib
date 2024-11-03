package Renamed479
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.objects.tank.Renamed1154;
   import alternativa.tanks.battle.objects.tank.Renamed947;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.BitMask;
   import alternativa.tanks.utils.MathUtils;
   import Renamed381.Renamed3045;
   import Renamed381.Renamed2768;
   
   public final class Renamed915
   {
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      public static const Renamed7865:int = 5;
      
      public static const Renamed7866:int = 6;
      
      public static const Renamed9440:int = 7;
      
      public static const Renamed7186:int = 8;
      
      public static const Renamed7187:int = 9;
      
      private static const Renamed9441:Number = 5;
      
      private static const Renamed9442:Number = 20;
      
      private static const Renamed9443:Number = 0.05;
      
      private static const Renamed9444:Number = Renamed9443 * Math.PI / 180;
      
      private static const EPSILON:Number = 0.000001;
      
      private static var Renamed9445:Vector3 = new Vector3();
      
      private static var Renamed9446:Vector3 = new Vector3();
      
      private static var Renamed9447:Vector3 = new Vector3();
      
      private static var Renamed669:Vector3 = new Vector3();
      
      private var Renamed987:Renamed947;
      
      private var maxTurnSpeed:Number = 0;
      
      private var turnAcceleration:Number = 0;
      
      private var turnSpeed:Number = 0;
      
      private var Renamed5182:Number = 0;
      
      private var Renamed9448:Number = 0;
      
      private var Renamed9449:int;
      
      private var Renamed1036:int;
      
      private var Renamed9450:Boolean;
      
      private var Renamed9451:Number = 0;
      
      private var Renamed2987:BitMask;
      
      private var Renamed9452:Boolean;
      
      protected var Renamed9425:int = 0;
      
      private var Renamed9453:int = 0;
      
      private var Renamed9454:Number;
      
      protected var Renamed5260:Number = 0;
      
      private var Renamed9455:Number;
      
      private var Renamed9456:Boolean;
      
      private var listener:Renamed2754;
      
      private var Renamed9457:Boolean = false;
      
      private var Renamed9458:Boolean = false;
      
      private var Renamed9459:Boolean = false;
      
      private var Renamed9460:Vector.<Boolean>;
      
      private var Renamed6777:Number;
      
      private var Renamed9461:Number;
      
      private var tank:Renamed775;
      
      public function Renamed915(param1:Boolean, param2:Renamed775)
      {
         this.tank = param2;
         this.Renamed987 = new Renamed1154(0.3,10,0,0);
         this.Renamed2987 = new BitMask();
         this.Renamed9460 = new Vector.<Boolean>(256,true);
         super();
         var _loc3_:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _loc4_:Renamed2768 = Renamed2768(OSGi.getInstance().getService(Renamed2768));
         var _loc5_:Renamed3045 = _loc4_.Renamed3057(param2.turret);
         this.Renamed9452 = param1;
         this.setMaxTurnSpeed(_loc5_.Renamed8341(),true);
         this.turnAcceleration = _loc5_.Renamed3137();
         this.Renamed6777 = Math.PI;
         this.Renamed9461 = -Math.PI;
         this.Renamed2987.clear();
      }
      
      public function Renamed9462(param1:Number) : void
      {
         this.Renamed9451 = param1;
      }
      
      public function lock(param1:int) : void
      {
         this.Renamed2987.change(param1,true);
         if(this.isLocked())
         {
            this.turnSpeed = 0;
            this.Renamed9463(0);
         }
      }
      
      public function unlock(param1:int) : void
      {
         var _loc2_:Boolean = this.isLocked();
         this.Renamed2987.change(param1,false);
         if(!this.isLocked() && _loc2_)
         {
            this.Renamed9450 = false;
            this.Renamed9463(this.Renamed9425);
         }
      }
      
      public function Renamed2848(param1:int, param2:Boolean = false) : void
      {
         this.Renamed9425 = param1;
         if(this.isEnabled())
         {
            this.Renamed9463(param1,param2);
         }
      }
      
      private function Renamed9463(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:int = this.Renamed9453;
         this.Renamed9453 = param1;
         var _loc4_:int = MathUtils.getBitValue(param1,Renamed7865);
         var _loc5_:int = MathUtils.getBitValue(param1,Renamed7866);
         this.Renamed1036 = _loc4_ - _loc5_;
         this.Renamed9450 = _loc4_ + _loc5_ == 0 && (this.Renamed9450 || MathUtils.getBitValue(param1,Renamed9440) == 1);
         if(this.Renamed9453 != _loc3_ || param2)
         {
            this.Renamed9464(this.Renamed9453);
         }
      }
      
      protected function Renamed9464(param1:int) : void
      {
         if(this.listener != null)
         {
            this.listener.Renamed2842(param1);
         }
      }
      
      public function Renamed2853(param1:Number) : void
      {
         this.Renamed9448 = param1;
      }
      
      public function Renamed5262(param1:Number) : void
      {
         var _loc2_:Number = this.Renamed5703(param1,this.Renamed9455);
         if(Math.abs(_loc2_) > Renamed9444)
         {
            this.Renamed9455 = param1;
            this.Renamed9456 = true;
            this.Renamed9459 = true;
         }
      }
      
      public function Renamed1013() : Number
      {
         return this.Renamed9448;
      }
      
      public function getControl() : int
      {
         return this.isEnabled() ? int(this.Renamed9425) : int(0);
      }
      
      public function rotate(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = false;
         if(this.Renamed9456)
         {
            this.Renamed9465(param1);
         }
         this.Renamed2848(this.Renamed9425,this.Renamed9458);
         this.Renamed9458 = false;
         this.Renamed5182 = this.Renamed9448;
         this.maxTurnSpeed = this.Renamed987.update(param1);
         if(this.Renamed2987.isEmpty())
         {
            if(this.Renamed9450)
            {
               if(this.Renamed9448 == this.Renamed9451)
               {
                  this.Renamed9466();
                  return;
               }
               _loc2_ = this.Renamed9448 < this.Renamed9451 ? int(1) : int(-1);
            }
            else
            {
               _loc2_ = this.Renamed1036;
            }
            if(this.Renamed9449 != _loc2_)
            {
               this.turnSpeed = 0;
               this.Renamed9449 = _loc2_;
            }
            if(_loc2_ == 0)
            {
               this.turnSpeed = 0;
               return;
            }
            this.turnSpeed += _loc2_ * this.turnAcceleration * param1;
            this.turnSpeed = MathUtils.clamp(this.turnSpeed,-this.maxTurnSpeed,this.maxTurnSpeed);
            _loc3_ = this.Renamed9448 < this.Renamed9451;
            this.Renamed9448 += this.turnSpeed * param1;
            if(this.Renamed9450 && _loc3_ != this.Renamed9448 < this.Renamed9451)
            {
               this.Renamed9448 = this.Renamed9451;
               this.Renamed9466();
               return;
            }
            this.Renamed9448 = MathUtils.clampAngle(this.Renamed9448);
            this.Renamed9448 = MathUtils.clamp(this.Renamed9448,this.Renamed9461,this.Renamed6777);
         }
      }
      
      private function Renamed9465(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         this.Renamed9425 = 0;
         var _loc4_:Number = this.Renamed5703(this.Renamed9455,this.Renamed1013());
         var _loc5_:Number = Math.abs(_loc4_);
         if(_loc5_ >= EPSILON)
         {
            _loc2_ = this.Renamed9467() * param1;
            if(_loc5_ < _loc2_ && !this.Renamed9459)
            {
               _loc3_ = _loc2_ / Renamed9441;
               if(_loc5_ <= _loc3_)
               {
                  this.Renamed2853(this.Renamed9455);
                  this.Renamed9456 = false;
                  if(_loc5_ >= _loc2_ / Renamed9442)
                  {
                     this.Renamed9458 = true;
                  }
               }
               else
               {
                  this.Renamed2853(this.Renamed1013() + _loc4_ / 2);
               }
            }
            else
            {
               if(_loc4_ < 0)
               {
                  this.Renamed9425 = MathUtils.changeBitValue(this.Renamed9425,Renamed7866,true);
                  this.Renamed9425 = MathUtils.changeBitValue(this.Renamed9425,Renamed7865,false);
               }
               else if(_loc4_ > 0)
               {
                  this.Renamed9425 = MathUtils.changeBitValue(this.Renamed9425,Renamed7865,true);
                  this.Renamed9425 = MathUtils.changeBitValue(this.Renamed9425,Renamed7866,false);
               }
               this.Renamed9459 = false;
            }
         }
      }
      
      private function Renamed5703(param1:Number, param2:Number) : Number
      {
         return Math.atan2(Math.sin(param1 - param2),Math.cos(param1 - param2));
      }
      
      private function Renamed9466() : void
      {
         this.Renamed9450 = false;
         this.turnSpeed = 0;
      }
      
      public function Renamed1123(param1:Body) : void
      {
         this.Renamed9468(param1);
      }
      
      private function Renamed9468(param1:Body) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.Renamed9454 > 0)
         {
            param1.prevState.orientation.getYAxis(Renamed9446);
            param1.prevState.orientation.getZAxis(Renamed9445);
            param1.state.orientation.getYAxis(Renamed9447);
            Renamed669.cross2(Renamed9447,Renamed9446);
            _loc2_ = Renamed669.dot(Renamed9445);
            _loc3_ = Renamed9446.dot(Renamed9447);
            _loc4_ = Math.atan2(_loc2_,_loc3_);
            this.Renamed9448 += _loc4_ * this.Renamed9454;
         }
      }
      
      public function Renamed1101(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = this.Renamed9448 - this.Renamed5182;
         if(_loc3_ < -Math.PI)
         {
            _loc2_ = this.Renamed5182 + param1 * (MathUtils.PI2 + _loc3_);
            if(_loc2_ > Math.PI)
            {
               _loc2_ -= MathUtils.PI2;
            }
         }
         else if(_loc3_ > Math.PI)
         {
            _loc2_ = this.Renamed5182 - param1 * (MathUtils.PI2 - _loc3_);
            if(_loc2_ < -Math.PI)
            {
               _loc2_ += MathUtils.PI2;
            }
         }
         else
         {
            _loc2_ = this.Renamed5182 + param1 * _loc3_;
         }
         return _loc2_;
      }
      
      public function isRotating() : Boolean
      {
         return this.turnSpeed != 0;
      }
      
      public function reset() : void
      {
         this.turnSpeed = 0;
         this.Renamed5182 = 0;
         this.Renamed9448 = this.Renamed9451;
         this.Renamed987.reset(this.Renamed987.Renamed1081());
         this.Renamed9450 = false;
         if(this.Renamed9452)
         {
            this.Renamed1036 = 0;
         }
      }
      
      public function setListener(param1:Renamed2754) : void
      {
         this.listener = param1;
         this.Renamed2848(0);
         this.Renamed9455 = 0;
      }
      
      public function setMaxTurnSpeed(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.maxTurnSpeed = param1;
            this.Renamed987.reset(param1);
         }
         else
         {
            this.Renamed987.Renamed1088(param1);
         }
      }
      
      public function Renamed9467() : Number
      {
         return this.Renamed987.Renamed1081();
      }
      
      public function setTurnAcceleration(param1:Number) : void
      {
         this.turnAcceleration = param1;
      }
      
      public function getTurnAcceleration() : Number
      {
         return this.turnAcceleration;
      }
      
      protected function isLocked() : Boolean
      {
         return !this.Renamed2987.isEmpty();
      }
      
      public function isEnabled() : Boolean
      {
         return this.Renamed2987.isEmpty();
      }
      
      public function Renamed3135(param1:Number) : void
      {
         this.Renamed9454 = param1;
      }
      
      public function rotateLeft(param1:Boolean) : void
      {
         this.setState(Renamed915.Renamed7865,param1);
         this.Renamed9456 = false;
      }
      
      public function rotateRight(param1:Boolean) : void
      {
         this.setState(Renamed915.Renamed7866,param1);
         this.Renamed9456 = false;
      }
      
      public function Renamed5274(param1:Boolean) : void
      {
         this.setState(Renamed915.Renamed7186,param1);
         this.Renamed9456 = false;
      }
      
      public function Renamed5276(param1:Boolean) : void
      {
         this.setState(Renamed915.Renamed7187,param1);
         this.Renamed9456 = false;
      }
      
      public function center(param1:Boolean) : void
      {
         this.setState(Renamed915.Renamed9440,param1);
         this.Renamed9456 = false;
      }
      
      private function setState(param1:int, param2:Boolean) : void
      {
         this.Renamed9425 = MathUtils.changeBitValue(this.Renamed9425,param1,param2);
      }
      
      public function Renamed5263(param1:Number) : void
      {
         this.Renamed5260 = param1;
         this.Renamed9457 = true;
      }
      
      public function Renamed1022() : Number
      {
         return this.Renamed5260;
      }
      
      public function Renamed1027() : Boolean
      {
         return this.Renamed9457;
      }
      
      public function Renamed1084() : void
      {
         this.Renamed5260 = 0;
         this.Renamed9457 = false;
      }
      
      public function Renamed5266() : void
      {
         this.Renamed9455 = this.Renamed1013();
      }
      
      public function Renamed5271(param1:uint, param2:Boolean) : void
      {
         if(param1 < this.Renamed9460.length)
         {
            this.Renamed9460[param1] = param2;
         }
      }
      
      public function Renamed5279(param1:uint) : Boolean
      {
         return param1 < this.Renamed9460.length ? Boolean(this.Renamed9460[param1]) : Boolean(false);
      }
      
      public function Renamed5265() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed9460.length)
         {
            this.Renamed9460[_loc1_] = false;
            _loc1_++;
         }
      }
   }
}

