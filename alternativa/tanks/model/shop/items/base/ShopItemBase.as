package alternativa.tanks.model.shop.items.base
{
   import controls.base.LabelBase;
   import §each set import§.§'4§;
   import §extends for catch§.§0#O§;
   import flash.events.MouseEvent;
   
   public class ShopItemBase extends ButtonItemBase
   {
      protected static const WIDTH:int = 279;
      
      protected static const HEIGHT:int = 143;
      
      protected var itemId:String;
      
      public function ShopItemBase(param1:String, param2:§0#O§)
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
         dispatchEvent(new §'4§(this.itemId));
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
      
      public function §dynamic var break§() : String
      {
         return this.itemId;
      }
   }
}

