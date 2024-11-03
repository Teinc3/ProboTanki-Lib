package Renamed17
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4559 implements Renamed4557
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed4557>;
      
      public function Renamed4559(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed4557>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed5393() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4557 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5393();
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5394() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4557 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5394();
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5395(param1:Renamed4556) : void
      {
         var Renamed3693:Renamed4556 = param1;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4557 = null;
         var Renamed5431:Renamed4556 = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5395(Renamed5431);
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5396() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4557 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5396();
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

