package alternativa.tanks.view.battlecreate
{
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormControllerCallBack;
   import flash.display.BitmapData;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public interface ICreateBattleFormView
   {
      function show() : void;
      
      function hide() : void;
      
      function destroy() : void;
      
      function setCallBack(param1:ICreateBattleFormControllerCallBack) : void;
      
      function setBattleName(param1:String) : void;
      
      function getBattleName() : String;
      
      function blockedStartButton() : void;
      
      function unBlockedStartButton() : void;
      
      function getBattleNameLength() : int;
      
      function setProgressBattleNameCheckIcon() : void;
      
      function resetProgressBattleNameCheckIcon() : void;
      
      function selectMap(param1:String, param2:String) : void;
      
      function setSelectMapThemeItemByField(param1:String, param2:String) : void;
      
      function setMapsInfo(param1:Array) : void;
      
      function setThemeInfo(param1:Array) : void;
      
      function Renamed1592(param1:Vector.<Object>) : void;
      
      function showThemeForMap() : void;
      
      function hideThemeForMap() : void;
      
      function setRankIntervalRestriction(param1:int, param2:int, param3:int) : void;
      
      function setMaxRankRange(param1:int) : void;
      
      function setMaxRang(param1:int) : void;
      
      function setMinRang(param1:int) : void;
      
      function setCurrentRank(param1:int) : void;
      
      function getCurrentRang() : int;
      
      function getMinRank() : int;
      
      function getMaxRank() : int;
      
      function getMinRangValue() : int;
      
      function getMaxRangValue() : int;
      
      function getMaxRangRange() : int;
      
      function getSelectedThemeItem() : Object;
      
      function getSelectMapItem() : Object;
      
      function setPreview(param1:BitmapData) : void;
      
      function showInvalidRectangleBattleName() : void;
      
      function hideInvalidRectangleBattleName() : void;
      
      function setSettingsPlayersLimit(param1:int, param2:int, param3:int) : void;
      
      function setSettingsTimeLimit(param1:int, param2:int, param3:int) : void;
      
      function setSettingsScoreLimit(param1:int, param2:int, param3:int, param4:int) : void;
      
      function setNameAndIconKillsLimitStepper() : void;
      
      function setNameMaxPlayersStepper() : void;
      
      function setNameMaxPlayersTeamStepper() : void;
      
      function setNameAndIconFlagsStepper() : void;
      
      function setNameAndIconDominationStepper() : void;
      
      function Renamed1599() : void;
      
      function get isPrivateBattle() : Boolean;
      
      function get isAutoBalance() : Boolean;
      
      function get isFriendlyFire() : Boolean;
      
      function get isNoSuppliesBattle() : Boolean;
      
      function get isProBattle() : Boolean;
      
      function get isWithoutBonuses() : Boolean;
      
      function get isWithoutCrystals() : Boolean;
      
      function get isReArmor() : Boolean;
      
      function getTimeLimit() : int;
      
      function getScoreLimit() : int;
      
      function getNumberPlayers() : int;
      
      function resetCheckBox() : void;
      
      function setTypeBattle(param1:Renamed1587) : void;
      
      function setAvailableTypesBattle(param1:Vector.<Renamed1587>) : void;
      
      function get isWithoutUpgrades() : Boolean;
      
      function Renamed1605() : Object;
      
      function Renamed1609() : void;
      
      function Renamed3917() : void;
      
      function Renamed1613(param1:int) : void;
   }
}

