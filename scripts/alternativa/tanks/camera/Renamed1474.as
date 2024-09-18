package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed1464 extends Renamed1457 implements Renamed611
   {
      private static const Renamed1465:Number = 3000;
      
      private static const Renamed1466:Vector3 = new Vector3();
      
      private var p1:Vector3;
      
      private var p2:Vector3;
      
      private var Renamed1467:Vector3;
      
      private var Renamed1468:Vector3;
      
      private var Renamed1469:Number;
      
      private var distance:Number;
      
      private var acceleration:Number;
      
      private var speed:Number;
      
      private var Renamed1470:Renamed1471;
      
      private var Renamed1472:Renamed1471;
      
      public var duration:int;
      
      public function Renamed1464(param1:int)
      {
         this.p1 = new Vector3();
         this.p2 = new Vector3();
         this.Renamed1467 = new Vector3();
         this.Renamed1468 = new Vector3();
         this.Renamed1470 = new Renamed1471();
         this.Renamed1472 = new Renamed1471();
         super();
         this.duration = param1;
      }
      
      public function init(param1:Vector3, param2:Vector3) : void
      {
         this.p1.copy(Renamed1460());
         this.p2.copy(this.p1);
         this.Renamed1468.copy(param1);
         this.Renamed1467.copy(this.Renamed1468);
         this.p2.z = this.Renamed1467.z = (this.p1.z > this.Renamed1468.z ? this.p1.z : this.Renamed1468.z) + Renamed1465;
         var _loc3_:Number = 4000000 / (this.duration * this.duration);
         this.Renamed1470.init(MathUtils.clampAngle(Renamed1461()),param2.x,_loc3_);
         this.Renamed1472.init(MathUtils.clampAngle(Renamed1463()),param2.z,_loc3_);
         var _loc4_:Vector3 = new Vector3();
         _loc4_.diff(this.Renamed1468,this.p1);
         this.Renamed1469 = _loc4_.length();
         this.acceleration = this.Renamed1469 * _loc3_;
         this.distance = 0;
         this.speed = 0;
      }
      
      override public function update(param1:int, param2:int) : void
      {
         if(this.speed < 0)
         {
            return;
         }
         if(this.distance > 0.5 * this.Renamed1469 && this.acceleration > 0)
         {
            this.acceleration = -this.acceleration;
            this.Renamed1470.reverseAcceleration();
            this.Renamed1472.reverseAcceleration();
         }
         var _loc3_:Number = 0.001 * param2;
         var _loc4_:Number = this.acceleration * _loc3_;
         this.distance += (this.speed + 0.5 * _loc4_) * _loc3_;
         this.speed += _loc4_;
         if(this.distance > this.Renamed1469)
         {
            this.distance = this.Renamed1469;
         }
         this.Renamed1473(this.distance / this.Renamed1469,this.p1,this.p2,this.Renamed1467,this.Renamed1468,Renamed1466);
         setPosition(Renamed1466);
         Renamed1459(this.Renamed1470.update(_loc3_),0,this.Renamed1472.update(_loc3_));
      }
      
      private function Renamed1473(param1:Number, param2:Vector3, param3:Vector3, param4:Vector3, param5:Vector3, param6:Vector3) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = 1 - param1;
         _loc7_ = _loc9_ * _loc9_;
         var _loc10_:Number = 3 * param1 * _loc7_;
         _loc7_ *= _loc9_;
         _loc8_ = param1 * param1;
         var _loc11_:Number = 3 * _loc8_ * _loc9_;
         _loc8_ *= param1;
         param6.x = _loc7_ * param2.x + _loc10_ * param3.x + _loc11_ * param4.x + _loc8_ * param5.x;
         param6.y = _loc7_ * param2.y + _loc10_ * param3.y + _loc11_ * param4.y + _loc8_ * param5.y;
         param6.z = _loc7_ * param2.z + _loc10_ * param3.z + _loc11_ * param4.z + _loc8_ * param5.z;
      }
   }
}

