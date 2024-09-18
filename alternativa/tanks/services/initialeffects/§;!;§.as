package alternativa.tanks.services.initialeffects
{
   import flash.utils.getTimer;
   
   public class §;!;§ implements IInitialEffectsService
   {
      private var § #l§:Vector.<§if catch function§>;
      
      public function §;!;§()
      {
         super();
      }
      
      public function §+!m§(param1:String) : Vector.<§if catch function§>
      {
         var _loc2_:Vector.<§if catch function§> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§if catch function§ = null;
         if(this.§ #l§ != null)
         {
            _loc3_ = int(this.§ #l§.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.§ #l§[_loc4_];
               if(_loc5_.userId == param1)
               {
                  if(_loc2_ == null)
                  {
                     _loc2_ = new Vector.<§if catch function§>();
                  }
                  _loc2_.push(_loc5_);
                  var _loc6_:*;
                  this.§ #l§[_loc6_ = _loc4_--] = this.§ #l§[--_loc3_];
                  this.§ #l§.length = _loc3_;
               }
               _loc4_++;
            }
            if(_loc3_ == 0)
            {
               this.§ #l§ = null;
            }
         }
         return _loc2_;
      }
      
      public function addInitialEffect(param1:String, param2:int, param3:int, param4:int) : void
      {
         if(this.§ #l§ == null)
         {
            this.§ #l§ = new Vector.<§if catch function§>();
         }
         this.§ #l§.push(new §if catch function§(getTimer(),param1,param2,param3,param4));
      }
      
      public function §try§(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = this.§""r§(param1,param2);
         if(_loc4_ >= 0)
         {
            _loc3_ = int(this.§ #l§.length);
            this.§ #l§[_loc4_] = this.§ #l§[--_loc3_];
            this.§ #l§.length = _loc3_;
         }
      }
      
      private function §""r§(param1:String, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§if catch function§ = null;
         if(this.§ #l§ != null)
         {
            _loc3_ = int(this.§ #l§.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.§ #l§[_loc4_];
               if(_loc5_.userId == param1 && _loc5_.effectId == param2)
               {
                  return _loc4_;
               }
               _loc4_++;
            }
         }
         return -1;
      }
   }
}

