package alternativa.tanks.gui.premiumaccount
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.ImageConst;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import forms.alert.AlertDialogWindow;
   
   public class PremiumAccountWelcomeAlert extends AlertDialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var _welcomeText:String;
      
      public function PremiumAccountWelcomeAlert(param1:String)
      {
         this._welcomeText = param1;
         super(localeService.getImage(ImageConst.IMAGE_PREMIUM_HEADER),localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT));
      }
      
      override protected function init() : void
      {
         var _loc2_:LabelBase = null;
         var _loc1_:Bitmap = null;
         super.init();
         _loc1_ = new Bitmap(PremiumAccountIcons.premiumIconForWelcomeAlert);
         _contentPlace.addChild(_loc1_);
         _loc2_ = this.createLabel();
         _loc2_.width = _loc1_.width;
         _contentPlace.addChild(_loc2_);
         _loc2_.y = _loc1_.height + GAP_11;
         var _loc3_:int = Math.max(_loc1_.width,_loc2_.width + 2 * GAP_11);
         _loc1_.x = _loc3_ - _loc1_.width >> 1;
         _loc2_.x = _loc3_ - _loc2_.width >> 1;
         var _loc4_:int = _loc1_.height + GAP_11 + _loc2_.height + GAP_11;
         setContentPlaceSize(_loc3_,_loc4_);
      }
      
      private function createLabel() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.autoSize = TextFieldAutoSize.CENTER;
         _loc1_.align = TextFormatAlign.CENTER;
         _loc1_.multiline = true;
         _loc1_.text = this._welcomeText;
         _loc1_.size = 18;
         _loc1_.color = ColorConstants.GREEN_TEXT;
         return _loc1_;
      }
   }
}

