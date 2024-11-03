package alternativa.tanks.model.shop.items.base
{
   import controls.base.LabelBase;
   import Renamed348.Renamed2218;
   import Renamed355.Renamed2267;
   import flash.events.MouseEvent;
   
   public class ShopItemBase extends ButtonItemBase
   {
      protected static const WIDTH:int = 279;
      
      protected static const HEIGHT:int = 143;
      
      protected var itemId:String;
      
      public function ShopItemBase(param1:String, param2:Renamed2267)
      {
         this.itemId = param1;
         addEventListener(MouseEvent.CLICK,this.onMouseClick);
         super(param2);
      }
      
      protected function fixChineseCurrencyLabelRendering(param1:LabelBase) : void
      {
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed2218(this.itemId));
      }
      
      override public function get width() : Number
      {
         return WIDTH;
      }
      
      override public function get height() : Number
      {
         return HEIGHT;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         removeEventListener(MouseEvent.CLICK,this.onMouseClick);
      }
      
      public function activateDisabledFilter() : void
      {
         alpha = 0.9;
      }
      
      public function Renamed2269() : String
      {
         return this.itemId;
      }
   }
}

