package Renamed9
{
   public class Renamed10
   {
      private var Renamed4932:int;
      
      private var Renamed4933:Number;
      
      public function Renamed10(param1:int = 0, param2:Number = 0)
      {
         super();
         this.Renamed4932 = param1;
         this.Renamed4933 = param2;
      }
      
      public function get chargingTimeMsec() : int
      {
         return this.Renamed4932;
      }
      
      public function set chargingTimeMsec(param1:int) : void
      {
         this.Renamed4932 = param1;
      }
      
      public function get weakeningCoeff() : Number
      {
         return this.Renamed4933;
      }
      
      public function set weakeningCoeff(param1:Number) : void
      {
         this.Renamed4933 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RailgunCC [";
         _loc1_ += "chargingTimeMsec = " + this.chargingTimeMsec + " ";
         _loc1_ += "weakeningCoeff = " + this.weakeningCoeff + " ";
         return _loc1_ + "]";
      }
   }
}

