package §do static§
{
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   
   public class §0!1§
   {
      private var _preview:LocalizedImageResource;
      
      public function §0!1§(param1:LocalizedImageResource = null)
      {
         super();
         this._preview = param1;
      }
      
      public function get preview() : LocalizedImageResource
      {
         return this._preview;
      }
      
      public function set preview(param1:LocalizedImageResource) : void
      {
         this._preview = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TipItemCC [";
         _loc1_ += "preview = " + this.preview + " ";
         return _loc1_ + "]";
      }
   }
}

