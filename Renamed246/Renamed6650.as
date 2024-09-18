package Renamed3253
{
   import alternativa.utils.filters.BCSHFilter;
   import Renamed320.Renamed6647;
   import flash.filters.BitmapFilter;
   
   public class Renamed6649
   {
      private var brightness:Number;
      
      private var contrast:Number;
      
      private var saturation:Number;
      
      private var hue:Number;
      
      public function Renamed6649(param1:Renamed6647)
      {
         super();
         this.brightness = param1.brightness;
         this.contrast = param1.contrast;
         this.saturation = param1.saturation;
         this.hue = param1.hue;
      }
      
      public function createFilter() : BitmapFilter
      {
         return BCSHFilter.createFilter(this.brightness,this.contrast,this.saturation,this.hue);
      }
   }
}

