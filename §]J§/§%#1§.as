package §]J§
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§6!k§;
   import alternativa.tanks.battle.§`§;
   
   public class §%#1§
   {
      private var running:Boolean;
      
      public function §%#1§()
      {
         this.§[#+§ = new Vector.<§`§>();
         this.§;!O§ = new Vector.<§6!k§>();
         super();
      }
      
      public function add(param1:§`§) : void
      {
         if(this.running)
         {
            this.§;!O§.push(new §!d§(this,param1));
         }
         else if(this.§[#+§.indexOf(param1) < 0)
         {
            this.§[#+§.push(param1);
         }
      }
      
      public function remove(param1:§`§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.running)
         {
            this.§;!O§.push(new §use while§(this,param1));
         }
         else
         {
            _loc2_ = int(this.§[#+§.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.§[#+§.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.§[#+§[_loc3_] = this.§[#+§[--_loc2_];
                  this.§[#+§.length = _loc2_;
               }
            }
         }
      }
      
      public function §5!t§(param1:Body) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:§`§ = null;
         if(param1 != null)
         {
            this.running = true;
            _loc2_ = int(this.§[#+§.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.§[#+§[_loc3_];
               _loc4_.checkTrigger(param1);
               _loc3_++;
            }
            this.running = false;
            this.§function var get§();
         }
      }
      
      private function §function var get§() : void
      {
         var _loc1_:§6!k§ = null;
         while(_loc1_ = this.§;!O§.pop(), _loc1_ != null)
         {
            _loc1_.execute();
         }
      }
   }
}

