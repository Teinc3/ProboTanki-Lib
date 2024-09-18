package Renamed137
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.bonuses.Bonus;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4537 implements Renamed2400
   {
      private var object:IGameObject;
      
      private var impl:Renamed2400;
      
      public function Renamed4537(param1:IGameObject, param2:Renamed2400)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed2520(param1:ClientObject, param2:String) : Bonus
      {
         var Renamed4878:ClientObject = param1;
         var Renamed3693:String = param2;
         var Renamed2142:Bonus = null;
         var Renamed4879:String = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2142 = this.impl.Renamed2520(Renamed4878,Renamed4879);
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

