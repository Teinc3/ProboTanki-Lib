package Renamed87
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4714 implements Renamed4711
   {
      private var object:IGameObject;
      
      private var impl:Renamed4711;
      
      public function Renamed4714(param1:IGameObject, param2:Renamed4711)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed5502() : Number
      {
         var Renamed2142:Number = NaN;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed5502();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

