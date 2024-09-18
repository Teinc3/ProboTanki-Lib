package Renamed224
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4579 implements Renamed4580
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed4580>;
      
      public function Renamed4579(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed4580>();
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
         var Renamed2144:Renamed4580 = null;
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
         var Renamed2144:Renamed4580 = null;
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
      
      public function Renamed6326() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4580 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed6326();
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed6327() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4580 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed6327();
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5395(param1:int) : void
      {
         var Renamed3693:int = param1;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4580 = null;
         var Renamed6328:int = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5395(Renamed6328);
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5396(param1:int) : void
      {
         var Renamed3693:int = param1;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed4580 = null;
         var Renamed6328:int = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5396(Renamed6328);
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

