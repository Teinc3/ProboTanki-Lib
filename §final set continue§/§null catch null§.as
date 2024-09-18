package §final set continue§
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §null catch null§ implements §=n§
   {
      private var object:IGameObject;
      
      private var impl:§=n§;
      
      public function §null catch null§(param1:IGameObject, param2:§=n§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function §;#o§(param1:String) : void
      {
         var §for const break§:String = param1;
         var §@#$§:String = §for const break§;
         try
         {
            Model.object = this.object;
            this.impl.§;#o§(§@#$§);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function sendUsersRestorePasswordLink(param1:String) : void
      {
         var email:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.sendUsersRestorePasswordLink(email);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function changePasswordAndEmail(param1:String, param2:String) : void
      {
         var newPassword:String = param1;
         var newEmail:String = param2;
         try
         {
            Model.object = this.object;
            this.impl.changePasswordAndEmail(newPassword,newEmail);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

