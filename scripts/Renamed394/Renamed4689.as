package Renamed394
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4689 implements Renamed3074
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed3074>;
      
      public function Renamed4689(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed3074>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed3088(param1:int) : void
      {
         var Renamed3693:int = param1;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3074 = null;
         var Renamed6864:int = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3088(Renamed6864);
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed3089(param1:int) : void
      {
         var Renamed3693:int = param1;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3074 = null;
         var Renamed6864:int = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3089(Renamed6864);
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed3097(param1:int, param2:Vector3, param3:Tank, param4:Vector3) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed4951:Tank = param3;
         var Renamed8458:Vector3 = param4;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3074 = null;
         var Renamed6864:int = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         var Renamed4046:Tank = Renamed4951;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3097(Renamed6864,Renamed8459,Renamed4046,Renamed8458);
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed3098(param1:int, param2:Vector3) : void
      {
         var Renamed3693:int = param1;
         var Renamed4950:Vector3 = param2;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3074 = null;
         var Renamed6864:int = Renamed3693;
         var Renamed8459:Vector3 = Renamed4950;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed3098(Renamed6864,Renamed8459);
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

