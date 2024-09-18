package Renamed430
{
   import Renamed4805.Renamed4806;
   import flash.display.Bitmap;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed2235 extends Renamed4806
   {
      private static const Renamed8855:Class = Renamed8856;
      
      public function Renamed2235(param1:String)
      {
         this.preview = new Bitmap(new Renamed8855().bitmapData);
         super(param1,localeService.getText(TanksLocale.TEXT_PROMO_CODE_SHOP_LABEL));
         Renamed7142();
      }
      
      override protected function align() : void
      {
         super.align();
         if(preview != null)
         {
            preview.y += 4;
            preview.x -= PADDING;
         }
      }
   }
}

