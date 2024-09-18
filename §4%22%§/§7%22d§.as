package §4"%§
{
   import alternativa.utils.filters.BCSHFilter;
   import §catch catch true§.§@?§;
   import flash.filters.BitmapFilter;
   
   public class §7"d§
   {
      private var brightness:Number;
      
      private var contrast:Number;
      
      private var saturation:Number;
      
      private var hue:Number;
      
      public function §7"d§(param1:§@?§)
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

