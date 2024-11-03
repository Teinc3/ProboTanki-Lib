package Renamed259
{
   import Renamed1.Renamed3193;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4599 implements Renamed3255
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed3255>;
      
      public function Renamed4599(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed3255>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed3262(param1:String) : Renamed3193
      {
         var Renamed3693:String = param1;
         var Renamed2142:Renamed3193 = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3255 = null;
         var Renamed6805:String = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed3262(Renamed6805);
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

