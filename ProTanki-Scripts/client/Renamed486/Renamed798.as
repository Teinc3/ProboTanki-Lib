package Renamed486
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed754;
   import alternativa.tanks.battle.Renamed804;
   
   public class Renamed798
   {
      private var running:Boolean;
      
      public function Renamed798()
      {
         this.Renamed797 = new Vector.<Renamed804>();
         this.Renamed794 = new Vector.<Renamed754>();
         super();
      }
      
      public function add(param1:Renamed804) : void
      {
         if(this.running)
         {
            this.Renamed794.push(new Renamed9608(this,param1));
         }
         else if(this.Renamed797.indexOf(param1) < 0)
         {
            this.Renamed797.push(param1);
         }
      }
      
      public function remove(param1:Renamed804) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.running)
         {
            this.Renamed794.push(new Renamed9609(this,param1));
         }
         else
         {
            _loc2_ = int(this.Renamed797.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.Renamed797.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.Renamed797[_loc3_] = this.Renamed797[--_loc2_];
                  this.Renamed797.length = _loc2_;
               }
            }
         }
      }
      
      public function Renamed822(param1:Body) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Renamed804 = null;
         if(param1 != null)
         {
            this.running = true;
            _loc2_ = int(this.Renamed797.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.Renamed797[_loc3_];
               _loc4_.checkTrigger(param1);
               _loc3_++;
            }
            this.running = false;
            this.Renamed1291();
         }
      }
      
      private function Renamed1291() : void
      {
         var _loc1_:Renamed754 = null;
         while(_loc1_ = this.Renamed794.pop(), _loc1_ != null)
         {
            _loc1_.execute();
         }
      }
   }
}

