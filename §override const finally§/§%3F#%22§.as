package §override const finally§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §?#"§ implements §default const dynamic§
   {
      private var object:IGameObject;
      
      private var impl:§default const dynamic§;
      
      public function §?#"§(param1:IGameObject, param2:§default const dynamic§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function isGrouped() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isGrouped();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

