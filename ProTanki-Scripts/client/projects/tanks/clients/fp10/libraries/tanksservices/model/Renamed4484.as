package projects.tanks.clients.fp10.libraries.tanksservices.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4484 implements IFriends
   {
      private var object:IGameObject;
      
      private var impl:IFriends;
      
      public function Renamed4484(param1:IGameObject, param2:IFriends)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function isLocal() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isLocal();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

