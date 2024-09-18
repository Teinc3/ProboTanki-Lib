package §]!5§
{
   import base.DiscreteSprite;
   import §var package override§.§native for implements§;
   
   public class §8"W§ extends DiscreteSprite
   {
      private static const GAP:int = 10;
      
      public var headerText:String;
      
      public var §throw while§:String;
      
      public var §%#^§:String;
      
      public var header:§get const native§;
      
      public var items:§implements final§;
      
      public function §8"W§(param1:String, param2:String, param3:String)
      {
         super();
         this.headerText = param1;
         this.§throw while§ = param2;
         this.§%#^§ = param3;
         this.init();
      }
      
      private function init() : void
      {
         this.header = new §get const native§(this.headerText,this.§throw while§);
         addChild(this.header);
         this.items = new §implements final§();
         addChild(this.items);
      }
      
      public function addItem(param1:§native for implements§) : void
      {
         this.items.addItem(param1);
      }
      
      public function render(param1:int) : void
      {
         this.header.render(param1);
         this.items.render();
         this.items.y = this.header.y + this.header.height + GAP;
      }
      
      public function destroy() : void
      {
         this.header = null;
         this.items.destroy();
         this.items = null;
      }
   }
}

