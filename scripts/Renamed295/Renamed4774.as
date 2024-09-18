package Renamed2090
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4774 implements Renamed2092
   {
      private var object:IGameObject;
      
      private var impl:Renamed2092;
      
      public function Renamed4774(param1:IGameObject, param2:Renamed2092)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function preparePresent(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.preparePresent(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function confirmPresentPurchase(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.confirmPresentPurchase(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

