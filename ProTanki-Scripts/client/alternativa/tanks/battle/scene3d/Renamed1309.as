package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.objects.Decal;
   import alternativa.tanks.battle.BattleService;
   import flash.utils.getTimer;
   
   public class Renamed1304 implements Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var fadeTime:int;
      
      private var entries:Vector.<Renamed1305>;
      
      private var Renamed1306:int;
      
      public function Renamed1304(param1:int)
      {
         this.entries = new Vector.<Renamed1305>();
         super();
         this.fadeTime = param1;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Renamed1305 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = this.Renamed1306;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = this.entries[_loc7_];
            _loc4_ = param1 - _loc3_.startTime;
            if(_loc4_ > this.fadeTime)
            {
               _loc5_++;
               battleService.Renamed621().Renamed1307(_loc3_.Renamed1308);
               --this.Renamed1306;
            }
            else
            {
               _loc3_.Renamed1308.alpha = 1 - _loc4_ / this.fadeTime;
               if(_loc5_ > 0)
               {
                  this.entries[_loc7_ - _loc5_] = _loc3_;
               }
            }
            _loc7_++;
         }
         var _loc8_:int = this.Renamed1306;
         while(_loc8_ < _loc6_)
         {
            this.entries[_loc8_] = null;
            _loc8_++;
         }
      }
      
      public function add(param1:Decal) : void
      {
         var _loc2_:* = this.Renamed1306++;
         this.entries[_loc2_] = new Renamed1305(param1,getTimer());
      }
   }
}

