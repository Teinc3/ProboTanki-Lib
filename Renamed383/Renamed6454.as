package Renamed383
{
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed6454
   {
      private var _usersInfo:Vector.<Renamed2737>;
      
      public function Renamed6454(param1:Vector.<Renamed2737> = null)
      {
         super();
         this._usersInfo = param1;
      }
      
      public function get usersInfo() : Vector.<Renamed2737>
      {
         return this._usersInfo;
      }
      
      public function set usersInfo(param1:Vector.<Renamed2737>) : void
      {
         this._usersInfo = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "StatisticsDMCC [";
         _loc1_ += "usersInfo = " + this.usersInfo + " ";
         return _loc1_ + "]";
      }
   }
}

