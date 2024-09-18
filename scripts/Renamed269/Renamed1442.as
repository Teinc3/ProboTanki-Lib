package Renamed1
{
   import alternativa.math.Vector3;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class Renamed1442
   {
      private static var pool:Renamed1442;
      
      public static const Renamed7029:int = 1000000;
      
      private static const Renamed7030:Number = 1000;
      
      private static const Renamed7031:Number = 5000;
      
      private static const Renamed7032:Number = 5;
      
      internal var nextInPool:Renamed1442;
      
      private var Renamed7033:Number;
      
      private var Renamed7034:Number;
      
      private var sound:Sound;
      
      private var Renamed7035:SoundChannel;
      
      private var transform:SoundTransform;
      
      private var Renamed7036:Number = 1;
      
      private var Renamed7037:Number = 1;
      
      private var Renamed7038:Number = 1;
      
      public function Renamed1442(param1:Sound, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         this.transform = new SoundTransform(0);
         super();
         this.init(param1,param2,param3,param4,param5);
      }
      
      public static function create(param1:Sound, param2:Number = 1, param3:Number = 1000, param4:Number = 5000, param5:Number = 5) : Renamed1442
      {
         var _loc6_:Renamed1442 = null;
         if(pool == null)
         {
            return new Renamed1442(param1,param3,param4,param5,param2);
         }
         _loc6_ = pool;
         _loc6_.init(param1,param3,param4,param5,param2);
         pool = _loc6_.nextInPool;
         _loc6_.nextInPool = null;
         return _loc6_;
      }
      
      public static function destroy(param1:Renamed1442) : void
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
      
      public function Renamed7002() : Boolean
      {
         return this.Renamed7035 != null;
      }
      
      public function get channel() : SoundChannel
      {
         return this.Renamed7035;
      }
      
      public function get position() : Number
      {
         return this.Renamed7035 == null ? Number(0) : Number(this.Renamed7035.position);
      }
      
      public function init(param1:Sound, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.sound = param1;
         this.Renamed7033 = param2;
         this.Renamed7037 = param5;
         this.Renamed7034 = (Math.sqrt(param4) - 1) / (param3 - param2);
         this.volume = 1;
      }
      
      public function clear() : void
      {
         this.stop();
         this.sound = null;
      }
      
      public function get Renamed7039() : Number
      {
         return this.Renamed7037;
      }
      
      public function set Renamed7039(param1:Number) : void
      {
         this.Renamed7037 = param1;
         this.Renamed7040();
      }
      
      public function get volume() : Number
      {
         return this.Renamed7036;
      }
      
      public function set volume(param1:Number) : void
      {
         this.Renamed7036 = param1;
         this.Renamed7040();
      }
      
      public function Renamed7041(param1:Vector3, param2:Vector3, param3:Vector3, param4:SoundTransform) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2.x - param1.x;
         var _loc7_:Number = param2.y - param1.y;
         var _loc8_:Number = param2.z - param1.z;
         var _loc9_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_);
         if(_loc9_ < this.Renamed7033)
         {
            param4.volume = 1;
            param4.pan = 0;
         }
         else
         {
            _loc5_ = 1 + this.Renamed7034 * (_loc9_ - this.Renamed7033);
            _loc5_ = 1 / (_loc5_ * _loc5_);
            param4.volume = _loc5_;
            _loc9_ = 1 / _loc9_;
            _loc6_ *= _loc9_;
            _loc7_ *= _loc9_;
            _loc8_ *= _loc9_;
            param4.pan = (_loc6_ * param3.x + _loc7_ * param3.y + _loc8_ * param3.z) * (1 - _loc5_);
         }
      }
      
      public function Renamed6974(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         if(this.Renamed7035 != null)
         {
            this.Renamed7041(param1,param2,param3,this.transform);
            this.transform.volume *= this.Renamed7038;
            this.Renamed7035.soundTransform = this.transform;
         }
      }
      
      public function play(param1:int, param2:int) : SoundChannel
      {
         if(this.Renamed7035 != null)
         {
            this.Renamed7035.stop();
         }
         return this.Renamed7035 = this.sound.play(param1,param2);
      }
      
      public function stop() : void
      {
         if(this.Renamed7035 != null)
         {
            this.Renamed7035.stop();
            this.Renamed7035 = null;
         }
      }
      
      private function Renamed7040() : void
      {
         this.Renamed7038 = this.Renamed7037 * this.Renamed7036;
      }
   }
}

