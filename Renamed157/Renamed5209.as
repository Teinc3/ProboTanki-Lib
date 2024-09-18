package Renamed5196
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class Renamed5197 extends Sprite
   {
      private const Renamed2592:int = 3;
      
      private const Renamed5198:int = 18;
      
      private var numMessages:int;
      
      private var messages:Vector.<Renamed5199>;
      
      private var Renamed5200:int;
      
      private var Renamed5201:Vector.<Renamed5199>;
      
      public function Renamed5197()
      {
         this.messages = new Vector.<Renamed5199>();
         this.Renamed5201 = new Vector.<Renamed5199>();
         super();
         filters = [new GlowFilter(0,0.75,5,5)];
      }
      
      public function addMessage(param1:uint, param2:String) : void
      {
         this.Renamed5202();
         var _loc3_:Renamed5199 = this.messages[this.numMessages] = this.createMessage();
         _loc3_.init();
         this.Renamed5203(_loc3_,param1,param2);
      }
      
      public function Renamed5204(param1:uint, param2:String, param3:int) : void
      {
         this.Renamed5202();
         var _loc4_:Renamed5199 = this.messages[this.numMessages] = this.createMessage();
         _loc4_.Renamed5205(param3);
         this.Renamed5203(_loc4_,param1,param2);
      }
      
      private function Renamed5202() : void
      {
         if(this.numMessages == this.Renamed2592)
         {
            this.Renamed5206(0);
         }
      }
      
      private function Renamed5203(param1:Renamed5199, param2:uint, param3:String) : void
      {
         var _loc4_:Label = param1.getLabel();
         addChild(_loc4_);
         _loc4_.color = param2;
         _loc4_.text = param3;
         _loc4_.x = -0.5 * _loc4_.width;
         _loc4_.y = this.Renamed5198 * this.numMessages;
         ++this.numMessages;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Renamed5199 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.numMessages)
         {
            _loc2_ = this.messages[_loc3_];
            if(_loc2_.Renamed5207)
            {
               this.Renamed5206(_loc3_);
               _loc3_--;
            }
            else
            {
               _loc2_.update(param1);
            }
            _loc3_++;
         }
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function Renamed5206(param1:int) : void
      {
         var _loc2_:Label = null;
         var _loc3_:Renamed5199 = this.messages[param1];
         this.Renamed5208(_loc3_);
         var _loc4_:int = param1 + 1;
         while(_loc4_ < this.numMessages)
         {
            _loc3_ = this.messages[int(_loc4_ - 1)] = this.messages[_loc4_];
            _loc2_ = _loc3_.getLabel();
            _loc2_.y -= this.Renamed5198;
            _loc4_++;
         }
         --this.numMessages;
      }
      
      private function Renamed5208(param1:Renamed5199) : void
      {
         removeChild(param1.getLabel());
         var _loc2_:* = this.Renamed5200++;
         this.Renamed5201[_loc2_] = param1;
      }
      
      private function createMessage() : Renamed5199
      {
         var _loc1_:Renamed5199 = null;
         if(this.Renamed5200 == 0)
         {
            _loc1_ = new Renamed5199();
         }
         else
         {
            _loc1_ = this.Renamed5201[--this.Renamed5200];
            this.Renamed5201[this.Renamed5200] = null;
         }
         return _loc1_;
      }
   }
}

