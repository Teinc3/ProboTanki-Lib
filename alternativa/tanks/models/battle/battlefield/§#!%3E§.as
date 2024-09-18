package alternativa.tanks.models.battle.battlefield
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §#!>§ implements §]#P§
   {
      private var object:IGameObject;
      
      private var impl:§]#P§;
      
      public function §#!>§(param1:IGameObject, param2:§]#P§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §continue catch var§() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.§continue catch var§();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

