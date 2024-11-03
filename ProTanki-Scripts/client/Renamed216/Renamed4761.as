package Renamed216
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4761 implements Renamed3639
   {
      private var object:IGameObject;
      
      private var impl:Renamed3639;
      
      public function Renamed4761(param1:IGameObject, param2:Renamed3639)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getUsersCount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getFriendsCount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getFriendsCount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

