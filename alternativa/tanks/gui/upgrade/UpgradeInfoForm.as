package alternativa.tanks.gui.upgrade
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ItemInfoPanelBitmaps;
   import alternativa.tanks.gui.timer.CountDownTimerWithIcon;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.§else package implements§;
   import base.DiscreteSprite;
   import controls.TankWindowInner;
   import controls.labels.MouseDisabledLabel;
   import controls.timer.CountDownTimer;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class UpgradeInfoForm extends DiscreteSprite
   {
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const leftProgressResource:Class = UpgradeInfoForm_leftProgressResource;
      
      private static const centerProgressResource:Class = UpgradeInfoForm_centerProgressResource;
      
      public static const HORIZONTAL_MARGIN:int = 10;
      
      protected var bg:TankWindowInner;
      
      protected var propertyNameLabel:MouseDisabledLabel;
      
      protected var propertyValueLabel:MouseDisabledLabel;
      
      protected var propertyDeltaLabel:MouseDisabledLabel;
      
      private var upgradeProgressValue:MouseDisabledLabel;
      
      private var timerLabel:CountDownTimerWithIcon;
      
      private var propertyParams:§else package implements§;
      
      protected var propertyValue:UpgradableItemPropertyValue;
      
      private var icon:Bitmap;
      
      private var progressBar:Bitmap;
      
      private var textLayer:Sprite;
      
      private var leftProgressPart:Bitmap;
      
      private var centerProgressPart:Bitmap;
      
      private var rightProgressPart:Bitmap;
      
      private var isUpgrading:Boolean = false;
      
      public function UpgradeInfoForm(param1:int, param2:int, param3:UpgradableItemPropertyValue)
      {
         this.propertyNameLabel = new MouseDisabledLabel();
         this.propertyValueLabel = new MouseDisabledLabel();
         this.propertyDeltaLabel = new MouseDisabledLabel();
         this.upgradeProgressValue = new MouseDisabledLabel();
         this.timerLabel = new CountDownTimerWithIcon();
         this.progressBar = new Bitmap();
         this.textLayer = new Sprite();
         super();
         this.bg = new TankWindowInner(param1,param2,TankWindowInner.GREEN);
         addChild(this.bg);
         this.progressBar.x = 1;
         this.progressBar.y = 1;
         this.progressBar.blendMode = BlendMode.OVERLAY;
         this.bg.addChild(this.progressBar);
         this.bg.addChild(this.textLayer);
         this.propertyParams = propertyService.getParams(param3.getProperty());
         this.icon = this.propertyParams.§+#_§();
         var _loc4_:Bitmap;
         (_loc4_ = new Bitmap(ItemInfoPanelBitmaps.backIcon)).x = HORIZONTAL_MARGIN;
         _loc4_.y = 1;
         this.putOnLine(_loc4_,25);
         this.textLayer.addChild(_loc4_);
         this.icon.x = _loc4_.x + 1;
         this.icon.y = _loc4_.y + 1;
         addChild(this.icon);
         this.textLayer.addChild(this.propertyNameLabel);
         this.textLayer.addChild(this.propertyValueLabel);
         this.textLayer.addChild(this.propertyDeltaLabel);
         this.timerLabel.setRightX(param1 - HORIZONTAL_MARGIN);
         this.textLayer.addChild(this.timerLabel);
         this.timerLabel.visible = false;
         this.propertyValueLabel.textColor = UpgradeColors.GREEN;
         this.textLayer.addChild(this.upgradeProgressValue);
         this.propertyNameLabel.text = this.propertyParams.name + ":";
         this.leftProgressPart = new Bitmap(new leftProgressResource().bitmapData);
         this.centerProgressPart = new Bitmap(new centerProgressResource().bitmapData);
         this.rightProgressPart = new Bitmap(new leftProgressResource().bitmapData);
         this.setProperty(param3);
         this.putOnLine(this.propertyValueLabel,25);
         this.putOnLine(this.propertyNameLabel,25);
         this.putOnLine(this.upgradeProgressValue,25);
         this.putOnLine(this.propertyDeltaLabel,25);
         this.putOnLine(this.timerLabel,25);
         this.align();
      }
      
      public function propertyUpgraded() : void
      {
         this.isUpgrading = false;
         this.setProperty(this.propertyValue);
      }
      
      private function updateColor() : void
      {
         var _loc1_:int = UpgradeColors.getColorForValue(this.propertyValue);
         this.upgradeProgressValue.textColor = _loc1_;
         if(this.propertyValue.isFullUpgraded())
         {
            this.propertyValueLabel.textColor = _loc1_;
         }
      }
      
      public function showTime() : void
      {
         this.timerLabel.visible = true;
      }
      
      public function hideTime() : void
      {
         if(!this.isUpgrading)
         {
            this.timerLabel.visible = false;
         }
      }
      
      private function updateProgressBar() : void
      {
         var _loc1_:Shape = null;
         var _loc2_:Graphics = null;
         var _loc3_:Matrix = null;
         var _loc4_:int = this.bg.width - 2;
         var _loc5_:int = Math.round(_loc4_ * this.propertyValue.getLevel() / this.propertyValue.getMaxLevel());
         if(_loc5_ == 0)
         {
            this.progressBar.visible = false;
            return;
         }
         this.progressBar.visible = true;
         this.progressBar.bitmapData = new BitmapData(_loc5_,this.leftProgressPart.height,true,0);
         if(_loc5_ > 0)
         {
            this.progressBar.bitmapData.draw(this.leftProgressPart);
         }
         if(_loc5_ > this.leftProgressPart.width)
         {
            this.centerProgressPart.width = Math.min(_loc5_ - this.leftProgressPart.width,_loc4_ - this.leftProgressPart.width * 2);
            _loc1_ = new Shape();
            _loc2_ = _loc1_.graphics;
            _loc2_.beginBitmapFill(this.centerProgressPart.bitmapData);
            _loc2_.drawRect(this.leftProgressPart.width,0,this.centerProgressPart.width,this.centerProgressPart.height);
            _loc2_.endFill();
            this.progressBar.bitmapData.draw(_loc1_);
         }
         if(_loc5_ == _loc4_)
         {
            _loc3_ = new Matrix(-1,0,0,1,_loc4_,0);
            this.progressBar.bitmapData.draw(this.leftProgressPart,_loc3_);
         }
      }
      
      private function setProperty(param1:UpgradableItemPropertyValue) : void
      {
         this.propertyValue = param1;
         this.propertyValueLabel.text = param1.getValue();
         this.upgradeProgressValue.text = param1.getLevel() + " / " + param1.getMaxLevel();
         if(param1.getLevel() == param1.getMaxLevel())
         {
            this.textLayer.removeChild(this.propertyDeltaLabel);
         }
         else
         {
            this.propertyDeltaLabel.text = param1.getDelta();
            this.timerLabel.setTime(param1.getTimeInSeconds());
         }
         this.updateProgressBar();
         this.updateColor();
         this.align();
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.align();
      }
      
      private function align() : void
      {
         this.upgradeProgressValue.x = this.icon.x + 75 - this.upgradeProgressValue.width;
         this.propertyNameLabel.x = this.icon.x + 75 + HORIZONTAL_MARGIN;
         this.propertyValueLabel.x = this.propertyNameLabel.x + this.propertyNameLabel.width;
         this.propertyDeltaLabel.x = this.propertyValueLabel.x + this.propertyValueLabel.width;
      }
      
      protected function putOnLine(param1:DisplayObject, param2:int) : void
      {
         param1.y = int(param2 - param1.height * 0.5);
      }
      
      public function setTimer(param1:CountDownTimer) : void
      {
         this.timerLabel.start(param1);
         this.isUpgrading = true;
         this.showTime();
      }
   }
}

