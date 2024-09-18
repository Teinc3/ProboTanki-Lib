package projects.tanks.client.garage.models.item.temporary
{
   public class TemporaryItemCC
   {
      private var _lifeTimeInSec:int;
      
      private var _remainingTimeInSec:int;
      
      public function TemporaryItemCC(param1:int = 0, param2:int = 0)
      {
         super();
         this._lifeTimeInSec = param1;
         this._remainingTimeInSec = param2;
      }
      
      public function get lifeTimeInSec() : int
      {
         return this._lifeTimeInSec;
      }
      
      public function set lifeTimeInSec(param1:int) : void
      {
         this._lifeTimeInSec = param1;
      }
      
      public function get remainingTimeInSec() : int
      {
         return this._remainingTimeInSec;
      }
      
      public function set remainingTimeInSec(param1:int) : void
      {
         this._remainingTimeInSec = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TemporaryItemCC [";
         _loc1_ += "lifeTimeInSec = " + this.lifeTimeInSec + " ";
         _loc1_ += "remainingTimeInSec = " + this.remainingTimeInSec + " ";
         return _loc1_ + "]";
      }
   }
}

