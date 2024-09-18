package alternativa.tanks.model.useremailandpassword
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §else for super§ implements IUserEmailAndPassword
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IUserEmailAndPassword>;
      
      public function §else for super§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IUserEmailAndPassword>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function changePassword(param1:String) : void
      {
         var i:int = 0;
         var m:IUserEmailAndPassword = null;
         var password:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.changePassword(password);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function changeEmail(param1:String) : void
      {
         var i:int = 0;
         var m:IUserEmailAndPassword = null;
         var email:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.changeEmail(email);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getEmail() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:IUserEmailAndPassword = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getEmail();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function sendChangeInstruction() : void
      {
         var i:int = 0;
         var m:IUserEmailAndPassword = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.sendChangeInstruction();
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

