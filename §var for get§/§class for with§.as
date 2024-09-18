package §var for get§
{
   public class §class for with§
   {
      private var _proBattleEnterPrice:int;
      
      private var §"!6§:int;
      
      public function §class for with§(param1:int = 0, param2:int = 0)
      {
         super();
         this._proBattleEnterPrice = param1;
         this.§"!6§ = param2;
      }
      
      public function get proBattleEnterPrice() : int
      {
         return this._proBattleEnterPrice;
      }
      
      public function set proBattleEnterPrice(param1:int) : void
      {
         this._proBattleEnterPrice = param1;
      }
      
      public function get timeLeftInSec() : int
      {
         return this.§"!6§;
      }
      
      public function set timeLeftInSec(param1:int) : void
      {
         this.§"!6§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ProBattleCC [";
         _loc1_ += "proBattleEnterPrice = " + this.proBattleEnterPrice + " ";
         _loc1_ += "timeLeftInSec = " + this.timeLeftInSec + " ";
         return _loc1_ + "]";
      }
   }
}

