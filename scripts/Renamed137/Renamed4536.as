package Renamed137
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.bonuses.Bonus;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4536 implements Renamed2400
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed2400>;
      
      public function Renamed4536(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed2400>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed2520(param1:ClientObject, param2:String) : Bonus
      {
         var Renamed4878:ClientObject = param1;
         var Renamed3693:String = param2;
         var Renamed2142:Bonus = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2400 = null;
         var Renamed4879:String = Renamed3693;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed2520(Renamed4878,Renamed4879);
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

