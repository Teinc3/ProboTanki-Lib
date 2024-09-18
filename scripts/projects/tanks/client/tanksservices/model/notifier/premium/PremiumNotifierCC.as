package projects.tanks.client.tanksservices.model.notifier.premium
{
   public class PremiumNotifierCC
   {
      private var _lifeTimeInSeconds:int;
      
      public function PremiumNotifierCC(param1:int = 0)
      {
         super();
         this._lifeTimeInSeconds = param1;
      }
      
      public function get lifeTimeInSeconds() : int
      {
         return this._lifeTimeInSeconds;
      }
      
      public function set lifeTimeInSeconds(param1:int) : void
      {
         this._lifeTimeInSeconds = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "PremiumNotifierCC [";
         _loc1_ += "lifeTimeInSeconds = " + this.lifeTimeInSeconds + " ";
         return _loc1_ + "]";
      }
   }
}

