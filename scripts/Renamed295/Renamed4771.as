package Renamed2090
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4771 implements Renamed2092
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed2092>;
      
      public function Renamed4771(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed2092>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function preparePresent(param1:IGameObject) : void
      {
         var i:int = 0;
         var m:Renamed2092 = null;
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.preparePresent(presentItem);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function confirmPresentPurchase(param1:IGameObject) : void
      {
         var i:int = 0;
         var m:Renamed2092 = null;
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.confirmPresentPurchase(presentItem);
               i++;
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

