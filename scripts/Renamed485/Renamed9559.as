package Renamed485
{
   import Renamed142.Renamed2740;
   import controls.InventoryIcon;
   import controls.Label;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class Renamed9559
   {
      private static const Renamed5214:int = 10;
      
      private static const Renamed9590:int = 1;
      
      private static const Renamed9591:int = 2;
      
      private static const Renamed9592:int = 3;
      
      private var Renamed9593:int;
      
      private var Renamed9594:Label;
      
      private var item:Renamed9565;
      
      private var canvas:DisplayObjectContainer;
      
      private var Renamed9595:Renamed9596;
      
      private var Renamed9597:Label;
      
      private var Renamed9598:int;
      
      private var Renamed9599:InventoryIcon;
      
      private var Renamed9600:int = 3;
      
      private var colorTransform:ColorTransform;
      
      private var Renamed9601:int;
      
      private var Renamed9602:Number = 1;
      
      public function Renamed9559(param1:int)
      {
         this.Renamed9599 = new InventoryIcon(InventoryIcon.EMPTY);
         this.colorTransform = new ColorTransform();
         super();
         this.Renamed9593 = param1;
         this.canvas = new Sprite();
         this.canvas.addChild(this.Renamed9599);
         this.Renamed9594 = new Label();
         this.Renamed9594.size = Renamed5214;
         this.Renamed9594.text = param1.toString();
         this.Renamed9594.x = 3;
         this.Renamed9594.y = 1;
         this.canvas.addChild(this.Renamed9594);
         this.Renamed9576(Renamed2740.Renamed4956,true);
      }
      
      public function Renamed9576(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.Renamed9598 |= param1;
         }
         else
         {
            this.Renamed9598 &= ~param1;
         }
      }
      
      public function isLocked() : Boolean
      {
         return this.Renamed9598 != 0;
      }
      
      public function Renamed9580() : DisplayObject
      {
         return this.canvas;
      }
      
      public function setItem(param1:Renamed9565) : void
      {
         if(this.item == param1)
         {
            return;
         }
         if(this.item != null)
         {
            this.Renamed9603();
         }
         this.item = param1;
         if(param1 != null)
         {
            this.initItemSlot(param1);
         }
         this.Renamed9572();
      }
      
      private function Renamed9603() : void
      {
         var _loc1_:InventoryIcon = this.item.getIcon();
         if(this.canvas.contains(_loc1_))
         {
            this.canvas.removeChild(_loc1_);
         }
      }
      
      private function initItemSlot(param1:Renamed9565) : void
      {
         if(this.canvas.contains(this.Renamed9599))
         {
            this.canvas.removeChild(this.Renamed9599);
         }
         var _loc2_:InventoryIcon = param1.getIcon();
         this.canvas.addChildAt(_loc2_,0);
         if(this.Renamed9595 == null)
         {
            this.Renamed9595 = new Renamed9596(_loc2_.width - 4,8);
            this.Renamed9595.x = 2;
            this.Renamed9595.y = 2;
            this.canvas.addChild(this.Renamed9595);
         }
         this.Renamed9595.visible = false;
         this.Renamed9604();
      }
      
      private function Renamed9604() : void
      {
         if(this.Renamed9597 == null)
         {
            this.Renamed9597 = new Label();
            this.Renamed9597.size = Renamed5214;
            this.canvas.addChild(this.Renamed9597);
         }
      }
      
      private function Renamed9605() : void
      {
         if(!this.canvas.contains(this.Renamed9599))
         {
            if(this.item != null)
            {
               this.Renamed9603();
            }
            this.canvas.addChildAt(this.Renamed9599,0);
         }
         if(this.Renamed9597 != null)
         {
            this.Renamed9597.visible = false;
         }
      }
      
      public function getItem() : Renamed9565
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
               this.Renamed9595.visible = true;
               this.Renamed9595.draw(0);
               this.Renamed9602 = 1;
            }
            else
            {
               _loc2_ = this.item.Renamed9585(param1);
               if(_loc2_ == 1)
               {
                  this.Renamed9595.visible = false;
                  if(this.Renamed9602 < 1)
                  {
                     this.Renamed9577(param1);
                  }
                  this.Renamed9578(param1);
               }
               else
               {
                  this.Renamed9606();
                  this.Renamed9595.visible = true;
                  this.Renamed9595.draw(_loc2_);
               }
               this.Renamed9602 = _loc2_;
            }
         }
      }
      
      public function Renamed9572() : void
      {
         if(this.item != null)
         {
            if(this.item.count > 0)
            {
               this.Renamed9597.text = this.item.count.toString();
               this.Renamed9597.x = this.item.getIcon().width - this.Renamed9597.width - 3;
               this.Renamed9597.y = this.item.getIcon().height - this.Renamed9597.height - 1;
               this.Renamed9597.visible = true;
            }
            else if(this.item.count == -1)
            {
               this.Renamed9597.visible = false;
            }
            else
            {
               this.Renamed9605();
            }
         }
      }
      
      public function Renamed9578(param1:int) : void
      {
         var _loc2_:uint = 255;
         var _loc3_:uint = 100;
         var _loc4_:uint = 300;
         switch(this.Renamed9600)
         {
            case Renamed9590:
               if(param1 < this.Renamed9601 + _loc3_)
               {
                  this.Renamed8454(_loc2_ * (param1 - this.Renamed9601) / _loc3_);
               }
               else
               {
                  this.Renamed8454(_loc2_);
                  this.Renamed9601 += _loc3_ + _loc4_;
                  this.Renamed9600 = Renamed9591;
               }
               break;
            case Renamed9591:
               if(param1 < this.Renamed9601)
               {
                  this.Renamed8454(_loc2_ * (this.Renamed9601 - param1) / _loc4_);
               }
               else
               {
                  this.Renamed9606();
               }
         }
      }
      
      private function Renamed8454(param1:uint) : void
      {
         this.colorTransform.redOffset = param1;
         this.colorTransform.greenOffset = param1;
         this.colorTransform.blueOffset = param1;
         this.colorTransform.alphaOffset = param1;
         this.canvas.transform.colorTransform = this.colorTransform;
      }
      
      public function Renamed9577(param1:int) : void
      {
         this.Renamed9600 = Renamed9590;
         this.Renamed9601 = param1;
      }
      
      private function Renamed9606() : void
      {
         if(this.Renamed9600 != Renamed9592)
         {
            this.Renamed9600 = Renamed9592;
            this.Renamed8454(0);
         }
      }
      
      public function Renamed9573() : void
      {
         this.initItemSlot(this.item);
      }
   }
}

