package Renamed259
{
   import Renamed1.Renamed3193;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4737 implements Renamed3255
   {
      private var object:IGameObject;
      
      private var impl:Renamed3255;
      
      public function Renamed4737(param1:IGameObject, param2:Renamed3255)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed3262(param1:String) : Renamed3193
      {
         var Renamed3693:String = param1;
         var Renamed2142:Renamed3193 = null;
         var Renamed6805:String = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed3262(Renamed6805);
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

