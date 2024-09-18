package §final set continue§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §]"y§ implements §=n§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§=n§>;
      
      public function §]"y§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§=n§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function §;#o§(param1:String) : void
      {
         var §for const break§:String = param1;
         var §final package§:int = 0;
         var §finally const catch§:§=n§ = null;
         var §@#$§:String = §for const break§;
         try
         {
            Model.object = this.object;
            §final package§ = 0;
            while(§final package§ < this.impl.length)
            {
               §finally const catch§ = this.impl[§final package§];
               §finally const catch§.§;#o§(§@#$§);
               §final package§++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function sendUsersRestorePasswordLink(param1:String) : void
      {
         var i:int = 0;
         var m:§=n§ = null;
         var email:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.sendUsersRestorePasswordLink(email);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function changePasswordAndEmail(param1:String, param2:String) : void
      {
         var i:int = 0;
         var m:§=n§ = null;
         var newPassword:String = param1;
         var newEmail:String = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.changePasswordAndEmail(newPassword,newEmail);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

