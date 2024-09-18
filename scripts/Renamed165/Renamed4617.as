package Renamed4614
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4617 implements Renamed4618
   {
      private var object:IGameObject;
      
      private var impl:Renamed4618;
      
      public function Renamed4617(param1:IGameObject, param2:Renamed4618)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function continueBattle() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.continueBattle();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

