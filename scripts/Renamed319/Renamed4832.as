package Renamed319
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4832 implements Renamed4834
   {
      private var object:IGameObject;
      
      private var impl:Renamed4834;
      
      public function Renamed4832(param1:IGameObject, param2:Renamed4834)
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

