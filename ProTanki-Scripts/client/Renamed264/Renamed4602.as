package Renamed264
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4602 implements Renamed508
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed508>;
      
      public function Renamed4602(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed508>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed5996() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed508 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5996();
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5995() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed508 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed5995();
               Renamed2143++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed2843() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed508 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed2843();
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

