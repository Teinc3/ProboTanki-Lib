package §""v§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §;G§ implements §,"3§
   {
      private var object:IGameObject;
      
      private var impl:§,"3§;
      
      public function §;G§(param1:IGameObject, param2:§,"3§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanName();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getClanLink() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanLink();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

