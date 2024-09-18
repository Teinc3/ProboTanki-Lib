package alternativa.tanks.services.initialeffects
{
   import flash.utils.getTimer;
   
   public class Renamed525 implements IInitialEffectsService
   {
      private var Renamed3818:Vector.<Renamed2759>;
      
      public function Renamed525()
      {
         super();
      }
      
      public function Renamed2838(param1:String) : Vector.<Renamed2759>
      {
         var _loc2_:Vector.<Renamed2759> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Renamed2759 = null;
         if(this.Renamed3818 != null)
         {
            _loc3_ = int(this.Renamed3818.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.Renamed3818[_loc4_];
               if(_loc5_.userId == param1)
               {
                  if(_loc2_ == null)
                  {
                     _loc2_ = new Vector.<Renamed2759>();
                  }
                  _loc2_.push(_loc5_);
                  var _loc6_:*;
                  this.Renamed3818[_loc6_ = _loc4_--] = this.Renamed3818[--_loc3_];
                  this.Renamed3818.length = _loc3_;
               }
               _loc4_++;
            }
            if(_loc3_ == 0)
            {
               this.Renamed3818 = null;
            }
         }
         return _loc2_;
      }
      
      public function addInitialEffect(param1:String, param2:int, param3:int, param4:int) : void
      {
         if(this.Renamed3818 == null)
         {
            this.Renamed3818 = new Vector.<Renamed2759>();
         }
         this.Renamed3818.push(new Renamed2759(getTimer(),param1,param2,param3,param4));
      }
      
      public function Renamed2924(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = this.Renamed3819(param1,param2);
         if(_loc4_ >= 0)
         {
            _loc3_ = int(this.Renamed3818.length);
            this.Renamed3818[_loc4_] = this.Renamed3818[--_loc3_];
            this.Renamed3818.length = _loc3_;
         }
      }
      
      private function Renamed3819(param1:String, param2:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Renamed2759 = null;
         if(this.Renamed3818 != null)
         {
            _loc3_ = int(this.Renamed3818.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = this.Renamed3818[_loc4_];
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

