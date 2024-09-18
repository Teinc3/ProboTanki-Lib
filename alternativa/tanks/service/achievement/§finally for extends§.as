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
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §finally for extends§ implements IAchievementService
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
      
      private static const §use var in§:Class = §package const switch§;
      
      private static const present:BitmapData = (new §use var in§() as Bitmap).bitmapData;
      
      private const HELPER_GROUP_KEY:String = "GarageModel";
      
      private var battle:FirstBattleCreateHelper;
      
      private var §&#t§:BattleStartButtonHelper;
      
      private var §?!?§:FirstBattleFightHelper;
      
      private var §#"&§:BattleFightButtonHelper;
      
      private var §switch catch var§:FirstDonateHelper;
      
      private var §while const final§:DonateButtonHelper;
      
      private var §<O§:FirstPurchaseHelper;
      
      private var §&"J§:PurchaseButtonHelper;
      
      private var friend:InviteFriendHelper;
      
      private var email:SetEmailHelper;
      
      private var §'!x§:Vector.<§null package extends§>;
      
      private var §finally var break§:int = 0;
      
      private var inBattle:Boolean;
      
      private var §function catch var§:Boolean = false;
      
      private var §set throw§:Boolean = true;
      
      public function §finally for extends§()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.battle = new FirstBattleCreateHelper();
         this.§&#t§ = new BattleStartButtonHelper();
         this.§?!?§ = new FirstBattleFightHelper();
         this.§#"&§ = new BattleFightButtonHelper();
         this.§switch catch var§ = new FirstDonateHelper();
         this.§while const final§ = new DonateButtonHelper();
         this.§<O§ = new FirstPurchaseHelper();
         this.§&"J§ = new PurchaseButtonHelper();
         this.friend = new InviteFriendHelper();
         this.email = new SetEmailHelper();
         var _loc1_:IHelpService = IHelpService(OSGi.getInstance().getService(IHelpService));
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,800,this.battle,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,802,this.§?!?§,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,803,this.§#"&§,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,804,this.§switch catch var§,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,805,this.§while const final§,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,806,this.§<O§,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,807,this.§&"J§,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,808,this.friend,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,809,this.email,false);
         _loc1_.registerHelper(this.HELPER_GROUP_KEY,811,this.§&#t§,false);
         this.§'!x§ = new Vector.<§null package extends§>();
      }
      
      public function §get const import§(param1:Vector.<§null package extends§>) : void
      {
         this.§'!x§ = new Vector.<§null package extends§>();
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1[_loc3_] != §null package extends§.FIRST_REFERRAL)
            {
               this.§'!x§.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         if(this.§'!x§.length != 0)
         {
            this.§]8§();
            this.alignHelpers();
            display.stage.addEventListener(Event.RESIZE,this.alignHelpers);
         }
      }
      
      public function setPanelPartition(param1:int) : void
      {
         this.§finally var break§ = param1;
         this.inBattle = false;
         this.§]8§();
         this.alignHelpers();
      }
      
      public function setGarageBuyButtonTargetPoint(param1:Point) : void
      {
         this.§&"J§.targetPoint = param1;
         this.§]8§();
         this.alignHelpers();
      }
      
      public function setBattleStartButtonTargetPoint(param1:Point) : void
      {
         this.§#"&§.targetPoint = param1;
         this.§]8§();
         this.alignHelpers();
      }
      
      public function setPaymentResumeButtonTargetPoint(param1:Point) : void
      {
         this.§while const final§.targetPoint = param1;
         this.§]8§();
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
         this.§function catch var§ = true;
         this.§]8§();
      }
      
      public function hideStartButtonHelper() : void
      {
         this.§function catch var§ = false;
         this.§]8§();
      }
      
      public function privateAchievementBubbleIsNotNeededAnymore() : void
      {
         this.§set throw§ = false;
      }
      
      public function completeAchievement(param1:§null package extends§, param2:String, param3:int) : void
      {
         if(this.§'!x§.indexOf(param1) != -1)
         {
            this.§'!x§.splice(this.§'!x§.indexOf(param1),1);
         }
         this.hideAllBubbles(this.inBattle);
         var _loc4_:CongratulationsWindowPresent = new CongratulationsWindowPresent(present,null,param2);
      }
      
      public function activateAchievement(param1:§null package extends§) : void
      {
         if(!(param1 == §null package extends§.FIRST_REFERRAL && partnersService.isRunningInsidePartnerEnvironment()))
         {
            this.§'!x§.push(param1);
         }
         this.§]8§();
         this.alignHelpers();
      }
      
      private function §]8§() : void
      {
         var _loc1_:§null package extends§ = null;
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
         while(_loc3_ < this.§'!x§.length)
         {
            _loc1_ = this.§'!x§[_loc3_];
            switch(_loc1_)
            {
               case §null package extends§.FIRST_PURCHASE:
                  if(this.§finally var break§ == 1 && this.§&"J§.targetPoint.x != 0)
                  {
                     helpService.showHelper(this.HELPER_GROUP_KEY,807,true);
                  }
                  break;
               case §null package extends§.FIGHT_FIRST_BATTLE:
                  if(this.§finally var break§ != 0)
                  {
                     helpService.showHelperIfAble(this.HELPER_GROUP_KEY,802,true);
                  }
                  break;
               case §null package extends§.FIRST_DONATE:
                  if(lobbyLayoutService.getCurrentState() == LayoutState.PAYMENT && this.§while const final§.targetPoint.x > 0)
                  {
                     helpService.showHelper(this.HELPER_GROUP_KEY,805,true);
                  }
                  else if(lobbyLayoutService.getCurrentState() == LayoutState.GARAGE)
                  {
                     helpService.showHelperIfAble(this.HELPER_GROUP_KEY,804,true);
                  }
                  break;
               case §null package extends§.FIRST_REFERRAL:
                  helpService.showHelper(this.HELPER_GROUP_KEY,808,true);
                  break;
               case §null package extends§.SET_EMAIL:
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
         this.§&#t§.targetPoint = new Point(_loc2_ - 35,_loc3_ - 30);
         this.§?!?§.targetPoint = new Point(_loc2_ - 292,30);
         this.§switch catch var§.targetPoint = new Point(_loc2_ - (panelView.§+#,§().buttonBar.§!#T§() ? 550 : 400),30);
         this.§<O§.targetPoint = new Point(_loc2_ - 320 + 90,30);
         this.friend.targetPoint = new Point(_loc2_ - 130,30);
         this.email.targetPoint = new Point(_loc2_ - 110,30);
      }
      
      public function §finally for true§() : void
      {
         this.§while const final§.visible = true;
      }
      
      public function §3%§() : void
      {
         this.§while const final§.visible = false;
      }
   }
}

