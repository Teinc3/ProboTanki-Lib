package alternativa.tanks.model.donationalert
{
   import Renamed2081.Renamed2082;
   import Renamed2081.Renamed2083;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.ThanksForPurchaseWindow;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.types.Long;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   
   public class DonationAlertModel extends Renamed2082 implements Renamed2083
   {
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "payment";
      
      private var donation:int = 0;
      
      private var bonusCrystals:int = 0;
      
      private var packageBonusCrystals:int = 0;
      
      private var window:ThanksForPurchaseWindow = null;
      
      private var time:Long = null;
      
      private var confirmTime:Long;
      
      private var remFrames:int;
      
      private var image:BitmapData;
      
      public function DonationAlertModel()
      {
         super();
      }
      
      public function showDonationAlert(param1:Long, param2:int, param3:int, param4:int, param5:ImageResource) : void
      {
         if(this.window == null)
         {
            this.image = param5.data;
            this.window = new ThanksForPurchaseWindow(param5.data,param2,param3,param4);
            this.confirmTime = param1;
            this.show();
         }
         else
         {
            this.donation += param2;
            this.bonusCrystals += param4;
            this.packageBonusCrystals += param3;
            if(this.time == null || this.compareTime(this.time,param1) < 0)
            {
               this.time = param1;
            }
         }
      }
      
      private function onResize(param1:Event) : void
      {
         this.window.x = Math.round((display.stage.stageWidth - this.window.width) * 0.5);
         this.window.y = Math.round((display.stage.stageHeight - this.window.height) * 0.5);
      }
      
      private function onClose(param1:Event) : void
      {
         trackerService.trackEvent(GA_CATEGORY,"thanksForPurchaseClosed",this.window.donationCrystals.toString());
         dialogsService.removeDialog(this.window);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.window = null;
         if(this.donation > 0)
         {
            this.window = new ThanksForPurchaseWindow(this.image,this.donation,this.packageBonusCrystals,this.bonusCrystals);
            this.donation = 0;
            this.bonusCrystals = 0;
            this.packageBonusCrystals = 0;
            this.confirmTime = this.time;
            this.time = null;
            this.remFrames = 10;
            display.stage.addEventListener(Event.ENTER_FRAME,this.showAfter);
         }
      }
      
      private function show() : void
      {
         this.onResize(null);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.window.closeButton.addEventListener(MouseEvent.CLICK,this.onClose);
         dialogsService.addDialog(this.window);
      }
      
      private function showAfter(param1:Event) : void
      {
         --this.remFrames;
         if(this.remFrames == 0)
         {
            this.show();
            display.stage.removeEventListener(Event.ENTER_FRAME,this.showAfter);
         }
      }
      
      private function compareTime(param1:Long, param2:Long) : int
      {
         if(param1.high != param2.high)
         {
            return param1.high < param2.high ? int(-1) : int(1);
         }
         if(param1.low == param2.low)
         {
            return 0;
         }
         return param1.low < param2.low ? int(-1) : int(1);
      }
   }
}

