package alternativa.tanks.gui
{
   import alternativa.tanks.gui.upgrade.UpgradeColors;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import assets.Diamond;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import forms.ranks.SmallRankIcon;
   
   public class ModInfoRow extends Sprite
   {
      private static const RANK_WIDTH:int = 13;
      
      private var isSelected:Boolean = false;
      
      public var labels:Vector.<LabelBase>;
      
      public var costLabel:LabelBase;
      
      public var crystalIcon:Diamond;
      
      public var rankIcon:SmallRankIcon;
      
      public var upgradeIndicator:UpgradeIndicator;
      
      public const h:int = 17;
      
      public const hSpace:int = 10;
      
      public var costWidth:int;
      
      private var numberProperties:int = 0;
      
      private var _width:int;
      
      public function ModInfoRow(param1:int, param2:int)
      {
         var _loc3_:LabelBase = null;
         super();
         this._width = param2;
         this.labels = new Vector.<LabelBase>(8);
         var _loc4_:int = 0;
         while(_loc4_ < 8)
         {
            _loc3_ = new LabelBase();
            _loc3_.color = 16777215;
            _loc3_.align = TextFormatAlign.CENTER;
            _loc3_.text = "ABC123";
            addChild(_loc3_);
            this.labels[_loc4_] = _loc3_;
            _loc3_.y = this.h - _loc3_.height >> 1;
            _loc4_++;
         }
         this.costLabel = new LabelBase();
         this.costLabel.color = 16777215;
         this.costLabel.align = TextFormatAlign.RIGHT;
         this.costLabel.text = "ABC123";
         addChild(this.costLabel);
         this.costLabel.y = this.h - this.costLabel.height >> 1;
         this.crystalIcon = new Diamond();
         addChild(this.crystalIcon);
         this.crystalIcon.y = this.h - this.crystalIcon.height >> 1;
         this.rankIcon = new SmallRankIcon();
         addChild(this.rankIcon);
         this.rankIcon.y = (this.h - this.rankIcon.height >> 1) + 1;
         this.upgradeIndicator = new UpgradeIndicator(param1);
         addChild(this.upgradeIndicator);
         this.upgradeIndicator.y = (this.h - this.upgradeIndicator.height >> 1) + 1;
      }
      
      public function select() : void
      {
         var _loc1_:LabelBase = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = this.labels[_loc2_] as LabelBase;
            _loc1_.color = 16777215;
            _loc1_.sharpness = -100;
            _loc1_.thickness = 100;
            _loc2_++;
         }
         this.costLabel.sharpness = -100;
         this.costLabel.thickness = 100;
         this.isSelected = true;
      }
      
      public function unselect() : void
      {
         var _loc1_:LabelBase = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = this.labels[_loc2_] as LabelBase;
            _loc1_.color = 16777215;
            _loc1_.sharpness = 50;
            _loc1_.thickness = -50;
            _loc2_++;
         }
         this.costLabel.color = 16777215;
         this.costLabel.sharpness = 50;
         this.costLabel.thickness = -50;
         this.isSelected = false;
      }
      
      public function setLabelsNum(param1:int) : void
      {
         this.numberProperties = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.labels.length)
         {
            if(_loc2_ < param1)
            {
               (this.labels[_loc2_] as LabelBase).visible = true;
            }
            else
            {
               (this.labels[_loc2_] as LabelBase).visible = false;
            }
            _loc2_++;
         }
      }
      
      public function setLabelsText(param1:Vector.<UpgradableItemPropertyValue>) : void
      {
         var _loc2_:UpgradableItemPropertyValue = null;
         var _loc3_:int = 0;
         var _loc4_:LabelBase = null;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = param1[_loc5_];
            _loc3_ = UpgradeColors.getColorForValue(_loc2_);
            (_loc4_ = this.labels[_loc5_]).text = _loc2_.getValue();
            _loc4_.color = _loc3_;
            _loc5_++;
         }
      }
      
      public function updatePositions() : void
      {
         var _loc1_:LabelBase = null;
         var _loc2_:int = this._width;
         this.crystalIcon.x = _loc2_ - this.crystalIcon.width - this.hSpace;
         this.costLabel.x = this.crystalIcon.x - 3 - this.costLabel.width;
         var _loc3_:Number = this.crystalIcon.x - 3 - this.costWidth;
         this.rankIcon.x = _loc3_ - this.hSpace - RANK_WIDTH;
         this.upgradeIndicator.x = this.rankIcon.x - this.upgradeIndicator.width - this.hSpace;
         var _loc4_:Number = (this.upgradeIndicator.x - 2 * this.hSpace) / this.numberProperties;
         var _loc5_:int = 0;
         while(_loc5_ < this.numberProperties)
         {
            _loc1_ = this.labels[_loc5_];
            _loc1_.x = Math.round(this.hSpace + _loc4_ * _loc5_ + (_loc4_ - _loc1_.width) / 2);
            _loc5_++;
         }
      }
      
      public function getPositions() : Vector.<Number>
      {
         var _loc1_:LabelBase = null;
         var _loc2_:Vector.<Number> = new Vector.<Number>(this.numberProperties,true);
         var _loc3_:int = 0;
         while(_loc3_ < this.numberProperties)
         {
            _loc1_ = this.labels[_loc3_];
            _loc2_[_loc3_] = _loc1_.x + _loc1_.width * 0.5;
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

