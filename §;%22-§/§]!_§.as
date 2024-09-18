package §;"-§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §]!_§ implements §[Z§
   {
      private var object:IGameObject;
      
      private var impl:§[Z§;
      
      public function §]!_§(param1:IGameObject, param2:§[Z§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function removePresent(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.removePresent(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

