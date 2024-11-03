package projects.tanks.client.battleservice.model.statistics
{
   public class Renamed4209
   {
      private var Renamed4210:int;
      
      private var Renamed4211:int;
      
      private var _reward:int;
      
      private var _userId:String;
      
      public function Renamed4209(param1:int = 0, param2:int = 0, param3:int = 0, param4:String = null)
      {
         super();
         this.Renamed4210 = param1;
         this.Renamed4211 = param2;
         this._reward = param3;
         this._userId = param4;
      }
      
      public function get Renamed4212() : int
      {
         return this.Renamed4210;
      }
      
      public function set Renamed4212(param1:int) : void
      {
         this.Renamed4210 = param1;
      }
      
      public function get Renamed4213() : int
      {
         return this.Renamed4211;
      }
      
      public function set Renamed4213(param1:int) : void
      {
         this.Renamed4211 = param1;
      }
      
      public function get reward() : int
      {
         return this._reward;
      }
      
      public function set reward(param1:int) : void
      {
         this._reward = param1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(param1:String) : void
      {
         this._userId = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserReward [";
         _loc1_ += "newbiesAbonementBonusReward = " + this.Renamed4212 + " ";
         _loc1_ += "premiumBonusReward = " + this.Renamed4213 + " ";
         _loc1_ += "reward = " + this.reward + " ";
         _loc1_ += "userId = " + this.userId + " ";
         return _loc1_ + "]";
      }
   }
}

