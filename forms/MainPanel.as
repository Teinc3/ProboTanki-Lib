package forms
{
   import alternativa.osgi.service.display.IDisplay;
   import controls.PlayerInfo;
   import controls.rangicons.RangIconNormal;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.events.MainButtonBarEvents;
   import forms.ranks.BigRankIcon;
   import forms.ranks.RankIcon;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   
   public class MainPanel extends Sprite
   {
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var display:IDisplay;
      
      public var rangIcon:RangIconNormal;
      
      public var playerInfo:PlayerInfo;
      
      public var buttonBar:ButtonBar;
      
      private var _rang:int;
      
      private var _isTester:Boolean = false;
      
      private var _hasDoubleCrystal:Boolean = false;
      
      public var rankIcon:RankIcon;
      
      public function MainPanel(param1:Boolean = false)
      {
         this.rangIcon = new RangIconNormal();
         this.playerInfo = new PlayerInfo();
         this.buttonBar = new ButtonBar();
         this.rankIcon = new BigRankIcon();
         super();
         this._isTester = param1;
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
         premiumService.addEventListener(Event.CHANGE,this.onPremiumChanged);
      }
      
      public function set rang(param1:int) : void
      {
         this.playerInfo.rang = param1;
         this.rankIcon.init(premiumService.hasPremium(),param1);
         this.alignRankIcon();
      }
      
      public function get rang() : int
      {
         return this._rang;
      }
      
      private function configUI(param1:Event) : void
      {
         this.y = 3;
         addChild(this.rankIcon);
         addChild(this.playerInfo);
         addChild(this.buttonBar);
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function listClick(param1:MouseEvent) : void
      {
         this.buttonBar.dispatchEvent(new MainButtonBarEvents(1));
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         _loc2_ = int(Math.max(970,display.stage.stageWidth));
         this.playerInfo.x = 15;
         this.playerInfo.width = _loc2_ - this.buttonBar.width + 13 - this.playerInfo.x - 10;
         this.buttonBar.x = _loc2_ - this.buttonBar.width - 4;
         this.buttonBar.draw();
      }
      
      private function onUpdateRank(param1:UserPropertiesServiceEvent) : void
      {
         if(this.buttonBar.§!#T§())
         {
            this.buttonBar.draw();
            this.onResize();
            userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
         }
      }
      
      public function hide() : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function get isTester() : Boolean
      {
         return this._isTester;
      }
      
      public function set isTester(param1:Boolean) : void
      {
         this._isTester = param1;
         this.buttonBar.isTester = this._isTester;
         this.buttonBar.draw();
         this.onResize(null);
      }
      
      public function get hasDoubleCrystal() : Boolean
      {
         return this._hasDoubleCrystal;
      }
      
      public function set hasDoubleCrystal(param1:Boolean) : void
      {
         this._hasDoubleCrystal = param1;
         this.buttonBar.hasDoubleCrystal = this._hasDoubleCrystal;
         this.buttonBar.draw();
         this.onResize(null);
      }
      
      private function onPremiumChanged(param1:Event) : void
      {
         var _loc2_:int = int(Math.max(970,stage.stageWidth));
         this.playerInfo.x = 15;
         this.playerInfo.width = _loc2_ - this.buttonBar.width + 13 - this.playerInfo.x - 10;
         this.buttonBar.x = _loc2_ - this.buttonBar.width - 4;
         this.rankIcon.init(premiumService.hasPremium(),userPropertiesService.rank);
         this.alignRankIcon();
      }
      
      private function alignRankIcon() : void
      {
         this.rankIcon.y = 29 - (this.rankIcon.height >> 1);
         this.rankIcon.x = 38 - (this.rankIcon.width >> 1);
      }
   }
}

