package alternativa.tanks.service.temporaryitem
{
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed565 implements ITemporaryItemService
   {
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      private var items:Dictionary;
      
      public function Renamed565()
      {
         super();
         this.items = new Dictionary();
      }
      
      public function Renamed2146(param1:IGameObject) : Number
      {
         var _loc2_:Renamed3790 = this.items[param1];
         if(_loc2_ != null)
         {
            return _loc2_.Renamed3791;
         }
         return 0;
      }
      
      public function Renamed2147(param1:IGameObject, param2:int) : void
      {
         var _loc3_:Renamed3790 = new Renamed3790(param1,param2);
         this.items[param1] = _loc3_;
         _loc3_.addEventListener(Event.COMPLETE,this.Renamed3792);
      }
      
      public function Renamed2148(param1:IGameObject) : void
      {
         var _loc2_:Renamed3790 = this.items[param1];
         if(_loc2_ != null)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.Renamed3792);
            _loc2_.destroy();
            delete this.items[param1];
         }
      }
      
      private function Renamed3792(param1:Event) : void
      {
         var _loc2_:IGameObject = Renamed3790(param1.target).item;
         temporaryItemNotifyService.Renamed3793(_loc2_);
         delete this.items[_loc2_];
      }
   }
}

