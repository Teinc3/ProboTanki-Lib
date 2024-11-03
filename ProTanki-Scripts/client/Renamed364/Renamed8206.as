package Renamed364
{
   import Renamed1.Renamed3193;
   import alternativa.tanks.battle.objects.tank.Tank;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4675 implements Renamed4674
   {
      private var object:IGameObject;
      
      private var impl:Renamed4674;
      
      public function Renamed4675(param1:IGameObject, param2:Renamed4674)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed3472(param1:IGameObject, param2:Tank, param3:Renamed3193) : void
      {
         var Renamed3693:IGameObject = param1;
         var Renamed4950:Tank = param2;
         var Renamed4951:Renamed3193 = param3;
         var Renamed4878:IGameObject = Renamed3693;
         var Renamed8204:Tank = Renamed4950;
         var Renamed8205:Renamed3193 = Renamed4951;
         try
         {
            Model.object = this.object;
            this.impl.Renamed3472(Renamed4878,Renamed8204,Renamed8205);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

