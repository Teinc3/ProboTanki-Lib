package Renamed462
{
   import alternativa.object.ClientObject;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4723 implements Renamed3122
   {
      private var object:IGameObject;
      
      private var impl:Renamed3122;
      
      public function Renamed4723(param1:IGameObject, param2:Renamed3122)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed3126(param1:ClientObject) : Renamed3075
      {
         var Renamed4878:ClientObject = param1;
         var Renamed2142:Renamed3075 = null;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed3126(Renamed4878);
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

