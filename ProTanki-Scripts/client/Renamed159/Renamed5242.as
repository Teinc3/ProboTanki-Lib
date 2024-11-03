package Renamed2081
{
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   
   public class Renamed5242
   {
      private var _image:LocalizedImageResource;
      
      private var _message:String;
      
      public function Renamed5242(param1:LocalizedImageResource = null, param2:String = null)
      {
         super();
         this._image = param1;
         this._message = param2;
      }
      
      public function get image() : LocalizedImageResource
      {
         return this._image;
      }
      
      public function set image(param1:LocalizedImageResource) : void
      {
         this._image = param1;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DonationAlertCC [";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "message = " + this.message + " ";
         return _loc1_ + "]";
      }
   }
}

