package alternativa.tanks.view.battlecreate
{
   import Renamed3900.Renamed3901;
   import alternativa.tanks.controllers.battlecreate.CreateBattleMapParams;
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormControllerCallBack;
   import alternativa.tanks.controllers.battlecreate.ICreateBattleFormViewCallBack;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battlecreate.slider.SelectRankSlider;
   import alternativa.tanks.view.battlecreate.slider.SelectRankSliderEvent;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import assets.icons.BattleInfoIcons;
   import assets.icons.InputCheckIcon;
   import controls.NumStepper;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.base.RedButtonBase;
   import controls.base.TankInputBase;
   import controls.checkbox.CheckBoxEvent;
   import controls.checkbox.Renamed3902;
   import controls.dropdownlist.Renamed3903;
   import controls.dropdownlist.DropDownList;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.events.LoginFormEvent;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class CreateBattleFormView extends Sprite implements ICreateBattleFormView, ICreateBattleFormViewCallBack
   {
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "lobby";
      
      private static const GA_ACTION:String = "createBattle";
      
      private static const MIN_FLASH_WIDTH:int = 970;
      
      private static const MIN_FLASH_HEIGHT:int = 530;
      
      private static const HEADER_HEIGHT:int = 60;
      
      private static const MAX_CHARS_BATTLE_NAME:int = 25;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleCreateBattleForm;
      
      private var _container:DisplayObjectContainer;
      
      private var _isShowThemeComboBox:Boolean;
      
      private var _callback:ICreateBattleFormControllerCallBack;
      
      private var _timeOutResize:uint;
      
      private var _background:TankWindow;
      
      private var _battleNameTextInput:TankInputBase;
      
      private var _battleNameCheckIcon:InputCheckIcon;
      
      private var _chooseMapComboBox:DropDownList;
      
      private var _chooseThemeMapComboBox:DropDownList;
      
      private var Renamed3904:DropDownList;
      
      private var _battleInfo:BattleInfoParamsView;
      
      private var _chooseRankSlider:SelectRankSlider;
      
      private var _chooseTypeBattle:ChooseTypeBattleView;
      
      private var _maxNumberPlayersStepper:NumStepper;
      
      private var _timeLimitStepper:NumStepper;
      
      private var _scoreLimitStepper:NumStepper;
      
      private var _autoBalanceCheckBox:Renamed3902;
      
      private var _friendlyFireCheckBox:Renamed3902;
      
      private var _suppliesCheckBox:Renamed3902;
      
      private var _bonusesCheckBox:Renamed3902;
      
      private var _crystalsCheckBox:Renamed3902;
      
      private var _proBattleCheckBox:Renamed3902;
      
      private var _upgradesCheckBox:Renamed3902;
      
      private var _privateBattleCheckBox:Renamed3902;
      
      private var _reArmorCheckBox:Renamed3902;
      
      private var _startButton:RedButtonBase;
      
      private var _trackedEvents:Dictionary;
      
      private const Renamed3905:Number = 11;
      
      public function CreateBattleFormView(param1:Stage, param2:DisplayObjectContainer, param3:ILocaleCreateBattleForm)
      {
         this._trackedEvents = new Dictionary();
         super();
         this._stage = param1;
         this._container = param2;
         this._locale = param3;
         this.init();
      }
      
      protected function init() : void
      {
         this._background = new TankWindow();
         this._background.headerLang = this._locale.headerLang;
         this._background.header = TankWindowHeader.CREATE_BATTLE;
         addChild(this._background);
         this._battleNameTextInput = new TankInputBase();
         this._battleNameTextInput.label = this._locale.battleNameLabel;
         this._battleNameTextInput.maxChars = MAX_CHARS_BATTLE_NAME;
         addChild(this._battleNameTextInput);
         this._battleNameCheckIcon = new InputCheckIcon();
         addChild(this._battleNameCheckIcon);
         this.resetProgressBattleNameCheckIcon();
         this._battleInfo = new BattleInfoParamsView();
         addChild(this._battleInfo);
         this._chooseRankSlider = new SelectRankSlider();
         addChild(this._chooseRankSlider);
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push(this._locale.deathMatchButtonLabel);
         _loc1_.push(this._locale.teamDeathMatchButtonLabel);
         _loc1_.push(this._locale.captureTheFlagButtonLabel);
         _loc1_.push(this._locale.dominationButtonLabel);
         _loc1_.push("AS");
         var _loc2_:Vector.<String> = new Vector.<String>();
         _loc2_.push(this._locale.deathMatchButtonShortLabel);
         _loc2_.push(this._locale.teamDeathMatchButtonShortLabel);
         _loc2_.push(this._locale.captureTheFlagButtonShortLabel);
         _loc2_.push(this._locale.dominationButtonShortLabel);
         _loc2_.push("AS");
         this._chooseTypeBattle = new ChooseTypeBattleView(_loc1_,_loc2_,this);
         addChild(this._chooseTypeBattle);
         this._maxNumberPlayersStepper = new NumStepper();
         this._maxNumberPlayersStepper.label = this._locale.stepperMaxPlayersLabel;
         this._maxNumberPlayersStepper.icon = BattleInfoIcons.PLAYERS;
         addChild(this._maxNumberPlayersStepper);
         this._timeLimitStepper = new NumStepper();
         this._timeLimitStepper.label = this._locale.stepperTimeLimitLabel;
         this._timeLimitStepper.icon = BattleInfoIcons.TIME_LIMIT;
         addChild(this._timeLimitStepper);
         this._scoreLimitStepper = new NumStepper();
         this._scoreLimitStepper.label = this._locale.stepperFlagsLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.CTF;
         addChild(this._scoreLimitStepper);
         this._proBattleCheckBox = new Renamed3902(Renamed3901.Renamed3906);
         this._proBattleCheckBox.label = this._locale.checkBoxSportModeLabel;
         this._proBattleCheckBox.Renamed1878 = false;
         addChild(this._proBattleCheckBox);
         this._autoBalanceCheckBox = new Renamed3902(Renamed3901.Renamed3907);
         this._autoBalanceCheckBox.Renamed1878 = true;
         this._autoBalanceCheckBox.label = this._locale.checkBoxAutoBalanceLabel;
         addChild(this._autoBalanceCheckBox);
         this._friendlyFireCheckBox = new Renamed3902(Renamed3901.Renamed3908);
         this._friendlyFireCheckBox.label = this._locale.checkBoxFriendlyFireLabel;
         addChild(this._friendlyFireCheckBox);
         this._suppliesCheckBox = new Renamed3902(Renamed3901.Renamed3909);
         this._suppliesCheckBox.Renamed1878 = true;
         this._suppliesCheckBox.label = this._locale.checkBoxNoSuppliesLabel;
         addChild(this._suppliesCheckBox);
         this._bonusesCheckBox = new Renamed3902(Renamed3901.Renamed3910);
         this._bonusesCheckBox.Renamed1878 = true;
         this._bonusesCheckBox.label = this._locale.checkBoxBonusesLabel;
         addChild(this._bonusesCheckBox);
         this._crystalsCheckBox = new Renamed3902(Renamed3901.Renamed3911);
         this._crystalsCheckBox.Renamed1878 = true;
         this._crystalsCheckBox.label = this._locale.checkBoxCrystalsLabel;
         addChild(this._crystalsCheckBox);
         this._upgradesCheckBox = new Renamed3902(Renamed3901.Renamed3912);
         this._upgradesCheckBox.Renamed1878 = true;
         this._upgradesCheckBox.label = this._locale.checkBoxUpgradesLabel;
         this._upgradesCheckBox.alpha = 0.5;
         this._upgradesCheckBox.enabled = false;
         this._privateBattleCheckBox = new Renamed3902(Renamed3901.Renamed3913);
         this._privateBattleCheckBox.label = this._locale.checkBoxPrivateBattleLabel;
         addChild(this._privateBattleCheckBox);
         this._reArmorCheckBox = new Renamed3902(Renamed3901.Renamed3914);
         this._reArmorCheckBox.Renamed1878 = true;
         this._reArmorCheckBox.label = this._locale.checkBoxReArmorLabel;
         addChild(this._reArmorCheckBox);
         this.Renamed3904 = new DropDownList();
         this.Renamed3904.setRenderer(Renamed3903);
         addChild(this.Renamed3904);
         this._startButton = new RedButtonBase();
         this._startButton.label = this._locale.startButtonLabel;
         addChild(this._startButton);
         this._chooseMapComboBox = new DropDownList();
         this._chooseMapComboBox.label = this._locale.mapNameLabel;
         addChild(this._chooseMapComboBox);
         this._chooseThemeMapComboBox = new DropDownList();
         this._chooseThemeMapComboBox.label = this._locale.themeMapNameLabel;
         addChild(this._chooseThemeMapComboBox);
      }
      
      public function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._battleNameTextInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onBattleNameChange);
         this._battleNameTextInput.textField.addEventListener(FocusEvent.FOCUS_IN,this.onBattleNameInFocus);
         this._battleNameTextInput.textField.addEventListener(FocusEvent.FOCUS_OUT,this.onBattleNameOutFocus);
         this._chooseMapComboBox.addEventListener(Event.CHANGE,this.onMapChange);
         this._chooseMapComboBox.addEventListener(Event.OPEN,this.onMapComboBoxOpen);
         this._chooseThemeMapComboBox.addEventListener(Event.OPEN,this.onThemeComboBoxOpen);
         this._chooseThemeMapComboBox.addEventListener(Event.CHANGE,this.onThemeChange);
         this._maxNumberPlayersStepper.addEventListener(Event.CHANGE,this.onPlayersNumberChange);
         this._maxNumberPlayersStepper.addEventListener(MouseEvent.CLICK,this.onPlayersNumberChangeTrack);
         this._timeLimitStepper.addEventListener(Event.CHANGE,this.onTimeLimitChange);
         this._timeLimitStepper.addEventListener(MouseEvent.CLICK,this.onTimeLimitChangeTrack);
         this._scoreLimitStepper.addEventListener(Event.CHANGE,this.onScoreLimitChange);
         this._scoreLimitStepper.addEventListener(MouseEvent.CLICK,this.onScoreLimitChangeTrack);
         this._chooseRankSlider.addEventListener(SelectRankSliderEvent.RANK_LIMIT_CHANGED,this.onRankLimitChanged);
         this._startButton.addEventListener(MouseEvent.CLICK,this.onStartButtonClick);
         this._suppliesCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onNoSuppliesChange);
         this._proBattleCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onProBattleChanged);
         this._privateBattleCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onPrivateBattleChange);
         this._friendlyFireCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onFriendlyFireChange);
         this._bonusesCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onBonusesChange);
         this._crystalsCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onCrystalsChange);
         this._autoBalanceCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onAutoBalanceChange);
         this._reArmorCheckBox.addEventListener(CheckBoxEvent.STATE_CHANGED,this.onReArmorChange);
         this.Renamed3904.addEventListener(Event.CHANGE,this.Renamed1608);
      }
      
      public function removeEvents() : void
      {
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._battleNameTextInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onBattleNameChange);
         this._battleNameTextInput.textField.removeEventListener(FocusEvent.FOCUS_IN,this.onBattleNameInFocus);
         this._battleNameTextInput.textField.removeEventListener(FocusEvent.FOCUS_OUT,this.onBattleNameOutFocus);
         this._chooseMapComboBox.removeEventListener(Event.CHANGE,this.onMapChange);
         this._chooseMapComboBox.removeEventListener(Event.OPEN,this.onMapComboBoxOpen);
         this._chooseThemeMapComboBox.removeEventListener(Event.OPEN,this.onThemeComboBoxOpen);
         this._chooseThemeMapComboBox.removeEventListener(Event.CHANGE,this.onThemeChange);
         this._maxNumberPlayersStepper.removeEventListener(Event.CHANGE,this.onPlayersNumberChange);
         this._maxNumberPlayersStepper.removeEventListener(MouseEvent.CLICK,this.onPlayersNumberChangeTrack);
         this._timeLimitStepper.removeEventListener(Event.CHANGE,this.onTimeLimitChange);
         this._timeLimitStepper.removeEventListener(MouseEvent.CLICK,this.onTimeLimitChangeTrack);
         this._scoreLimitStepper.removeEventListener(Event.CHANGE,this.onScoreLimitChange);
         this._scoreLimitStepper.removeEventListener(MouseEvent.CLICK,this.onScoreLimitChangeTrack);
         this._chooseRankSlider.removeEventListener(SelectRankSliderEvent.RANK_LIMIT_CHANGED,this.onRankLimitChanged);
         this._startButton.removeEventListener(MouseEvent.CLICK,this.onStartButtonClick);
         this._suppliesCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onNoSuppliesChange);
         this._proBattleCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onProBattleChanged);
         this._privateBattleCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onPrivateBattleChange);
         this._friendlyFireCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onFriendlyFireChange);
         this._bonusesCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onBonusesChange);
         this._autoBalanceCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onAutoBalanceChange);
         this._reArmorCheckBox.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.onReArmorChange);
         this.Renamed3904.removeEventListener(Event.CHANGE,this.Renamed1608);
      }
      
      public function onClickTypeBattleButton(param1:Renamed1587) : void
      {
         this._callback.onSelected(param1);
         this.trackOnce("battleTypeChange_" + param1.name);
      }
      
      public function setTypeBattle(param1:Renamed1587) : void
      {
         this._chooseTypeBattle.setTypeBattle(param1);
         this.onProBattleChanged();
      }
      
      public function setProgressBattleNameCheckIcon() : void
      {
         this._battleNameCheckIcon.gotoAndStop(1);
         this._battleNameCheckIcon.visible = true;
      }
      
      public function resetProgressBattleNameCheckIcon() : void
      {
         this._battleNameCheckIcon.gotoAndStop(0);
         this._battleNameCheckIcon.visible = false;
      }
      
      public function showInvalidRectangleBattleName() : void
      {
         this._battleNameTextInput.validValue = false;
      }
      
      public function hideInvalidRectangleBattleName() : void
      {
         this._battleNameTextInput.validValue = true;
      }
      
      public function setBattleName(param1:String) : void
      {
         this._battleNameTextInput.value = param1;
      }
      
      public function getBattleName() : String
      {
         return this._battleNameTextInput.value;
      }
      
      public function getBattleNameLength() : int
      {
         return this._battleNameTextInput.textField.length;
      }
      
      public function blockedStartButton() : void
      {
         this._startButton.enable = false;
      }
      
      public function unBlockedStartButton() : void
      {
         this._startButton.enable = true;
      }
      
      public function resetCheckBox() : void
      {
         this._privateBattleCheckBox.Renamed1878 = false;
         this.onProBattleChanged();
      }
      
      public function get isPrivateBattle() : Boolean
      {
         return this._privateBattleCheckBox.Renamed1878;
      }
      
      public function get isAutoBalance() : Boolean
      {
         return this._autoBalanceCheckBox.Renamed1878;
      }
      
      public function get isFriendlyFire() : Boolean
      {
         return this._friendlyFireCheckBox.Renamed1878;
      }
      
      public function get isNoSuppliesBattle() : Boolean
      {
         return !this._suppliesCheckBox.Renamed1878;
      }
      
      public function get isWithoutBonuses() : Boolean
      {
         return !this._bonusesCheckBox.Renamed1878;
      }
      
      public function get isWithoutCrystals() : Boolean
      {
         return !this._crystalsCheckBox.Renamed1878;
      }
      
      public function get isProBattle() : Boolean
      {
         return this._proBattleCheckBox.Renamed1878;
      }
      
      public function get isReArmor() : Boolean
      {
         return this._reArmorCheckBox.Renamed1878;
      }
      
      public function get isWithoutUpgrades() : Boolean
      {
         return !this._upgradesCheckBox.Renamed1878;
      }
      
      public function setRankIntervalRestriction(param1:int, param2:int, param3:int) : void
      {
         this._chooseRankSlider.minValue = param1;
         this._chooseRankSlider.maxValue = param2;
         this._chooseRankSlider.tickInterval = param3;
      }
      
      public function setMaxRankRange(param1:int) : void
      {
         this._chooseRankSlider.maxRangRange = param1;
      }
      
      public function setMaxRang(param1:int) : void
      {
         this._chooseRankSlider.maxRang = param1;
         this._chooseRankSlider.width = this._battleInfo.width;
      }
      
      public function setMinRang(param1:int) : void
      {
         this._chooseRankSlider.minRang = param1;
         this._chooseRankSlider.width = this._battleInfo.width;
      }
      
      public function setCurrentRank(param1:int) : void
      {
         this._chooseRankSlider.currentRang = param1;
      }
      
      public function getCurrentRang() : int
      {
         return this._chooseRankSlider.currentRang;
      }
      
      public function getMaxRank() : int
      {
         return this._chooseRankSlider.maxRang;
      }
      
      public function getMinRank() : int
      {
         return this._chooseRankSlider.minRang;
      }
      
      public function getMinRangValue() : int
      {
         return this._chooseRankSlider.minValue;
      }
      
      public function getMaxRangValue() : int
      {
         return this._chooseRankSlider.maxValue;
      }
      
      public function getMaxRangRange() : int
      {
         return this._chooseRankSlider.maxRangRange;
      }
      
      public function setCallBack(param1:ICreateBattleFormControllerCallBack) : void
      {
         this._callback = param1;
      }
      
      public function show() : void
      {
         this.setEvents();
         this.onResize(null);
         this.onProBattleChanged();
         if(!this._container.contains(this))
         {
            this._container.addChild(this);
         }
         this._chooseMapComboBox.open();
      }
      
      public function hide() : void
      {
         this.removeEvents();
         if(this._container.contains(this))
         {
            this._container.removeChild(this);
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         clearTimeout(this._timeOutResize);
         this._chooseTypeBattle.destroy();
         this._chooseTypeBattle = null;
         this._background = null;
         this._battleNameTextInput = null;
         this._battleNameCheckIcon = null;
         this._battleInfo = null;
         this._chooseRankSlider = null;
         this._maxNumberPlayersStepper = null;
         this._timeLimitStepper = null;
         this._scoreLimitStepper = null;
         this._autoBalanceCheckBox = null;
         this._friendlyFireCheckBox = null;
         this._suppliesCheckBox = null;
         this._proBattleCheckBox = null;
         this._bonusesCheckBox = null;
         this._crystalsCheckBox = null;
         this._upgradesCheckBox = null;
         this._privateBattleCheckBox = null;
         this._reArmorCheckBox = null;
         this._startButton = null;
         this._chooseMapComboBox = null;
         this._chooseThemeMapComboBox = null;
         this._callback = null;
         this._locale = null;
         this._stage = null;
         this._container = null;
         this._trackedEvents = null;
         this.Renamed3904 = null;
      }
      
      public function setAvailableTypesBattle(param1:Vector.<Renamed1587>) : void
      {
         this._chooseTypeBattle.setAvailableTypesBattle(param1);
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:int = 520;
         if(this._stage.stageHeight < 720)
         {
            _loc4_ = 450;
         }
         var _loc5_:Number = int(Math.max(MIN_FLASH_WIDTH,param1)) / 3;
         var _loc6_:Number = Math.max(param2 - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _loc5_;
         this._background.height = _loc6_;
         this.x = _loc5_ * 2;
         this.y = HEADER_HEIGHT;
         this._battleNameTextInput.width = _loc5_ - this._battleNameTextInput._label.textWidth - 37;
         this._battleNameTextInput.x = this._battleNameTextInput.width - this._battleNameTextInput.textField.width + 10;
         this._battleNameTextInput.y = 11;
         this._battleNameCheckIcon.x = _loc5_ - this._battleNameCheckIcon.width - 3 - 11;
         this._battleNameCheckIcon.y = 18;
         this._chooseMapComboBox.x = this._battleNameTextInput.width - this._battleNameTextInput.textField.width + 10;
         this._chooseMapComboBox.y = 46;
         this._chooseMapComboBox.height = 275;
         this.resizeMapAndThemeComboBoxes();
         this._battleInfo.width = _loc5_ - 22;
         this._battleInfo.height = int(_loc6_ - _loc4_);
         this._battleInfo.x = 11;
         this._battleInfo.y = 81;
         this._chooseRankSlider.x = 11;
         this._chooseRankSlider.y = this._battleInfo.height + 86;
         this._chooseRankSlider.width = this._battleInfo.width;
         this._chooseTypeBattle.resize(this._battleInfo.width,this._chooseTypeBattle.getComponentHeight());
         this._chooseTypeBattle.x = 11;
         this._chooseTypeBattle.y = this._chooseRankSlider.y + 35;
         var _loc7_:int = int((_loc5_ - this._maxNumberPlayersStepper.width - this._timeLimitStepper.width - this._scoreLimitStepper.width) / 4);
         this._maxNumberPlayersStepper.x = _loc7_;
         this._timeLimitStepper.x = this._maxNumberPlayersStepper.width + _loc7_ * 2;
         this._scoreLimitStepper.x = this._maxNumberPlayersStepper.width + this._timeLimitStepper.width + _loc7_ * 3;
         this._maxNumberPlayersStepper.y = this._timeLimitStepper.y = this._scoreLimitStepper.y = this._chooseTypeBattle.y + 71;
         var _loc8_:int = _loc5_ / 2 + 5;
         this._proBattleCheckBox.x = 11;
         this._proBattleCheckBox.y = this._maxNumberPlayersStepper.y + this._maxNumberPlayersStepper.height - 11;
         this._reArmorCheckBox.x = 11;
         this._reArmorCheckBox.y = this._proBattleCheckBox.y + this._proBattleCheckBox.height + 8;
         this._bonusesCheckBox.x = 11;
         this._bonusesCheckBox.y = this._reArmorCheckBox.y + this._reArmorCheckBox.height + 8;
         this._crystalsCheckBox.x = 11;
         this._crystalsCheckBox.y = this._bonusesCheckBox.y + this._bonusesCheckBox.height + 8;
         this._suppliesCheckBox.x = 11;
         this._suppliesCheckBox.y = this._crystalsCheckBox.y + this._crystalsCheckBox.height + 8;
         this.Renamed3904.x = _loc8_;
         this.Renamed3904.y = this._proBattleCheckBox.y;
         this.Renamed3904.width = _loc5_ - this.Renamed3904.x - this.Renamed3905;
         this.Renamed3915();
         this._privateBattleCheckBox.x = _loc8_;
         this._privateBattleCheckBox.y = this._proBattleCheckBox.y + this._proBattleCheckBox.height + 8;
         this._autoBalanceCheckBox.x = _loc8_;
         this._autoBalanceCheckBox.y = this._privateBattleCheckBox.y + this._privateBattleCheckBox.height + 8;
         this._friendlyFireCheckBox.x = _loc8_;
         this._friendlyFireCheckBox.y = this._autoBalanceCheckBox.y + this._autoBalanceCheckBox.height + 8;
         this._upgradesCheckBox.x = _loc8_;
         this._startButton.x = _loc5_ - this._startButton.width - 11;
         this._startButton.y = _loc6_ - 42;
         if(param3)
         {
            this.resizeWithDelay();
         }
      }
      
      private function Renamed3915() : void
      {
         this.Renamed3904.height = 34 + 5 * this.Renamed3904.rowHeight;
      }
      
      private function resizeWithDelay(param1:int = 200) : void
      {
         clearTimeout(this._timeOutResize);
         this._timeOutResize = setTimeout(this.onResizeWithDelay,param1);
      }
      
      private function onResizeWithDelay() : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight,false);
      }
      
      public function setMapsInfo(param1:Array) : void
      {
         var _loc2_:CreateBattleMapParams = null;
         this._chooseMapComboBox.clear();
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_] as CreateBattleMapParams;
            this._chooseMapComboBox.addItem({
               "index":_loc2_.index,
               "gameName":_loc2_.gameName,
               "id":_loc2_.id,
               "minRank":_loc2_.minRank,
               "maxRank":_loc2_.maxRank,
               "rang":_loc2_.currentRank,
               "maxPeople":_loc2_.maxPeople,
               "battleModes":_loc2_.battleModes,
               "clanName":_loc2_.clanName,
               "clanLink":_loc2_.clanLink,
               "additionalCrystalsPercent":_loc2_.additionalCrystalsPercent,
               "defaultMap":_loc2_.defaultMap
            });
            _loc4_++;
         }
      }
      
      public function setThemeInfo(param1:Array) : void
      {
         this._chooseThemeMapComboBox.clear();
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._chooseThemeMapComboBox.addItem({
               "gameName":this._locale.getThemeName(param1[_loc3_].theme),
               "themeName":param1[_loc3_].gameName,
               "id":param1[_loc3_].id,
               "rang":param1[_loc3_].rang,
               "theme":param1[_loc3_].theme
            });
            _loc3_++;
         }
         this._chooseThemeMapComboBox.height = 34 + _loc2_ * 20;
      }
      
      public function selectMap(param1:String, param2:String) : void
      {
         this._chooseMapComboBox.selectItemByField(param1,param2);
      }
      
      public function setSelectMapThemeItemByField(param1:String, param2:String) : void
      {
         this._chooseThemeMapComboBox.selectItemByField(param1,param2);
      }
      
      public function getSelectMapItem() : Object
      {
         return this._chooseMapComboBox.selectedItem;
      }
      
      public function getSelectedThemeItem() : Object
      {
         return this._chooseThemeMapComboBox.selectedItem;
      }
      
      public function showThemeForMap() : void
      {
         this._isShowThemeComboBox = true;
         this._chooseThemeMapComboBox.visible = this._isShowThemeComboBox;
         this.resizeMapAndThemeComboBoxes();
      }
      
      public function hideThemeForMap() : void
      {
         this._isShowThemeComboBox = false;
         this._chooseThemeMapComboBox.visible = this._isShowThemeComboBox;
         this.resizeMapAndThemeComboBoxes();
      }
      
      public function setPreview(param1:BitmapData) : void
      {
         this._battleInfo.setPreview(param1);
      }
      
      public function setSettingsPlayersLimit(param1:int, param2:int, param3:int) : void
      {
         this._maxNumberPlayersStepper.minValue = param1;
         this._maxNumberPlayersStepper.maxValue = param2;
         this._maxNumberPlayersStepper.value = param3;
      }
      
      public function setSettingsTimeLimit(param1:int, param2:int, param3:int) : void
      {
         this._timeLimitStepper.minValue = param1;
         this._timeLimitStepper.maxValue = param2;
         this._timeLimitStepper.value = param3;
      }
      
      public function setSettingsScoreLimit(param1:int, param2:int, param3:int, param4:int) : void
      {
         this._scoreLimitStepper.minValue = param1;
         this._scoreLimitStepper.maxValue = param2;
         this._scoreLimitStepper.value = param3;
         this._scoreLimitStepper.step = param4;
      }
      
      public function setNameMaxPlayersStepper() : void
      {
         this._maxNumberPlayersStepper.label = this._locale.stepperMaxPlayersLabel;
      }
      
      public function setNameMaxPlayersTeamStepper() : void
      {
         this._maxNumberPlayersStepper.label = this._locale.stepperMaxTeamPlayersLabel;
      }
      
      public function setNameAndIconKillsLimitStepper() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperKillsLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.KILL_LIMIT;
      }
      
      public function setNameAndIconFlagsStepper() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperFlagsLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.CTF;
      }
      
      public function setNameAndIconDominationStepper() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperDominationLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.Renamed3916;
      }
      
      public function Renamed1599() : void
      {
         this._scoreLimitStepper.label = this._locale.stepperDominationLimitLabel;
         this._scoreLimitStepper.icon = BattleInfoIcons.Renamed3916;
      }
      
      public function getTimeLimit() : int
      {
         return this._timeLimitStepper.value;
      }
      
      public function getScoreLimit() : int
      {
         return this._scoreLimitStepper.value;
      }
      
      public function getNumberPlayers() : int
      {
         return this._maxNumberPlayersStepper.value;
      }
      
      private function resizeMapAndThemeComboBoxes() : void
      {
         var _loc1_:Number = int(Math.max(MIN_FLASH_WIDTH,this._stage.stageWidth)) / 3;
         if(this._isShowThemeComboBox)
         {
            this._chooseMapComboBox.width = int(_loc1_ / 2 - this._chooseMapComboBox.x - 11);
            this._chooseThemeMapComboBox.width = int(_loc1_ / 2 - this._chooseMapComboBox.x - 10);
            this._chooseThemeMapComboBox.x = int(_loc1_ / 2 + this._chooseMapComboBox.x);
         }
         else
         {
            this._chooseMapComboBox.width = _loc1_ - this._battleNameTextInput._label.textWidth - 37;
         }
         this._chooseThemeMapComboBox.y = 46;
      }
      
      private function onPrivateBattleChange(param1:CheckBoxEvent) : void
      {
         this.trackOnce("privateBattleChange");
      }
      
      private function onRankLimitChanged(param1:SelectRankSliderEvent) : void
      {
         this.trackOnce("rankLimitChange");
      }
      
      private function onStartButtonClick(param1:MouseEvent) : void
      {
         this._callback.onCreateBattle();
         this.trackOnce("startBattle");
      }
      
      private function onResize(param1:Event) : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight);
      }
      
      private function onBattleNameChange(param1:LoginFormEvent) : void
      {
         this._callback.onBattleNameChange();
         this.trackOnce("battleNameChange");
      }
      
      private function onBattleNameInFocus(param1:FocusEvent) : void
      {
         this._callback.onBattleNameInFocus();
      }
      
      private function onBattleNameOutFocus(param1:FocusEvent) : void
      {
         this._callback.onBattleNameOutFocus();
      }
      
      private function onMapChange(param1:Event) : void
      {
         this._callback.onMapChange();
         this.trackOnce("mapChange");
      }
      
      private function onMapComboBoxOpen(param1:Event) : void
      {
         this.trackOnce("mapComboBoxOpen");
      }
      
      private function onThemeComboBoxOpen(param1:Event) : void
      {
         this.trackOnce("themeComboBoxOpen");
      }
      
      private function onThemeChange(param1:Event) : void
      {
         this._callback.onThemeChange();
         this.trackOnce("themeChange");
      }
      
      private function onPlayersNumberChange(param1:Event) : void
      {
         this._callback.onPlayersNumberChange();
      }
      
      private function onTimeLimitChange(param1:Event) : void
      {
         this._callback.onTimeLimitChange();
      }
      
      private function onScoreLimitChange(param1:Event) : void
      {
         this._callback.onScoreLimitChange();
      }
      
      private function onNoSuppliesChange(param1:CheckBoxEvent) : void
      {
         this.trackOnce("supplyChange");
      }
      
      private function onProBattleChanged(param1:CheckBoxEvent = null) : void
      {
         if(this._proBattleCheckBox.Renamed1878)
         {
            this._upgradesCheckBox.visible = true;
            this._bonusesCheckBox.visible = true;
            this._crystalsCheckBox.visible = true;
            this._suppliesCheckBox.visible = true;
            this._reArmorCheckBox.visible = true;
            this._privateBattleCheckBox.visible = true;
            this.Renamed3904.visible = true;
            if(this._chooseTypeBattle.getSelectedBattleMode() != Renamed1587.DM)
            {
               this._friendlyFireCheckBox.visible = true;
               this._autoBalanceCheckBox.visible = true;
            }
            else
            {
               this._friendlyFireCheckBox.visible = false;
               this._autoBalanceCheckBox.visible = false;
            }
         }
         else
         {
            this._upgradesCheckBox.visible = false;
            this._bonusesCheckBox.visible = false;
            this._crystalsCheckBox.visible = false;
            this._suppliesCheckBox.visible = false;
            this._friendlyFireCheckBox.visible = false;
            this._autoBalanceCheckBox.visible = false;
            this._privateBattleCheckBox.visible = false;
            this.Renamed3904.visible = false;
            this._reArmorCheckBox.visible = false;
         }
         this.trackOnce("proBattleChanged");
      }
      
      private function onFriendlyFireChange(param1:CheckBoxEvent) : void
      {
         this.trackOnce("friendlyFireChange");
      }
      
      private function onBonusesChange(param1:CheckBoxEvent) : void
      {
         this.trackOnce("bonusesChange");
      }
      
      private function onCrystalsChange(param1:CheckBoxEvent) : void
      {
         this.trackOnce("crystalBonusChange");
      }
      
      private function onAutoBalanceChange(param1:CheckBoxEvent) : void
      {
         this.trackOnce("autoBalanceChange");
      }
      
      private function onScoreLimitChangeTrack(param1:MouseEvent) : void
      {
         this.trackOnce("scoreLimitChange");
      }
      
      private function onPlayersNumberChangeTrack(param1:MouseEvent) : void
      {
         this.trackOnce("playersNumberChange");
      }
      
      private function onTimeLimitChangeTrack(param1:MouseEvent) : void
      {
         this.trackOnce("timeLimitChange");
      }
      
      private function onReArmorChange(param1:CheckBoxEvent) : void
      {
         this._callback.Renamed1610();
         this.trackOnce("ReArmorChange");
      }
      
      private function Renamed1608(param1:Event) : void
      {
         this._callback.Renamed1608();
      }
      
      private function trackOnce(param1:String) : void
      {
         if(this._trackedEvents[param1] == null)
         {
            this._trackedEvents[param1] = true;
            trackerService.trackEvent(GA_CATEGORY,GA_ACTION,param1);
         }
      }
      
      public function Renamed1592(param1:Vector.<Object>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.Renamed3904.addItem(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function Renamed1605() : Object
      {
         return this.Renamed3904.selectedItem;
      }
      
      public function Renamed1609() : void
      {
         this._reArmorCheckBox.Renamed1878 = false;
      }
      
      public function Renamed3917() : void
      {
         this._upgradesCheckBox.Renamed1878 = false;
      }
      
      public function Renamed1613(param1:int) : void
      {
         this.Renamed3904.selectItemByField("index",param1);
      }
   }
}

