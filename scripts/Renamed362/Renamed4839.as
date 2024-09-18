package Renamed362
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4839 implements Renamed4836
   {
      private var object:IGameObject;
      
      private var impl:Renamed4836;
      
      public function Renamed4839(param1:IGameObject, param2:Renamed4836)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed8181(param1:String) : void
      {
         var Renamed3693:String = param1;
         var Renamed8182:String = Renamed3693;
         try
         {
            Model.object = this.object;
            this.impl.Renamed8181(Renamed8182);
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

