package §case var include§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §default var dynamic§ implements §switch set false§
   {
      private var object:IGameObject;
      
      private var impl:§switch set false§;
      
      public function §default var dynamic§(param1:IGameObject, param2:§switch set false§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function checkInvite(param1:String) : void
      {
         var inviteCode:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.checkInvite(inviteCode);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

