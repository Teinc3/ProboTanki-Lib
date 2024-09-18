package alternativa.tanks.camera
{
   public class §if set catch§
   {
      private var §1x§:Number;
      
      private var §;"h§:Number;
      
      private var angularAcceleration:Number;
      
      private var angularSpeed:Number;
      
      private var §var catch static§:Number;
      
      public function §if set catch§()
      {
         super();
      }
      
      public function init(param1:Number, param2:Number, param3:Number) : void
      {
         this.§;"h§ = param2 - param1;
         if(this.§;"h§ < 0)
         {
            this.§;"h§ = -this.§;"h§;
            this.§var catch static§ = -1;
         }
         else
         {
            this.§var catch static§ = 1;
         }
         if(this.§;"h§ > Math.PI)
         {
            this.§var catch static§ = -this.§var catch static§;
            this.§;"h§ = 2 * Math.PI - this.§;"h§;
         }
         this.angularAcceleration = param3 * this.§;"h§;
         this.angularSpeed = 0;
         this.§1x§ = 0;
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
         if(this.§1x§ < this.§;"h§)
         {
            _loc2_ = this.angularAcceleration * param1;
            _loc3_ = (this.angularSpeed + 0.5 * _loc2_) * param1;
            this.angularSpeed += _loc2_;
            _loc4_ = this.§;"h§ - this.§1x§;
            if(_loc4_ < _loc3_)
            {
               _loc3_ = _loc4_;
            }
            this.§1x§ += _loc3_;
            return _loc3_ * this.§var catch static§;
         }
         return 0;
      }
   }
}

