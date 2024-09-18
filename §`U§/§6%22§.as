package §`U§
{
   import §0#W§.§&h§;
   import §1!-§.§case var super§;
   import §1!-§.§var const override§;
   import §>#m§.§5!"§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.types.Long;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteAfter;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import forms.TankWindowWithHeader;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class §6"§ extends DialogWindow implements CountDownTimerOnCompleteAfter
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var §2!M§:DailyQuestNotifierService;
      
      public static const §in const do§:int = 280;
      
      public static const §in set for§:int = 310;
      
      public static const WINDOW_MARGIN:int = 11;
      
      private const §final var finally§:int = 13;
      
      private const §var set set§:int = 1000;
      
      private var window:TankWindowWithHeader;
      
      private var closeButton:DefaultButtonBase;
      
      private var §use get§:Vector.<§break§>;
      
      private var infoLink:LabelBase;
      
      private var §!#'§:§else catch null§;
      
      private var §!!x§:CountDownTimer;
      
      private var §?!;§:Boolean;
      
      private var §2# §:Boolean;
      
      public function §6"§()
      {
         this.§use get§ = new Vector.<§break§>();
         super();
         this.§return const default§();
         this.§[#F§();
         this.§;!6§();
         this.§?"l§();
      }
      
      private function §[#F§() : void
      {
         this.§!#'§ = new §else catch null§();
         this.§!#'§.x = WINDOW_MARGIN;
         this.§!#'§.y = WINDOW_MARGIN;
         addChild(this.§!#'§);
      }
      
      private function §return const default§() : void
      {
         this.window = TankWindowWithHeader.createWindow(TanksLocale.IMAGE_HEADER_NEWS,§in const do§ + WINDOW_MARGIN * 2,0);
         addChild(this.window);
      }
      
      private function §;!6§() : void
      {
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.window.addChild(this.closeButton);
      }
      
      private function §?"l§() : void
      {
         this.infoLink = new LabelBase();
         this.infoLink.htmlText = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_INFORMATION);
         this.window.addChild(this.infoLink);
      }
      
      public function init(param1:Vector.<§5!"§>) : void
      {
         §2!M§.hideNotification();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.§%"c§(param1[_loc2_],_loc2_);
            _loc2_++;
         }
         this.§!#R§();
      }
      
      private function §%"c§(param1:§5!"§, param2:int) : void
      {
         var _loc3_:§break§ = new §break§(param1);
         _loc3_.addEventListener(§case var super§.DAILY_QUEST_CHANGE,this.§package default§);
         _loc3_.x = §in const do§ * param2 + WINDOW_MARGIN + int(WINDOW_MARGIN / 2) * param2;
         _loc3_.y = WINDOW_MARGIN + §else catch null§.HEIGHT + WINDOW_MARGIN;
         this.§use get§.push(_loc3_);
         this.window.addChild(_loc3_);
      }
      
      private function §package default§(param1:§case var super§) : void
      {
         if(param1.§7![§.§6#J§ || moneyService.§while package dynamic§(param1.§7![§.§6#6§))
         {
            this.§?!;§ = false;
            this.§<"N§();
         }
         else
         {
            this.onCloseButtonClick();
         }
      }
      
      private function §<"N§() : void
      {
         this.§true package true§();
         this.§4!z§();
      }
      
      private function §4!z§() : void
      {
         this.§!!x§ = new CountDownTimer();
         this.§!!x§.addListener(CountDownTimerOnCompleteAfter,this);
         this.§!!x§.start(getTimer() + this.§var set set§);
         this.§2# § = true;
      }
      
      private function §true package true§() : void
      {
         var _loc1_:§break§ = null;
         for each(_loc1_ in this.§use get§)
         {
            if(_loc1_.§'#'§())
            {
               _loc1_.§5"X§();
            }
         }
      }
      
      public function §dynamic set switch§(param1:Long, param2:§5!"§) : void
      {
         var _loc3_:§break§ = null;
         for each(_loc3_ in this.§use get§)
         {
            if(_loc3_.§package package const§() == param1)
            {
               _loc3_.§`#e§(param2);
            }
            if(_loc3_.§'#'§())
            {
               _loc3_.§static break§(param2.§6#6§);
            }
         }
         this.§!#R§();
         this.§?!;§ = true;
         if(!this.§2# §)
         {
            this.§if package break§();
         }
      }
      
      private function §!#R§() : void
      {
         var _loc1_:int = this.§^"9§();
         this.§90§(_loc1_);
         this.§for const final§();
         this.§if for true§(_loc1_);
      }
      
      private function §for const final§() : void
      {
         var _loc1_:uint = this.§use get§.length;
         this.window.width = _loc1_ * §in const do§ + WINDOW_MARGIN * 2 + int(WINDOW_MARGIN / 2) * (_loc1_ - 1);
         this.§do catch super§();
      }
      
      private function §do catch super§() : void
      {
         this.closeButton.x = int(this.window.width - this.closeButton.width - WINDOW_MARGIN);
         this.infoLink.x = WINDOW_MARGIN;
      }
      
      private function §^"9§() : int
      {
         var _loc1_:§break§ = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.§use get§)
         {
            _loc2_ = Math.max(_loc2_,_loc1_.§case catch break§());
         }
         return _loc2_;
      }
      
      private function §90§(param1:int) : void
      {
         var _loc2_:§break§ = null;
         for each(_loc2_ in this.§use get§)
         {
            _loc2_.§return set include§(param1);
         }
      }
      
      public function §return set for§() : void
      {
         this.window.width = §in set for§ + WINDOW_MARGIN * 2;
         this.§do catch super§();
         var _loc1_:§use set extends§ = new §use set extends§();
         _loc1_.x = WINDOW_MARGIN;
         _loc1_.y = WINDOW_MARGIN + §else catch null§.HEIGHT + WINDOW_MARGIN;
         this.window.addChild(_loc1_);
         this.§if for true§(_loc1_.§case catch break§());
         this.§!#'§.redraw(this.window.width - 2 * WINDOW_MARGIN);
      }
      
      public function §override for dynamic§(param1:§&h§) : void
      {
         this.§!#'§.init(param1);
         this.§!#'§.redraw(this.window.width - 2 * WINDOW_MARGIN);
      }
      
      private function §if for true§(param1:int) : void
      {
         this.window.height = this.§final var finally§ + this.closeButton.height + WINDOW_MARGIN + param1 + WINDOW_MARGIN + §else catch null§.HEIGHT + WINDOW_MARGIN;
         this.closeButton.y = int(this.window.height - this.closeButton.height - WINDOW_MARGIN);
         this.infoLink.y = int(this.window.height - this.infoLink.height - WINDOW_MARGIN);
      }
      
      public function show() : void
      {
         dialogService.enqueueDialog(this);
      }
      
      public function takePrize(param1:Long) : void
      {
         this.§9!§(param1);
         if(this.§use get§.length > 0)
         {
            this.§]!x§();
            this.§!#R§();
         }
         else
         {
            this.§return set for§();
         }
         this.§!#'§.§;U§(this.window.width - 2 * WINDOW_MARGIN);
         dialogService.centerDialog(this);
      }
      
      private function §9!§(param1:Long) : void
      {
         var _loc2_:§break§ = null;
         for each(_loc2_ in this.§use get§)
         {
            if(_loc2_.§package package const§() == param1)
            {
               this.§1+§(_loc2_);
               this.window.removeChild(_loc2_);
               this.§use get§.splice(this.§use get§.indexOf(_loc2_),1);
               break;
            }
         }
      }
      
      private function §]!x§() : void
      {
         var _loc1_:§break§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§use get§.length)
         {
            _loc1_ = this.§use get§[_loc2_];
            _loc1_.x = §in const do§ * _loc2_ + WINDOW_MARGIN + int(WINDOW_MARGIN / 2) * _loc2_;
            _loc2_++;
         }
      }
      
      private function onCloseButtonClick(param1:MouseEvent = null) : void
      {
         this.removeListeners();
         this.§final package function§();
         dispatchEvent(new §var const override§(§var const override§.§76§));
         dialogService.removeDialog(this);
      }
      
      private function removeListeners() : void
      {
         var _loc1_:§break§ = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         for each(_loc1_ in this.§use get§)
         {
            this.§1+§(_loc1_);
         }
      }
      
      private function §1+§(param1:§break§) : void
      {
         param1.removeEventListener(§case var super§.DAILY_QUEST_CHANGE,this.§package default§);
         if(param1.§'#'§())
         {
            param1.§function for try§();
         }
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
      
      public function onCompleteAfter(param1:CountDownTimer, param2:Boolean) : void
      {
         this.§final package function§();
         if(this.§?!;§)
         {
            this.§if package break§();
         }
      }
      
      private function §final package function§() : void
      {
         if(this.§!!x§ != null)
         {
            this.§!!x§.removeListener(CountDownTimerOnCompleteAfter,this);
            this.§!!x§.destroy();
            this.§2# § = false;
         }
      }
      
      private function §if package break§() : void
      {
         var _loc1_:§break§ = null;
         for each(_loc1_ in this.§use get§)
         {
            if(_loc1_.§'#'§())
            {
               _loc1_.§8!F§();
            }
         }
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
   }
}

