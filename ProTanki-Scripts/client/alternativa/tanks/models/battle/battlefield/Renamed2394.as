package alternativa.tanks.models.battle.battlefield
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed2394 implements Renamed2311
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed2311>;
      
      public function Renamed2394(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed2311>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function Renamed2312() : void
      {
         var Renamed2143:int = 0;
         var Renamed2144:Renamed2311 = null;
         try
         {
            Model.object = this.object;
            Renamed2143 = 0;
            while(Renamed2143 < this.impl.length)
            {
               Renamed2144 = this.impl[Renamed2143];
               Renamed2144.Renamed2312();
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

