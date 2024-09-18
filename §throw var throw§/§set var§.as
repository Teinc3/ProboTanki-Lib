package §throw var throw§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §set var§ implements §>P§
   {
      private var object:IGameObject;
      
      private var impl:§>P§;
      
      public function §set var§(param1:IGameObject, param2:§>P§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function fit() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.fit();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

