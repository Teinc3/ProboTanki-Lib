package alternativa.tanks.model.info
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.info.§?S§;
   
   public class §return var catch§ implements §with var while§
   {
      private var object:IGameObject;
      
      private var impl:§with var while§;
      
      public function §return var catch§(param1:IGameObject, param2:§with var while§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getConstructor() : §?S§
      {
         var result:§?S§ = null;
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
      
      public function getPreviewResource() : ImageResource
      {
         var result:ImageResource = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getPreviewResource();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

