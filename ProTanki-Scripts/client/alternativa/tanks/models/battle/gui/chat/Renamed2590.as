package alternativa.tanks.models.battle.gui.chat
{
   import Renamed136.Renamed663;
   import Renamed230.Renamed2587;
   import Renamed230.Renamed2588;
   import Renamed496.Renamed2589;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.userlabel.ChatUpdateEvent;
   
   public class Renamed2590 extends Renamed2587
   {
      private static const Renamed2591:int = 300;
      
      private static const Renamed2592:int = 100;
      
      private static const Renamed2593:int = 5;
      
      private var buffer:Array;
      
      private var Renamed2594:Boolean = true;
      
      private var Renamed2595:uint = 0;
      
      public function Renamed2590()
      {
         this.buffer = [];
         super();
      }
      
      public function addLine(param1:String, param2:Renamed663, param3:String, param4:Boolean, param5:Boolean) : void
      {
         this.Renamed2596();
         var _loc6_:Renamed2597 = new Renamed2597(param1,param2,param3,param4,param5);
         _loc6_.addEventListener(Renamed2589.Renamed2598,this.Renamed2599);
         this.Renamed2600(_loc6_);
         Renamed2601(_loc6_);
         container.addEventListener(ChatUpdateEvent.UPDATE,this.Renamed2602);
      }
      
      private function Renamed2602(param1:ChatUpdateEvent) : void
      {
         if(this.Renamed2595 != 0)
         {
            clearTimeout(this.Renamed2595);
         }
         this.Renamed2595 = setTimeout(this.Renamed2603,100);
      }
      
      private function Renamed2603() : void
      {
         var _loc1_:Renamed2588 = null;
         this.Renamed2595 = 0;
         for each(_loc1_ in this.buffer)
         {
            if(_loc1_ is Renamed2597)
            {
               Renamed2597(_loc1_).alignChatUserLabel();
            }
         }
      }
      
      public function Renamed2580(param1:String) : void
      {
         this.Renamed2596();
         var _loc2_:Renamed2604 = new Renamed2604(Renamed2591,param1);
         _loc2_.addEventListener(Renamed2589.Renamed2598,this.Renamed2599);
         this.Renamed2600(_loc2_);
         Renamed2601(_loc2_);
      }
      
      override public function Renamed2605(param1:Boolean = false) : Renamed2588
      {
         var _loc2_:Renamed2588 = super.Renamed2605();
         this.y += shift;
         if(param1)
         {
            this.buffer.shift();
         }
         return _loc2_;
      }
      
      public function Renamed2606() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Renamed2588 = null;
         this.Renamed2594 = false;
         var _loc3_:int = this.buffer.length - container.numChildren;
         _loc1_ = 0;
         while(_loc1_ < container.numChildren)
         {
            _loc2_ = Renamed2588(container.getChildAt(_loc1_));
            _loc2_.Renamed2607();
            _loc1_++;
         }
         _loc1_ = _loc3_ - 1;
         while(_loc1_ >= 0)
         {
            try
            {
               Renamed2608(Renamed2588(this.buffer[_loc1_]));
            }
            catch(err:Error)
            {
            }
            _loc1_--;
         }
      }
      
      public function Renamed2609() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Renamed2588 = null;
         this.Renamed2594 = true;
         var _loc3_:int = container.numChildren - Renamed2593;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            this.Renamed2605();
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < container.numChildren)
         {
            _loc2_ = Renamed2588(container.getChildAt(_loc1_));
            if(!_loc2_.alive)
            {
               this.Renamed2605();
               _loc1_--;
            }
            else
            {
               _loc2_.Renamed2610();
            }
            _loc1_++;
         }
      }
      
      public function clear() : void
      {
         this.buffer.length = 0;
         var _loc1_:int = container.numChildren - 1;
         while(_loc1_ >= 0)
         {
            container.removeChildAt(_loc1_);
            _loc1_--;
         }
      }
      
      private function Renamed2599(param1:Renamed2589) : void
      {
         if(this.Renamed2594 && container.contains(param1.line))
         {
            this.Renamed2605();
         }
         param1.line.removeEventListener(Renamed2589.Renamed2598,this.Renamed2599);
      }
      
      private function Renamed2596() : void
      {
         if(this.Renamed2594 && container.numChildren > Renamed2593 || !this.Renamed2594 && container.numChildren >= Renamed2592)
         {
            this.Renamed2605();
         }
      }
      
      private function Renamed2600(param1:Renamed2588) : void
      {
         this.buffer.push(param1);
         if(this.buffer.length > Renamed2592)
         {
            this.buffer.shift();
         }
      }
   }
}

