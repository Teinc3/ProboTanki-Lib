package §return set dynamic§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.money.IMoneyService;
   import controls.buttons.h50px.GreyBigButton;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class § "i§ implements AutoClosable
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      protected var §="@§:GreyBigButton;
      
      private var §return const function§:Function;
      
      public function § "i§(param1:String, param2:Function)
      {
         this.§="@§ = new GreyBigButton();
         super();
         this.§return const function§ = param2;
         this.§="@§.label = localeService.getText(param1);
         this.§="@§.addEventListener(MouseEvent.CLICK,this.onClick);
         this.§="@§.x = 11;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(moneyService.§while package dynamic§(100000))
         {
            this.§return const function§();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.§="@§.enabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this.§="@§.enabled;
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         param1.addChild(this.§="@§);
      }
      
      public function close() : void
      {
         this.§="@§.removeEventListener(MouseEvent.CLICK,this.onClick);
      }
   }
}

