package §14§
{
   import §7"j§.§final var super§;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   
   public class §package set for§ implements §7"]§
   {
      private static const §while catch var§:int = 10;
      
      private static const §2"i§:int = 21;
      
      private static const _position:Vector3 = new Vector3();
      
      private var effects:Vector.<§package var§>;
      
      private var §'!H§:int;
      
      private var §3!P§:Dictionary;
      
      private var numSounds:int;
      
      private var §catch for throw§:Boolean;
      
      public function §package set for§()
      {
         this.effects = new Vector.<§package var§>();
         this.§3!P§ = new Dictionary();
         super();
      }
      
      public static function §[# §(param1:Sound) : §7"]§
      {
         var _loc2_:SoundChannel = param1.play(0,1,new SoundTransform(0));
         if(_loc2_ != null)
         {
            _loc2_.stop();
            return new §package set for§();
         }
         return new §for with§();
      }
      
      public function §3#O§(param1:Boolean) : void
      {
         this.§catch for throw§ = param1;
      }
      
      public function §finally package get§(param1:Sound, param2:int = 0, param3:int = 0, param4:SoundTransform = null) : SoundChannel
      {
         var _loc5_:SoundChannel = null;
         if(this.§catch package switch§(param1))
         {
            _loc5_ = param1.play(param2,param3,param4);
            if(_loc5_ != null)
            {
               this.§extends for each§(_loc5_);
            }
            return _loc5_;
         }
         return null;
      }
      
      private function §catch package switch§(param1:Sound) : Boolean
      {
         return !this.§catch for throw§ && this.numSounds < §while catch var§ && param1 != null;
      }
      
      public function §set const var§(param1:SoundChannel) : void
      {
         if(param1 != null && this.§3!P§[param1] != null)
         {
            this.§var package default§(param1);
         }
      }
      
      public function §return each§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§3!P§)
         {
            this.§var package default§(_loc1_ as SoundChannel);
         }
      }
      
      public function §each set set§(param1:§final var super§) : void
      {
         if(this.§case set default§(param1))
         {
            param1.enabled = true;
            this.effects.push(§package var§.create(0,param1));
            ++this.§'!H§;
         }
      }
      
      private function §case set default§(param1:§final var super§) : Boolean
      {
         return !this.§catch for throw§ && param1 != null && this.§"#K§(param1) < 0;
      }
      
      public function §use var super§(param1:§final var super§) : void
      {
         var _loc2_:§package var§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§'!H§)
         {
            _loc2_ = this.effects[_loc3_];
            if(_loc2_.§case set final§ == param1)
            {
               param1.destroy();
               §package var§.destroy(_loc2_);
               this.effects.splice(_loc3_,1);
               --this.§'!H§;
               return;
            }
            _loc3_++;
         }
      }
      
      public function §return for get§() : void
      {
         var _loc1_:§package var§ = null;
         while(this.effects.length > 0)
         {
            _loc1_ = this.effects.pop();
            _loc1_.§case set final§.destroy();
            §package var§.destroy(_loc1_);
         }
         this.§'!H§ = 0;
      }
      
      public function §=#z§(param1:int, param2:§3!0§) : void
      {
         var _loc3_:int = 0;
         if(this.§'!H§ > 0)
         {
            this.§switch package use§(param2.position);
            _loc3_ = this.§%#M§(param1,param2);
            this.§3#+§(_loc3_);
         }
      }
      
      private function §%#M§(param1:int, param2:§3!0§) : int
      {
         var _loc3_:§package var§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < this.§'!H§)
         {
            _loc3_ = this.effects[_loc4_];
            _loc5_ = _loc3_.§case set final§.numSounds;
            if(_loc5_ == 0)
            {
               _loc3_.§case set final§.destroy();
               §package var§.destroy(_loc3_);
               this.effects.splice(_loc4_,1);
               --this.§'!H§;
               _loc4_--;
            }
            else if(_loc6_ + _loc5_ > §2"i§)
            {
               if(_loc6_ == §2"i§)
               {
                  break;
               }
               _loc3_.§case set final§.enabled = false;
            }
            else
            {
               _loc3_.§case set final§.enabled = true;
               _loc3_.§case set final§.play(param1,param2);
               _loc6_ += _loc5_;
            }
            _loc4_++;
         }
         return _loc4_;
      }
      
      private function §3#+§(param1:int) : void
      {
         var _loc2_:§package var§ = null;
         var _loc3_:int = param1;
         while(_loc3_ < this.§'!H§)
         {
            _loc2_ = this.effects[_loc3_];
            _loc2_.§case set final§.enabled = false;
            if(_loc2_.§case set final§.numSounds == 0)
            {
               _loc2_.§case set final§.destroy();
               §package var§.destroy(_loc2_);
               this.effects.splice(_loc3_,1);
               --this.§'!H§;
               _loc3_--;
            }
            _loc3_++;
         }
      }
      
      private function §extends for each§(param1:SoundChannel) : void
      {
         param1.addEventListener(Event.SOUND_COMPLETE,this.§import var§);
         this.§3!P§[param1] = true;
         ++this.numSounds;
      }
      
      private function §var package default§(param1:SoundChannel) : void
      {
         param1.stop();
         param1.removeEventListener(Event.SOUND_COMPLETE,this.§import var§);
         delete this.§3!P§[param1];
         --this.numSounds;
      }
      
      private function §import var§(param1:Event) : void
      {
         this.§set const var§(param1.target as SoundChannel);
      }
      
      private function §"#K§(param1:§final var super§) : int
      {
         var _loc2_:§package var§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§'!H§)
         {
            _loc2_ = this.effects[_loc3_];
            if(_loc2_.§case set final§ == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function §switch package use§(param1:Vector3) : void
      {
         var §for const break§:Vector3 = param1;
         var §try package import§:Vector3 = §for const break§;
         this.§while package include§(§try package import§);
         this.effects.sort(function(param1:§package var§, param2:§package var§):Number
         {
            return param1.§implements set package§ - param2.§implements set package§;
         });
      }
      
      private function §while package include§(param1:Vector3) : void
      {
         var _loc2_:§package var§ = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         while(_loc6_ < this.§'!H§)
         {
            _loc2_ = this.effects[_loc6_];
            _loc2_.§case set final§.readPosition(_position);
            _loc3_ = param1.x - _position.x;
            _loc4_ = param1.y - _position.y;
            _loc5_ = param1.z - _position.z;
            _loc2_.§implements set package§ = _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
            _loc6_++;
         }
      }
   }
}

