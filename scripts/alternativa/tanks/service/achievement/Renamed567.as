package alternativa.tanks.service.achievement
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.help.achievements.BattleFightButtonHelper;
   import alternativa.tanks.help.achievements.BattleStartButtonHelper;
   import alternativa.tanks.help.achievements.DonateButtonHelper;
   import alternativa.tanks.help.achievements.FirstBattleCreateHelper;
   import alternativa.tanks.help.achievements.FirstBattleFightHelper;
   import alternativa.tanks.help.achievements.FirstDonateHelper;
   import alternativa.tanks.help.achievements.FirstPurchaseHelper;
   import alternativa.tanks.help.achievements.InviteFriendHelper;
   import alternativa.tanks.help.achievements.PurchaseButtonHelper;
   import alternativa.tanks.help.achievements.SetEmailHelper;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed567 implements IAchievementService
   {
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      private static const Renamed3609:Class = Renamed3610;
      
      private static const present:BitmapData = (new Renamed3609() as Bitmap).bitmapData;
      
      private const HELPER_GROUP_KEY:String = "GarageModel";
      
      private var battle:FirstBattleCreateHelper;
      
      private var Renamed3611:BattleStartButtonHelper;
      
      private var Renamed3612:FirstBattleFightHelper;
      
      private var Renamed3613:BattleFightButtonHelper;
      
      private var Renamed3614:FirstDonateHelper;
      
      private var Renamed3615:DonateButtonHelper;
      
      private var Renamed3616:FirstPurchaseHelper;
      
      private var Renamed3617:PurchaseButtonHelper;
      
      private var friend:InviteFriendHelper;
      
      private var email:SetEmailHelper;
      
      private var Renamed3618:Vector.<Renamed2072>;
      
      private var Renamed3619:int = 0;
      
      private var inBattle:Boolean;
      
      private var Renamed3620:Boolean = false;
      
      private var Renamed3621:Boolean = true;
      
      public function Renamed567()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.battle = new FirstBattleCreateHelper();
         this.Renamed3611 = new BattleStartButtonHelper();
         this.Renamed3612 = new FirstBattleFightHelper();
         this.Renamed3613 = new BattleFightButtonHelper();
         this.Renamed3614 = new FirstDonateHelper();
         this.Renamed3615 = new DonateButtonHelper();
         this.Renamed3616 = new FirstPurchaseHelper();
         this.Renamed3617 = new PurchaseButtonHelper();
         this.friend = new InviteFriendHelper();
         this.email = new SetEmailHelper();
         var _loc1_:IHelpService = IHelpService(OSGi.getInstance().getService(IHelpService));
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,800,this.battle,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,802,this.Renamed3612,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,803,this.Renamed3613,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,804,this.Renamed3614,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,805,this.Renamed3615,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,806,this.Renamed3616,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,807,this.Renamed3617,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,808,this.friend,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,809,this.email,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,811,this.Renamed3611,false);
         this.Renamed3618 = new Vector.<Renamed2072>();
      }
      
      public function Renamed2075(param1:Vector.<Renamed2072>) : void
      {
         this.Renamed3618 = new Vector.<Renamed2072>();
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1[_loc3_] != Renamed2072.FIRST_REFERRAL)
            {
               this.Renamed3618.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         if(this.Renamed3618.length != 0)
         {
            this.Renamed3622();
            this.alignHelpers();
            display.stage.addEventListener(Event.RESIZE,this.alignHelpers);
         }
      }
      
      public function setPanelPartition(param1:int) : void
      {
         this.Renamed3619 = param1;
         this.inBattle = false;
         this.Renamed3622();
         this.alignHelpers();
      }
      
      public function setGarageBuyButtonTargetPoint(param1:Point) : void
      {
         this.Renamed3617.targetPoint = param1;
         this.Renamed3622();
         this.alignHelpers();
      }
      
      public function setBattleStartButtonTargetPoint(param1:Point) : void
      {
         this.Renamed3613.targetPoint = param1;
         this.Renamed3622();
         this.alignHelpers();
      }
      
      public function setPaymentResumeButtonTargetPoint(param1:Point) : void
      {
         this.Renamed3615.targetPoint = param1;
         this.Renamed3622();
         this.alignHelpers();
      }
      
      public function hideAllBubbles(param1:Boolean) : void
      {
         var _loc2_:int = 800;
         while(_loc2_ < 812)
         {
            helpService.hideHelper(this.HELPER_GROUP_KEY,_loc2_);
            _loc2_++;
         }
         helpService.hideHelp();
         this.inBattle = param1;
      }
      
      public function showStartButtonHelper() : void
      {
         this.Renamed3620 = true;
         this.Renamed3622();
      }
      
      public function hideStartButtonHelper() : void
      {
         this.Renamed3620 = false;
         this.Renamed3622();
      }
      
      public function privateAchievementBubbleIsNotNeededAnymore() : void
      {
         this.Renamed3621 = false;
      }
      
      public function completeAchievement(param1:Renamed2072, param2:String, param3:int) : void
      {
         if(this.Renamed3618.indexOf(param1) != -1)
         {
            this.Renamed3618.splice(this.Renamed3618.indexOf(param1),1);
         }
         this.hideAllBubbles(this.inBattle);
         var _loc4_:CongratulationsWindowPresent = new CongratulationsWindowPresent(present,null,param2);
      }
      
      public function activateAchievement(param1:Renamed2072) : void
      {
         if(!(param1 == Renamed2072.FIRST_REFERRAL && partnersService.isRunningInsidePartnerEnvironment()))
         {
            this.Renamed3618.push(param1);
         }
         this.Renamed3622();
         this.alignHelpers();
      }
      
      private function Renamed3622() : void
      {
         var _loc1_:Renamed2072 = null;
         if(this.inBattle)
         {
            return;
         }
         var _loc2_:int = 800;
         while(_loc2_ < 812)
         {
            helpService.hideHelper(this.HELPER_GROUP_KEY,_loc2_);
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed3618.length)
         {
            _loc1_ = this.Renamed3618[_loc3_];
            switch(_loc1_)
            {
               case Renamed2072.FIRST_PURCHASE:
                  if(this.Renamed3619 == 1 && this.Renamed3617.targetPoint.x != 0)
                  {
                     helpService.showHelper(this.HELPER_GROUP_KEY,807,true);
                  }
                  break;
               case Renamed2072.FIGHT_FIRST_BATTLE:
                  if(this.Renamed3619 != 0)
                  {
                     helpService.showHelperIfAble(this.HELPER_GROUP_KEY,802,true);
                  }
                  break;
               case Renamed2072.FIRST_DONATE:
                  if(lobbyLayoutService.getCurrentState() == LayoutState.PAYMENT && this.Renamed3615.targetPoint.x > 0)
                  {
                     helpService.showHelper(this.HELPER_GROUP_KEY,805,true);
                  }
                  else if(lobbyLayoutService.getCurrentState() == LayoutState.GARAGE)
                  {
                     helpService.showHelperIfAble(this.HELPER_GROUP_KEY,804,true);
                  }
                  break;
               case Renamed2072.FIRST_REFERRAL:
                  helpService.showHelper(this.HELPER_GROUP_KEY,808,true);
                  break;
               case Renamed2072.SET_EMAIL:
                  helpService.showHelper(this.HELPER_GROUP_KEY,809,true);
                  break;
            }
            _loc3_++;
         }
      }
      
      private function alignHelpers(param1:Event = null) : void
      {
         var _loc2_:int = int(Math.max(970,display.stage.stageWidth));
         var _loc3_:int = int(Math.max(580,display.stage.stageHeight));
         this.battle.targetPoint = new Point(_loc2_ - 295,30);
         this.Renamed3611.targetPoint = new Point(_loc2_ - 35,_loc3_ - 30);
         this.Renamed3612.targetPoint = new Point(_loc2_ - 292,30);
         this.Renamed3614.targetPoint = new Point(_loc2_ - (panelView.Renamed2160().buttonBar.Renamed2162() ? 550 : 400),30);
         this.Renamed3616.targetPoint = new Point(_loc2_ - 320 + 90,30);
         this.friend.targetPoint = new Point(_loc2_ - 130,30);
         this.email.targetPoint = new Point(_loc2_ - 110,30);
      }
      
      public function Renamed3607() : void
      {
         this.Renamed3615.visible = true;
      }
      
      public function Renamed3608() : void
      {
         this.Renamed3615.visible = false;
      }
   }
}

