package alternativa.tanks.model.userproperties
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.panel.IPanelView;
   import controls.PlayerInfo;
   import controls.panel.UpdateRankNotice;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import forms.MainPanel;
   import projects.tanks.client.panel.model.profile.userproperty.IUserPropertyModelBase;
   import projects.tanks.client.panel.model.profile.userproperty.UserPropertyModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class UserPropertiesModel extends UserPropertyModelBase implements IUserPropertyModelBase, IUserProperties
   {
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      private var CHANNEL:String = "UserPropertiesModel";
      
      private var _id:String;
      
      private var _name:String;
      
      private var _score:int;
      
      private var _rank:int;
      
      private var _nextScore:int;
      
      private var _startRating:Number;
      
      private var _place:int;
      
      private var _hasDoubleCrystal:Boolean;
      
      private var _currentRankScore:int;
      
      public function UserPropertiesModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this._startRating = getInitParam().rating;
         userPropertiesService.init(getInitParam().id,getInitParam().uid,getInitParam().score,getInitParam().rank,getInitParam().serverNumber,getInitParam().templateBattlePage,getInitParam().gameHost,getInitParam().userProfileUrl);
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:Timer = null;
         this._id = getInitParam().id;
         this._name = getInitParam().uid;
         this._nextScore = getInitParam().nextRankScore;
         this._score = getInitParam().score;
         this._currentRankScore = getInitParam().currentRankScore;
         this._rank = getInitParam().rank;
         this._startRating = getInitParam().rating;
         this._place = getInitParam().place;
         this._hasDoubleCrystal = getInitParam().hasDoubleCrystal;
         this.setHasDoubleCrystal(this._hasDoubleCrystal);
         this.updateRatingAndPlace(this._startRating,this._place);
         var _loc2_:MainPanel = panelView.§+#,§();
         _loc2_.rang = this._rank;
         this.updateScore(this._score);
         _loc2_.playerInfo.playerName = this._name;
         moneyService.init(getInitParam().crystals);
         if(this._hasDoubleCrystal)
         {
            _loc1_ = new Timer(getInitParam().durationCrystalAbonement);
            _loc1_.addEventListener(TimerEvent.TIMER,this.onTimer);
            _loc1_.start();
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         OSGi.clientLog.log(this.CHANNEL,"UserPropertiesModel onTimer");
         this.setHasDoubleCrystal(false);
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function updateScore(param1:int) : void
      {
         var _loc2_:int = this._score;
         this._score = param1;
         panelView.§+#,§().playerInfo.updateScore(param1,this._nextScore);
         this.updateProgress();
         if(param1 != _loc2_)
         {
            userPropertiesService.updateScore(param1);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:int = this._rank;
         this._rank = param1;
         this._score = param2;
         this._nextScore = param4;
         this._currentRankScore = param3;
         var _loc7_:MainPanel;
         (_loc7_ = panelView.§+#,§()).rang = param1;
         _loc7_.playerInfo.updateScore(this._score,param4);
         display.systemUILayer.addChild(new UpdateRankNotice(param1,param5));
         helpService.hideAllHelpers();
         this.updateProgress();
         if(param1 != _loc6_)
         {
            userPropertiesService.updateRank(param1);
         }
      }
      
      private function updateProgress() : void
      {
         var _loc1_:int = 0;
         if(this._nextScore != 0)
         {
            _loc1_ = (this._score - this._currentRankScore) / (this._nextScore - this._currentRankScore) * 10000;
         }
         else
         {
            _loc1_ = 10000;
         }
         panelView.§+#,§().playerInfo.progress = _loc1_;
      }
      
      public function updateRatingAndPlace(param1:Number, param2:int) : void
      {
         this._place = param2;
         var _loc3_:PlayerInfo = panelView.§+#,§().playerInfo;
         if(this._startRating < param1)
         {
            _loc3_.ratingChange = 1;
         }
         else if(this._startRating > param1)
         {
            _loc3_.ratingChange = -1;
         }
         else
         {
            _loc3_.ratingChange = 0;
         }
         _loc3_.rating = param1;
         _loc3_.position = this._place + 1;
      }
      
      public function getId() : String
      {
         return this._id;
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      public function getScore() : int
      {
         return this._score;
      }
      
      public function getRank() : int
      {
         return this._rank;
      }
      
      public function getNextScore() : int
      {
         return this._nextScore;
      }
      
      public function getPlace() : int
      {
         return this._place;
      }
      
      public function getHasDoubleCrystal() : Boolean
      {
         return this._hasDoubleCrystal;
      }
      
      public function setHasDoubleCrystal(param1:Boolean) : void
      {
         this._hasDoubleCrystal = param1;
         panelView.§+#,§().hasDoubleCrystal = param1;
      }
      
      public function changeCrystal(param1:int) : void
      {
         moneyService.§class catch§(param1);
      }
      
      public function updateUid(param1:String) : void
      {
         this._name = param1;
         this._id = param1;
         panelView.§+#,§().playerInfo.playerName = param1;
      }
   }
}

