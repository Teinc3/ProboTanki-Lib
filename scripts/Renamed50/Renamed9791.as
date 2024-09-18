package Renamed50
{
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import Renamed82.Renamed8544;
   
   public class Renamed9791 extends Renamed1444 implements Renamed608
   {
      private static const Renamed9792:int = 100000;
      
      private static const Renamed7030:Number = 1000;
      
      private static const Renamed7031:Number = 2000;
      
      private static const Renamed7032:Number = 2;
      
      private static const Renamed8575:Number = 1;
      
      private static const Renamed6967:int = 200;
      
      private static const position:Vector3 = new Vector3();
      
      private var sfxData:Renamed9775;
      
      private var object:Object3D;
      
      private var _type:Renamed8544;
      
      private var _enabled:Boolean;
      
      private var dead:Boolean;
      
      private var Renamed6968:Renamed1442;
      
      private var Renamed2315:SoundChannel;
      
      public function Renamed9791(param1:Renamed1443)
      {
         super(param1);
      }
      
      public function init(param1:Renamed9775, param2:Object3D) : void
      {
         this.sfxData = param1;
         this.object = param2;
         this._type = Renamed8544.OFF;
         this.dead = false;
         this._enabled = false;
      }
      
      public function set type(param1:Renamed8544) : void
      {
         if(this._type != param1)
         {
            this._type = param1;
            this.Renamed9793();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            if(!this._enabled)
            {
               this.Renamed6968.stop();
               this.Renamed2315 = null;
            }
         }
      }
      
      public function play(param1:int, param2:Renamed842) : void
      {
         if(!this.dead)
         {
            if(this.Renamed2315 == null)
            {
               this.Renamed2315 = this.Renamed6968.play(Renamed6967,Renamed9792);
            }
            position.x = this.object.x;
            position.y = this.object.y;
            position.z = this.object.z;
            this.Renamed6968.Renamed6974(param2.position,position,param2.Renamed594);
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function destroy() : void
      {
         if(this.Renamed6968 != null)
         {
            Renamed1442.destroy(this.Renamed6968);
            this.Renamed6968 = null;
            this.Renamed2315 = null;
         }
         this.sfxData = null;
         this.object = null;
         recycle();
      }
      
      public function get numSounds() : int
      {
         return this.dead ? int(0) : int(1);
      }
      
      public function kill() : void
      {
         this.dead = true;
      }
      
      private function Renamed9793() : void
      {
         var _loc1_:SoundTransform = null;
         if(this.Renamed2315 != null)
         {
            _loc1_ = this.Renamed2315.soundTransform;
            this.Renamed2315 = null;
         }
         if(this.Renamed6968 != null)
         {
            Renamed1442.destroy(this.Renamed6968);
         }
         var _loc2_:Sound = this.Renamed8584();
         this.Renamed6968 = Renamed1442.create(_loc2_,Renamed8575,Renamed7030,Renamed7031,Renamed7032);
         if(_loc1_ != null)
         {
            this.Renamed2315 = this.Renamed6968.play(Renamed6967,Renamed9792);
            if(this.Renamed2315 != null)
            {
               this.Renamed2315.soundTransform = _loc1_;
            }
         }
      }
      
      private function Renamed8584() : Sound
      {
         switch(this._type)
         {
            case Renamed8544.IDLE:
               return this.sfxData.idleSound;
            case Renamed8544.HEALING:
               return this.sfxData.Renamed9780;
            case Renamed8544.DAMAGING:
               return this.sfxData.Renamed9784;
            default:
               throw new Error();
         }
      }
   }
}

