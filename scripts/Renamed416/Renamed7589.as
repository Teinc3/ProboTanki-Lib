package Renamed416
{
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   
   public class Renamed7589
   {
      private var Renamed8659:Vector.<Renamed2072>;
      
      public function Renamed7589(param1:Vector.<Renamed2072> = null)
      {
         super();
         this.Renamed8659 = param1;
      }
      
      public function get Renamed2076() : Vector.<Renamed2072>
      {
         return this.Renamed8659;
      }
      
      public function set Renamed2076(param1:Vector.<Renamed2072>) : void
      {
         this.Renamed8659 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "AchievementCC [";
         _loc1_ += "activeAchievements = " + this.Renamed2076 + " ";
         return _loc1_ + "]";
      }
   }
}

