package Renamed2090
{
   import Renamed149.Renamed5057;
   import Renamed149.Renamed4764;
   import Renamed233.Renamed4768;
   import Renamed233.SendPresentEvent;
   import alternativa.tanks.model.garage.Renamed2095;
   import alternativa.tanks.service.item.ItemService;
   import flash.events.Event;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4772 extends Renamed5057 implements Renamed4764, Renamed2092
   {
      [Inject]
      public static var itemService:ItemService;
      
      private var uid:String;
      
      private var text:String;
      
      private var price:int;
      
      private var Renamed7423:Renamed4768;
      
      private var Renamed5557:IGameObject;
      
      public function Renamed4772()
      {
         super();
      }
      
      public function preparePresent(param1:IGameObject) : void
      {
         this.Renamed5557 = param1;
         this.Renamed7423 = new Renamed4768();
         this.Renamed7423.addEventListener(SendPresentEvent.SEND_PRESENT,getFunctionWrapper(this.Renamed7424));
         this.Renamed7423.addEventListener(Event.CANCEL,getFunctionWrapper(this.Renamed7425));
      }
      
      private function Renamed7425(param1:Event) : void
      {
         this.Renamed7426();
      }
      
      private function Renamed7426() : void
      {
         this.Renamed7423.removeEventListener(SendPresentEvent.SEND_PRESENT,getFunctionWrapper(this.Renamed7424));
         this.Renamed7423.removeEventListener(Event.CANCEL,getFunctionWrapper(this.Renamed7426));
         this.Renamed7423 = null;
      }
      
      private function Renamed7424(param1:SendPresentEvent) : void
      {
         this.uid = param1.uid;
         this.text = param1.text;
         this.price = itemService.getPrice(this.Renamed5557);
         this.Renamed7426();
         Renamed2095(object.adapt(Renamed2095)).showConfirmAlert(itemService.getName(this.Renamed5557),this.price,itemService.getPreviewResource(this.Renamed5557).data,true,-1);
      }
      
      public function confirmPresentPurchase(param1:IGameObject) : void
      {
         server.Renamed5071(this.uid,param1,this.text,this.price);
      }
   }
}

