package Renamed74
{
   import alternativa.math.Vector3;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed4697 implements Renamed76
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed76>;
      
      public function Renamed4697(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed76>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed3458(param1:int, param2:Vector3, param3:Vector.<Renamed667>) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed4951:Vector.<Renamed667> = param3;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed76 = null;
         var Renamed6864:int = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         var Renamed10263:Vector.<Renamed667> = Renamed4951;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3458(Renamed6864,Renamed8459,Renamed10263);
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed3459(param1:int, param2:Vector3) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed76 = null;
         var Renamed6864:int = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3459(Renamed6864,Renamed8459);
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

