package §7"j§
{
   import alternativa.math.Vector3;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class §implements for break§
   {
      private static var pool:§implements for break§;
      
      public static const §7!e§:int = 1000000;
      
      private static const §false package native§:Number = 1000;
      
      private static const §+!R§:Number = 5000;
      
      private static const §%!t§:Number = 5;
      
      internal var nextInPool:§implements for break§;
      
      private var §?"A§:Number;
      
      private var §#"g§:Number;
      
      private var sound:Sound;
      
      private var §<!6§:SoundChannel;
      
      private var transform:SoundTransform;
      
      private var §@t§:Number = 1;
      
      private var §var package extends§:Number = 1;
      
      private var §2&§:Number = 1;
      
      public function §implements for break§(param1:Sound, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         this.transform = new SoundTransform(0);
         super();
         this.init(param1,param2,param3,param4,param5);
      }
      
      public static function create(param1:Sound, param2:Number = 1, param3:Number = 1000, param4:Number = 5000, param5:Number = 5) : §implements for break§
      {
         var _loc6_:§implements for break§ = null;
         if(pool == null)
         {
            return new §implements for break§(param1,param3,param4,param5,param2);
         }
         _loc6_ = pool;
         _loc6_.init(param1,param3,param4,param5,param2);
         pool = _loc6_.nextInPool;
         _loc6_.nextInPool = null;
         return _loc6_;
      }
      
      public static function destroy(param1:§implements for break§) : void
      {
         param1.clear();
         if(pool == null)
         {
            pool = param1;
         }
         else
         {
            param1.nextInPool = pool;
            pool = param1;
         }
      }
      
      public function §case package case§() : Boolean
      {
         return this.§<!6§ != null;
      }
      
      public function get channel() : SoundChannel
      {
         return this.§<!6§;
      }
      
      public function get position() : Number
      {
         return this.§<!6§ == null ? Number(0) : Number(this.§<!6§.position);
      }
      
      public function init(param1:Sound, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.sound = param1;
         this.§?"A§ = param2;
         this.§var package extends§ = param5;
         this.§#"g§ = (Math.sqrt(param4) - 1) / (param3 - param2);
         this.volume = 1;
      }
      
      public function clear() : void
      {
         this.stop();
         this.sound = null;
      }
      
      public function get §include catch do§() : Number
      {
         return this.§var package extends§;
      }
      
      public function set §include catch do§(param1:Number) : void
      {
         this.§var package extends§ = param1;
         this.§false catch class§();
      }
      
      public function get volume() : Number
      {
         return this.§@t§;
      }
      
      public function set volume(param1:Number) : void
      {
         this.§@t§ = param1;
         this.§false catch class§();
      }
      
      public function §2"G§(param1:Vector3, param2:Vector3, param3:Vector3, param4:SoundTransform) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2.x - param1.x;
         var _loc7_:Number = param2.y - param1.y;
         var _loc8_:Number = param2.z - param1.z;
         var _loc9_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_);
         if(_loc9_ < this.§?"A§)
         {
            param4.volume = 1;
            param4.pan = 0;
         }
         else
         {
            _loc5_ = 1 + this.§#"g§ * (_loc9_ - this.§?"A§);
            _loc5_ = 1 / (_loc5_ * _loc5_);
            param4.volume = _loc5_;
            _loc9_ = 1 / _loc9_;
            _loc6_ *= _loc9_;
            _loc7_ *= _loc9_;
            _loc8_ *= _loc9_;
            param4.pan = (_loc6_ * param3.x + _loc7_ * param3.y + _loc8_ * param3.z) * (1 - _loc5_);
         }
      }
      
      public function §class catch switch§(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         if(this.§<!6§ != null)
         {
            this.§2"G§(param1,param2,param3,this.transform);
            this.transform.volume *= this.§2&§;
            this.§<!6§.soundTransform = this.transform;
         }
      }
      
      public function play(param1:int, param2:int) : SoundChannel
      {
         if(this.§<!6§ != null)
         {
            this.§<!6§.stop();
         }
         return this.§<!6§ = this.sound.play(param1,param2);
      }
      
      public function stop() : void
      {
         if(this.§<!6§ != null)
         {
            this.§<!6§.stop();
            this.§<!6§ = null;
         }
      }
      
      private function §false catch class§() : void
      {
         this.§2&§ = this.§var package extends§ * this.§@t§;
      }
   }
}

