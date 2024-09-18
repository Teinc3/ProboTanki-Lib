package §'#r§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §var set switch§ implements §in const if§
   {
      private var object:IGameObject;
      
      private var impl:§in const if§;
      
      public function §var set switch§(param1:IGameObject, param2:§in const if§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getEnterPrice() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getEnterPrice();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeLeftInSec() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getTimeLeftInSec();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

