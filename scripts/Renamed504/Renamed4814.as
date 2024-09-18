package Renamed504
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4814 extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private const Renamed10012:uint = 16777215;
      
      private const Renamed1910:int = 120;
      
      private const Renamed9966:int = 280;
      
      private const Renamed9965:int = 10;
      
      private const BOTTOM_MARGIN:int = 5;
      
      private var Renamed9968:TankWindowInner;
      
      private var Renamed10013:LabelBase;
      
      public function Renamed4814()
      {
         super();
         this.Renamed9971();
         this.Renamed9972();
         this.Renamed5203();
         this.Renamed9974();
      }
      
      private function Renamed9971() : void
      {
         this.Renamed9968 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed9968.width = Renamed4812.Renamed9928;
         addChild(this.Renamed9968);
      }
      
      private function Renamed9972() : void
      {
         var _loc1_:Bitmap = new Bitmap();
         _loc1_.x = int(this.Renamed9968.width / 2 - this.Renamed9966 / 2);
         _loc1_.y = this.Renamed9965;
         _loc1_.bitmapData = Renamed9908.Renamed10011;
         this.Renamed9968.addChild(_loc1_);
      }
      
      private function Renamed5203() : void
      {
         this.Renamed10013 = new LabelBase();
         this.Renamed10013.color = this.Renamed10012;
         this.Renamed10013.align = TextFormatAlign.CENTER;
         this.Renamed10013.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_ALL_MISSIONS_COMPLETED);
         this.Renamed10013.x = int(Renamed4812.Renamed9928 / 2 - this.Renamed10013.width / 2);
         this.Renamed10013.y = this.Renamed1910 + this.Renamed9965 * 2;
         this.Renamed9968.addChild(this.Renamed10013);
      }
      
      private function Renamed9974() : void
      {
         this.Renamed9968.height = this.Renamed10013.height + this.Renamed1910 + this.Renamed9965 * 3;
      }
      
      public function Renamed746() : int
      {
         return this.Renamed9968.height + this.BOTTOM_MARGIN;
      }
   }
}

