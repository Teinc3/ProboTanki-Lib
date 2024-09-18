package Renamed392
{
   import Renamed4553.Renamed5127;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2654;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2552;
   import controls.base.LabelBase;
   import controls.resultassets.WhiteFrame;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class Renamed8443 extends Sprite implements Renamed919, Renamed2552
   {
      private static const Renamed6493:int = 1;
      
      private var shape:Shape;
      
      private var indicators:Vector.<Renamed8444>;
      
      private var _width:int;
      
      private var _height:int;
      
      public function Renamed8443(param1:Vector.<Renamed5127>)
      {
         this.shape = new Shape();
         super();
         this.Renamed8445(param1);
         this.Renamed8446(param1.length);
         addChild(this.shape);
         this.Renamed8447();
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function Renamed8447() : void
      {
         var _loc1_:Renamed8444 = null;
         for each(_loc1_ in this.indicators)
         {
            addChild(_loc1_.getLabel());
         }
      }
      
      public function Renamed2656(param1:Renamed2654) : void
      {
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         var _loc1_:Renamed8444 = null;
         for each(_loc1_ in this.indicators)
         {
            _loc1_.update();
         }
      }
      
      private function Renamed8445(param1:Vector.<Renamed5127>) : void
      {
         var _loc2_:Renamed5127 = null;
         var _loc3_:Renamed8444 = null;
         var _loc4_:LabelBase = null;
         var _loc5_:Vector.<Renamed5127> = this.Renamed8448(param1);
         var _loc6_:int = 2;
         this.indicators = new Vector.<Renamed8444>(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc7_];
            _loc3_ = new Renamed8444(_loc2_);
            _loc3_.x = _loc6_;
            _loc3_.y = 2;
            addChild(_loc3_);
            (_loc4_ = _loc3_.getLabel()).y = 8;
            _loc4_.x = int(_loc3_.x + (_loc3_.width - _loc4_.width) / 2);
            if(_loc7_ < _loc5_.length - 1)
            {
               this.shape.graphics.lineStyle(0,16777215);
               this.shape.graphics.moveTo(_loc3_.x + 36,2);
               this.shape.graphics.lineTo(_loc3_.x + 36,38);
            }
            this.indicators[_loc7_] = _loc3_;
            _loc6_ += _loc3_.width + Renamed6493;
            _loc7_++;
         }
      }
      
      private function Renamed8448(param1:Vector.<Renamed5127>) : Vector.<Renamed5127>
      {
         var Renamed3693:Vector.<Renamed5127> = param1;
         var Renamed6119:Vector.<Renamed5127> = Renamed3693;
         return Renamed6119.concat().sort(function(param1:Renamed5127, param2:Renamed5127):Number
         {
            if(param1.getName() < param2.getName())
            {
               return -1;
            }
            if(param1.getName() > param2.getName())
            {
               return 1;
            }
            return 0;
         });
      }
      
      private function Renamed8446(param1:int) : void
      {
         var _loc2_:WhiteFrame = new WhiteFrame();
         _loc2_.width = param1 * (36 + Renamed6493) - Renamed6493 + 4;
         addChild(_loc2_);
         this._width = _loc2_.width;
         this._height = _loc2_.height;
      }
      
      [Obfuscation(rename="false")]
      override public function get width() : Number
      {
         return this._width;
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return this._height;
      }
   }
}

