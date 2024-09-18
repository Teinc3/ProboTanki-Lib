package alternativa.tanks.service.item
{
   import flash.events.Event;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed3686 extends Event
   {
      public static var Renamed3687:String = "ItemEvents:OnItemAdded";
      
      private var item:IGameObject;
      
      public function Renamed3686(param1:String, param2:IGameObject)
      {
         super(param1);
         this.item = param2;
      }
      
      public function getItem() : IGameObject
      {
         return this.item;
      }
   }
}

