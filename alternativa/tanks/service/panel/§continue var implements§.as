package alternativa.tanks.service.panel
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.events.EventDispatcher;
   import forms.MainPanel;
   import services.alertservice.Alert;
   import services.alertservice.§get const use§;
   
   public class §continue var implements§ extends EventDispatcher implements IPanelView
   {
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private var panel:MainPanel;
      
      public function §continue var implements§()
      {
         super();
      }
      
      public function §break const const§(param1:Boolean, param2:Boolean, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void
      {
         this.panel = new MainPanel(param1);
      }
      
      public function §+#,§() : MainPanel
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
         _loc2_.showAlert(param1,Vector.<String>([§get const use§.OK]));
         display.dialogsLayer.addChild(_loc2_);
      }
   }
}

