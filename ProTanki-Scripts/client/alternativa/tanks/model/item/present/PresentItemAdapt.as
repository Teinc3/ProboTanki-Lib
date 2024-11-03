package alternativa.tanks.model.item.present
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.present.PresentItemCC;
   
   public class PresentItemAdapt implements PresentItem
   {
      private var object:IGameObject;
      
      private var impl:PresentItem;
      
      public function PresentItemAdapt(param1:IGameObject, param2:PresentItem)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getText() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getText();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getPresenterId() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getPresenterId();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getDate() : Date
      {
         var result:Date = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getDate();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getImage() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getImage();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getConstructor() : PresentItemCC
      {
         var result:PresentItemCC = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getConstructor();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

