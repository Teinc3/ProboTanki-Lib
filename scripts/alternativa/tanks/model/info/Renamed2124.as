package alternativa.tanks.model.info
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.info.Renamed2118;
   
   public class Renamed2124 implements Renamed2120
   {
      private var object:IGameObject;
      
      private var impl:Renamed2120;
      
      public function Renamed2124(param1:IGameObject, param2:Renamed2120)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getConstructor() : Renamed2118
      {
         var result:Renamed2118 = null;
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

