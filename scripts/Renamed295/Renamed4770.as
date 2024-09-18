package Renamed2090
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4770 implements Renamed2091
   {
      private var object:IGameObject;
      
      private var impl:Renamed2091;
      
      public function Renamed4770(param1:IGameObject, param2:Renamed2091)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function removePresent(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.removePresent(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

