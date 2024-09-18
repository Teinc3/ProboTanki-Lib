package alternativa.tanks.service.panel
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.events.EventDispatcher;
   import forms.MainPanel;
   import services.alertservice.Alert;
   import services.alertservice.Renamed1616;
   
   public class Renamed573 extends EventDispatcher implements IPanelView
   {
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private var panel:MainPanel;
      
      public function Renamed573()
      {
         super();
      }
      
      public function Renamed2159(param1:Boolean, param2:Boolean, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.panel = new MainPanel(param1);
      }
      
      public function Renamed2160() : MainPanel
      {
         return this.panel;
      }
      
      public function lock() : void
      {
         this.panel.mouseEnabled = false;
         this.panel.mouseChildren = false;
      }
      
      public function unlock() : void
      {
         this.panel.mouseEnabled = true;
         this.panel.mouseChildren = true;
      }
      
      public function showAlert(param1:String) : void
      {
         var _loc2_:Alert = new Alert();
         _loc2_.showAlert(param1,Vector.<String>([Renamed1616.OK]));
         display.dialogsLayer.addChild(_loc2_);
      }
   }
}

