package alternativa.tanks.battle.scene3d
{
   import alternativa.tanks.battle.§6!k§;
   
   public class §##W§
   {
      private var §="c§:Vector.<§else if§>;
      
      private var size:int;
      
      private var §override const dynamic§:Boolean;
      
      public function §##W§()
      {
         this.§;!O§ = new Vector.<§6!k§>();
         this.§="c§ = new Vector.<§else if§>();
         super();
      }
      
      public function §9"N§(param1:§else if§) : void
      {
         if(this.§override const dynamic§)
         {
            this.§;!O§.push(new §with for throw§(this,param1));
         }
         else if(this.§="c§.indexOf(param1) < 0)
         {
            var _loc2_:* = this.size++;
            this.§="c§[_loc2_] = param1;
         }
      }
      
      public function §0!n§(param1:§else if§) : void
      {
         var _loc2_:int = 0;
         if(this.§override const dynamic§)
         {
            this.§;!O§.push(new §6#o§(this,param1));
         }
         else
         {
            _loc2_ = int(this.§="c§.indexOf(param1));
            if(_loc2_ >= 0)
            {
               this.§="c§[_loc2_] = this.§="c§[--this.size];
               this.§="c§[this.size] = null;
            }
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:§else if§ = null;
         this.§override const dynamic§ = true;
         var _loc4_:int = 0;
         while(_loc4_ < this.size)
         {
            _loc3_ = this.§="c§[_loc4_];
            _loc3_.render(param1,param2);
            _loc4_++;
         }
         this.§override const dynamic§ = false;
         this.§function var get§();
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

