package Renamed195
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4751 implements Renamed4750
   {
      private var object:IGameObject;
      
      private var impl:Renamed4750;
      
      public function Renamed4751(param1:IGameObject, param2:Renamed4750)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getEnterPrice() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getEnterPrice();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeLeftInSec() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getTimeLeftInSec();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

