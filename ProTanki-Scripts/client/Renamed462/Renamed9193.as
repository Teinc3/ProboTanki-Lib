package Renamed462
{
   import alternativa.object.ClientObject;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4722 implements Renamed3122
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed3122>;
      
      public function Renamed4722(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed3122>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed3126(param1:ClientObject) : Renamed3075
      {
         var Renamed4878:ClientObject = param1;
         var Renamed2142:Renamed3075 = null;
         var Renamed2143:int = 0;
         var Renamed2144:Renamed3122 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2142 = Renamed2144.Renamed3126(Renamed4878);
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

