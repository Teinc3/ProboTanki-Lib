package Renamed504
{
   import Renamed225.Renamed5522;
   import Renamed229.Renamed6463;
   import Renamed229.Renamed6465;
   import Renamed4808.Renamed5536;
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
   
   public class Renamed4812 extends DialogWindow implements CountDownTimerOnCompleteAfter
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var Renamed3661:DailyQuestNotifierService;
      
      public static const Renamed9901:int = 280;
      
      public static const Renamed9928:int = 310;
      
      public static const WINDOW_MARGIN:int = 11;
      
      private const Renamed9929:int = 13;
      
      private const Renamed9930:int = 1000;
      
      private var window:TankWindowWithHeader;
      
      private var closeButton:DefaultButtonBase;
      
      private var Renamed9931:Vector.<Renamed9932>;
      
      private var infoLink:LabelBase;
      
      private var Renamed9933:Renamed4813;
      
      private var Renamed9934:CountDownTimer;
      
      private var Renamed9935:Boolean;
      
      private var Renamed9936:Boolean;
      
      public function Renamed4812()
      {
         this.Renamed9931 = new Vector.<Renamed9932>();
         super();
         this.Renamed9937();
         this.Renamed9938();
         this.Renamed1915();
         this.Renamed9939();
      }
      
      private function Renamed9938() : void
      {
         this.Renamed9933 = new Renamed4813();
         this.Renamed9933.x = WINDOW_MARGIN;
         this.Renamed9933.y = WINDOW_MARGIN;
         addChild(this.Renamed9933);
      }
      
      private function Renamed9937() : void
      {
         this.window = TankWindowWithHeader.createWindow(TanksLocale.IMAGE_HEADER_NEWS,Renamed9901 + WINDOW_MARGIN * 2,0);
         addChild(this.window);
      }
      
      private function Renamed1915() : void
      {
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.window.addChild(this.closeButton);
      }
      
      private function Renamed9939() : void
      {
         this.infoLink = new LabelBase();
         this.infoLink.htmlText = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_INFORMATION);
         this.window.addChild(this.infoLink);
      }
      
      public function init(param1:Vector.<Renamed5536>) : void
      {
         Renamed3661.hideNotification();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.Renamed9940(param1[_loc2_],_loc2_);
            _loc2_++;
         }
         this.Renamed9941();
      }
      
      private function Renamed9940(param1:Renamed5536, param2:int) : void
      {
         var _loc3_:Renamed9932 = new Renamed9932(param1);
         _loc3_.addEventListener(Renamed6463.DAILY_QUEST_CHANGE,this.Renamed8313);
         _loc3_.x = Renamed9901 * param2 + WINDOW_MARGIN + int(WINDOW_MARGIN / 2) * param2;
         _loc3_.y = WINDOW_MARGIN + Renamed4813.HEIGHT + WINDOW_MARGIN;
         this.Renamed9931.push(_loc3_);
         this.window.addChild(_loc3_);
      }
      
      private function Renamed8313(param1:Renamed6463) : void
      {
         if(param1.Renamed6464.Renamed5544 || moneyService.Renamed1617(param1.Renamed6464.Renamed5547))
         {
            this.Renamed9935 = false;
            this.Renamed9942();
         }
         else
         {
            this.onCloseButtonClick();
         }
      }
      
      private function Renamed9942() : void
      {
         this.Renamed9943();
         this.Renamed9944();
      }
      
      private function Renamed9944() : void
      {
         this.Renamed9934 = new CountDownTimer();
         this.Renamed9934.addListener(CountDownTimerOnCompleteAfter,this);
         this.Renamed9934.start(getTimer() + this.Renamed9930);
         this.Renamed9936 = true;
      }
      
      private function Renamed9943() : void
      {
         var _loc1_:Renamed9932 = null;
         for each(_loc1_ in this.Renamed9931)
         {
            if(_loc1_.Renamed9945())
            {
               _loc1_.Renamed9946();
            }
         }
      }
      
      public function Renamed8315(param1:Long, param2:Renamed5536) : void
      {
         var _loc3_:Renamed9932 = null;
         for each(_loc3_ in this.Renamed9931)
         {
            if(_loc3_.Renamed9947() == param1)
            {
               _loc3_.Renamed9948(param2);
            }
            if(_loc3_.Renamed9945())
            {
               _loc3_.Renamed9949(param2.Renamed5547);
            }
         }
         this.Renamed9941();
         this.Renamed9935 = true;
         if(!this.Renamed9936)
         {
            this.Renamed9950();
         }
      }
      
      private function Renamed9941() : void
      {
         var _loc1_:int = this.Renamed9951();
         this.Renamed9952(_loc1_);
         this.Renamed9953();
         this.Renamed9954(_loc1_);
      }
      
      private function Renamed9953() : void
      {
         var _loc1_:uint = this.Renamed9931.length;
         this.window.width = _loc1_ * Renamed9901 + WINDOW_MARGIN * 2 + int(WINDOW_MARGIN / 2) * (_loc1_ - 1);
         this.Renamed9955();
      }
      
      private function Renamed9955() : void
      {
         this.closeButton.x = int(this.window.width - this.closeButton.width - WINDOW_MARGIN);
         this.infoLink.x = WINDOW_MARGIN;
      }
      
      private function Renamed9951() : int
      {
         var _loc1_:Renamed9932 = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.Renamed9931)
         {
            _loc2_ = Math.max(_loc2_,_loc1_.Renamed746());
         }
         return _loc2_;
      }
      
      private function Renamed9952(param1:int) : void
      {
         var _loc2_:Renamed9932 = null;
         for each(_loc2_ in this.Renamed9931)
         {
            _loc2_.Renamed9956(param1);
         }
      }
      
      public function Renamed8312() : void
      {
         this.window.width = Renamed9928 + WINDOW_MARGIN * 2;
         this.Renamed9955();
         var _loc1_:Renamed4814 = new Renamed4814();
         _loc1_.x = WINDOW_MARGIN;
         _loc1_.y = WINDOW_MARGIN + Renamed4813.HEIGHT + WINDOW_MARGIN;
         this.window.addChild(_loc1_);
         this.Renamed9954(_loc1_.Renamed746());
         this.Renamed9933.redraw(this.window.width - 2 * WINDOW_MARGIN);
      }
      
      public function Renamed8311(param1:Renamed5522) : void
      {
         this.Renamed9933.init(param1);
         this.Renamed9933.redraw(this.window.width - 2 * WINDOW_MARGIN);
      }
      
      private function Renamed9954(param1:int) : void
      {
         this.window.height = this.Renamed9929 + this.closeButton.height + WINDOW_MARGIN + param1 + WINDOW_MARGIN + Renamed4813.HEIGHT + WINDOW_MARGIN;
         this.closeButton.y = int(this.window.height - this.closeButton.height - WINDOW_MARGIN);
         this.infoLink.y = int(this.window.height - this.infoLink.height - WINDOW_MARGIN);
      }
      
      public function show() : void
      {
         dialogService.enqueueDialog(this);
      }
      
      public function takePrize(param1:Long) : void
      {
         this.Renamed9957(param1);
         if(this.Renamed9931.length > 0)
         {
            this.Renamed9958();
            this.Renamed9941();
         }
         else
         {
            this.Renamed8312();
         }
         this.Renamed9933.Renamed9959(this.window.width - 2 * WINDOW_MARGIN);
         dialogService.centerDialog(this);
      }
      
      private function Renamed9957(param1:Long) : void
      {
         var _loc2_:Renamed9932 = null;
         for each(_loc2_ in this.Renamed9931)
         {
            if(_loc2_.Renamed9947() == param1)
            {
               this.Renamed9960(_loc2_);
               this.window.removeChild(_loc2_);
               this.Renamed9931.splice(this.Renamed9931.indexOf(_loc2_),1);
               break;
            }
         }
      }
      
      private function Renamed9958() : void
      {
         var _loc1_:Renamed9932 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed9931.length)
         {
            _loc1_ = this.Renamed9931[_loc2_];
            _loc1_.x = Renamed9901 * _loc2_ + WINDOW_MARGIN + int(WINDOW_MARGIN / 2) * _loc2_;
            _loc2_++;
         }
      }
      
      private function onCloseButtonClick(param1:MouseEvent = null) : void
      {
         this.removeListeners();
         this.Renamed9961();
         dispatchEvent(new Renamed6465(Renamed6465.Renamed6466));
         dialogService.removeDialog(this);
      }
      
      private function removeListeners() : void
      {
         var _loc1_:Renamed9932 = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         for each(_loc1_ in this.Renamed9931)
         {
            this.Renamed9960(_loc1_);
         }
      }
      
      private function Renamed9960(param1:Renamed9932) : void
      {
         param1.removeEventListener(Renamed6463.DAILY_QUEST_CHANGE,this.Renamed8313);
         if(param1.Renamed9945())
         {
            param1.Renamed9962();
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
         this.Renamed9961();
         if(this.Renamed9935)
         {
            this.Renamed9950();
         }
      }
      
      private function Renamed9961() : void
      {
         if(this.Renamed9934 != null)
         {
            this.Renamed9934.removeListener(CountDownTimerOnCompleteAfter,this);
            this.Renamed9934.destroy();
            this.Renamed9936 = false;
         }
      }
      
      private function Renamed9950() : void
      {
         var _loc1_:Renamed9932 = null;
         for each(_loc1_ in this.Renamed9931)
         {
            if(_loc1_.Renamed9945())
            {
               _loc1_.Renamed9963();
            }
         }
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
   }
}

