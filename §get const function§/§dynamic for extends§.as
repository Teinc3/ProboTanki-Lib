package §get const function§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §dynamic for extends§ implements §'-§
   {
      private var object:IGameObject;
      
      private var impl:§'-§;
      
      public function §dynamic for extends§(param1:IGameObject, param2:§'-§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function isForRent() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isForRent();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

