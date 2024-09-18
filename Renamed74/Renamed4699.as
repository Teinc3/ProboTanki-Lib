package Renamed74
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import Renamed349.Renamed3105;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4699 implements Renamed3436
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed3436>;
      
      public function Renamed4699(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed3436>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed3444(param1:ClientObject, param2:Vector3, param3:Vector.<Renamed3105>) : void
      {
         var Renamed3693:ClientObject = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed4951:Vector.<Renamed3105> = param3;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3436 = null;
         var Renamed10264:ClientObject = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         var Renamed10263:Vector.<Renamed3105> = Renamed4951;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3444(Renamed10264,Renamed8459,Renamed10263);
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

