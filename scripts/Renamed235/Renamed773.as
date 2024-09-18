package Renamed235
{
   import Renamed1.Renamed608;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   
   public class Renamed773 implements Renamed607
   {
      private static const Renamed6527:int = 10;
      
      private static const Renamed6528:int = 21;
      
      private static const _position:Vector3 = new Vector3();
      
      private var effects:Vector.<Renamed6529>;
      
      private var Renamed1359:int;
      
      private var Renamed974:Dictionary;
      
      private var numSounds:int;
      
      private var Renamed6530:Boolean;
      
      public function Renamed773()
      {
         this.effects = new Vector.<Renamed6529>();
         this.Renamed974 = new Dictionary();
         super();
      }
      
      public static function Renamed799(param1:Sound) : Renamed607
      {
         var _loc2_:SoundChannel = param1.play(0,1,new SoundTransform(0));
         if(_loc2_ != null)
         {
            _loc2_.stop();
            return new Renamed773();
         }
         return new Renamed6524();
      }
      
      public function Renamed2470(param1:Boolean) : void
      {
         this.Renamed6530 = param1;
      }
      
      public function Renamed2316(param1:Sound, param2:int = 0, param3:int = 0, param4:SoundTransform = null) : SoundChannel
      {
         var _loc5_:SoundChannel = null;
         if(this.Renamed6531(param1))
         {
            _loc5_ = param1.play(param2,param3,param4);
            if(_loc5_ != null)
            {
               this.Renamed6532(_loc5_);
            }
            return _loc5_;
         }
         return null;
      }
      
      private function Renamed6531(param1:Sound) : Boolean
      {
         return !this.Renamed6530 && this.numSounds < Renamed6527 && param1 != null;
      }
      
      public function Renamed2317(param1:SoundChannel) : void
      {
         if(param1 != null && this.Renamed974[param1] != null)
         {
            this.Renamed6533(param1);
         }
      }
      
      public function Renamed809() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.Renamed974)
         {
            this.Renamed6533(_loc1_ as SoundChannel);
         }
      }
      
      public function Renamed1121(param1:Renamed608) : void
      {
         if(this.Renamed6534(param1))
         {
            param1.enabled = true;
            this.effects.push(Renamed6529.create(0,param1));
            ++this.Renamed1359;
         }
      }
      
      private function Renamed6534(param1:Renamed608) : Boolean
      {
         return !this.Renamed6530 && param1 != null && this.Renamed6535(param1) < 0;
      }
      
      public function Renamed1070(param1:Renamed608) : void
      {
         var _loc2_:Renamed6529 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed1359)
         {
            _loc2_ = this.effects[_loc3_];
            if(_loc2_.Renamed6536 == param1)
            {
               param1.destroy();
               Renamed6529.destroy(_loc2_);
               this.effects.splice(_loc3_,1);
               --this.Renamed1359;
               return;
            }
            _loc3_++;
         }
      }
      
      public function Renamed810() : void
      {
         var _loc1_:Renamed6529 = null;
         while(this.effects.length > 0)
         {
            _loc1_ = this.effects.pop();
            _loc1_.Renamed6536.destroy();
            Renamed6529.destroy(_loc1_);
         }
         this.Renamed1359 = 0;
      }
      
      public function Renamed814(param1:int, param2:Renamed842) : void
      {
         var _loc3_:int = 0;
         if(this.Renamed1359 > 0)
         {
            this.Renamed6537(param2.position);
            _loc3_ = this.Renamed6538(param1,param2);
            this.Renamed6539(_loc3_);
         }
      }
      
      private function Renamed6538(param1:int, param2:Renamed842) : int
      {
         var _loc3_:Renamed6529 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < this.Renamed1359)
         {
            _loc3_ = this.effects[_loc4_];
            _loc5_ = _loc3_.Renamed6536.numSounds;
            if(_loc5_ == 0)
            {
               _loc3_.Renamed6536.destroy();
               Renamed6529.destroy(_loc3_);
               this.effects.splice(_loc4_,1);
               --this.Renamed1359;
               _loc4_--;
            }
            else if(_loc6_ + _loc5_ > Renamed6528)
            {
               if(_loc6_ == Renamed6528)
               {
                  break;
               }
               _loc3_.Renamed6536.enabled = false;
            }
            else
            {
               _loc3_.Renamed6536.enabled = true;
               _loc3_.Renamed6536.play(param1,param2);
               _loc6_ += _loc5_;
            }
            _loc4_++;
         }
         return _loc4_;
      }
      
      private function Renamed6539(param1:int) : void
      {
         var _loc2_:Renamed6529 = null;
         var _loc3_:int = param1;
         while(_loc3_ < this.Renamed1359)
         {
            _loc2_ = this.effects[_loc3_];
            _loc2_.Renamed6536.enabled = false;
            if(_loc2_.Renamed6536.numSounds == 0)
            {
               _loc2_.Renamed6536.destroy();
               Renamed6529.destroy(_loc2_);
               this.effects.splice(_loc3_,1);
               --this.Renamed1359;
               _loc3_--;
            }
            _loc3_++;
         }
      }
      
      private function Renamed6532(param1:SoundChannel) : void
      {
         param1.addEventListener(Event.SOUND_COMPLETE,this.Renamed6540);
         this.Renamed974[param1] = true;
         ++this.numSounds;
      }
      
      private function Renamed6533(param1:SoundChannel) : void
      {
         param1.stop();
         param1.removeEventListener(Event.SOUND_COMPLETE,this.Renamed6540);
         delete this.Renamed974[param1];
         --this.numSounds;
      }
      
      private function Renamed6540(param1:Event) : void
      {
         this.Renamed2317(param1.target as SoundChannel);
      }
      
      private function Renamed6535(param1:Renamed608) : int
      {
         var _loc2_:Renamed6529 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed1359)
         {
            _loc2_ = this.effects[_loc3_];
            if(_loc2_.Renamed6536 == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function Renamed6537(param1:Vector3) : void
      {
         var Renamed3693:Vector3 = param1;
         var Renamed6541:Vector3 = Renamed3693;
         this.Renamed6542(Renamed6541);
         this.effects.sort(function(param1:Renamed6529, param2:Renamed6529):Number
         {
            return param1.Renamed6543 - param2.Renamed6543;
         });
      }
      
      private function Renamed6542(param1:Vector3) : void
      {
         var _loc2_:Renamed6529 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         while(_loc6_ < this.Renamed1359)
         {
            _loc2_ = this.effects[_loc6_];
            _loc2_.Renamed6536.readPosition(_position);
            _loc3_ = param1.x - _position.x;
            _loc4_ = param1.y - _position.y;
            _loc5_ = param1.z - _position.z;
            _loc2_.Renamed6543 = _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
            _loc6_++;
         }
      }
   }
}

