package Renamed461
{
   public class Renamed2773
   {
      private var Renamed9157:Number;
      
      private var Renamed9154:int;
      
      public function Renamed2773(param1:Number = 0, param2:int = 0)
      {
         super();
         this.Renamed9157 = param1;
         this.Renamed9154 = param2;
      }
      
      public function get angle() : Number
      {
         return this.Renamed9157;
      }
      
      public function set angle(param1:Number) : void
      {
         this.Renamed9157 = param1;
      }
      
      public function get control() : int
      {
         return this.Renamed9154;
      }
      
      public function set control(param1:int) : void
      {
         this.Renamed9154 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RotateTurretCommand [";
         _loc1_ += "angle = " + this.angle + " ";
         _loc1_ += "control = " + this.control + " ";
         return _loc1_ + "]";
      }
   }
}

