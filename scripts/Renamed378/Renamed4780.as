package Renamed378
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4780 implements Renamed2094
   {
      private var object:IGameObject;
      
      private var impl:Renamed2094;
      
      public function Renamed4780(param1:IGameObject, param2:Renamed2094)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function isForRent() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isForRent();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

