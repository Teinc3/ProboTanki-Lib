package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   import Renamed136.Renamed663;
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
   import Renamed460.Renamed2657;
   import Renamed465.Renamed2658;
   
   public class Renamed2659 extends Sprite implements Renamed2658
   {
      private static var Renamed2660:Class = Renamed2661;
      
      private static var Renamed2662:Class = Renamed2663;
      
      private static var Renamed2664:Class = Renamed2665;
      
      private static var Renamed2666:Class = Renamed2667;
      
      private static var Renamed2668:Class = Renamed2669;
      
      private static const Renamed2670:uint = 16742221;
      
      private static const Renamed2671:uint = 4760319;
      
      private static const Renamed2672:uint = 9249024;
      
      private static const Renamed2673:uint = 16256;
      
      private static const Renamed2674:int = 30;
      
      private static const Renamed2675:int = 6;
      
      private var border:WhiteFrame;
      
      private var Renamed2676:Renamed2657;
      
      private var Renamed2677:Renamed2657;
      
      private var labelRed:Label;
      
      private var Renamed2678:Label;
      
      private var time:int;
      
      private var Renamed2679:Renamed2680;
      
      private var Renamed2681:Renamed2680;
      
      private var blinker:Renamed2682;
      
      public function Renamed2659()
      {
         this.Renamed2679 = new Renamed2680(Renamed2670,16777215);
         this.Renamed2681 = new Renamed2680(Renamed2671,16777215);
         this.blinker = new Renamed2682(0,1,Vector.<int>([200,600]),Vector.<Number>([10,1.1]));
         super();
         this.border = new WhiteFrame();
         addChild(this.border);
         this.labelRed = this.createLabel(Renamed2670);
         this.Renamed2678 = this.createLabel(Renamed2671);
         this.Renamed2676 = new Renamed2657(new Renamed2660(),new Renamed2664(),new Renamed2668(),this.blinker);
         this.Renamed2676.y = 5;
         addChild(this.Renamed2676);
         this.Renamed2677 = new Renamed2657(new Renamed2662(),new Renamed2666(),new Renamed2668(),this.blinker);
         this.Renamed2677.y = 5;
         addChild(this.Renamed2677);
         this.update();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private static function Renamed2683(param1:Label, param2:Renamed2680, param3:Bitmap) : void
      {
         var _loc4_:uint = 0;
         if(param3.visible)
         {
            _loc4_ = param2.interpolate(param3.alpha);
         }
         else
         {
            _loc4_ = param2.Renamed2684;
         }
         if(_loc4_ != param1.textColor)
         {
            param1.textColor = _loc4_;
         }
      }
      
      public function Renamed2685(param1:int, param2:int) : void
      {
         this.labelRed.text = param1.toString();
         this.Renamed2678.text = param2.toString();
         this.Renamed2677.setState(Renamed2657.Renamed2686);
         this.Renamed2676.setState(Renamed2657.Renamed2686);
         this.update();
      }
      
      public function set Renamed2687(param1:int) : void
      {
         if(int(this.labelRed.text) == param1)
         {
            return;
         }
         this.labelRed.text = param1.toString();
         this.Renamed2676.setState(Renamed2657.Renamed2688);
         this.update();
      }
      
      public function set Renamed2689(param1:int) : void
      {
         if(int(this.Renamed2678.text) == param1)
         {
            return;
         }
         this.Renamed2678.text = param1.toString();
         this.Renamed2677.setState(Renamed2657.Renamed2688);
         this.update();
      }
      
      public function showFlagAtBase(param1:Renamed663) : void
      {
         var _loc2_:Renamed2657 = this.Renamed2690(param1);
         _loc2_.setState(Renamed2657.Renamed2686);
      }
      
      public function showFlagCarried(param1:Renamed663) : void
      {
         var _loc2_:Renamed2657 = this.Renamed2690(param1);
         _loc2_.setState(Renamed2657.Renamed2691);
      }
      
      public function showFlagDropped(param1:Renamed663) : void
      {
         var _loc2_:Renamed2657 = this.Renamed2690(param1);
         _loc2_.setState(Renamed2657.Renamed2692);
      }
      
      public function Renamed2693(param1:Renamed663, param2:int) : void
      {
         switch(param1)
         {
            case Renamed663.BLUE:
               this.Renamed2689 = param2;
               break;
            case Renamed663.RED:
               this.Renamed2687 = param2;
         }
      }
      
      private function update() : void
      {
         var _loc1_:int = 5;
         var _loc2_:int = this.labelRed.width > this.Renamed2678.width ? int(this.labelRed.width) : int(this.Renamed2678.width);
         this.Renamed2677.x = _loc1_ + _loc1_;
         var _loc3_:int = this.Renamed2677.x + Renamed2674 + _loc1_;
         this.labelRed.x = _loc3_ + (_loc2_ - this.labelRed.width >> 1);
         _loc3_ += _loc2_ + _loc1_ + _loc1_;
         this.Renamed2678.x = _loc3_ + (_loc2_ - this.Renamed2678.width >> 1);
         _loc3_ += _loc2_ + _loc1_;
         this.Renamed2676.x = _loc3_;
         _loc3_ += Renamed2674 + _loc1_ + _loc1_;
         this.Renamed2694(_loc3_);
      }
      
      private function Renamed2694(param1:int) : void
      {
         this.border.width = param1;
         var _loc2_:String = GradientType.LINEAR;
         var _loc3_:Array = [Renamed2672,Renamed2673];
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
         _loc2_.y = Renamed2675;
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
         this.Renamed2677.update(_loc2_,_loc3_);
         this.Renamed2676.update(_loc2_,_loc3_);
         Renamed2683(this.labelRed,this.Renamed2679,this.Renamed2676.Renamed2695);
         Renamed2683(this.Renamed2678,this.Renamed2681,this.Renamed2677.Renamed2695);
      }
      
      private function Renamed2690(param1:Renamed663) : Renamed2657
      {
         switch(param1)
         {
            case Renamed663.BLUE:
               return this.Renamed2676;
            case Renamed663.RED:
               return this.Renamed2677;
            default:
               throw new ArgumentError("Unsupported team type");
         }
      }
   }
}

