package Renamed56
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed6377;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed843;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed10041 extends Renamed1444 implements Renamed609
   {
      private var position:Vector3;
      
      private var direction:Vector3;
      
      private var currentTime:int;
      
      private var maxTime:int;
      
      private var Renamed5093:Renamed6377;
      
      private var container:Renamed908;
      
      public function Renamed10041(param1:Renamed1443)
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.Renamed5093 = new Renamed6377(30,200,0,-100,0);
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Renamed843) : void
      {
         this.position.copy(param1);
         this.direction.copy(param2);
         this.Renamed5093.init(param3,0.001 * param3.fps);
         this.maxTime = this.Renamed5093.Renamed6419();
         this.currentTime = 0;
         this.Renamed5093.x = param1.x;
         this.Renamed5093.y = param1.y;
         this.Renamed5093.z = param1.z;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.currentTime >= this.maxTime)
         {
            return false;
         }
         this.Renamed5093.setTime(this.currentTime);
         this.currentTime += param1;
         Renamed6378.Renamed6415(this.Renamed5093,this.position,this.direction,param2.position);
         return true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed5093);
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed5093);
         this.container = null;
         this.Renamed5093.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.currentTime = this.maxTime;
      }
   }
}

