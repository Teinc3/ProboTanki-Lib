package Renamed202
{
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed6015
   {
      private var Renamed6016:int;
      
      private var Renamed6017:int;
      
      private var _usersInfoBlue:Vector.<Renamed2737>;
      
      private var _usersInfoRed:Vector.<Renamed2737>;
      
      public function Renamed6015(param1:int = 0, param2:int = 0, param3:Vector.<Renamed2737> = null, param4:Vector.<Renamed2737> = null)
      {
         super();
         this.Renamed6016 = param1;
         this.Renamed6017 = param2;
         this._usersInfoBlue = param3;
         this._usersInfoRed = param4;
      }
      
      public function get Renamed2689() : int
      {
         return this.Renamed6016;
      }
      
      public function set Renamed2689(param1:int) : void
      {
         this.Renamed6016 = param1;
      }
      
      public function get Renamed2687() : int
      {
         return this.Renamed6017;
      }
      
      public function set Renamed2687(param1:int) : void
      {
         this.Renamed6017 = param1;
      }
      
      public function get Renamed6018() : Vector.<Renamed2737>
      {
         return this._usersInfoBlue;
      }
      
      public function set Renamed6018(param1:Vector.<Renamed2737>) : void
      {
         this._usersInfoBlue = param1;
      }
      
      public function get Renamed6019() : Vector.<Renamed2737>
      {
         return this._usersInfoRed;
      }
      
      public function set Renamed6019(param1:Vector.<Renamed2737>) : void
      {
         this._usersInfoRed = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "StatisticsTeamCC [";
         _loc1_ += "blueScore = " + this.Renamed2689 + " ";
         _loc1_ += "redScore = " + this.Renamed2687 + " ";
         _loc1_ += "usersInfoBlue = " + this.Renamed6018 + " ";
         _loc1_ += "usersInfoRed = " + this.Renamed6019 + " ";
         return _loc1_ + "]";
      }
   }
}

