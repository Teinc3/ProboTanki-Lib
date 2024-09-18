package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.objects.Decal;
   import alternativa.tanks.battle.BattleService;
   import flash.utils.getTimer;
   
   public class §0"_§ implements §else if§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var fadeTime:int;
      
      private var entries:Vector.<§[!2§>;
      
      private var §function const get§:int;
      
      public function §0"_§(param1:int)
      {
         this.entries = new Vector.<§[!2§>();
         super();
         this.fadeTime = param1;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:§[!2§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = this.§function const get§;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = this.entries[_loc7_];
            _loc4_ = param1 - _loc3_.startTime;
            if(_loc4_ > this.fadeTime)
            {
               _loc5_++;
               battleService.§3l§().§do for default§(_loc3_.§package catch finally§);
               --this.§function const get§;
            }
            else
            {
               _loc3_.§package catch finally§.alpha = 1 - _loc4_ / this.fadeTime;
               if(_loc5_ > 0)
               {
                  this.entries[_loc7_ - _loc5_] = _loc3_;
               }
            }
            _loc7_++;
         }
         var _loc8_:int = this.§function const get§;
         while(_loc8_ < _loc6_)
         {
            this.entries[_loc8_] = null;
            _loc8_++;
         }
      }
      
      public function add(param1:Decal) : void
      {
         var _loc2_:* = this.§function const get§++;
         this.entries[_loc2_] = new §[!2§(param1,getTimer());
      }
   }
}

