package Renamed414
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.money.IMoneyService;
   import controls.buttons.h50px.GreyBigButton;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed4785 implements AutoClosable
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      protected var Renamed8652:GreyBigButton;
      
      private var Renamed3784:Function;
      
      public function Renamed4785(param1:String, param2:Function)
      {
         this.Renamed8652 = new GreyBigButton();
         super();
         this.Renamed3784 = param2;
         this.Renamed8652.label = localeService.getText(param1);
         this.Renamed8652.addEventListener(MouseEvent.CLICK,this.onClick);
         this.Renamed8652.x = 11;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(moneyService.Renamed1617(100000))
         {
            this.Renamed3784();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.Renamed8652.enabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this.Renamed8652.enabled;
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         param1.addChild(this.Renamed8652);
      }
      
      public function close() : void
      {
         this.Renamed8652.removeEventListener(MouseEvent.CLICK,this.onClick);
      }
   }
}

