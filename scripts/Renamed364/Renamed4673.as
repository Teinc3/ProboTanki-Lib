package Renamed364
{
   import Renamed1.Renamed3193;
   import alternativa.tanks.battle.objects.tank.Tank;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4673 implements Renamed4674
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed4674>;
      
      public function Renamed4673(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed4674>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed3472(param1:IGameObject, param2:Tank, param3:Renamed3193) : void
      {
         var Renamed3693:IGameObject = param1;
         var Renamed4950:Tank = param2;
         var Renamed4951:Renamed3193 = param3;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4674 = null;
         var Renamed4878:IGameObject = Renamed3693;
         var Renamed8204:Tank = Renamed4950;
         var Renamed8205:Renamed3193 = Renamed4951;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3472(Renamed4878,Renamed8204,Renamed8205);
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

