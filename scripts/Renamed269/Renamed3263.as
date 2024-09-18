package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class Renamed3263 extends Renamed1444 implements Renamed608
   {
      private static const Renamed6996:Vector3 = new Vector3();
      
      private var sound:Renamed1442;
      
      private var Renamed6997:int;
      
      private var startTime:int;
      
      private var Renamed6998:int;
      
      private var object:Object3D;
      
      private var channel:SoundChannel;
      
      private var alive:Boolean;
      
      private var time:int;
      
      private var Renamed6999:Number;
      
      private var Renamed7000:Number;
      
      private var listener:Renamed6441;
      
      public function Renamed3263(param1:Renamed1443)
      {
         super(param1);
      }
      
      public function Renamed7001(param1:Renamed1442, param2:Object3D, param3:Renamed6441 = null) : void
      {
         this.init(param1,param2,0,1,0,param3);
      }
      
      public function init(param1:Renamed1442, param2:Object3D, param3:int = 0, param4:int = 1, param5:int = 0, param6:Renamed6441 = null) : void
      {
         this.sound = param1;
         this.object = param2;
         this.Renamed6997 = param3;
         this.Renamed6998 = param4;
         this.startTime = param5;
         this.listener = param6;
         this.alive = true;
         this.time = 0;
         this.Renamed6999 = param1.volume;
         this.Renamed7000 = 0;
      }
      
      public function play(param1:int, param2:Renamed842) : void
      {
         if(!this.alive)
         {
            return;
         }
         if(this.time < this.Renamed6997)
         {
            this.time += param1;
            return;
         }
         if(!this.sound.Renamed7002())
         {
            this.channel = this.sound.play(this.startTime,this.Renamed6998);
            if(this.channel != null)
            {
               this.channel.addEventListener(Event.SOUND_COMPLETE,this.Renamed6540);
            }
         }
         Renamed6996.x = this.object.x;
         Renamed6996.y = this.object.y;
         Renamed6996.z = this.object.z;
         if(this.Renamed7000 > 0)
         {
            this.Renamed6999 -= this.Renamed7000 * param1;
            if(this.Renamed6999 <= 0)
            {
               this.Renamed7000 = 0;
               this.Renamed6999 = 0;
            }
            this.sound.volume = this.Renamed6999;
         }
         this.sound.Renamed6974(param2.position,Renamed6996,param2.Renamed594);
      }
      
      public function destroy() : void
      {
         this.Renamed7003();
         Renamed1442.destroy(this.sound);
         this.object = null;
         this.sound = null;
         if(this.listener != null)
         {
            this.listener.Renamed6447(this);
            this.listener = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(!param1)
         {
            this.Renamed7003();
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function get numSounds() : int
      {
         return this.alive ? int(1) : int(0);
      }
      
      public function Renamed3279(param1:int) : void
      {
         this.Renamed7000 = this.Renamed6999 / param1;
      }
      
      private function Renamed6540(param1:Event) : void
      {
         this.Renamed7003();
         this.alive = false;
      }
      
      private function Renamed7003() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.Renamed6540);
            this.channel = null;
         }
         this.sound.stop();
         if(this.Renamed6998 <= 1)
         {
            this.alive = false;
         }
      }
   }
}

