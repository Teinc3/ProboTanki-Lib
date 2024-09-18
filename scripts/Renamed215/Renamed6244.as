package Renamed215
{
   import Renamed136.Renamed663;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed5725
   {
      private var Renamed6240:Renamed5726;
      
      private var Renamed4208:int;
      
      private var _kills:int;
      
      private var _score:int;
      
      private var _reward:int;
      
      private var Renamed4211:int;
      
      private var Renamed4210:int;
      
      public function Renamed5725()
      {
         super();
      }
      
      public function Renamed6241(param1:Renamed4207, param2:Renamed5726) : void
      {
         this.Renamed6240 = param2;
         this.Renamed4208 = param1.deaths;
         this._kills = param1.kills;
         this._score = param1.score;
      }
      
      public function Renamed6242(param1:Renamed4207) : void
      {
         this.Renamed4208 = param1.deaths;
         this._kills = param1.kills;
         this._score = param1.score;
      }
      
      public function Renamed6243(param1:Renamed2737, param2:Renamed5726) : void
      {
         this.Renamed6240 = param2;
         this.Renamed4208 = param1.deaths;
         this._kills = param1.kills;
         this._score = param1.score;
      }
      
      public function get userId() : String
      {
         return this.Renamed6240.userId;
      }
      
      public function get uid() : String
      {
         return this.Renamed6240.uid;
      }
      
      public function get rank() : int
      {
         return this.Renamed6240.rank;
      }
      
      public function get suspicious() : Boolean
      {
         return this.Renamed6240.suspicious;
      }
      
      public function get loaded() : Boolean
      {
         return this.Renamed6240.loaded;
      }
      
      public function get teamType() : Renamed663
      {
         return this.Renamed6240.teamType;
      }
      
      public function get deaths() : int
      {
         return this.Renamed4208;
      }
      
      public function get kills() : int
      {
         return this._kills;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function get reward() : int
      {
         return this._reward;
      }
      
      public function set teamType(param1:Renamed663) : void
      {
         this.Renamed6240.teamType = param1;
      }
      
      public function set suspicious(param1:Boolean) : void
      {
         this.Renamed6240.suspicious = param1;
      }
      
      public function set loaded(param1:Boolean) : void
      {
         this.Renamed6240.loaded = param1;
      }
      
      public function set rank(param1:int) : void
      {
         this.Renamed6240.rank = param1;
      }
      
      public function set reward(param1:int) : void
      {
         this._reward = param1;
      }
      
      public function get Renamed4213() : int
      {
         return this.Renamed4211;
      }
      
      public function set Renamed4213(param1:int) : void
      {
         this.Renamed4211 = param1;
      }
      
      public function get Renamed4212() : int
      {
         return this.Renamed4210;
      }
      
      public function set Renamed4212(param1:int) : void
      {
         this.Renamed4210 = param1;
      }
   }
}

