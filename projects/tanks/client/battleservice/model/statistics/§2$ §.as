package projects.tanks.client.battleservice.model.statistics
{
   public class §2$ §
   {
      private var §'R§:int;
      
      private var §!"J§:int;
      
      private var _reward:int;
      
      private var _userId:String;
      
      public function §2$ §(param1:int = 0, param2:int = 0, param3:int = 0, param4:String = null)
      {
         super();
         this.§'R§ = param1;
         this.§!"J§ = param2;
         this._reward = param3;
         this._userId = param4;
      }
      
      public function get §true for try§() : int
      {
         return this.§'R§;
      }
      
      public function set §true for try§(param1:int) : void
      {
         this.§'R§ = param1;
      }
      
      public function get §do const use§() : int
      {
         return this.§!"J§;
      }
      
      public function set §do const use§(param1:int) : void
      {
         this.§!"J§ = param1;
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
         _loc1_ += "newbiesAbonementBonusReward = " + this.§true for try§ + " ";
         _loc1_ += "premiumBonusReward = " + this.§do const use§ + " ";
         _loc1_ += "reward = " + this.reward + " ";
         _loc1_ += "userId = " + this.userId + " ";
         return _loc1_ + "]";
      }
   }
}

