package Renamed504
{
   import Renamed225.Renamed5522;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import controls.TankWindowInner;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4813 extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const leftProgressResource:Class = Renamed9984;
      
      private static const centerProgressResource:Class = Renamed9985;
      
      private static const Renamed9986:int = 570;
      
      public static const HEIGHT:int = 50;
      
      private static const Renamed9987:int = 7;
      
      private static const SPACE:int = 5;
      
      private static const Renamed9988:int = 5;
      
      private static const Renamed9966:int = 44;
      
      private var leftProgressPart:Bitmap;
      
      private var centerProgressPart:Bitmap;
      
      private var Renamed9989:TankWindowInner;
      
      private var Renamed9990:Bitmap;
      
      private var Renamed9991:Bitmap;
      
      private var Renamed9992:MouseDisabledLabel;
      
      private var Renamed6370:int;
      
      private var Renamed9993:Boolean;
      
      private var Renamed6372:Bitmap;
      
      private var Renamed6373:Bitmap;
      
      private var blinkEffect:BlinkEffect;
      
      private var Renamed9994:int;
      
      public function Renamed4813()
      {
         this.leftProgressPart = new Bitmap(new leftProgressResource().bitmapData);
         this.centerProgressPart = new Bitmap(new centerProgressResource().bitmapData);
         this.Renamed9990 = new Bitmap();
         this.Renamed9991 = new Bitmap();
         this.Renamed9992 = new MouseDisabledLabel();
         this.Renamed6372 = new Bitmap();
         this.Renamed6373 = new Bitmap();
         this.blinkEffect = new BlinkEffect(0.3,0.6);
         super();
      }
      
      public function init(param1:Renamed5522) : void
      {
         this.Renamed6370 = param1.Renamed6370;
         this.Renamed9993 = param1.Renamed6371;
         this.Renamed9995(param1);
      }
      
      private function Renamed9995(param1:Renamed5522) : void
      {
         this.Renamed6372.bitmapData = param1.Renamed6372.data;
         this.Renamed6372.x = 0;
         this.Renamed6372.y = SPACE + 4;
         addChild(this.Renamed6372);
         this.Renamed6373.bitmapData = param1.Renamed6373.data;
         this.Renamed6373.x = this.Renamed9994 - SPACE;
         this.Renamed6373.y = 2 * SPACE + 4;
         addChild(this.Renamed6373);
      }
      
      public function redraw(param1:int) : void
      {
         this.Renamed9994 = param1 - 2 * Renamed9966 - 2 * Renamed9988;
         this.Renamed9996();
      }
      
      public function Renamed9959(param1:int) : void
      {
         if(!this.Renamed9993)
         {
            ++this.Renamed6370;
            this.Renamed9993 = true;
         }
         this.redraw(param1);
      }
      
      private function Renamed9996() : void
      {
         this.Renamed9997();
         this.Renamed9998();
         this.Renamed9999();
         this.Renamed10000();
      }
      
      private function Renamed10000() : void
      {
         this.Renamed9992.visible = this.Renamed9994 > Renamed9986;
      }
      
      private function Renamed9997() : void
      {
         this.Renamed6373.x = this.Renamed9994 + Renamed9966 + 2 * Renamed9988;
      }
      
      private function Renamed9998() : void
      {
         if(this.Renamed9989 == null)
         {
            this.Renamed9989 = new TankWindowInner(this.Renamed9994,HEIGHT,TankWindowInner.GREEN);
            this.Renamed9989.x = Renamed9966 + Renamed9988;
            this.Renamed9989.y = SPACE;
            addChild(this.Renamed9989);
            this.Renamed9990.x = Renamed9966 + Renamed9988 + 1;
            this.Renamed9990.y = SPACE + 1;
            this.Renamed9990.blendMode = BlendMode.OVERLAY;
            addChild(this.Renamed9990);
            this.Renamed9991.y = SPACE + 1;
            this.Renamed9991.blendMode = BlendMode.OVERLAY;
            addChild(this.Renamed9991);
            this.Renamed9992.x = Renamed9966 + Renamed9988 + SPACE;
            this.Renamed9992.y = 4 * SPACE;
            this.Renamed9992.text = localeService.getText(TanksLocale.TEXT_WEEKLY_QUEST_HINT);
            addChild(this.Renamed9992);
         }
         this.Renamed9989.width = this.Renamed9994;
      }
      
      private function Renamed9999() : void
      {
         var _loc1_:Shape = null;
         var _loc2_:Graphics = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Shape = null;
         var _loc6_:Graphics = null;
         this.blinkEffect.stop();
         var _loc7_:Number = this.Renamed9994 * 1 / Renamed9987;
         var _loc8_:int = _loc7_ * this.Renamed6370;
         if(this.Renamed6370 != 0)
         {
            this.Renamed9990.bitmapData = new BitmapData(_loc8_,this.leftProgressPart.height,true,0);
            this.Renamed9990.bitmapData.draw(this.leftProgressPart);
            if(_loc8_ > this.leftProgressPart.width)
            {
               this.centerProgressPart.width = Math.min(_loc8_ - this.leftProgressPart.width,this.Renamed9994 - this.leftProgressPart.width * 2) - 2;
               _loc1_ = new Shape();
               _loc2_ = _loc1_.graphics;
               _loc2_.beginBitmapFill(this.centerProgressPart.bitmapData);
               _loc2_.drawRect(this.leftProgressPart.width,0,this.centerProgressPart.width,this.centerProgressPart.height);
               _loc2_.endFill();
               this.Renamed9990.bitmapData.draw(_loc1_);
            }
            if(this.Renamed6370 == Renamed9987)
            {
               this.Renamed9990.bitmapData.draw(this.leftProgressPart,new Matrix(-1,0,0,1,this.Renamed9994 - 2,0));
            }
         }
         if(!this.Renamed9993)
         {
            _loc3_ = _loc7_;
            _loc4_ = 0;
            this.Renamed9991.bitmapData = new BitmapData(this.Renamed9994 - _loc8_,this.leftProgressPart.height,true,0);
            if(this.Renamed6370 == 0)
            {
               this.Renamed9991.bitmapData.draw(this.leftProgressPart);
               _loc3_ = _loc7_ - this.leftProgressPart.width;
               _loc4_ = this.leftProgressPart.width;
            }
            if(this.Renamed6370 == 6)
            {
               this.Renamed9991.bitmapData.draw(this.leftProgressPart,new Matrix(-1,0,0,1,this.Renamed9994 - _loc8_,0));
               _loc3_ = this.Renamed9994 - _loc8_ - this.leftProgressPart.width;
            }
            this.centerProgressPart.width = _loc3_;
            _loc5_ = new Shape();
            (_loc6_ = _loc5_.graphics).beginBitmapFill(this.centerProgressPart.bitmapData);
            _loc6_.drawRect(_loc4_,0,this.centerProgressPart.width,this.centerProgressPart.height);
            _loc6_.endFill();
            this.Renamed9991.bitmapData.draw(_loc5_);
            this.Renamed9991.x = this.Renamed9990.x + this.Renamed9990.width - (this.Renamed6370 == 0 ? 0 : 2);
            this.blinkEffect.start(this.Renamed9991);
         }
         else
         {
            this.Renamed9991.visible = false;
         }
      }
   }
}

