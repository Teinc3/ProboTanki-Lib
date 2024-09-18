package Renamed264
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4601 implements Renamed508
   {
      private var object:IGameObject;
      
      private var impl:Renamed508;
      
      public function Renamed4601(param1:IGameObject, param2:Renamed508)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function Renamed5996() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed5996();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed5995() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed5995();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function Renamed2843() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.Renamed2843();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

