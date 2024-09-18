package §import for in§
{
   import §#"D§.§case set extends§;
   import alternativa.tanks.battle.scene3d.§else if§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§class set default§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§const set final§;
   import controls.base.LabelBase;
   import controls.resultassets.WhiteFrame;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class §override package dynamic§ extends Sprite implements §else if§, §const set final§
   {
      private static const §;!N§:int = 1;
      
      private var shape:Shape;
      
      private var indicators:Vector.<§try for get§>;
      
      private var _width:int;
      
      private var _height:int;
      
      public function §override package dynamic§(param1:Vector.<§case set extends§>)
      {
         this.shape = new Shape();
         super();
         this.§`x§(param1);
         this.§=#,§(param1.length);
         addChild(this.shape);
         this.§%#F§();
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function §%#F§() : void
      {
         var _loc1_:§try for get§ = null;
         for each(_loc1_ in this.indicators)
         {
            addChild(_loc1_.getLabel());
         }
      }
      
      public function §+"l§(param1:§class set default§) : void
      {
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         var _loc1_:§try for get§ = null;
         for each(_loc1_ in this.indicators)
         {
            _loc1_.update();
         }
      }
      
      private function §`x§(param1:Vector.<§case set extends§>) : void
      {
         var _loc2_:§case set extends§ = null;
         var _loc3_:§try for get§ = null;
         var _loc4_:LabelBase = null;
         var _loc5_:Vector.<§case set extends§> = this.§for for in§(param1);
         var _loc6_:int = 2;
         this.indicators = new Vector.<§try for get§>(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc7_];
            _loc3_ = new §try for get§(_loc2_);
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
            _loc6_ += _loc3_.width + §;!N§;
            _loc7_++;
         }
      }
      
      private function §for for in§(param1:Vector.<§case set extends§>) : Vector.<§case set extends§>
      {
         var §for const break§:Vector.<§case set extends§> = param1;
         var §-!H§:Vector.<§case set extends§> = §for const break§;
         return §-!H§.concat().sort(function(param1:§case set extends§, param2:§case set extends§):Number
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
      
      private function §=#,§(param1:int) : void
      {
         var _loc2_:WhiteFrame = new WhiteFrame();
         _loc2_.width = param1 * (36 + §;!N§) - §;!N§ + 4;
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

