package alternativa.tanks.model.shop
{
   import alternativa.tanks.gui.payment.controls.Renamed1955;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.containers.Renamed2259;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class Renamed2233 extends DialogWindow
   {
      private var qiwi:Class;
      
      private var Renamed2260:BitmapData;
      
      private var cards:Class;
      
      private var Renamed2261:BitmapData;
      
      private var sbp:Class;
      
      private var Renamed2262:BitmapData;
      
      private var types:Array;
      
      private var item:String;
      
      private var callback:Function;
      
      private var panel:Renamed2259;
      
      public function Renamed2233(param1:String, param2:Function)
      {
         var _loc3_:TankWindow = null;
         this.qiwi = Renamed2263;
         this.Renamed2260 = new this.qiwi().bitmapData;
         this.cards = Renamed2264;
         this.Renamed2261 = new this.cards().bitmapData;
         this.sbp = Renamed2265;
         this.Renamed2262 = new this.sbp().bitmapData;
         this.types = ["cryptomus","cards","sbp","other"];
         this.panel = new Renamed2259();
         super();
         this.item = param1;
         this.callback = param2;
         this.panel.Renamed1987(8);
         _loc3_ = new TankWindow(400,300);
         var _loc4_:Renamed1955 = new Renamed1955(this.Renamed2260);
         _loc4_.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc5_:Renamed1955 = new Renamed1955(this.Renamed2261);
         _loc5_.addEventListener(MouseEvent.CLICK,this.onClick);
         var _loc6_:Renamed1955 = new Renamed1955(this.Renamed2262);
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

