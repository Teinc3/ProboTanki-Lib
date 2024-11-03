package alternativa.tanks.battle.events
{
   import flash.utils.Dictionary;
   
   public class Renamed510 implements BattleEventDispatcher
   {
      private var Renamed876:int;
      
      private var Renamed877:Dictionary;
      
      private var Renamed878:Dictionary;
      
      private var Renamed879:Dictionary;
      
      private var Renamed880:Dictionary;
      
      public function Renamed510()
      {
         this.Renamed877 = new Dictionary();
         this.Renamed878 = new Dictionary();
         this.Renamed879 = new Dictionary();
         this.Renamed880 = new Dictionary();
         super();
      }
      
      private static function addListener(param1:Dictionary, param2:Class, param3:Renamed511) : void
      {
         var _loc4_:Vector.<Renamed511> = param1[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new Vector.<Renamed511>();
            param1[param2] = _loc4_;
         }
         if(_loc4_.indexOf(param3) < 0)
         {
            _loc4_.push(param3);
         }
      }
      
      private static function removeListener(param1:Dictionary, param2:Class, param3:Renamed511) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Vector.<Renamed511> = param1[param2];
         if(_loc5_ != null)
         {
            _loc4_ = int(_loc5_.indexOf(param3));
            if(_loc4_ >= 0)
            {
               if(_loc5_.length == 1)
               {
                  delete param1[param2];
               }
               else
               {
                  _loc5_.splice(_loc4_,1);
               }
            }
         }
      }
      
      public function Renamed539(param1:Class, param2:Renamed511) : void
      {
         if(this.Renamed876 > 0)
         {
            removeListener(this.Renamed879,param1,param2);
            addListener(this.Renamed878,param1,param2);
         }
         else
         {
            addListener(this.Renamed877,param1,param2);
         }
      }
      
      public function Renamed866(param1:Class, param2:Renamed511) : void
      {
         if(this.Renamed876 > 0)
         {
            removeListener(this.Renamed878,param1,param2);
            addListener(this.Renamed879,param1,param2);
         }
         else
         {
            removeListener(this.Renamed877,param1,param2);
         }
      }
      
      public function dispatchEvent(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         ++this.Renamed876;
         var _loc4_:Vector.<Renamed511> = this.Renamed877[param1.constructor];
         if(_loc4_ != null)
         {
            _loc2_ = int(_loc4_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               Renamed511(_loc4_[_loc3_]).handleBattleEvent(param1);
               _loc3_++;
            }
         }
         --this.Renamed876;
         this.Renamed881();
      }
      
      public function Renamed867(param1:Object) : void
      {
         if(!this.Renamed880[param1.constructor])
         {
            this.Renamed880[param1.constructor] = true;
            this.dispatchEvent(param1);
         }
      }
      
      public function Renamed868() : void
      {
         this.Renamed880 = new Dictionary();
      }
      
      private function Renamed881() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Vector.<Renamed511> = null;
         if(this.Renamed876 > 0)
         {
            return;
         }
         for(_loc4_ in this.Renamed879)
         {
            _loc5_ = this.Renamed879[_loc4_];
            delete this.Renamed879[_loc4_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               removeListener(this.Renamed877,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
         for(_loc4_ in this.Renamed878)
         {
            _loc5_ = this.Renamed878[_loc4_];
            delete this.Renamed878[_loc4_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               addListener(this.Renamed877,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
      }
   }
}

