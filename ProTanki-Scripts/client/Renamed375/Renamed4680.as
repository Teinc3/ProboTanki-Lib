package Renamed375
{
   import Renamed361.Renamed5339;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4680 implements Renamed2767
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed2767>;
      
      public function Renamed4680(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed2767>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed2834() : Renamed5339
      {
         var Renamed2142:Renamed5339 = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2767 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed2834();
               Renamed2143++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return Renamed2142;
      }
   }
}

