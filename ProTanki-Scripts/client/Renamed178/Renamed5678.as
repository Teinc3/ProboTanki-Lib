package Renamed4745
{
   public class Renamed5678
   {
      private var Renamed5679:Vector.<String>;
      
      private var Renamed5680:Vector.<String>;
      
      public function Renamed5678(param1:Vector.<String> = null, param2:Vector.<String> = null)
      {
         super();
         this.Renamed5679 = param1;
         this.Renamed5680 = param2;
      }
      
      public function get usersBlue() : Vector.<String>
      {
         return this.Renamed5679;
      }
      
      public function set usersBlue(param1:Vector.<String>) : void
      {
         this.Renamed5679 = param1;
      }
      
      public function get usersRed() : Vector.<String>
      {
         return this.Renamed5680;
      }
      
      public function set usersRed(param1:Vector.<String>) : void
      {
         this.Renamed5680 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TeamBattleItemCC [";
         _loc1_ += "usersBlue = " + this.usersBlue + " ";
         _loc1_ += "usersRed = " + this.usersRed + " ";
         return _loc1_ + "]";
      }
   }
}

