package projects.tanks.client.panel.model.news.item
{
   public class NewsItemCC
   {
      private var _imageUrl:String;
      
      private var _newsDate:String;
      
      private var _newsText:String;
      
      public function NewsItemCC(param1:String = null, param2:String = null, param3:String = null)
      {
         super();
         this._imageUrl = param1;
         this._newsDate = param2;
         this._newsText = param3;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function set imageUrl(param1:String) : void
      {
         this._imageUrl = param1;
      }
      
      public function get newsDate() : String
      {
         return this._newsDate;
      }
      
      public function set newsDate(param1:String) : void
      {
         this._newsDate = param1;
      }
      
      public function get newsText() : String
      {
         return this._newsText;
      }
      
      public function set newsText(param1:String) : void
      {
         this._newsText = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "NewsItemCC [";
         _loc1_ += "imageUrl = " + this.imageUrl + " ";
         _loc1_ += "newsDate = " + this.newsDate + " ";
         _loc1_ += "newsText = " + this.newsText + " ";
         return _loc1_ + "]";
      }
   }
}

