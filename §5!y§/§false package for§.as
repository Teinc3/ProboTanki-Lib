package §5!y§
{
   import § !g§.§class for case§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.§1!"§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.§include include§;
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import controls.resultassets.WhiteFrame;
   import flash.display.Bitmap;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   import §with const extends§.§#"5§;
   import §with var import§.§continue package var§;
   
   public class §false package for§ extends Sprite implements §continue package var§
   {
      private static var §7"y§:Class = §each set dynamic§;
      
      private static var §^!U§:Class = §]!f§;
      
      private static var §continue var function§:Class = §]#a§;
      
      private static const §=#b§:uint = 16742221;
      
      private static const §#6§:uint = 4760319;
      
      private static const §8"U§:uint = 9249024;
      
      private static const §#c§:uint = 16256;
      
      private static const §return catch package§:int = 30;
      
      private static const §dynamic set each§:int = 6;
      
      private var border:WhiteFrame;
      
      private var §throw package in§:§#"5§;
      
      private var §while var include§:BattleInfoIcons;
      
      private var labelRed:Label;
      
      private var §;!a§:Label;
      
      private var time:int;
      
      private var §`!0§:§1!"§;
      
      private var blinker:§include include§;
      
      public function §false package for§()
      {
         this.§`!0§ = new §1!"§(§#6§,16777215);
         this.blinker = new §include include§(0,1,Vector.<int>([200,600]),Vector.<Number>([10,1.1]));
         super();
         this.border = new WhiteFrame();
         addChild(this.border);
         this.labelRed = this.createLabel(§=#b§);
         this.§;!a§ = this.createLabel(§#6§);
         this.§throw package in§ = new §#"5§(new §7"y§(),new §^!U§(),new §continue var function§(),this.blinker);
         this.§throw package in§.y = 5;
         addChild(this.§throw package in§);
         this.§while var include§ = new BattleInfoIcons();
         this.§while var include§.type = BattleInfoIcons.§in catch throw§;
         this.§while var include§.y = 9;
         addChild(this.§while var include§);
         this.update();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private static function §>!a§(param1:Label, param2:§1!"§, param3:Bitmap) : void
      {
         var _loc4_:uint = 0;
         if(param3.visible)
         {
            _loc4_ = param2.interpolate(param3.alpha);
         }
         else
         {
            _loc4_ = param2.§7h§;
         }
         if(_loc4_ != param1.textColor)
         {
            param1.textColor = _loc4_;
         }
      }
      
      public function §in var switch§(param1:int, param2:int) : void
      {
         this.labelRed.text = param1.toString();
         this.§;!a§.text = param2.toString();
         this.§throw package in§.setState(§#"5§.§const package while§);
         this.update();
      }
      
      public function set §override const const§(param1:int) : void
      {
         if(int(this.labelRed.text) == param1)
         {
            return;
         }
         this.labelRed.text = param1.toString();
         this.update();
      }
      
      public function set §break var for§(param1:int) : void
      {
         if(int(this.§;!a§.text) == param1)
         {
            return;
         }
         this.§;!a§.text = param1.toString();
         this.update();
      }
      
      public function showFlagAtBase() : void
      {
         this.§throw package in§.setState(§#"5§.§const package while§);
      }
      
      public function showFlagCarried() : void
      {
         this.§throw package in§.setState(§#"5§.§null package final§);
      }
      
      public function showFlagDropped() : void
      {
         this.§throw package in§.setState(§#"5§.§!#f§);
      }
      
      public function §var catch while§(param1:§class for case§, param2:int) : void
      {
         switch(param1)
         {
            case §class for case§.BLUE:
               this.§break var for§ = param2;
               break;
            case §class for case§.RED:
               this.§override const const§ = param2;
         }
      }
      
      private function update() : void
      {
         var _loc1_:int = 5;
         var _loc2_:int = this.labelRed.width > this.§;!a§.width ? int(this.labelRed.width) : int(this.§;!a§.width);
         this.§throw package in§.x = _loc1_ + _loc1_;
         var _loc3_:int = this.§throw package in§.x + §return catch package§ + _loc1_;
         this.labelRed.x = _loc3_ + (_loc2_ - this.labelRed.width >> 1);
         _loc3_ += _loc2_ + _loc1_ + _loc1_;
         this.§;!a§.x = _loc3_ + (_loc2_ - this.§;!a§.width >> 1);
         _loc3_ += _loc2_ + _loc1_;
         this.§while var include§.x = _loc3_;
         _loc3_ += 22 + _loc1_ + _loc1_;
         this.§super const each§(_loc3_);
      }
      
      private function §super const each§(param1:int) : void
      {
         this.border.width = param1;
         var _loc2_:String = GradientType.LINEAR;
         var _loc3_:Array = [§8"U§,§#c§];
         var _loc4_:Array = [1,1];
         var _loc5_:int = 8 / param1 * 255;
         var _loc6_:Array = [127 - _loc5_,127 + _loc5_];
         var _loc7_:int = 2;
         var _loc8_:Matrix = new Matrix();
         _loc8_.createGradientBox(param1 - 2 * _loc7_,this.border.height - 2 * _loc7_,0,0,0);
         var _loc9_:String = SpreadMethod.PAD;
         var _loc10_:Graphics = graphics;
         _loc10_.clear();
         _loc10_.beginGradientFill(_loc2_,_loc3_,_loc4_,_loc6_,_loc8_,_loc9_);
         _loc10_.drawRect(_loc7_,_loc7_,param1 - 2 * _loc7_,this.border.height - 2 * _loc7_);
         _loc10_.endFill();
      }
      
      private function createLabel(param1:uint) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.color = param1;
         _loc2_.size = 18;
         _loc2_.bold = true;
         _loc2_.autoSize = TextFieldAutoSize.CENTER;
         _loc2_.y = §dynamic set each§;
         _loc2_.text = "0";
         addChild(_loc2_);
         return _loc2_;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.update();
         this.time = getTimer();
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:int = _loc2_ - this.time;
         this.time = _loc2_;
         this.blinker.update(_loc2_,_loc3_);
         this.§throw package in§.update(_loc2_,_loc3_);
         §>!a§(this.§;!a§,this.§`!0§,this.§throw package in§.§null catch extends§);
      }
   }
}

