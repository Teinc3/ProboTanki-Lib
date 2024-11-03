package projects.tanks.client.garage.models.item.upgradeable.calculators
{
   public class LinearParams
   {
      private var _initialValue:Number;
      
      private var _step:Number;
      
      public function LinearParams(param1:Number = 0, param2:Number = 0)
      {
         super();
         this._initialValue = param1;
         this._step = param2;
      }
      
      public function get initialValue() : Number
      {
         return this._initialValue;
      }
      
      public function set initialValue(param1:Number) : void
      {
         this._initialValue = param1;
      }
      
      public function get step() : Number
      {
         return this._step;
      }
      
      public function set step(param1:Number) : void
      {
         this._step = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LinearParams [";
         _loc1_ += "initialValue = " + this.initialValue + " ";
         _loc1_ += "step = " + this.step + " ";
         return _loc1_ + "]";
      }
   }
}

