package alternativa.tanks.battle.events
{
   import flash.utils.Dictionary;
   
   public class §<# § implements BattleEventDispatcher
   {
      private var §"!9§:int;
      
      private var §^!E§:Dictionary;
      
      private var §return package null§:Dictionary;
      
      private var §;8§:Dictionary;
      
      private var §each false§:Dictionary;
      
      public function §<# §()
      {
         this.§^!E§ = new Dictionary();
         this.§return package null§ = new Dictionary();
         this.§;8§ = new Dictionary();
         this.§each false§ = new Dictionary();
         super();
      }
      
      private static function addListener(param1:Dictionary, param2:Class, param3:§throw package continue§) : void
      {
         var _loc4_:Vector.<§throw package continue§> = param1[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new Vector.<§throw package continue§>();
            param1[param2] = _loc4_;
         }
         if(_loc4_.indexOf(param3) < 0)
         {
            _loc4_.push(param3);
         }
      }
      
      private static function removeListener(param1:Dictionary, param2:Class, param3:§throw package continue§) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Vector.<§throw package continue§> = param1[param2];
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
      
      public function §set for each§(param1:Class, param2:§throw package continue§) : void
      {
         if(this.§"!9§ > 0)
         {
            removeListener(this.§;8§,param1,param2);
            addListener(this.§return package null§,param1,param2);
         }
         else
         {
            addListener(this.§^!E§,param1,param2);
         }
      }
      
      public function §7!3§(param1:Class, param2:§throw package continue§) : void
      {
         if(this.§"!9§ > 0)
         {
            removeListener(this.§return package null§,param1,param2);
            addListener(this.§;8§,param1,param2);
         }
         else
         {
            removeListener(this.§^!E§,param1,param2);
         }
      }
      
      public function dispatchEvent(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         ++this.§"!9§;
         var _loc4_:Vector.<§throw package continue§> = this.§^!E§[param1.constructor];
         if(_loc4_ != null)
         {
            _loc2_ = int(_loc4_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               §throw package continue§(_loc4_[_loc3_]).handleBattleEvent(param1);
               _loc3_++;
            }
         }
         --this.§"!9§;
         this.§-u§();
      }
      
      public function §"#L§(param1:Object) : void
      {
         if(!this.§each false§[param1.constructor])
         {
            this.§each false§[param1.constructor] = true;
            this.dispatchEvent(param1);
         }
      }
      
      public function §5#6§() : void
      {
         this.§each false§ = new Dictionary();
      }
      
      private function §-u§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Vector.<§throw package continue§> = null;
         if(this.§"!9§ > 0)
         {
            return;
         }
         for(_loc4_ in this.§;8§)
         {
            _loc5_ = this.§;8§[_loc4_];
            delete this.§;8§[_loc4_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               removeListener(this.§^!E§,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
         for(_loc4_ in this.§return package null§)
         {
            _loc5_ = this.§return package null§[_loc4_];
            delete this.§return package null§[_loc4_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               addListener(this.§^!E§,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
      }
   }
}

