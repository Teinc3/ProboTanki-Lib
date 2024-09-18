package Renamed396
{
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed8467 extends Renamed1444 implements Renamed608
   {
      private static const Renamed8468:int = 99999;
      
      private var tankHitSound:Renamed1442;
      
      private var hitSound:Renamed1442;
      
      private var Renamed8469:Renamed1442;
      
      private var Renamed8470:Renamed1442;
      
      private var position:Vector3;
      
      private var alive:Boolean;
      
      public function Renamed8467(param1:Renamed1443)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:Renamed1442, param2:Renamed1442) : void
      {
         this.hitSound = param1;
         this.tankHitSound = param2;
         this.alive = true;
         this.Renamed8469 = param1;
      }
      
      public function Renamed1554(param1:Vector3, param2:Boolean) : void
      {
         this.position.copy(param1);
         this.Renamed8470 = this.Renamed8469;
         this.Renamed8469 = param2 ? this.tankHitSound : this.hitSound;
         if(this.Renamed8470 != this.Renamed8469)
         {
            this.Renamed8471();
         }
      }
      
      public function play(param1:int, param2:Renamed842) : void
      {
         if(!this.Renamed8469.Renamed7002())
         {
            this.Renamed8469.play(0,Renamed8468);
         }
         this.Renamed8469.Renamed6974(param2.position,this.position,param2.Renamed594);
      }
      
      public function destroy() : void
      {
         this.Renamed8471();
         this.hitSound = null;
         this.tankHitSound = null;
         this.Renamed8469 = null;
         this.Renamed8470 = null;
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
            this.Renamed8471();
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.copy(this.position);
      }
      
      public function get numSounds() : int
      {
         return this.alive ? int(1) : int(0);
      }
      
      private function Renamed8471() : void
      {
         this.hitSound.stop();
         this.tankHitSound.stop();
      }
   }
}

