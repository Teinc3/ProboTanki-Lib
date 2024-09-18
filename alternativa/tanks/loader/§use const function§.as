package alternativa.tanks.loader
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class §use const function§ extends MovieClipLoaderAsset
   {
      private static var bytes:ByteArray = null;
      
      public var §3"v§:Class;
      
      public function §use const function§()
      {
         this.§3"v§ = §;#S§;
         super();
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.§3"v§());
         }
         return bytes;
      }
   }
}

