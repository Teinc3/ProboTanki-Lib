package alternativa.tanks.model.shop
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.bugreport.PaymentBugReportBlock;
   import alternativa.tanks.model.shop.items.crystallitem.CrystalPackageItem;
   import alternativa.tanks.model.shop.items.premuimitem.PremiumPackageItem;
   import Renamed315.Renamed2234;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import Renamed401.Renamed2219;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import Renamed430.Renamed2235;
   
   public class ShopWindow extends DialogWindow
   {
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public static const WINDOW_PADDING:int = 11;
      
      public static const WINDOW_WIDTH:int = 915;
      
      private static const Renamed2236:int = 691;
      
      private static const Renamed2237:int = 580;
      
      public static const SPACE_MODULE:int = 7;
      
      public static var haveDoubleCrystalls:Boolean = false;
      
      public var Renamed2238:int;
      
      private var window:TankWindow;
      
      private var bugReportBlock:PaymentBugReportBlock;
      
      public var header:Renamed2239;
      
      private var Renamed2240:Renamed2234;
      
      private var closeButton:DefaultButtonBase;
      
      public function ShopWindow()
      {
         this.window = new TankWindow();
         this.header = new Renamed2239();
         super();
         addChild(this.window);
         this.window.width = WINDOW_WIDTH;
         this.window.height = 691;
         this.header.x = WINDOW_PADDING;
         this.header.y = WINDOW_PADDING;
         this.header.resize(WINDOW_WIDTH - WINDOW_PADDING * 2);
         this.closeButton = new DefaultButtonBase();
         this.closeButton.tabEnabled = false;
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeButton.x = this.window.width - this.closeButton.width - 2 * WINDOW_PADDING;
         this.closeButton.y = this.window.height - this.closeButton.height - WINDOW_PADDING;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onClickClose);
         addChild(this.closeButton);
         this.bugReportBlock = new PaymentBugReportBlock();
         this.bugReportBlock.x = WINDOW_PADDING;
         this.bugReportBlock.y = this.closeButton.y - WINDOW_PADDING - this.bugReportBlock.height;
         this.bugReportBlock.width = this.window.width - WINDOW_PADDING - this.bugReportBlock.x;
         addChild(this.bugReportBlock);
         this.header.addEventListener(Event.CLOSE,this.onClickClose);
         addChild(this.header);
         this.Renamed2238 = numChildren;
         display.stage.addEventListener(Event.RESIZE,this.render);
         this.render();
         dialogService.addDialog(this);
      }
      
      public function render(param1:Event = null) : void
      {
         this.window.height = Math.round(Math.max(Renamed2237,Math.min(display.stage.stageHeight - 60,Renamed2236)));
         this.closeButton.y = this.window.height - this.closeButton.height - WINDOW_PADDING;
         this.bugReportBlock.y = this.closeButton.y - this.bugReportBlock.height - 3;
         this.bugReportBlock.width = WINDOW_WIDTH - WINDOW_PADDING - this.bugReportBlock.x;
         if(this.Renamed2240)
         {
            this.Renamed2240.x = WINDOW_PADDING;
            this.Renamed2240.y = this.header.y + this.header.height;
            this.Renamed2240.render(WINDOW_WIDTH - WINDOW_PADDING * 2,this.bugReportBlock.y - this.Renamed2240.y - 3);
         }
      }
      
      public function Renamed2224(param1:Renamed2234) : void
      {
         if(Boolean(this.Renamed2240) && contains(this.Renamed2240))
         {
            removeChild(this.Renamed2240);
            this.Renamed2240.destroy();
         }
         this.Renamed2240 = param1;
         this.Renamed2240.window = this;
         addChildAt(this.Renamed2240,this.Renamed2238 - 1);
         this.render();
         this.Renamed2240.Renamed2241();
      }
      
      private function onClickClose(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function addItem(param1:String, param2:String, param3:Object, param4:Renamed2219) : void
      {
         if(param2.indexOf("crystal") >= 0)
         {
            param4.addItem(new CrystalPackageItem(param2,param3),param1);
         }
         else if(param2.indexOf("premium") >= 0)
         {
            param4.addItem(new PremiumPackageItem(param2,param3),param1);
         }
         else
         {
            param4.addItem(new Renamed2235(param2),param1);
         }
         param4.render(this.window.width - WINDOW_PADDING * 2,this.bugReportBlock.y - param4.y - WINDOW_PADDING);
      }
   }
}

