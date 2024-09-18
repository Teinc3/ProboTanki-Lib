package Renamed74
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import Renamed349.Renamed3105;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4696 implements Renamed3436
   {
      private var object:IGameObject;
      
      private var impl:Renamed3436;
      
      public function Renamed4696(param1:IGameObject, param2:Renamed3436)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed3444(param1:ClientObject, param2:Vector3, param3:Vector.<Renamed3105>) : void
      {
         var Renamed3693:ClientObject = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed4951:Vector.<Renamed3105> = param3;
         var Renamed10264:ClientObject = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         var Renamed10263:Vector.<Renamed3105> = Renamed4951;
         try
         {
            Model.object = this.object;
            this.impl.Renamed3444(Renamed10264,Renamed8459,Renamed10263);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

