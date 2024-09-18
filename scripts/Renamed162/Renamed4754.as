package Renamed1580
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4754 implements Renamed1581
   {
      private var object:IGameObject;
      
      private var impl:Renamed1581;
      
      public function Renamed4754(param1:IGameObject, param2:Renamed1581)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanName();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getClanLink() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanLink();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

