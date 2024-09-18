package alternativa.tanks.model.shop
{
   import alternativa.tanks.gui.payment.controls.§<"[§;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.containers.§throw catch final§;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class §1#w§ extends DialogWindow
   {
      private var qiwi:Class;
      
      private var §%p§:BitmapData;
      
      private var cards:Class;
      
      private var §7"G§:BitmapData;
      
      private var sbp:Class;
      
      private var §@>§:BitmapData;
      
      private var types:Array;
      
      private var item:String;
      
      private var callback:Function;
      
      private var panel:§throw catch final§;
      
      public function §1#w§(param1:String, param2:Function)
      {
         var _loc3_:TankWindow = null;
         this.qiwi = §var final§;
         this.§%p§ = new this.qiwi().bitmapData;
         this.cards = §try include§;
         this.§7"G§ = new this.cards().bitmapData;
         this.sbp = §;O§;
         this.§@>§ = new this.sbp().bitmapData;
         this.types = ["cryptomus","cards","sbp","other"];
         this.panel = new §throw catch final§();
         super();
         this.item = param1;
         this.callback = param2;
         this.panel.§!!t§(8);
         _loc3_ = new TankWindow(400,300);
         var _loc4_:§<"[§ = new §<"[§(this.§%p§);
         _loc4_.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc5_:§<"[§ = new §<"[§(this.§7"G§);
         _loc5_.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc6_:§<"[§ = new §<"[§(this.§@>§);
         _loc6_.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc7_:DefaultButtonBase = new DefaultButtonBase();
         _loc7_.addEventListener(MouseEvent.CLICK,this.onClick);
         _loc7_.label = "Другое";
         _loc7_.width = 155;
         this.panel.addItem(_loc4_);
         this.panel.addItem(_loc5_);
         this.panel.addItem(_loc6_);
         this.panel.addItem(_loc7_);
         this.panel.x = _loc3_.width - this.panel.width >> 1;
         this.panel.y = _loc3_.height - this.panel.height >> 1;
         _loc3_.addChild(this.panel);
         addChild(_loc3_);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc2_:int = int(this.panel.getItems().indexOf(DisplayObject(param1.currentTarget)));
         this.callback(this.item,this.types[_loc2_]);
         this.destroy();
      }
      
      private function destroy() : void
      {
         dialogService.removeDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.destroy();
      }
   }
}

