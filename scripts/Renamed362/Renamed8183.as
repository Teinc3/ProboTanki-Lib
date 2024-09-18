package Renamed362
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4837 implements Renamed4836
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed4836>;
      
      public function Renamed4837(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed4836>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed8181(param1:String) : void
      {
         var Renamed3693:String = param1;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4836 = null;
         var Renamed8182:String = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed8181(Renamed8182);
               Renamed2143++;
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
         var m:Renamed4836 = null;
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
         var m:Renamed4836 = null;
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

