package Renamed484
{
   import Renamed466.Renamed4810;
   import controls.base.LabelBase;
   import flash.text.TextFieldAutoSize;
   
   public class Renamed4047 extends MainPanelDailyQuestButton
   {
      private const Renamed9552:int = 72;
      
      private const Renamed9553:int = -4;
      
      private const Renamed9554:int = 18;
      
      private const Renamed9555:int = 4;
      
      private var Renamed9556:LabelBase;
      
      public function Renamed4047()
      {
         super();
         this.Renamed9556 = new LabelBase();
         this.Renamed9556.x = this.Renamed9554;
         this.Renamed9556.y = this.Renamed9555;
         this.Renamed9556.width = this.width - this.Renamed9554;
         this.Renamed9556.autoSize = TextFieldAutoSize.CENTER;
         this.Renamed9556.mouseEnabled = false;
         addChild(this.Renamed9556);
         var _loc1_:Renamed4810 = new Renamed4810();
         addChild(_loc1_);
         _loc1_.x = this.Renamed9552;
         _loc1_.y = this.Renamed9553;
      }
      
      override public function set label(param1:String) : void
      {
         this.Renamed9556.htmlText = param1;
      }
   }
}

