package §;"-§
{
   import §##N§.§ "$§;
   import §##N§.§'!y§;
   import §1#j§.§ #h§;
   import §1#j§.SendPresentEvent;
   import alternativa.tanks.model.garage.§null package override§;
   import alternativa.tanks.service.item.ItemService;
   import flash.events.Event;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §class case§ extends § "$§ implements §'!y§, §finally for implements§
   {
      [Inject]
      public static var itemService:ItemService;
      
      private var uid:String;
      
      private var text:String;
      
      private var price:int;
      
      private var §continue package finally§:§ #h§;
      
      private var §+#b§:IGameObject;
      
      public function §class case§()
      {
         super();
      }
      
      public function preparePresent(param1:IGameObject) : void
      {
         this.§+#b§ = param1;
         this.§continue package finally§ = new § #h§();
         this.§continue package finally§.addEventListener(SendPresentEvent.SEND_PRESENT,getFunctionWrapper(this.§with catch null§));
         this.§continue package finally§.addEventListener(Event.CANCEL,getFunctionWrapper(this.§final set null§));
      }
      
      private function §final set null§(param1:Event) : void
      {
         this.§dynamic var package§();
      }
      
      private function §dynamic var package§() : void
      {
         this.§continue package finally§.removeEventListener(SendPresentEvent.SEND_PRESENT,getFunctionWrapper(this.§with catch null§));
         this.§continue package finally§.removeEventListener(Event.CANCEL,getFunctionWrapper(this.§dynamic var package§));
         this.§continue package finally§ = null;
      }
      
      private function §with catch null§(param1:SendPresentEvent) : void
      {
         this.uid = param1.uid;
         this.text = param1.text;
         this.price = itemService.getPrice(this.§+#b§);
         this.§dynamic var package§();
         §null package override§(object.adapt(§null package override§)).showConfirmAlert(itemService.getName(this.§+#b§),this.price,itemService.getPreviewResource(this.§+#b§).data,true,-1);
      }
      
      public function confirmPresentPurchase(param1:IGameObject) : void
      {
         server.§ #1§(this.uid,param1,this.text,this.price);
      }
   }
}

