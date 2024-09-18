package alternativa.tanks.service.temporaryitem
{
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §in do§ implements ITemporaryItemService
   {
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      private var items:Dictionary;
      
      public function §in do§()
      {
         super();
         this.items = new Dictionary();
      }
      
      public function §native const set§(param1:IGameObject) : Number
      {
         var _loc2_:§include for§ = this.items[param1];
         if(_loc2_ != null)
         {
            return _loc2_.§switch const with§;
         }
         return 0;
      }
      
      public function §try in§(param1:IGameObject, param2:int) : void
      {
         var _loc3_:§include for§ = new §include for§(param1,param2);
         this.items[param1] = _loc3_;
         _loc3_.addEventListener(Event.COMPLETE,this.§"#h§);
      }
      
      public function §-",§(param1:IGameObject) : void
      {
         var _loc2_:§include for§ = this.items[param1];
         if(_loc2_ != null)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.§"#h§);
            _loc2_.destroy();
            delete this.items[param1];
         }
      }
      
      private function §"#h§(param1:Event) : void
      {
         var _loc2_:IGameObject = §include for§(param1.target).item;
         temporaryItemNotifyService.§while for catch§(_loc2_);
         delete this.items[_loc2_];
      }
   }
}

