package alternativa.tanks.camera
{
   public class Renamed1471
   {
      private var Renamed1490:Number;
      
      private var Renamed1491:Number;
      
      private var angularAcceleration:Number;
      
      private var angularSpeed:Number;
      
      private var Renamed1492:Number;
      
      public function Renamed1471()
      {
         super();
      }
      
      public function init(param1:Number, param2:Number, param3:Number) : void
      {
         this.Renamed1491 = param2 - param1;
         if(this.Renamed1491 < 0)
         {
            this.Renamed1491 = -this.Renamed1491;
            this.Renamed1492 = -1;
         }
         else
         {
            this.Renamed1492 = 1;
         }
         if(this.Renamed1491 > Math.PI)
         {
            this.Renamed1492 = -this.Renamed1492;
            this.Renamed1491 = 2 * Math.PI - this.Renamed1491;
         }
         this.angularAcceleration = param3 * this.Renamed1491;
         this.angularSpeed = 0;
         this.Renamed1490 = 0;
      }
      
      public function reverseAcceleration() : void
      {
         this.angularAcceleration = -this.angularAcceleration;
      }
      
      public function update(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.Renamed1490 < this.Renamed1491)
         {
            _loc2_ = this.angularAcceleration * param1;
            _loc3_ = (this.angularSpeed + 0.5 * _loc2_) * param1;
            this.angularSpeed += _loc2_;
            _loc4_ = this.Renamed1491 - this.Renamed1490;
            if(_loc4_ < _loc3_)
            {
               _loc3_ = _loc4_;
            }
            this.Renamed1490 += _loc3_;
            return _loc3_ * this.Renamed1492;
         }
         return 0;
      }
   }
}

