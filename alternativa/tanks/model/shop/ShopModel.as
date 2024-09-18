package alternativa.tanks.model.shop
{
   import §7#C§.§=b§;
   import §7#C§.SendPromoCodeEvent;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.panel.IPanelView;
   import §each set import§.§'4§;
   import flash.events.Event;
   import §native const with§.§each for case§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import scpacker.networking.Network;
   import §with set while§.§1"X§;
   import §with set while§.§extends const include§;
   
   public class ShopModel
   {
      private var localeService:ILocaleService;
      
      private var dialogsService:IDialogsService;
      
      private var panelView:IPanelView;
      
      private var network:Network;
      
      private var window:ShopWindow;
      
      private var form:§=b§;
      
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
         var _loc4_:String = this.§for catch const§(this.localeService.language);
         var _loc5_:§each for case§ = new §each for case§();
         var _loc6_:Array = _loc3_.categories;
         for each(_loc7_ in _loc6_)
         {
            _loc5_.§4D§(_loc7_.category_id,_loc7_.header_text[_loc4_],_loc7_.description[_loc4_]);
         }
         _loc8_ = _loc3_.items;
         for each(_loc9_ in _loc8_)
         {
            this.window.addItem(_loc9_.category_id,_loc9_.item_id,_loc9_.additional_data,_loc5_);
         }
         this.window.§with set case§(_loc5_);
         this.panelView.§+#,§().buttonBar.setEnablePaymentButton(false);
         this.window.addEventListener(§'4§.EVENT_TYPE,this.onSelectItem);
         this.window.addEventListener(Event.CLOSE,this.onClose);
      }
      
      private function §for catch const§(param1:String) : String
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
         this.panelView.§+#,§().buttonBar.setEnablePaymentButton(true);
         this.window = null;
      }
      
      private function §,A§(param1:SendPromoCodeEvent) : void
      {
         this.network.send(new §extends const include§(param1.§""4§()));
      }
      
      public function §"#9§() : void
      {
         this.form.§do set if§();
      }
      
      public function §override catch final§() : void
      {
         this.form.§override set in§();
      }
      
      private function onSelectItem(param1:§'4§) : void
      {
         var _loc2_:String = this.window.header.§[1§.selectedItem.code;
         if(param1.item.indexOf("promo") != -1)
         {
            this.form = new §=b§();
            this.form.addEventListener(SendPromoCodeEvent.§dynamic catch true§,this.§,A§);
            this.window.§with set case§(this.form);
            return;
         }
         if(_loc2_.indexOf("RU") != -1)
         {
            this.dialogsService.addDialog(new §1#w§(param1.item,this.send));
            return;
         }
         this.send(param1.item,"");
      }
      
      private function send(param1:String, param2:String) : *
      {
         this.network.send(new §1"X§(param1,param2));
      }
   }
}

