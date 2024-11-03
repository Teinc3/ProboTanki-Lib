package projects.tanks.client.panel.model.news.showing
{
   import projects.tanks.client.panel.model.news.item.NewsItemCC;
   
   public class NewsShowingCC
   {
      private var _newsItems:Vector.<NewsItemCC>;
      
      public function NewsShowingCC(param1:Vector.<NewsItemCC> = null)
      {
         super();
         this._newsItems = param1;
      }
      
      public function get newsItems() : Vector.<NewsItemCC>
      {
         return this._newsItems;
      }
      
      public function set newsItems(param1:Vector.<NewsItemCC>) : void
      {
         this._newsItems = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "NewsShowingCC [";
         _loc1_ += "newsItems = " + this.newsItems + " ";
         return _loc1_ + "]";
      }
   }
}

