package alternativa.tanks.model.shop
{
   import Renamed266.Renamed2217;
   import Renamed266.SendPromoCodeEvent;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.panel.IPanelView;
   import Renamed348.Renamed2218;
   import flash.events.Event;
   import Renamed401.Renamed2219;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import scpacker.networking.Network;
   import Renamed464.Renamed2220;
   import Renamed464.Renamed2221;
   
   public class ShopModel
   {
      private var localeService:ILocaleService;
      
      private var dialogsService:IDialogsService;
      
      private var panelView:IPanelView;
      
      private var network:Network;
      
      private var window:ShopWindow;
      
      private var form:Renamed2217;
      
      public function ShopModel()
      {
         super();
      }
      
      public function init(param1:String) : void
      {
         var _loc7_:Object = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc2_:Object = JSON.parse(param1);
         this.localeService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
         this.dialogsService = OSGi.getInstance().getService(IDialogsService) as IDialogsService;
         this.panelView = IPanelView(OSGi.getInstance().getService(IPanelView));
         this.network = Network(OSGi.getInstance().getService(Network));
         ShopWindow.haveDoubleCrystalls = _loc2_.have_double_crystals;
         this.window = new ShopWindow();
         var _loc3_:Object = JSON.parse(_loc2_.data);
         var _loc4_:String = this.Renamed2222(this.localeService.language);
         var _loc5_:Renamed2219 = new Renamed2219();
         var _loc6_:Array = _loc3_.categories;
         for each(_loc7_ in _loc6_)
         {
            _loc5_.Renamed2223(_loc7_.category_id,_loc7_.header_text[_loc4_],_loc7_.description[_loc4_]);
         }
         _loc8_ = _loc3_.items;
         for each(_loc9_ in _loc8_)
         {
            this.window.addItem(_loc9_.category_id,_loc9_.item_id,_loc9_.additional_data,_loc5_);
         }
         this.window.Renamed2224(_loc5_);
         this.panelView.Renamed2160().buttonBar.setEnablePaymentButton(false);
         this.window.addEventListener(Renamed2218.EVENT_TYPE,this.onSelectItem);
         this.window.addEventListener(Event.CLOSE,this.onClose);
      }
      
      private function Renamed2222(param1:String) : String
      {
         switch(param1)
         {
            case "ru":
            case "en":
               return param1.toUpperCase();
            case "pt_BR":
               return param1;
            default:
               return param1.toUpperCase();
         }
      }
      
      private function onClose(param1:Event) : void
      {
         this.dialogsService.removeDialog(this.window);
         this.panelView.Renamed2160().buttonBar.setEnablePaymentButton(true);
         this.window = null;
      }
      
      private function Renamed2225(param1:SendPromoCodeEvent) : void
      {
         this.network.send(new Renamed2221(param1.Renamed2226()));
      }
      
      public function Renamed2227() : void
      {
         this.form.Renamed2228();
      }
      
      public function Renamed2229() : void
      {
         this.form.Renamed2230();
      }
      
      private function onSelectItem(param1:Renamed2218) : void
      {
         var _loc2_:String = this.window.header.Renamed2231.selectedItem.code;
         if(param1.item.indexOf("promo") != -1)
         {
            this.form = new Renamed2217();
            this.form.addEventListener(SendPromoCodeEvent.Renamed2232,this.Renamed2225);
            this.window.Renamed2224(this.form);
            return;
         }
         if(_loc2_.indexOf("RU") != -1)
         {
            this.dialogsService.addDialog(new Renamed2233(param1.item,this.send));
            return;
         }
         this.send(param1.item,"");
      }
      
      private function send(param1:String, param2:String) : *
      {
         this.network.send(new Renamed2220(param1,param2));
      }
   }
}

