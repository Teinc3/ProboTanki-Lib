package Renamed74
{
   import alternativa.math.Vector3;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed4698 implements Renamed76
   {
      private var object:IGameObject;
      
      private var impl:Renamed76;
      
      public function Renamed4698(param1:IGameObject, param2:Renamed76)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed3458(param1:int, param2:Vector3, param3:Vector.<Renamed667>) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed4951:Vector.<Renamed667> = param3;
         var Renamed6864:int = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         var Renamed10263:Vector.<Renamed667> = Renamed4951;
         try
         {
            Model.object = this.object;
            this.impl.Renamed3458(Renamed6864,Renamed8459,Renamed10263);
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
         var Renamed6864:int = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         try
         {
            Model.object = this.object;
            this.impl.Renamed3459(Renamed6864,Renamed8459);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

