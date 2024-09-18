package alternativa.tanks.model.shop
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.bugreport.PaymentBugReportBlock;
   import alternativa.tanks.model.shop.items.crystallitem.CrystalPackageItem;
   import alternativa.tanks.model.shop.items.premuimitem.PremiumPackageItem;
   import §break set null§.§each for each§;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import §native const with§.§each for case§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import §super package switch§.§<!3§;
   
   public class ShopWindow extends DialogWindow
   {
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public static const WINDOW_PADDING:int = 11;
      
      public static const WINDOW_WIDTH:int = 915;
      
      private static const §[!g§:int = 691;
      
      private static const § !C§:int = 580;
      
      public static const SPACE_MODULE:int = 7;
      
      public static var haveDoubleCrystalls:Boolean = false;
      
      public var §2"V§:int;
      
      private var window:TankWindow;
      
      private var bugReportBlock:PaymentBugReportBlock;
      
      public var header:§>"E§;
      
      private var §"#C§:§each for each§;
      
      private var closeButton:DefaultButtonBase;
      
      public function ShopWindow()
      {
         this.window = new TankWindow();
         this.header = new §>"E§();
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
         this.§2"V§ = numChildren;
         display.stage.addEventListener(Event.RESIZE,this.render);
         this.render();
         dialogService.addDialog(this);
      }
      
      public function render(param1:Event = null) : void
      {
         this.window.height = Math.round(Math.max(§ !C§,Math.min(display.stage.stageHeight - 60,§[!g§)));
         this.closeButton.y = this.window.height - this.closeButton.height - WINDOW_PADDING;
         this.bugReportBlock.y = this.closeButton.y - this.bugReportBlock.height - 3;
         this.bugReportBlock.width = WINDOW_WIDTH - WINDOW_PADDING - this.bugReportBlock.x;
         if(this.§"#C§)
         {
            this.§"#C§.x = WINDOW_PADDING;
            this.§"#C§.y = this.header.y + this.header.height;
            this.§"#C§.render(WINDOW_WIDTH - WINDOW_PADDING * 2,this.bugReportBlock.y - this.§"#C§.y - 3);
         }
      }
      
      public function §with set case§(param1:§each for each§) : void
      {
         if(Boolean(this.§"#C§) && contains(this.§"#C§))
         {
            removeChild(this.§"#C§);
            this.§"#C§.destroy();
         }
         this.§"#C§ = param1;
         this.§"#C§.window = this;
         addChildAt(this.§"#C§,this.§2"V§ - 1);
         this.render();
         this.§"#C§.§"j§();
      }
      
      private function onClickClose(param1:Event = null) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function addItem(param1:String, param2:String, param3:Object, param4:§each for case§) : void
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
            param4.addItem(new §<!3§(param2),param1);
         }
         param4.render(this.window.width - WINDOW_PADDING * 2,this.bugReportBlock.y - param4.y - WINDOW_PADDING);
      }
   }
}

