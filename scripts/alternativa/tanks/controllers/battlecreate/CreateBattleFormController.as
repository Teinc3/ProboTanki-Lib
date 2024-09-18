package alternativa.tanks.controllers.battlecreate
{
   import Renamed1580.Renamed1581;
   import Renamed232.Renamed1582;
   import Renamed1583.Renamed1584;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.view.battlecreate.ICreateBattleFormView;
   import alternativa.types.Long;
   import Renamed312.Renamed1585;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1579;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class CreateBattleFormController extends EventDispatcher implements ICreateBattleFormControllerCallBack, IImageResource
   {
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var Renamed1588:BattleFormatUtil;
      
      private static const CHANNEL:String = "battlecreate";
      
      private static const MAX_RANK:int = 30;
      
      private static const MIN_RANK:int = 1;
      
      private static const MIN_RANK_INTERVAL_LENGTH:int = 1;
      
      private static const MIN_PLAYER_FOR_DEATH_MATCH:int = 2;
      
      private static const MIN_PLAYER_FOR_TEAM_BATTLE:int = 1;
      
      private static const STEP_FOR_STEPPER_DM:int = 1;
      
      private static const STEP_FOR_STEPPER_TDM:int = 1;
      
      private static const STEP_FOR_STEPPER_CTF:int = 1;
      
      private static const STEP_FOR_STEPPER_CP:int = 50;
      
      private static const Renamed1589:int = 50;
      
      private var _battlesLimits:Vector.<Renamed1585>;
      
      private var _killsLimit:int = 0;
      
      private var _flagsLimit:int = 0;
      
      private var _dominationScore:int = 0;
      
      private var Renamed1590:int = 0;
      
      private var _timeLimitInSec:int = 900;
      
      private var _maxPeopleCount:int;
      
      private var _battleMode:Renamed1587;
      
      private var _view:ICreateBattleFormView;
      
      private var _mapThemes:Dictionary;
      
      private var _currentRank:int = -1;
      
      private var _mapsParams:Array;
      
      private var _checkedBattleNameTimer:Timer;
      
      private var _battleNameBeforeCheck:String;
      
      private var _mapParamsForCurrentRank:Array;
      
      private var _isAutoName:Boolean;
      
      private var _isCheckedServerBattleName:Boolean;
      
      private var _themeName:String;
      
      private var _loadingPreviewId:Long;
      
      private var _isShowForm:Boolean;
      
      private var Renamed1591:int;
      
      public function CreateBattleFormController(param1:Vector.<Renamed1585>, param2:int, param3:Vector.<IGameObject>, param4:ICreateBattleFormView)
      {
         this._battleMode = Renamed1587.DM;
         this._mapThemes = new Dictionary();
         super();
         this._view = param4;
         this.init(param1,param2,param3);
      }
      
      private function init(param1:Vector.<Renamed1585>, param2:int, param3:Vector.<IGameObject>) : void
      {
         this._view.setCallBack(this);
         this._checkedBattleNameTimer = new Timer(1200);
         this._checkedBattleNameTimer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._battlesLimits = param1;
         this._view.setMaxRankRange(param2 - 1);
         this._view.setRankIntervalRestriction(MIN_RANK,MAX_RANK,MIN_RANK_INTERVAL_LENGTH);
         this._view.resetCheckBox();
         this._view.Renamed1592(this.Renamed1593());
         this.parseMapsParams(param3);
      }
      
      private function parseMapsParams(param1:Vector.<IGameObject>) : void
      {
         var _loc8_:SaveMapParams = null;
         var _loc2_:IGameObject = null;
         var _loc3_:Renamed1584 = null;
         var _loc4_:CreateBattleMapParams = null;
         var _loc5_:Renamed1581 = null;
         this._mapsParams = new Array();
         var _loc6_:int = int(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = param1[_loc7_];
            _loc3_ = Renamed1584(_loc2_.adapt(Renamed1584));
            (_loc4_ = new CreateBattleMapParams()).index = _loc7_;
            _loc4_.id = _loc3_.Renamed1594();
            _loc4_.previewResource = _loc3_.getPreviewResource();
            _loc4_.gameName = _loc3_.getName();
            _loc4_.maxPeople = _loc3_.Renamed1595();
            _loc4_.maxRank = _loc3_.getMaxRank();
            _loc4_.minRank = _loc3_.getMinRank();
            _loc4_.themeName = _loc3_.getThemeName();
            _loc4_.theme = _loc3_.Renamed1596();
            _loc4_.battleModes = _loc3_.Renamed1597();
            _loc4_.enabled = _loc3_.isEnabled();
            _loc5_ = Renamed1581(_loc2_.adapt(Renamed1581));
            _loc4_.clanName = _loc5_.getClanName();
            _loc4_.clanLink = _loc5_.getClanLink();
            _loc4_.additionalCrystalsPercent = _loc3_.getAdditionalCrystalsPercent();
            _loc8_ = this.getSaveMapParams();
            _loc4_.defaultMap = _loc8_ != null && _loc8_.mapId == _loc3_.getPreviewResource().id && _loc8_.themeName == _loc3_.getThemeName();
            this._mapsParams.push(_loc4_);
            _loc7_++;
         }
      }
      
      public function setPreviewResource(param1:ImageResource) : void
      {
         if(this._loadingPreviewId == param1.id)
         {
            this._view.setPreview(param1.data);
         }
      }
      
      public function onPlayersNumberChange() : void
      {
         this._maxPeopleCount = this._view.getNumberPlayers();
      }
      
      public function onTimeLimitChange() : void
      {
         this._timeLimitInSec = this._view.getTimeLimit() * 60;
         if(this._isCheckedServerBattleName)
         {
            this.checkedCorrectBattleParams();
         }
      }
      
      public function onScoreLimitChange() : void
      {
         switch(this._battleMode)
         {
            case Renamed1587.DM:
            case Renamed1587.TDM:
               this._killsLimit = this._view.getScoreLimit();
               break;
            case Renamed1587.CTF:
               this._flagsLimit = this._view.getScoreLimit();
               break;
            case Renamed1587.CP:
               this._dominationScore = this._view.getScoreLimit();
               break;
            case Renamed1587.AS:
               this.Renamed1590 = this._view.getScoreLimit();
         }
         if(this._isCheckedServerBattleName)
         {
            this.checkedCorrectBattleParams();
         }
      }
      
      public function onBattleNameChange() : void
      {
         this._view.blockedStartButton();
         this._checkedBattleNameTimer.stop();
         if(this._view.getBattleNameLength() != 0)
         {
            this._view.hideInvalidRectangleBattleName();
            this._isCheckedServerBattleName = false;
            this._checkedBattleNameTimer.start();
         }
         else
         {
            this._view.showInvalidRectangleBattleName();
         }
      }
      
      public function onBattleNameInFocus() : void
      {
         if(this._view.getBattleName() == this.getAutoName())
         {
            this._isAutoName = false;
            this._view.setBattleName("");
            this._view.showInvalidRectangleBattleName();
            this._view.blockedStartButton();
         }
      }
      
      public function onBattleNameOutFocus() : void
      {
         if(this._view.getBattleNameLength() == 0)
         {
            this.setAutoNameBattle();
            if(this.isBattleParamsCorrect())
            {
               this._view.unBlockedStartButton();
            }
         }
      }
      
      public function onSelected(param1:Renamed1587) : void
      {
         this._battleMode = param1;
         var _loc2_:int = this._battlesLimits[this._battleMode.value].timeLimitInSec;
         if(this._timeLimitInSec > _loc2_)
         {
            this._timeLimitInSec = _loc2_;
         }
         switch(this._battleMode)
         {
            case Renamed1587.DM:
               this.setTypeBattleDM();
               break;
            case Renamed1587.TDM:
               this.setTypeBattleTDM();
               break;
            case Renamed1587.CTF:
               this.setTypeBattleCtf();
               break;
            case Renamed1587.CP:
               this.setTypeBattleDomination();
               break;
            case Renamed1587.AS:
               this.Renamed1598();
         }
      }
      
      private function setTypeBattleDM() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _loc1_:int = int(this.getSelectedMapParams().maxPeople);
         this._maxPeopleCount = _loc1_;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_DEATH_MATCH,_loc1_,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._killsLimit,STEP_FOR_STEPPER_DM);
         this._view.setNameAndIconKillsLimitStepper();
         this._view.setNameMaxPlayersStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleTDM() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _loc1_:int = int(this.getSelectedMapParams().maxPeople) / 2;
         this._maxPeopleCount = _loc1_;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_loc1_,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._killsLimit,STEP_FOR_STEPPER_TDM);
         this._view.setNameAndIconKillsLimitStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleCtf() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _loc1_:int = int(this.getSelectedMapParams().maxPeople) / 2;
         this._maxPeopleCount = _loc1_;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_loc1_,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._flagsLimit,STEP_FOR_STEPPER_CTF);
         this._view.setNameAndIconFlagsStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function setTypeBattleDomination() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _loc1_:int = int(this.getSelectedMapParams().maxPeople) / 2;
         this._maxPeopleCount = _loc1_;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_loc1_,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this._dominationScore,STEP_FOR_STEPPER_CP);
         this._view.setNameAndIconDominationStepper();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      private function Renamed1598() : void
      {
         this._view.setTypeBattle(this._battleMode);
         var _loc1_:int = int(this.getSelectedMapParams().maxPeople) / 2;
         this._maxPeopleCount = _loc1_;
         this._view.setSettingsPlayersLimit(MIN_PLAYER_FOR_TEAM_BATTLE,_loc1_,this._maxPeopleCount);
         this._view.setSettingsTimeLimit(0,this._battlesLimits[this._battleMode.value].timeLimitInSec / 60,this._timeLimitInSec / 60);
         this._view.setSettingsScoreLimit(0,this._battlesLimits[this._battleMode.value].scoreLimit,this.Renamed1590,Renamed1589);
         this._view.Renamed1599();
         this._view.setNameMaxPlayersTeamStepper();
         if(this._isAutoName)
         {
            this.setAutoNameBattle();
         }
      }
      
      public function onMapChange() : void
      {
         this.updateThemes();
         this.updateParams();
      }
      
      public function onThemeChange() : void
      {
         this._themeName = this._view.getSelectedThemeItem().themeName;
         this.updateParams();
      }
      
      private function updateParams() : void
      {
         this.updateRangeRank();
         this.setAvailableBattleTypes();
         this.selectBattleType(this._battleMode);
         this.saveMapParamInStorage();
         this.updatePreview();
      }
      
      private function updatePreview() : void
      {
         var _loc1_:ImageResource = this.getSelectedMapParams().previewResource;
         if(_loc1_.isLazy && !_loc1_.isLoaded)
         {
            this._loadingPreviewId = _loc1_.id;
            _loc1_.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         this._view.setPreview(_loc1_.data);
      }
      
      public function destroy() : void
      {
         this._checkedBattleNameTimer.stop();
         this._checkedBattleNameTimer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this._checkedBattleNameTimer = null;
         this._view.destroy();
         this._view = null;
      }
      
      public function showForm(param1:int) : void
      {
         this._isShowForm = true;
         if(this._currentRank != param1)
         {
            this._currentRank = param1;
            if(this._currentRank < MIN_RANK)
            {
               this._currentRank = MIN_RANK;
            }
            this._view.setCurrentRank(this._currentRank);
            this.updateAvailableMaps();
            this.selectDefaultMap();
         }
         achievementService.showStartButtonHelper();
         this.setAutoNameBattle();
         this._view.show();
      }
      
      public function setRank(param1:int) : void
      {
         if(this._isShowForm)
         {
            this.showForm(param1);
         }
      }
      
      public function hideForm() : void
      {
         this._isShowForm = false;
         this._checkedBattleNameTimer.stop();
         this._view.hide();
         achievementService.hideStartButtonHelper();
      }
      
      public function checkedBattleNameResult(param1:String) : void
      {
         this._isCheckedServerBattleName = true;
         this._checkedBattleNameTimer.stop();
         if(this._view.getBattleName() == this._battleNameBeforeCheck && this._battleNameBeforeCheck != param1)
         {
            this._isAutoName = false;
            this._view.setBattleName(param1);
         }
         this._view.resetProgressBattleNameCheckIcon();
         if(this._view.getBattleNameLength() != 0)
         {
            this._view.hideInvalidRectangleBattleName();
         }
         this.checkedCorrectBattleParams();
      }
      
      private function setAutoNameBattle() : void
      {
         this._isAutoName = true;
         this._isCheckedServerBattleName = true;
         this._view.setBattleName(this.getAutoName());
         this._view.hideInvalidRectangleBattleName();
      }
      
      private function checkedCorrectBattleParams() : void
      {
         if(this.isBattleParamsCorrect())
         {
            this._view.unBlockedStartButton();
         }
         else
         {
            this._view.blockedStartButton();
         }
      }
      
      private function isBattleParamsCorrect() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this._view.getBattleNameLength() != 0 && (this._view.getTimeLimit() != 0 || this._view.getScoreLimit() != 0))
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      private function setAvailableBattleTypes() : void
      {
         this._view.setAvailableTypesBattle(this.getSelectedMapParams().battleModes);
      }
      
      private function updateRangeRank() : void
      {
         var _loc1_:CreateBattleMapParams = this.getSelectedMapParams();
         var _loc2_:int = _loc1_.minRank < MIN_RANK ? int(MIN_RANK) : int(_loc1_.minRank);
         var _loc3_:int = _loc1_.maxRank > MAX_RANK ? int(MAX_RANK) : int(_loc1_.maxRank);
         var _loc4_:int = this._view.getMaxRangRange();
         if(_loc2_ < this._currentRank - _loc4_)
         {
            _loc2_ = this._currentRank - _loc4_;
         }
         if(_loc3_ > this._currentRank + _loc4_)
         {
            _loc3_ = this._currentRank + _loc4_;
         }
         this._view.setRankIntervalRestriction(_loc2_,_loc3_,MIN_RANK_INTERVAL_LENGTH);
         var _loc5_:int = this._view.getMinRank();
         var _loc6_:int = this._view.getMaxRank();
         if(this._currentRank + _loc4_ <= this._view.getMaxRangValue())
         {
            this._view.setMaxRang(this._currentRank + _loc4_);
         }
         else
         {
            this._view.setMaxRang(this._view.getMaxRangValue());
         }
         _loc6_ = this._view.getMaxRank();
         if(_loc6_ - this._currentRank < _loc4_)
         {
            if(_loc6_ - _loc4_ >= this._view.getMinRangValue())
            {
               this._view.setMinRang(_loc6_ - _loc4_);
            }
            else
            {
               this._view.setMinRang(this._view.getMinRangValue());
            }
         }
         else
         {
            this._view.setMinRang(this._currentRank);
         }
      }
      
      private function updateThemes() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = null;
         var _loc3_:CreateBattleMapParams = null;
         var _loc4_:CreateBattleMapParams = null;
         var _loc5_:Object = null;
         var _loc6_:String = this._view.getSelectMapItem().id;
         var _loc7_:Dictionary = this._mapThemes[_loc6_];
         if(_loc7_ != null)
         {
            _loc1_ = new Array();
            for(_loc2_ in _loc7_)
            {
               _loc4_ = this._mapThemes[_loc6_][_loc2_];
               if(this._currentRank >= _loc4_.minRank && this._currentRank <= _loc4_.maxRank)
               {
                  _loc1_.push({
                     "gameName":_loc2_,
                     "id":_loc4_.id,
                     "rang":0,
                     "theme":_loc4_.theme
                  });
               }
            }
            _loc1_.sortOn(["gameName"]);
            this._view.setThemeInfo(_loc1_);
            _loc3_ = this._mapThemes[this._view.getSelectMapItem().id][this._themeName];
            if(this._themeName != null && this.isMapAndThemeAvailable(_loc3_))
            {
               this._view.setSelectMapThemeItemByField("themeName",this._themeName);
            }
            else
            {
               _loc5_ = this._view.getSelectedThemeItem();
               this._themeName = _loc5_ != null ? _loc5_.themeName : null;
            }
            if(_loc1_.length > 1)
            {
               this._view.showThemeForMap();
            }
            else
            {
               this._view.hideThemeForMap();
            }
         }
      }
      
      private function isMapAndThemeAvailable(param1:CreateBattleMapParams) : Boolean
      {
         return param1 != null && param1.enabled && this._currentRank >= param1.minRank && this._currentRank <= param1.maxRank;
      }
      
      private function getSelectedMapParams() : CreateBattleMapParams
      {
         return CreateBattleMapParams(this._mapThemes[this._view.getSelectMapItem().id][this._themeName]);
      }
      
      private function updateAvailableMaps() : void
      {
         var _loc1_:CreateBattleMapParams = null;
         this._mapThemes = new Dictionary();
         this._mapParamsForCurrentRank = new Array();
         for each(_loc1_ in this._mapsParams)
         {
            if(_loc1_.enabled && this._currentRank <= _loc1_.maxRank)
            {
               if(this._mapThemes[_loc1_.id] == undefined)
               {
                  this._mapThemes[_loc1_.id] = new Dictionary();
                  _loc1_.currentRank = this._currentRank >= _loc1_.minRank ? int(0) : int(_loc1_.minRank);
                  this._mapParamsForCurrentRank.push(_loc1_);
               }
               this._mapThemes[_loc1_.id][_loc1_.themeName] = _loc1_;
            }
         }
         if(this._mapParamsForCurrentRank.length != 0)
         {
            this._mapParamsForCurrentRank.sortOn(["additionalCrystalsPercent","defaultMap","currentRank","gameName"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.NUMERIC,null]);
            this._view.setMapsInfo(this._mapParamsForCurrentRank);
            return;
         }
         throw new ArgumentError("For your rank is not available maps");
      }
      
      private function Renamed1600() : CreateBattleMapParams
      {
         var _loc1_:SaveMapParams = this.getSaveMapParams();
         return this.getMapParams(_loc1_.mapId,_loc1_.themeName);
      }
      
      private function selectDefaultMap() : void
      {
         var _loc1_:String = null;
         var _loc2_:CreateBattleMapParams = this.Renamed1600();
         if(this.isMapAndThemeAvailable(_loc2_))
         {
            _loc1_ = _loc2_.gameName;
            this._themeName = _loc2_.themeName;
         }
         else
         {
            _loc1_ = this._mapParamsForCurrentRank[0].gameName;
            this._themeName = this._mapParamsForCurrentRank[0].themeName;
         }
         this._view.selectMap("gameName",_loc1_);
         this.onMapChange();
      }
      
      private function getMapParams(param1:Long, param2:String) : CreateBattleMapParams
      {
         var _loc3_:int = int(this._mapsParams.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1 != null && this._mapsParams[_loc4_].previewResource.id.low == param1.low && this._mapsParams[_loc4_].themeName == param2)
            {
               return this._mapsParams[_loc4_];
            }
            _loc4_++;
         }
         return null;
      }
      
      private function getSaveMapParams() : SaveMapParams
      {
         var _loc1_:SaveMapParams = new SaveMapParams();
         var _loc2_:SharedObject = storageService.getStorage();
         var _loc3_:Vector.<Object> = _loc2_.data.SelectedMap != null && _loc2_.data.SelectedMap is Vector.<Object> ? _loc2_.data.SelectedMap as Vector.<Object> : new Vector.<Object>();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].userName == userPropertiesService.userName)
            {
               _loc1_.mapId = Long.getLong(int(_loc3_[_loc4_].mapIdHigh),int(_loc3_[_loc4_].mapIdLow));
               _loc1_.themeName = _loc3_[_loc4_].mapTheme;
               break;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function saveMapParamInStorage() : void
      {
         var _loc1_:Object = null;
         var _loc2_:SharedObject = storageService.getStorage();
         var _loc3_:Vector.<Object> = _loc2_.data.SelectedMap != null && _loc2_.data.SelectedMap is Vector.<Object> ? _loc2_.data.SelectedMap as Vector.<Object> : new Vector.<Object>();
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_].userName == userPropertiesService.userName)
            {
               _loc4_ = _loc5_;
               break;
            }
            _loc5_++;
         }
         var _loc6_:CreateBattleMapParams = this.getSelectedMapParams();
         if(_loc4_ != -1)
         {
            _loc3_[_loc4_].mapIdLow = _loc6_.previewResource.id.low;
            _loc3_[_loc4_].mapIdHigh = _loc6_.previewResource.id.high;
            _loc3_[_loc4_].mapTheme = _loc6_.themeName;
         }
         else
         {
            _loc1_ = new Object();
            _loc1_.userName = userPropertiesService.userName;
            _loc1_.mapIdLow = _loc6_.previewResource.id.low;
            _loc1_.mapIdHigh = _loc6_.previewResource.id.high;
            _loc1_.mapTheme = _loc6_.themeName;
            _loc3_.push(_loc1_);
         }
         _loc2_.data.SelectedMap = _loc3_;
      }
      
      private function selectBattleType(param1:Renamed1587) : void
      {
         if(this.isTypeBattleContainedSelectedMap(param1))
         {
            this.onSelected(param1);
         }
         else
         {
            this.onSelected(this.getSelectedMapParams().battleModes[0]);
         }
      }
      
      private function isTypeBattleContainedSelectedMap(param1:Renamed1587) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Vector.<Renamed1587> = this.getSelectedMapParams().battleModes;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function onCreateBattle() : void
      {
         var _loc1_:Renamed1579 = null;
         if(this.isBattleParamsCorrect())
         {
            _loc1_ = new Renamed1579();
            _loc1_.battleMode = this._battleMode;
            _loc1_.Renamed1601 = new Renamed1585(this._view.getScoreLimit(),this._timeLimitInSec);
            _loc1_.mapId = this._view.getSelectedThemeItem().id;
            _loc1_.theme = this._view.getSelectedThemeItem().theme;
            _loc1_.maxPeopleCount = this._maxPeopleCount;
            _loc1_.name = this._view.getBattleName();
            _loc1_.privateBattle = this._view.isPrivateBattle;
            _loc1_.rankRange = new Renamed1586(this._view.getMaxRank(),this._view.getMinRank());
            _loc1_.proBattle = this._view.isProBattle;
            if(this._view.isProBattle)
            {
               _loc1_.withoutSupplies = this._view.isNoSuppliesBattle;
               _loc1_.Renamed1602 = this._view.isWithoutUpgrades;
               _loc1_.withoutBonuses = this._view.isWithoutBonuses;
               _loc1_.withoutCrystals = this._view.isWithoutCrystals;
               _loc1_.autoBalance = this._view.isAutoBalance;
               _loc1_.friendlyFire = this._view.isFriendlyFire;
               _loc1_.reArmorEnabled = this._view.isReArmor;
            }
            else
            {
               _loc1_.autoBalance = true;
            }
            _loc1_.equipmentConstraintsMode = this.Renamed1603();
            _loc1_.parkourMode = this._view.isProBattle && this.Renamed1604();
            dispatchEvent(new CreateBattleEvent(CreateBattleEvent.CREATE_BATTLE,_loc1_));
            this.hideForm();
            achievementService.hideAllBubbles(true);
         }
      }
      
      private function Renamed1604() : Boolean
      {
         return this._view.Renamed1605().parkour;
      }
      
      private function Renamed1603() : Renamed1582
      {
         if(this._view.isProBattle)
         {
            return this._view.Renamed1605().equipmentConstraintsMode;
         }
         return Renamed1582.NONE;
      }
      
      private function Renamed1593() : Vector.<Object>
      {
         this.Renamed1591 = 0;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         _loc1_.push({
            "index":0,
            "gameName":Renamed1588.Renamed1606(Renamed1582.NONE),
            "equipmentConstraintsMode":Renamed1582.NONE,
            "parkour":false,
            "rang":0
         });
         _loc1_.push({
            "index":1,
            "gameName":Renamed1588.Renamed1606(Renamed1582.HORNET_RAILGUN),
            "equipmentConstraintsMode":Renamed1582.HORNET_RAILGUN,
            "parkour":false,
            "rang":0
         });
         _loc1_.push({
            "index":2,
            "gameName":Renamed1588.Renamed1606(Renamed1582.WASP_RAILGUN),
            "equipmentConstraintsMode":Renamed1582.WASP_RAILGUN,
            "parkour":false,
            "rang":0
         });
         _loc1_.push({
            "index":3,
            "gameName":Renamed1588.Renamed1606(Renamed1582.HORNET_WASP_RAILGUN),
            "equipmentConstraintsMode":Renamed1582.HORNET_WASP_RAILGUN,
            "parkour":false,
            "rang":0
         });
         _loc1_.push({
            "index":4,
            "gameName":Renamed1588.Renamed1607(),
            "equipmentConstraintsMode":Renamed1582.NONE,
            "parkour":true,
            "rang":0
         });
         return _loc1_;
      }
      
      public function Renamed1608() : void
      {
         var _loc1_:Renamed1582 = null;
         if(!this.Renamed1604())
         {
            _loc1_ = this.Renamed1603();
            if(_loc1_ != Renamed1582.NONE)
            {
               this._view.Renamed1609();
            }
         }
      }
      
      public function Renamed1610() : void
      {
         if(this._view.isReArmor)
         {
            this.Renamed1611();
         }
      }
      
      private function Renamed1611() : void
      {
         if(!this.Renamed1604())
         {
            this.Renamed1612();
         }
      }
      
      private function Renamed1612() : void
      {
         this._view.Renamed1613(this.Renamed1591);
      }
      
      private function getAutoName() : String
      {
         return this.getSelectedMapParams().gameName + " " + this._battleMode.name;
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this._view.setProgressBattleNameCheckIcon();
         this._view.blockedStartButton();
         this._battleNameBeforeCheck = this._view.getBattleName();
         this._checkedBattleNameTimer.stop();
         dispatchEvent(new CheckBattleNameEvent(CheckBattleNameEvent.CHECK_NAME,this._battleNameBeforeCheck));
      }
   }
}

