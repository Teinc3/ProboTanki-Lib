package alternativa.tanks.service.item
{
   import flash.events.Event;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §^"y§ extends Event
   {
      public static var §3#!§:String = "ItemEvents:OnItemAdded";
      
      private var item:IGameObject;
      
      public function §^"y§(param1:String, param2:IGameObject)
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

