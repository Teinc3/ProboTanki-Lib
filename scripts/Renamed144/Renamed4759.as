package Renamed144
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4759 implements Renamed3638
   {
      private var object:IGameObject;
      
      private var impl:Renamed3638;
      
      public function Renamed4759(param1:IGameObject, param2:Renamed3638)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getUsersCountBlue() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCountBlue();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getUsersCountRed() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCountRed();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getFriendsCountBlue() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getFriendsCountBlue();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getFriendsCountRed() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getFriendsCountRed();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

