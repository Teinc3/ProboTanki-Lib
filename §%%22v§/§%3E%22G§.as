package §%"v§
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class §>"G§ extends Sprite
   {
      private const §const set false§:int = 3;
      
      private const §-!4§:int = 18;
      
      private var numMessages:int;
      
      private var messages:Vector.<§4#F§>;
      
      private var §4[§:int;
      
      private var §each const dynamic§:Vector.<§4#F§>;
      
      public function §>"G§()
      {
         this.messages = new Vector.<§4#F§>();
         this.§each const dynamic§ = new Vector.<§4#F§>();
         super();
         filters = [new GlowFilter(0,0.75,5,5)];
      }
      
      public function addMessage(param1:uint, param2:String) : void
      {
         this.§for catch for§();
         var _loc3_:§4#F§ = this.messages[this.numMessages] = this.createMessage();
         _loc3_.init();
         this.§]#>§(_loc3_,param1,param2);
      }
      
      public function §switch catch dynamic§(param1:uint, param2:String, param3:int) : void
      {
         this.§for catch for§();
         var _loc4_:§4#F§ = this.messages[this.numMessages] = this.createMessage();
         _loc4_.§package catch return§(param3);
         this.§]#>§(_loc4_,param1,param2);
      }
      
      private function §for catch for§() : void
      {
         if(this.numMessages == this.§const set false§)
         {
            this.§3n§(0);
         }
      }
      
      private function §]#>§(param1:§4#F§, param2:uint, param3:String) : void
      {
         var _loc4_:Label = param1.getLabel();
         addChild(_loc4_);
         _loc4_.color = param2;
         _loc4_.text = param3;
         _loc4_.x = -0.5 * _loc4_.width;
         _loc4_.y = this.§-!4§ * this.numMessages;
         ++this.numMessages;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:§4#F§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.numMessages)
         {
            _loc2_ = this.messages[_loc3_];
            if(_loc2_.§use package var§)
            {
               this.§3n§(_loc3_);
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
      
      private function §3n§(param1:int) : void
      {
         var _loc2_:Label = null;
         var _loc3_:§4#F§ = this.messages[param1];
         this.§function for import§(_loc3_);
         var _loc4_:int = param1 + 1;
         while(_loc4_ < this.numMessages)
         {
            _loc3_ = this.messages[int(_loc4_ - 1)] = this.messages[_loc4_];
            _loc2_ = _loc3_.getLabel();
            _loc2_.y -= this.§-!4§;
            _loc4_++;
         }
         --this.numMessages;
      }
      
      private function §function for import§(param1:§4#F§) : void
      {
         removeChild(param1.getLabel());
         var _loc2_:* = this.§4[§++;
         this.§each const dynamic§[_loc2_] = param1;
      }
      
      private function createMessage() : §4#F§
      {
         var _loc1_:§4#F§ = null;
         if(this.§4[§ == 0)
         {
            _loc1_ = new §4#F§();
         }
         else
         {
            _loc1_ = this.§each const dynamic§[--this.§4[§];
            this.§each const dynamic§[this.§4[§] = null;
         }
         return _loc1_;
      }
   }
}

