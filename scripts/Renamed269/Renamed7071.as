package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.core.Light3D;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed6983 extends Renamed1444 implements Renamed609
   {
      private static const Renamed5211:int = 250;
      
      protected var light:Light3D;
      
      protected var Renamed6985:Renamed3193;
      
      protected var Renamed6986:Renamed3193;
      
      protected var startTime:int;
      
      protected var Renamed6984:int;
      
      protected var Renamed7069:int;
      
      protected var currentTime:int;
      
      protected var Renamed3675:Boolean;
      
      protected var Renamed6909:Renamed6901;
      
      protected var alive:Boolean;
      
      protected var random:int;
      
      protected var Renamed6972:Boolean;
      
      protected var fadeTime:int;
      
      protected var container:Renamed908;
      
      public function Renamed6983(param1:Renamed1443, param2:Light3D)
      {
         super(param1);
         this.light = param2;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.light);
      }
      
      private function Renamed7070() : void
      {
         this.Renamed7069 = this.Renamed6984 + (Math.random() * this.random - this.random / 2);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(!this.alive)
         {
            return false;
         }
         if(this.Renamed3675)
         {
            this.currentTime += param1;
            this.Renamed6985.Renamed6913(this.light,this.currentTime,this.startTime);
            if(this.currentTime >= this.startTime)
            {
               this.Renamed3675 = false;
               this.currentTime = 0;
               this.Renamed7070();
            }
         }
         else
         {
            this.currentTime += param1;
            if(this.currentTime > this.Renamed7069)
            {
               this.currentTime %= this.Renamed7069;
               this.Renamed7070();
            }
            this.Renamed6986.Renamed6913(this.light,this.currentTime,this.Renamed6984);
         }
         this.Renamed6909.Renamed6905(this.light,param2,param1);
         if(this.Renamed6972)
         {
            this.fadeTime += param1;
            if(this.fadeTime <= Renamed5211)
            {
               this.light.intensity *= 1 - this.fadeTime / Renamed5211;
            }
            else
            {
               this.light.intensity = 0;
               this.kill();
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container = null;
         this.Renamed6985 = null;
         this.Renamed6986 = null;
         this.Renamed6909.destroy();
         this.Renamed6909 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function stop() : void
      {
         this.Renamed6972 = true;
         this.fadeTime = 0;
      }
   }
}

