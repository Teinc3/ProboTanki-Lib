package projects.tanks.client.panel.model.bonus.showing.info
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class BonusInfoCC
   {
      private var _bottomText:String;
      
      private var _image:ImageResource;
      
      private var _topText:String;
      
      public function BonusInfoCC(param1:String = null, param2:ImageResource = null, param3:String = null)
      {
         super();
         this._bottomText = param1;
         this._image = param2;
         this._topText = param3;
      }
      
      public function get bottomText() : String
      {
         return this._bottomText;
      }
      
      public function set bottomText(param1:String) : void
      {
         this._bottomText = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
      }
      
      public function get topText() : String
      {
         return this._topText;
      }
      
      public function set topText(param1:String) : void
      {
         this._topText = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BonusInfoCC [";
         _loc1_ += "bottomText = " + this.bottomText + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "topText = " + this.topText + " ";
         return _loc1_ + "]";
      }
   }
}

