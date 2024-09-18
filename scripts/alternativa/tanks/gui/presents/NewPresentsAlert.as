package alternativa.tanks.gui.presents
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.ImageConst;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.DefaultButtonBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import forms.alert.AlertDialogWindow;
   
   public class NewPresentsAlert extends AlertDialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var bitmapDataClass:Class = NewPresentsAlert_bitmapDataClass;
      
      private static var bitmapData:BitmapData = Bitmap(new bitmapDataClass()).bitmapData;
      
      private var acceptButton:DefaultButtonBase;
      
      public function NewPresentsAlert()
      {
         var _loc2_:int = 0;
         super(localeService.getImage(ImageConst.IMAGE_HEADER_NEW_PRESENTS_ALERT),localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT));
         var _loc1_:Bitmap = new Bitmap(bitmapData);
         setContentPlaceSize(400,240);
         _contentPlace.addChild(_loc1_);
         _loc1_.x = (_contentPlace.width - _loc1_.width) / 2;
         _loc1_.y = (_contentPlace.height - _loc1_.height) / 2;
         this.acceptButton = new DefaultButtonBase();
         this.acceptButton.label = localeService.getText(TextConst.TEXT_NEW_PRESENTS_ALERT_ACCEPT_BUTTON);
         _loc2_ = Math.max(this.acceptButton.width,_cancelButton.width);
         this.acceptButton.x = (_buttonPlace.width - _loc2_) / 2;
         this.acceptButton.width = _loc2_;
         _cancelButton.x = _buttonPlace.width - _loc2_;
         _cancelButton.width = _loc2_;
         _buttonPlace.addChild(this.acceptButton);
         _cancelButton.addEventListener(MouseEvent.CLICK,this.cancel);
         this.acceptButton.addEventListener(MouseEvent.CLICK,this.accept);
         enqueueDialog();
      }
      
      private function accept(param1:MouseEvent) : void
      {
         dispatchEvent(new NewPresentsAlertEvent(NewPresentsAlertEvent.ACCEPT));
         this.destroyAlert();
      }
      
      private function cancel(param1:MouseEvent) : void
      {
         dispatchEvent(new NewPresentsAlertEvent(NewPresentsAlertEvent.CANCEL));
         this.destroyAlert();
      }
      
      private function destroyAlert() : void
      {
         _cancelButton.removeEventListener(MouseEvent.CLICK,this.cancel);
         this.acceptButton.removeEventListener(MouseEvent.CLICK,this.accept);
         destroy();
      }
   }
}

