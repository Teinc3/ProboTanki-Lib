package alternativa.tanks.models.battle.battlefield
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed2310 implements Renamed2311
   {
      private var object:IGameObject;
      
      private var impl:Renamed2311;
      
      public function Renamed2310(param1:IGameObject, param2:Renamed2311)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed2312() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed2312();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

