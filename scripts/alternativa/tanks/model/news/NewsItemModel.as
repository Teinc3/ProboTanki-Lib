package alternativa.tanks.model.news
{
   import projects.tanks.client.panel.model.news.item.INewsItemModelBase;
   import projects.tanks.client.panel.model.news.item.NewsItemModelBase;
   
   public class NewsItemModel extends NewsItemModelBase implements INewsItemModelBase, News
   {
      public function NewsItemModel()
      {
         super();
      }
      
      public function getNewsDate() : String
      {
         return getInitParam().newsDate;
      }
      
      public function getImageUrl() : String
      {
         return getInitParam().imageUrl;
      }
      
      public function getNewsText() : String
      {
         return getInitParam().newsText;
      }
   }
}

