package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.icons.GarageItemBackground;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class RankUpSupplyBonusAlert extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var closeButton:DefaultButtonBase;
      
      private const BORDER:int = 12;
      
      private const MARGIN:int = 12;
      
      public function RankUpSupplyBonusAlert(param1:RankUpSupplyBonusInfo)
      {
         super();
         this.createAlertWindow(this,param1);
         dialogService.enqueueDialog(this);
      }
      
      public function createAlertWindow(param1:Sprite, param2:RankUpSupplyBonusInfo) : void
      {
         var _loc3_:TankWindow = new TankWindow();
         _loc3_.headerLang = localeService.getText(TextConst.GUI_LANG);
         _loc3_.header = TankWindowHeader.CONGRATULATIONS;
         param1.addChild(_loc3_);
         var _loc4_:TankWindowInner = this.createInnerFrame(_loc3_,param2);
         this.closeButton = this.createCloseButton(_loc3_);
         _loc3_.width = _loc4_.width + this.BORDER * 2;
         _loc3_.height = _loc4_.height + this.closeButton.height + this.BORDER * 3 - 4;
         this.closeButton.x = (_loc3_.width - this.closeButton.width) / 2;
         this.closeButton.y = _loc4_.height + this.BORDER * 2 - 6;
      }
      
      private function createInnerFrame(param1:Sprite, param2:RankUpSupplyBonusInfo) : TankWindowInner
      {
         var _loc5_:LabelBase = null;
         var _loc3_:TankWindowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         param1.addChild(_loc3_);
         _loc3_.x = this.BORDER;
         _loc3_.y = this.BORDER;
         var _loc4_:GarageItemBackground = this.createItemPlate(_loc3_);
         _loc5_ = this.createDescriptionLabel(_loc3_,param2.text,_loc4_.width);
         this.placeItemPlate(_loc4_,param2,this.MARGIN - 3,_loc5_.height + this.MARGIN * 2);
         _loc3_.width = _loc4_.width + this.MARGIN * 2 - 6;
         _loc3_.height = _loc5_.height + this.MARGIN * 3 + _loc4_.height - 2;
         return _loc3_;
      }
      
      private function createItemPlate(param1:Sprite) : GarageItemBackground
      {
         var _loc2_:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         param1.addChild(_loc2_);
         return _loc2_;
      }
      
      private function createDescriptionLabel(param1:Sprite, param2:String, param3:int) : LabelBase
      {
         var _loc4_:LabelBase = new LabelBase();
         param1.addChild(_loc4_);
         _loc4_.wordWrap = true;
         _loc4_.multiline = true;
         _loc4_.text = param2;
         _loc4_.size = 12;
         _loc4_.color = 5898034;
         _loc4_.x = this.MARGIN - 2;
         _loc4_.y = this.MARGIN;
         _loc4_.width = param3;
         return _loc4_;
      }
      
      private function placeItemPlate(param1:GarageItemBackground, param2:RankUpSupplyBonusInfo, param3:int, param4:int) : void
      {
         param1.x = param3;
         param1.y = param4;
         this.createPreview(param1,param2.preview);
         this.createCountLabel(param1,param2.count);
      }
      
      private function createPreview(param1:Sprite, param2:ImageResource) : void
      {
         var _loc3_:PreviewBonusItem = new PreviewBonusItem(param2,param1.width,param1.height);
         param1.addChild(_loc3_);
      }
      
      private function createCountLabel(param1:Sprite, param2:int) : void
      {
         var _loc3_:LabelBase = new LabelBase();
         param1.addChild(_loc3_);
         _loc3_.size = 16;
         _loc3_.color = 5898034;
         _loc3_.text = "×" + param2;
         _loc3_.x = param1.width - _loc3_.width - 15;
         _loc3_.y = param1.height - _loc3_.height - 10;
      }
      
      private function createCloseButton(param1:Sprite) : DefaultButtonBase
      {
         var _loc2_:DefaultButtonBase = new DefaultButtonBase();
         _loc2_.label = localeService.getText(TextConst.ALERT_ANSWER_OK);
         _loc2_.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         param1.addChild(_loc2_);
         return _loc2_;
      }
      
      private function closeBonusWindow(param1:MouseEvent = null) : void
      {
         this.destroy();
      }
      
      public function destroy() : void
      {
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         dialogService.removeDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.closeBonusWindow();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.closeBonusWindow();
      }
   }
}

