package alternativa.tanks.loader
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class Renamed2044 extends MovieClipLoaderAsset
   {
      private static var bytes:ByteArray = null;
      
      public var Renamed2064:Class;
      
      public function Renamed2044()
      {
         this.Renamed2064 = Renamed2063;
         super();
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.Renamed2064());
         }
         return bytes;
      }
   }
}

