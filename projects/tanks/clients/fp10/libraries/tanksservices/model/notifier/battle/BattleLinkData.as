package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle
{
   import projects.tanks.client.battleservice.§<#p§;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleLinkData
   {
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var _userId:String;
      
      private var battleData:BattleInfoData;
      
      private var _mapName:String;
      
      public function BattleLinkData(param1:String, param2:BattleNotifierData)
      {
         super();
         this._userId = param1;
         this.battleData = param2.battleData;
         this._mapName = this.battleData.mapName + " " + this.battleData.mode.name;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get serverNumber() : int
      {
         return this.battleData.serverNumber;
      }
      
      public function get battleId() : String
      {
         return this.battleData.battleId;
      }
      
      public function get range() : §<#p§
      {
         return this.battleData.range;
      }
      
      public function getBattleData() : BattleInfoData
      {
         return this.battleData;
      }
      
      public function isSelfBattle() : Boolean
      {
         var _loc1_:String = userInfoService.getCurrentUserId();
         var _loc2_:IUserInfoLabelUpdater = userInfoService.getOrCreateUpdater(_loc1_);
         if(_loc2_.battleLink != null)
         {
            return _loc2_.battleLink.battleId == this.battleId;
         }
         return false;
      }
      
      public function isShowBattle() : Boolean
      {
         var _loc1_:Boolean = true;
         if(this.battleData.privateBattle)
         {
            _loc1_ = this.isSelfBattle();
         }
         return _loc1_;
      }
      
      public function availableRank() : Boolean
      {
         var _loc1_:int = userPropertiesService.rank;
         return this.isShowBattle() && (_loc1_ >= this.battleData.range.min && _loc1_ <= this.battleData.range.max);
      }
      
      public function isClickable() : Boolean
      {
         return !this.isSelfBattle() && this.isShowBattle();
      }
      
      public function get proBattle() : Boolean
      {
         return this.battleData.proBattle;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
   }
}

