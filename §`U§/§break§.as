package §`U§
{
   import §1!-§.§]!U§;
   import §1!-§.§case var super§;
   import §48§.§%"$§;
   import §48§.§false catch static§;
   import §>#m§.§5!"§;
   import alternativa.types.Long;
   import controls.TankWindowInner;
   import controls.base.ThreeLineBigButton;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §break§ extends Sprite
   {
      private const §override extends§:int = 10;
      
      private const §while set each§:int = 120;
      
      private const §^"J§:int = 280;
      
      private const §static const const§:int = 4;
      
      private var §null var super§:TankWindowInner;
      
      private var §dynamic for while§:§ "n§;
      
      private var §#!x§:Bitmap;
      
      private var §="@§:ThreeLineBigButton;
      
      private var §7![§:§5!"§;
      
      public function §break§(param1:§5!"§)
      {
         super();
         this.§7![§ = param1;
         this.§2! §();
         this.§3#W§();
         this.§case package return§();
         this.§,"M§();
         this.§continue var while§();
      }
      
      private function §2! §() : void
      {
         this.§null var super§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§null var super§.width = §6"§.§in const do§;
         addChild(this.§null var super§);
      }
      
      private function §3#W§() : void
      {
         this.§#!x§ = new Bitmap();
         this.§#!x§.x = int(this.§null var super§.width / 2 - this.§^"J§ / 2);
         this.§#!x§.y = this.§override extends§;
         this.§#!x§.bitmapData = this.§7![§.image.data;
         this.§null var super§.addChild(this.§#!x§);
      }
      
      private function §case package return§() : void
      {
         this.§dynamic for while§ = new § "n§(this.§7![§);
         this.§dynamic for while§.x = this.§override extends§;
         this.§dynamic for while§.y = this.§while set each§ + this.§override extends§ * 2;
         this.§null var super§.addChild(this.§dynamic for while§);
      }
      
      private function §continue var while§() : void
      {
         this.§="@§ = this.§!#x§();
         addChild(this.§="@§);
         this.§1"C§();
      }
      
      private function §!#x§() : ThreeLineBigButton
      {
         if(this.§7![§.progress == this.§7![§.§2!O§)
         {
            return this.§@!l§();
         }
         return this.§="2§();
      }
      
      private function §="2§() : ThreeLineBigButton
      {
         var _loc1_:§false catch static§ = new §false catch static§();
         _loc1_.addEventListener(MouseEvent.CLICK,this.§;"c§);
         if(this.§7![§.§6#J§)
         {
            _loc1_.§implements package static§();
         }
         else
         {
            _loc1_.showButtonWithCrystals(this.§7![§.§6#6§);
         }
         return ThreeLineBigButton(_loc1_);
      }
      
      private function §;"c§(param1:MouseEvent) : void
      {
         dispatchEvent(new §case var super§(§case var super§.DAILY_QUEST_CHANGE,this.§7![§));
      }
      
      private function §@!l§() : ThreeLineBigButton
      {
         var _loc1_:ThreeLineBigButton = new §%"$§();
         _loc1_.addEventListener(MouseEvent.CLICK,this.§case catch false§);
         return _loc1_;
      }
      
      private function §case catch false§(param1:MouseEvent) : void
      {
         this.§="@§.removeEventListener(MouseEvent.CLICK,this.§case catch false§);
         dispatchEvent(new §]!U§(§]!U§.DAILY_QUEST_GET_PRIZE,this.§7![§));
      }
      
      private function §1"C§() : void
      {
         this.§="@§.x = int(§6"§.§in const do§ / 2 - this.§="@§.width / 2);
         this.§="@§.y = this.§null var super§.height + §6"§.WINDOW_MARGIN - this.§static const const§;
      }
      
      private function §,"M§() : void
      {
         this.§null var super§.height = this.§dynamic for while§.§case catch break§() + this.§while set each§ + this.§override extends§ * 3;
      }
      
      public function §`#e§(param1:§5!"§) : void
      {
         this.§7![§ = param1;
         this.§#!x§.bitmapData = param1.image.data;
         this.§dynamic for while§.§super for each§(param1);
         this.§,"M§();
         this.§1"C§();
      }
      
      public function §return set include§(param1:int) : void
      {
         this.§null var super§.height = param1 - (§6"§.WINDOW_MARGIN + this.§="@§.height);
         var _loc2_:int = param1 - this.§default const for§();
         this.§dynamic for while§.§const const§(_loc2_);
         this.§="@§.y = param1 - this.§="@§.height - this.§static const const§;
      }
      
      public function §static break§(param1:int) : void
      {
         this.§7![§.§6#J§ = false;
         this.§7![§.§6#6§ = param1;
         §false catch static§(this.§="@§).showButtonWithCrystals(param1);
      }
      
      public function §case catch break§() : int
      {
         return this.§dynamic for while§.§case catch break§() + this.§default const for§();
      }
      
      private function §default const for§() : int
      {
         return this.§while set each§ + this.§override extends§ * 3 + §6"§.WINDOW_MARGIN + this.§="@§.height;
      }
      
      public function §package package const§() : Long
      {
         return this.§7![§.questId;
      }
      
      public function §function for try§() : void
      {
         var _loc1_:§false catch static§ = §false catch static§(this.§="@§);
         _loc1_.removeEventListener(MouseEvent.CLICK,this.§;"c§);
         _loc1_.removeListeners();
      }
      
      public function §'#'§() : Boolean
      {
         return this.§="@§ is §false catch static§;
      }
      
      public function §5"X§() : void
      {
         this.§="@§.enabled = false;
      }
      
      public function §8!F§() : void
      {
         this.§="@§.enabled = true;
      }
   }
}

