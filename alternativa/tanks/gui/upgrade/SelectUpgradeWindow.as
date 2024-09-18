package alternativa.tanks.gui.upgrade
{
   import alternativa.tanks.gui.buttons.CrystalButton;
   import alternativa.tanks.gui.buttons.color.GoldBigButtonSkin;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.money.IMoneyService;
   import controls.BigButton1;
   import controls.base.BigButtonBase;
   import controls.buttons.h50px.GreyBigButtonSkin;
   import controls.labels.MouseDisabledLabel;
   import controls.timer.CountDownTimer;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class SelectUpgradeWindow extends UpgradeWindowBase
   {
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      private static const INFO_FORM_WIDTH:int = 430;
      
      private static const BUTTON_WIDTH:int = 136;
      
      private static const VERTICAL_MARGIN:int = 7;
      
      private static const HORIZONTAL_MARGIN:int = 7;
      
      private static const UPGRADE_TIMEOUT_MS:int = 750;
      
      private var properties:Vector.<UpgradableItemPropertyValue>;
      
      private var infos:Vector.<UpgradeInfoForm>;
      
      private var okButtons:Vector.<CrystalButton>;
      
      private var isUpgrading:Boolean = false;
      
      private var discountLabel:MouseDisabledLabel;
      
      private var nextModificationIndex:int;
      
      private var hasNextModification:Boolean;
      
      public function SelectUpgradeWindow(param1:Vector.<UpgradableItemPropertyValue>, param2:int = 0, param3:Boolean = false)
      {
         var _loc4_:int = 0;
         var _loc5_:UpgradeInfoForm = null;
         var _loc6_:UpgradableItemPropertyValue = null;
         var _loc7_:CrystalButton = null;
         this.discountLabel = new MouseDisabledLabel();
         this.hasNextModification = param3;
         this.properties = this.getUpgradableProperties(param1);
         this.nextModificationIndex = param2 + 1;
         super(INFO_FORM_WIDTH + HORIZONTAL_MARGIN * 3 + BUTTON_WIDTH + 10,(50 + VERTICAL_MARGIN) * this.properties.length + 2 * VERTICAL_MARGIN + 30 + 12);
         this.okButtons = new Vector.<CrystalButton>(this.properties.length);
         this.infos = new Vector.<UpgradeInfoForm>(this.properties.length);
         var _loc8_:int = HORIZONTAL_MARGIN + 5;
         this.discountLabel.x = _loc8_;
         if(this.isFullUpgraded())
         {
            _loc4_ = INFO_FORM_WIDTH + VERTICAL_MARGIN + BUTTON_WIDTH;
         }
         else
         {
            _loc4_ = INFO_FORM_WIDTH;
         }
         var _loc9_:int = 0;
         while(_loc9_ < this.properties.length)
         {
            _loc5_ = new UpgradeInfoForm(_loc4_,50,this.properties[_loc9_]);
            this.infos[_loc9_] = _loc5_;
            _loc5_.y = (VERTICAL_MARGIN + 50) * _loc9_ + VERTICAL_MARGIN + 6;
            _loc5_.x = _loc8_;
            addChild(_loc5_);
            _loc6_ = this.properties[_loc9_];
            if(_loc6_.isFullUpgraded())
            {
               this.okButtons[_loc9_] = null;
            }
            else
            {
               _loc7_ = new CrystalButton();
               this.okButtons[_loc9_] = _loc7_;
               _loc7_.setText(localeService.getText(TanksLocale.TEXT_GARAGE_UPGRADE_TEXT));
               _loc7_.setSkin(GreyBigButtonSkin.GREY_SKIN);
               _loc7_.width = BUTTON_WIDTH;
               _loc7_.addEventListener(MouseEvent.CLICK,this.onClick);
               _loc7_.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
               _loc7_.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
               _loc7_.x = _loc5_.x + INFO_FORM_WIDTH + HORIZONTAL_MARGIN;
               _loc7_.y = _loc5_.y;
               _loc7_.setCost(_loc6_.getCost());
               addChild(_loc7_);
            }
            _loc9_++;
         }
         if(param3)
         {
            addChild(this.discountLabel);
            this.updateDiscountLabel();
         }
      }
      
      private function updateDiscountLabel() : void
      {
         var _loc1_:UpgradableItemPropertyValue = null;
         var _loc2_:String = null;
         if(!this.hasNextModification)
         {
            return;
         }
         var _loc3_:Number = 0;
         for each(_loc1_ in this.properties)
         {
            _loc3_ += _loc1_.getDiscount();
         }
         _loc3_ *= 100;
         if(_loc3_ > 0)
         {
            _loc2_ = "пошел нахуй";
            this.discountLabel.text = _loc2_.replace("{discount}",int(_loc3_)).replace("{grade}",this.nextModificationIndex);
         }
         else
         {
            _loc2_ = "че";
            this.discountLabel.text = _loc2_.replace("{grade}",this.nextModificationIndex);
         }
         var _loc4_:Number = cancelButton.y + cancelButton.height * 0.5;
         this.discountLabel.y = _loc4_ - this.discountLabel.height * 0.5;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.okButtons.indexOf(param1.target));
         this.infos[_loc2_].hideTime();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.okButtons.indexOf(param1.target));
         this.infos[_loc2_].showTime();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.okButtons.indexOf(param1.target));
         if(this.isUpgrading)
         {
            this.speedUp(_loc2_);
         }
         else
         {
            this.startUpgrade(_loc2_);
         }
      }
      
      private function speedUp(param1:int) : void
      {
         var _loc2_:UpgradableItemPropertyValue = this.properties[param1];
         if(moneyService.§while package dynamic§(_loc2_.getSpeedUpCost()))
         {
            this.okButtons[param1].enabled = false;
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.SPEED_UP,_loc2_));
         }
         else
         {
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.FLUSH_UPGRADES));
         }
      }
      
      override protected function onClose() : void
      {
         this.removeEvents();
         dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.FLUSH_UPGRADES));
         dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.SELECT_WINDOW_CLOSED));
      }
      
      override protected function removeEvents() : void
      {
         var _loc1_:BigButtonBase = null;
         super.removeEvents();
         for each(_loc1_ in this.okButtons)
         {
            if(_loc1_ != null)
            {
               _loc1_.removeEventListener(MouseEvent.CLICK,this.onClick);
            }
         }
      }
      
      private function startUpgrade(param1:int) : void
      {
         var _loc2_:UpgradeInfoForm = null;
         var _loc3_:CountDownTimer = null;
         var _loc4_:int = 0;
         var _loc5_:CrystalButton = null;
         var _loc6_:BigButton1 = null;
         var _loc7_:UpgradableItemPropertyValue = this.properties[param1];
         if(moneyService.§while package dynamic§(_loc7_.getCost()))
         {
            _loc2_ = this.infos[param1];
            _loc3_ = new CountDownTimer();
            _loc3_.start(_loc7_.getTimeInSeconds() * 1000 + getTimer());
            _loc2_.setTimer(_loc3_);
            _loc4_ = 0;
            while(_loc4_ < this.properties.length)
            {
               _loc6_ = this.okButtons[_loc4_];
               if(_loc6_ != null && _loc4_ != param1)
               {
                  _loc6_.enabled = false;
               }
               _loc4_++;
            }
            _loc5_ = this.okButtons[param1];
            _loc5_.setCost(_loc7_.getSpeedUpCost());
            _loc5_.setText(localeService.getText(TanksLocale.TEXT_GARAGE_SPEED_UP_TEXT));
            _loc5_.setSkin(GoldBigButtonSkin.GOLD_SKIN);
            _loc5_.enabled = false;
            setTimeout(this.enableSpeedUpButton,UPGRADE_TIMEOUT_MS,_loc5_);
            this.isUpgrading = true;
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.UPGRADE_STARTED,_loc7_,_loc3_));
         }
         else
         {
            dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.FLUSH_UPGRADES));
         }
      }
      
      private function enableSpeedUpButton() : void
      {
         CrystalButton(arguments[0]).enabled = true;
      }
      
      public function propertyUpgraded(param1:UpgradableItemPropertyValue) : void
      {
         var _loc2_:BigButton1 = null;
         var _loc3_:DisplayObject = null;
         this.isUpgrading = false;
         var _loc4_:int = int(this.properties.indexOf(param1));
         this.infos[_loc4_].propertyUpgraded();
         var _loc5_:CrystalButton = this.okButtons[_loc4_];
         if(param1.isFullUpgraded())
         {
            removeChild(_loc5_);
            _loc5_.removeEventListener(MouseEvent.CLICK,this.onClick);
            _loc5_.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            _loc5_.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            this.updateDiscountLabel();
            this.infos[_loc4_].hideTime();
            this.okButtons[_loc4_] = null;
            if(this.isFullUpgraded())
            {
               this.setLongInfos();
            }
         }
         else
         {
            _loc5_.setText(localeService.getText(TanksLocale.TEXT_GARAGE_UPGRADE_TEXT));
            _loc5_.setSkin(GreyBigButtonSkin.GREY_SKIN);
            _loc5_.setCost(param1.getCost());
            _loc3_ = this.okButtons[_loc4_];
            if(_loc3_.mouseX >= 0 && _loc3_.mouseY >= 0 && _loc3_.mouseX <= _loc3_.width && _loc3_.mouseY < _loc3_.height)
            {
               this.infos[_loc4_].showTime();
            }
            else
            {
               this.infos[_loc4_].hideTime();
            }
         }
         var _loc6_:Boolean = true;
         for each(_loc2_ in this.okButtons)
         {
            if(_loc2_ != null)
            {
               _loc6_ = false;
            }
         }
         setTimeout(this.enableButtons,UPGRADE_TIMEOUT_MS);
      }
      
      public function enableButtons() : void
      {
         var _loc1_:BigButton1 = null;
         for each(_loc1_ in this.okButtons)
         {
            if(_loc1_ != null)
            {
               _loc1_.enabled = true;
            }
         }
      }
      
      private function isFullUpgraded() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.properties.length)
         {
            if(!this.properties[_loc1_].isFullUpgraded())
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      private function setLongInfos() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.infos.length)
         {
            removeChild(this.infos[_loc1_]);
            this.infos[_loc1_] = new UpgradeInfoForm(INFO_FORM_WIDTH + VERTICAL_MARGIN + BUTTON_WIDTH,50,this.properties[_loc1_]);
            addChild(this.infos[_loc1_]);
            this.infos[_loc1_].y = (VERTICAL_MARGIN + 50) * _loc1_ + VERTICAL_MARGIN + 6;
            this.infos[_loc1_].x = HORIZONTAL_MARGIN + 5;
            _loc1_++;
         }
      }
      
      private function getUpgradableProperties(param1:Vector.<UpgradableItemPropertyValue>) : Vector.<UpgradableItemPropertyValue>
      {
         var _loc2_:UpgradableItemPropertyValue = null;
         var _loc3_:Vector.<UpgradableItemPropertyValue> = new Vector.<UpgradableItemPropertyValue>();
         for each(_loc2_ in param1)
         {
            if(_loc2_.getMaxLevel() > 0)
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
   }
}

