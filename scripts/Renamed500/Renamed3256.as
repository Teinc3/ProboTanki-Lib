package Renamed500
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed6378;
   import alternativa.engine3d.materials.Material;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed3256 extends Renamed1444 implements Renamed3268
   {
      public static const WIDTH:Number = 48;
      
      private var position:Vector3;
      
      private var direction:Vector3;
      
      private var Renamed9860:Number;
      
      private var Renamed5867:int;
      
      private var Renamed4942:Renamed9863;
      
      private var container:Renamed908;
      
      public function Renamed3256(param1:Renamed1443)
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.Renamed4942 = new Renamed9863();
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number, param4:Number, param5:Material, param6:int) : void
      {
         this.position.copy(param1);
         this.direction.copy(param2);
         this.Renamed5867 = param6;
         this.Renamed9860 = 1 / param6;
         this.Renamed4942.init(WIDTH,param3,param4,param5);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed5867 < 0)
         {
            return false;
         }
         this.Renamed5867 -= param1;
         this.Renamed4942.alpha -= this.Renamed9860 * param1;
         Renamed6378.Renamed6415(this.Renamed4942,this.position,this.direction,param2.position);
         return true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed4942);
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed4942);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.Renamed5867 = -1;
      }
   }
}

