package Renamed407
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4783 implements Renamed3678
   {
      private var object:IGameObject;
      
      private var impl:Renamed3678;
      
      public function Renamed4783(param1:IGameObject, param2:Renamed3678)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function isGrouped() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.isGrouped();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

