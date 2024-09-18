package Renamed504
{
   import Renamed229.Renamed6467;
   import Renamed229.Renamed6463;
   import Renamed248.Renamed4803;
   import Renamed248.Renamed4804;
   import Renamed4808.Renamed5536;
   import alternativa.types.Long;
   import controls.TankWindowInner;
   import controls.base.ThreeLineBigButton;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class Renamed9932 extends Sprite
   {
      private const Renamed9965:int = 10;
      
      private const Renamed1910:int = 120;
      
      private const Renamed9966:int = 280;
      
      private const Renamed9967:int = 4;
      
      private var Renamed9968:TankWindowInner;
      
      private var Renamed9969:Renamed4811;
      
      private var Renamed9970:Bitmap;
      
      private var Renamed8652:ThreeLineBigButton;
      
      private var Renamed6464:Renamed5536;
      
      public function Renamed9932(param1:Renamed5536)
      {
         super();
         this.Renamed6464 = param1;
         this.Renamed9971();
         this.Renamed9972();
         this.Renamed9973();
         this.Renamed9974();
         this.Renamed9975();
      }
      
      private function Renamed9971() : void
      {
         this.Renamed9968 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed9968.width = Renamed4812.Renamed9901;
         addChild(this.Renamed9968);
      }
      
      private function Renamed9972() : void
      {
         this.Renamed9970 = new Bitmap();
         this.Renamed9970.x = int(this.Renamed9968.width / 2 - this.Renamed9966 / 2);
         this.Renamed9970.y = this.Renamed9965;
         this.Renamed9970.bitmapData = this.Renamed6464.image.data;
         this.Renamed9968.addChild(this.Renamed9970);
      }
      
      private function Renamed9973() : void
      {
         this.Renamed9969 = new Renamed4811(this.Renamed6464);
         this.Renamed9969.x = this.Renamed9965;
         this.Renamed9969.y = this.Renamed1910 + this.Renamed9965 * 2;
         this.Renamed9968.addChild(this.Renamed9969);
      }
      
      private function Renamed9975() : void
      {
         this.Renamed8652 = this.Renamed9976();
         addChild(this.Renamed8652);
         this.Renamed9977();
      }
      
      private function Renamed9976() : ThreeLineBigButton
      {
         if(this.Renamed6464.progress == this.Renamed6464.Renamed5545)
         {
            return this.Renamed9978();
         }
         return this.Renamed9979();
      }
      
      private function Renamed9979() : ThreeLineBigButton
      {
         var _loc1_:Renamed4804 = new Renamed4804();
         _loc1_.addEventListener(MouseEvent.CLICK,this.Renamed9980);
         if(this.Renamed6464.Renamed5544)
         {
            _loc1_.Renamed6720();
         }
         else
         {
            _loc1_.showButtonWithCrystals(this.Renamed6464.Renamed5547);
         }
         return ThreeLineBigButton(_loc1_);
      }
      
      private function Renamed9980(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed6463(Renamed6463.DAILY_QUEST_CHANGE,this.Renamed6464));
      }
      
      private function Renamed9978() : ThreeLineBigButton
      {
         var _loc1_:ThreeLineBigButton = new Renamed4803();
         _loc1_.addEventListener(MouseEvent.CLICK,this.Renamed9981);
         return _loc1_;
      }
      
      private function Renamed9981(param1:MouseEvent) : void
      {
         this.Renamed8652.removeEventListener(MouseEvent.CLICK,this.Renamed9981);
         dispatchEvent(new Renamed6467(Renamed6467.DAILY_QUEST_GET_PRIZE,this.Renamed6464));
      }
      
      private function Renamed9977() : void
      {
         this.Renamed8652.x = int(Renamed4812.Renamed9901 / 2 - this.Renamed8652.width / 2);
         this.Renamed8652.y = this.Renamed9968.height + Renamed4812.WINDOW_MARGIN - this.Renamed9967;
      }
      
      private function Renamed9974() : void
      {
         this.Renamed9968.height = this.Renamed9969.Renamed746() + this.Renamed1910 + this.Renamed9965 * 3;
      }
      
      public function Renamed9948(param1:Renamed5536) : void
      {
         this.Renamed6464 = param1;
         this.Renamed9970.bitmapData = param1.image.data;
         this.Renamed9969.Renamed9923(param1);
         this.Renamed9974();
         this.Renamed9977();
      }
      
      public function Renamed9956(param1:int) : void
      {
         this.Renamed9968.height = param1 - (Renamed4812.WINDOW_MARGIN + this.Renamed8652.height);
         var _loc2_:int = param1 - this.Renamed9982();
         this.Renamed9969.Renamed9924(_loc2_);
         this.Renamed8652.y = param1 - this.Renamed8652.height - this.Renamed9967;
      }
      
      public function Renamed9949(param1:int) : void
      {
         this.Renamed6464.Renamed5544 = false;
         this.Renamed6464.Renamed5547 = param1;
         Renamed4804(this.Renamed8652).showButtonWithCrystals(param1);
      }
      
      public function Renamed746() : int
      {
         return this.Renamed9969.Renamed746() + this.Renamed9982();
      }
      
      private function Renamed9982() : int
      {
         return this.Renamed1910 + this.Renamed9965 * 3 + Renamed4812.WINDOW_MARGIN + this.Renamed8652.height;
      }
      
      public function Renamed9947() : Long
      {
         return this.Renamed6464.questId;
      }
      
      public function Renamed9962() : void
      {
         var _loc1_:Renamed4804 = Renamed4804(this.Renamed8652);
         _loc1_.removeEventListener(MouseEvent.CLICK,this.Renamed9980);
         _loc1_.removeListeners();
      }
      
      public function Renamed9945() : Boolean
      {
         return this.Renamed8652 is Renamed4804;
      }
      
      public function Renamed9946() : void
      {
         this.Renamed8652.enabled = false;
      }
      
      public function Renamed9963() : void
      {
         this.Renamed8652.enabled = true;
      }
   }
}

