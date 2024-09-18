package controls
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.panel.Indicators;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import utils.FontParamsUtil;
   
   public class PlayerInfo extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private const normalGlowColor:uint = 1244928;
      
      private const minusGlowColor:uint = 16728064;
      
      private var _playerName:String;
      
      private var _rang:int;
      
      private var _score:int = 0;
      
      private var _scoreRemain:int = 0;
      
      private var _progress:int = 0;
      
      private var _newProgress:int;
      
      private var _deltaProgress:Number;
      
      private var _rating:Number = 0;
      
      private var _ratingChange:int = 0;
      
      private var _position:int;
      
      private var _shield:int = 5000;
      
      private var _weapon:int = 7500;
      
      private var _engine:int = 6000;
      
      private var _money:int = 0;
      
      private var _crystals:int = 0;
      
      public var indicators:Indicators;
      
      private var glowAlpha:Object;
      
      private var glowColor:Object;
      
      private var glowDelta:Number = 0.02;
      
      private var _width:int;
      
      public function PlayerInfo()
      {
         this.indicators = new Indicators();
         this.glowAlpha = new Object();
         this.glowColor = new Object();
         super();
         addChild(this.indicators);
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
      }
      
      public function get playerName() : String
      {
         return this._playerName;
      }
      
      public function set playerName(param1:String) : void
      {
         this._playerName = param1;
         this.updateInfo();
      }
      
      public function get rang() : int
      {
         return this._rang;
      }
      
      public function set rang(param1:int) : void
      {
         this._rang = param1;
         this.updateInfo();
      }
      
      public function updateScore(param1:int, param2:int) : void
      {
         if(param1 != this._score && this._score != 0)
         {
            this.flashLabel(this.indicators.playerInfo,param1 > this._score ? uint(this.normalGlowColor) : uint(this.minusGlowColor));
         }
         this._score = param1;
         this._scoreRemain = param2;
         this.updateInfo();
      }
      
      public function get progress() : int
      {
         return this._progress;
      }
      
      public function set progress(param1:int) : void
      {
         if(this._progress == 0)
         {
            this._progress = param1;
         }
         else
         {
            this._newProgress = param1;
            this._progress = param1;
            this.indicators.newprogress = param1;
         }
         this.updateInfo();
      }
      
      public function get rating() : Number
      {
         return this._rating;
      }
      
      public function set rating(param1:Number) : void
      {
         if(int(param1) != this._rating && this._rating != 0)
         {
            this.flashLabel(this.indicators.kdRatio,int(param1) > this._rating ? uint(this.normalGlowColor) : uint(this.minusGlowColor));
         }
         this._rating = int(param1);
         this.updateInfo();
      }
      
      public function get ratingChange() : int
      {
         return this._rating;
      }
      
      public function set ratingChange(param1:int) : void
      {
         this._ratingChange = param1;
         this.updateInfo();
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(param1:int) : void
      {
         if(param1 != this._position && this._position != 0)
         {
            this.flashLabel(this.indicators.scoreLabel,param1 > this._position ? uint(this.minusGlowColor) : uint(this.normalGlowColor));
         }
         this._position = param1;
         this.updateInfo();
      }
      
      public function get shield() : int
      {
         return this._shield;
      }
      
      public function set shield(param1:int) : void
      {
         this._shield = param1;
         this.updateInfo();
      }
      
      public function get weapon() : int
      {
         return this._weapon;
      }
      
      public function set weapon(param1:int) : void
      {
         this._weapon = param1;
         this.updateInfo();
      }
      
      public function get engine() : int
      {
         return this._engine;
      }
      
      public function set engine(param1:int) : void
      {
         this._engine = param1;
         this.updateInfo();
      }
      
      public function get money() : int
      {
         return this._money;
      }
      
      public function set money(param1:int) : void
      {
      }
      
      public function get crystals() : int
      {
         return this._engine;
      }
      
      public function set crystals(param1:int) : void
      {
         if(param1 != this._crystals && this._crystals != 0)
         {
            this.flashLabel(this.indicators.crystalInfo,param1 > this._crystals ? uint(this.normalGlowColor) : uint(this.minusGlowColor));
         }
         this._crystals = param1;
         this.updateInfo();
      }
      
      private function configUI(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         this.indicators.x = 59;
         this.setDefaultSharpnessAndThickness(this.indicators.crystalInfo);
         this.setDefaultSharpnessAndThickness(this.indicators.kdRatio);
         this.setDefaultSharpnessAndThickness(this.indicators.playerInfo);
         this.setDefaultSharpnessAndThickness(this.indicators.scoreLabel);
      }
      
      private function setDefaultSharpnessAndThickness(param1:Label) : void
      {
         param1.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         param1.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
      }
      
      private function updateInfo() : void
      {
         this.indicators.playerInfo.text = String(this._score) + " / " + String(this._scoreRemain) + "   " + Rank.name(this._rang) + " " + this._playerName;
         this.indicators.progress = this._progress;
         this.indicators.kdRatio.text = String(int(this._rating));
         this.indicators.kd_icon.gotoAndStop(this._ratingChange + 2);
         this.indicators.scoreLabel.text = localeService.getText(TextConst.MAIN_PANEL_RATING_LABEL) + String(this._position);
         switch(this._ratingChange)
         {
            case -1:
               this.indicators.kdRatio.color = 16717056;
               break;
            case 0:
               this.indicators.kdRatio.color = 11711154;
               break;
            case 1:
               this.indicators.kdRatio.color = 1244928;
         }
         this.indicators.crystalInfo.text = Money.numToString(this._crystals,false);
         this.width = this._width;
      }
      
      private function flashLabel(param1:Label, param2:uint = 16711680) : void
      {
         this.glowAlpha[param1.name] = 1;
         this.glowColor[param1.name] = param2;
         param1.addEventListener(Event.ENTER_FRAME,this.glowFrame);
      }
      
      private function glowFrame(param1:Event) : void
      {
         var _loc2_:Label = param1.target as Label;
         var _loc3_:GlowFilter = new GlowFilter(this.glowColor[_loc2_.name],this.glowAlpha[_loc2_.name],4,4,3,1,false);
         _loc2_.filters = [_loc3_];
         this.glowAlpha[_loc2_.name] -= this.glowDelta;
         if(this.glowAlpha[_loc2_.name] < 0)
         {
            _loc2_.filters = [];
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.glowFrame);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.indicators.width = param1;
      }
      
      public function setFirstBattleModeEnabled(param1:Boolean) : void
      {
         this.indicators.kd_icon.visible = !param1;
         this.indicators.kdicon.visible = !param1;
         this.indicators.kdRatio.visible = !param1;
         this.indicators.scoreLabel.visible = !param1;
      }
   }
}

