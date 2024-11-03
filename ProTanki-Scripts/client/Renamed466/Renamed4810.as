package Renamed466
{
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.Renamed3655;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class Renamed4810 extends Sprite
   {
      [Inject]
      public static var Renamed4827:DailyQuestNotifierService;
      
      private static var Renamed9317:Class = Renamed9316;
      
      private static var Renamed9318:BitmapData = Bitmap(new Renamed9317()).bitmapData;
      
      public function Renamed4810()
      {
         super();
         var _loc1_:Bitmap = new Bitmap(Renamed9318);
         addChild(_loc1_);
         visible = false;
         Renamed4827.addEventListener(Renamed3655.Renamed3656,this.Renamed9319);
         Renamed4827.addEventListener(Renamed3655.Renamed3657,this.Renamed3663);
      }
      
      private function Renamed3663(param1:Renamed3655) : void
      {
         visible = false;
      }
      
      private function Renamed9319(param1:Renamed3655) : void
      {
         visible = true;
      }
   }
}

