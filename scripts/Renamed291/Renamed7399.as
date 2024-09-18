package Renamed291
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.Renamed1875;
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
   import Renamed420.Renamed7387;
   import Renamed420.Renamed4823;
   import Renamed420.Renamed1806;
   
   public class Renamed4807 extends Renamed7387 implements Renamed4823, IObjectLoadListener
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
      
      private var Renamed7388:ReferralWindow;
      
      public function Renamed4807()
      {
         super();
      }
      
      private static function Renamed7389(param1:Vector.<String>) : Vector.<String>
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
      
      public function Renamed7390() : void
      {
         panelView.showAlert(localeService.getText(TanksLocale.TEXT_INVITATION_HAS_BEEN_SENT_ALERT_TEXT));
         this.Renamed7388.Renamed1877();
      }
      
      public function Renamed7391(param1:Vector.<Renamed1806>, param2:String, param3:String, param4:String) : void
      {
         if(this.Renamed7388 != null)
         {
            return;
         }
         this.Renamed7388 = new ReferralWindow(userPropertiesService.userName,param3,param2,param4,getInitParam().host,getInitParam().hash);
         dialogService.addDialog(this.Renamed7388);
         this.Renamed7388.addEventListener(Renamed1875.Renamed1876,this.Renamed7392);
         this.Renamed7388.closeButton.addEventListener(MouseEvent.CLICK,this.Renamed7393);
         this.Renamed7388.Renamed1873(param1);
         display.stage.addEventListener(Event.RESIZE,this.Renamed7394);
         this.Renamed7394();
         panelView.unlock();
         dialogWindowsDispatcherService.open();
      }
      
      private function Renamed7392(param1:Renamed1875) : void
      {
         var _loc2_:Vector.<String> = Vector.<String>(param1.AbstractPackets6.split(","));
         var _loc3_:Vector.<String> = Renamed7389(_loc2_);
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
            this.Renamed7395(_loc2_,Boolean(this.Renamed7388.Renamed1846.textField.text.length) ? this.Renamed7388.Renamed1846.textField.text : IUserProperties(object.adapt(IUserProperties)).getName());
         }
      }
      
      public function Renamed7395(param1:Vector.<String>, param2:String) : void
      {
         server.Renamed7396(param1,param2);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:MainPanel = panelView.Renamed2160();
         _loc1_.buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         if(param1.typeButton == MainButtonBarEvents.REFERAL)
         {
            if(this.Renamed7388 == null)
            {
               server.Renamed7397();
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
      
      private function Renamed7394(param1:Event = null) : void
      {
         var _loc2_:Stage = display.stage;
         this.Renamed7388.x = Math.round((_loc2_.stageWidth - this.Renamed7388.windowSize.x) * 0.5);
         this.Renamed7388.y = Math.round((_loc2_.stageHeight - this.Renamed7388.windowSize.y) * 0.5);
      }
      
      private function Renamed7393(param1:MouseEvent = null) : void
      {
         this.Renamed7388.removeEventListener(Renamed1875.Renamed1876,this.Renamed7392);
         this.Renamed7388.closeButton.removeEventListener(MouseEvent.CLICK,this.Renamed7393);
         display.stage.removeEventListener(Event.RESIZE,this.Renamed7394);
         dialogService.removeDialog(this.Renamed7388);
         dialogWindowsDispatcherService.close();
         this.Renamed7388 = null;
      }
      
      public function Renamed7398(param1:String) : void
      {
         panelView.showAlert(param1);
      }
   }
}

