package Renamed487
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4638 implements Renamed4637
   {
      private var object:IGameObject;
      
      private var impl:Renamed4637;
      
      public function Renamed4638(param1:IGameObject, param2:Renamed4637)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed5370() : Renamed5336
      {
         var Renamed2142:Renamed5336 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed5370();
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

