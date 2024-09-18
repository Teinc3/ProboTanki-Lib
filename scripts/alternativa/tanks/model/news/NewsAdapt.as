package alternativa.tanks.model.news
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class NewsAdapt implements News
   {
      private var object:IGameObject;
      
      private var impl:News;
      
      public function NewsAdapt(param1:IGameObject, param2:News)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getNewsDate() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getNewsDate();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getImageUrl() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getImageUrl();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getNewsText() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getNewsText();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

