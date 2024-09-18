package §;!w§
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.§-0§;
   import alternativa.tanks.gui.ReferralWindow;
   import alternativa.tanks.model.userproperties.IUserProperties;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.panel.IPanelView;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.MainPanel;
   import forms.events.MainButtonBarEvents;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import §static final§.§%#[§;
   import §static final§.§4!y§;
   import §static final§.§continue package do§;
   
   public class §!"A§ extends §%#[§ implements §4!y§, IObjectLoadListener
   {
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var §const catch true§:ReferralWindow;
      
      public function §!"A§()
      {
         super();
      }
      
      private static function §final for package§(param1:Vector.<String>) : Vector.<String>
      {
         var _loc2_:Object = null;
         var _loc3_:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
         var _loc4_:Vector.<String> = new Vector.<String>();
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = _loc3_.exec(param1[_loc5_]);
            if(_loc2_ == null)
            {
               _loc4_.push(param1[_loc5_]);
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function §`m§() : void
      {
         panelView.showAlert(localeService.getText(TanksLocale.TEXT_INVITATION_HAS_BEEN_SENT_ALERT_TEXT));
         this.§const catch true§.§-#d§();
      }
      
      public function §finally package static§(param1:Vector.<§continue package do§>, param2:String, param3:String, param4:String) : void
      {
         if(this.§const catch true§ != null)
         {
            return;
         }
         this.§const catch true§ = new ReferralWindow(userPropertiesService.userName,param3,param2,param4,getInitParam().host,getInitParam().hash);
         dialogService.addDialog(this.§const catch true§);
         this.§const catch true§.addEventListener(§-0§.§package package super§,this.§%V§);
         this.§const catch true§.closeButton.addEventListener(MouseEvent.CLICK,this.§class for if§);
         this.§const catch true§.§&"t§(param1);
         display.stage.addEventListener(Event.RESIZE,this.§implements set var§);
         this.§implements set var§();
         panelView.unlock();
         dialogWindowsDispatcherService.open();
      }
      
      private function §%V§(param1:§-0§) : void
      {
         var _loc2_:Vector.<String> = Vector.<String>(param1.§catch import§.split(","));
         var _loc3_:Vector.<String> = §final for package§(_loc2_);
         if(_loc3_.length > 0)
         {
            if(_loc3_.length == 1)
            {
               panelView.showAlert(localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_ADDRESS_NOT_VALID_ALERT_TEXT,_loc3_[0]));
            }
            else
            {
               panelView.showAlert(localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_ADDRESSES_NOT_VALID_ALERT_TEXT,_loc3_.join(", ")));
            }
         }
         else
         {
            this.§`F§(_loc2_,Boolean(this.§const catch true§.§["[§.textField.text.length) ? this.§const catch true§.§["[§.textField.text : IUserProperties(object.adapt(IUserProperties)).getName());
         }
      }
      
      public function §`F§(param1:Vector.<String>, param2:String) : void
      {
         server.§package var null§(param1,param2);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:MainPanel = panelView.§+#,§();
         _loc1_.buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         if(param1.typeButton == MainButtonBarEvents.REFERAL)
         {
            if(this.§const catch true§ == null)
            {
               server.§static const case§();
            }
            else
            {
               panelView.unlock();
            }
         }
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function §implements set var§(param1:Event = null) : void
      {
         var _loc2_:Stage = display.stage;
         this.§const catch true§.x = Math.round((_loc2_.stageWidth - this.§const catch true§.windowSize.x) * 0.5);
         this.§const catch true§.y = Math.round((_loc2_.stageHeight - this.§const catch true§.windowSize.y) * 0.5);
      }
      
      private function §class for if§(param1:MouseEvent = null) : void
      {
         this.§const catch true§.removeEventListener(§-0§.§package package super§,this.§%V§);
         this.§const catch true§.closeButton.removeEventListener(MouseEvent.CLICK,this.§class for if§);
         display.stage.removeEventListener(Event.RESIZE,this.§implements set var§);
         dialogService.removeDialog(this.§const catch true§);
         dialogWindowsDispatcherService.close();
         this.§const catch true§ = null;
      }
      
      public function §`"r§(param1:String) : void
      {
         panelView.showAlert(param1);
      }
   }
}

