package projects.tanks.client.users.model.friends
{
   public class Renamed4424
   {
      private var Renamed4446:Boolean;
      
      public function Renamed4424(param1:Boolean = false)
      {
         super();
         this.Renamed4446 = param1;
      }
      
      public function get local() : Boolean
      {
         return this.Renamed4446;
      }
      
      public function set local(param1:Boolean) : void
      {
         this.Renamed4446 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "FriendsCC [";
         _loc1_ += "local = " + this.local + " ";
         return _loc1_ + "]";
      }
   }
}

