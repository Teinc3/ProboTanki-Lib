package Renamed3253
{
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4590 implements Renamed3254
   {
      private var object:IGameObject;
      
      private var impl:Renamed3254;
      
      public function Renamed4590(param1:IGameObject, param2:Renamed3254)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function createFilter(param1:String) : BitmapFilter
      {
         var result:BitmapFilter = null;
         var key:String = param1;
         try
         {
            Model.object = this.object;
            result = this.impl.createFilter(key);
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

