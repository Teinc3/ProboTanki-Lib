package Renamed405
{
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.media.Sound;
   
   public class Renamed8574 extends Renamed1444 implements Renamed608
   {
      private static const Renamed7030:Number = 1500;
      
      private static const Renamed7031:Number = 5000;
      
      private static const Renamed7032:Number = 10;
      
      private static const Renamed8575:Number = 1.3;
      
      private var Renamed8576:Renamed1442;
      
      private var position:Vector3;
      
      private var alive:Boolean;
      
      public function Renamed8574(param1:Renamed1443)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:Sound, param2:Vector3) : void
      {
         this.Renamed8576 = Renamed1442.create(param1,Renamed8575,Renamed7030,Renamed7031,Renamed7032);
         this.position.copy(param2);
         this.alive = true;
      }
      
      public function play(param1:int, param2:Renamed842) : void
      {
         if(!this.Renamed8576.Renamed7002())
         {
            this.Renamed8576.play(0,99999);
         }
         this.Renamed8576.Renamed6974(param2.position,this.position,param2.Renamed594);
      }
      
      public function destroy() : void
      {
         this.Renamed8576.stop();
         Renamed1442.destroy(this.Renamed8576);
         this.Renamed8576 = null;
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
            this.Renamed8576.stop();
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
   }
}

