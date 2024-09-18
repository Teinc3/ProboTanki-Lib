package §]i§
{
   import §!!v§.§get for null§;
   import controls.InventoryIcon;
   import controls.Label;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class §final set if§
   {
      private static const §[b§:int = 10;
      
      private static const §import const const§:int = 1;
      
      private static const §break set override§:int = 2;
      
      private static const §if catch§:int = 3;
      
      private var §dynamic package include§:int;
      
      private var §import catch finally§:Label;
      
      private var item:§1!;§;
      
      private var canvas:DisplayObjectContainer;
      
      private var §]"U§:§`j§;
      
      private var §<"F§:Label;
      
      private var §with for use§:int;
      
      private var §override package case§:InventoryIcon;
      
      private var §true const if§:int = 3;
      
      private var colorTransform:ColorTransform;
      
      private var §dynamic try§:int;
      
      private var §?Z§:Number = 1;
      
      public function §final set if§(param1:int)
      {
         this.§override package case§ = new InventoryIcon(InventoryIcon.EMPTY);
         this.colorTransform = new ColorTransform();
         super();
         this.§dynamic package include§ = param1;
         this.canvas = new Sprite();
         this.canvas.addChild(this.§override package case§);
         this.§import catch finally§ = new Label();
         this.§import catch finally§.size = §[b§;
         this.§import catch finally§.text = param1.toString();
         this.§import catch finally§.x = 3;
         this.§import catch finally§.y = 1;
         this.canvas.addChild(this.§import catch finally§);
         this.§8!-§(§get for null§.§throw for§,true);
      }
      
      public function §8!-§(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.§with for use§ |= param1;
         }
         else
         {
            this.§with for use§ &= ~param1;
         }
      }
      
      public function isLocked() : Boolean
      {
         return this.§with for use§ != 0;
      }
      
      public function §set set catch§() : DisplayObject
      {
         return this.canvas;
      }
      
      public function setItem(param1:§1!;§) : void
      {
         if(this.item == param1)
         {
            return;
         }
         if(this.item != null)
         {
            this.§default const§();
         }
         this.item = param1;
         if(param1 != null)
         {
            this.initItemSlot(param1);
         }
         this.§else const null§();
      }
      
      private function §default const§() : void
      {
         var _loc1_:InventoryIcon = this.item.getIcon();
         if(this.canvas.contains(_loc1_))
         {
            this.canvas.removeChild(_loc1_);
         }
      }
      
      private function initItemSlot(param1:§1!;§) : void
      {
         if(this.canvas.contains(this.§override package case§))
         {
            this.canvas.removeChild(this.§override package case§);
         }
         var _loc2_:InventoryIcon = param1.getIcon();
         this.canvas.addChildAt(_loc2_,0);
         if(this.§]"U§ == null)
         {
            this.§]"U§ = new §`j§(_loc2_.width - 4,8);
            this.§]"U§.x = 2;
            this.§]"U§.y = 2;
            this.canvas.addChild(this.§]"U§);
         }
         this.§]"U§.visible = false;
         this.§+H§();
      }
      
      private function §+H§() : void
      {
         if(this.§<"F§ == null)
         {
            this.§<"F§ = new Label();
            this.§<"F§.size = §[b§;
            this.canvas.addChild(this.§<"F§);
         }
      }
      
      private function §'",§() : void
      {
         if(!this.canvas.contains(this.§override package case§))
         {
            if(this.item != null)
            {
               this.§default const§();
            }
            this.canvas.addChildAt(this.§override package case§,0);
         }
         if(this.§<"F§ != null)
         {
            this.§<"F§.visible = false;
         }
      }
      
      public function getItem() : §1!;§
      {
         return this.item;
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(this.item != null)
         {
            if(this.isLocked() || this.item.count == 0)
            {
               this.§]"U§.visible = true;
               this.§]"U§.draw(0);
               this.§?Z§ = 1;
            }
            else
            {
               _loc2_ = this.item.§@#m§(param1);
               if(_loc2_ == 1)
               {
                  this.§]"U§.visible = false;
                  if(this.§?Z§ < 1)
                  {
                     this.§4o§(param1);
                  }
                  this.§7#4§(param1);
               }
               else
               {
                  this.§5!H§();
                  this.§]"U§.visible = true;
                  this.§]"U§.draw(_loc2_);
               }
               this.§?Z§ = _loc2_;
            }
         }
      }
      
      public function §else const null§() : void
      {
         if(this.item != null)
         {
            if(this.item.count > 0)
            {
               this.§<"F§.text = this.item.count.toString();
               this.§<"F§.x = this.item.getIcon().width - this.§<"F§.width - 3;
               this.§<"F§.y = this.item.getIcon().height - this.§<"F§.height - 1;
               this.§<"F§.visible = true;
            }
            else if(this.item.count == -1)
            {
               this.§<"F§.visible = false;
            }
            else
            {
               this.§'",§();
            }
         }
      }
      
      public function §7#4§(param1:int) : void
      {
         var _loc2_:uint = 255;
         var _loc3_:uint = 100;
         var _loc4_:uint = 300;
         switch(this.§true const if§)
         {
            case §import const const§:
               if(param1 < this.§dynamic try§ + _loc3_)
               {
                  this.§ #I§(_loc2_ * (param1 - this.§dynamic try§) / _loc3_);
               }
               else
               {
                  this.§ #I§(_loc2_);
                  this.§dynamic try§ += _loc3_ + _loc4_;
                  this.§true const if§ = §break set override§;
               }
               break;
            case §break set override§:
               if(param1 < this.§dynamic try§)
               {
                  this.§ #I§(_loc2_ * (this.§dynamic try§ - param1) / _loc4_);
               }
               else
               {
                  this.§5!H§();
               }
         }
      }
      
      private function § #I§(param1:uint) : void
      {
         this.colorTransform.redOffset = param1;
         this.colorTransform.greenOffset = param1;
         this.colorTransform.blueOffset = param1;
         this.colorTransform.alphaOffset = param1;
         this.canvas.transform.colorTransform = this.colorTransform;
      }
      
      public function §4o§(param1:int) : void
      {
         this.§true const if§ = §import const const§;
         this.§dynamic try§ = param1;
      }
      
      private function §5!H§() : void
      {
         if(this.§true const if§ != §if catch§)
         {
            this.§true const if§ = §if catch§;
            this.§ #I§(0);
         }
      }
      
      public function §false package true§() : void
      {
         this.initItemSlot(this.item);
      }
   }
}

