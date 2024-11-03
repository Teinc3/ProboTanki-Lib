package Renamed4643
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.utils.Dictionary;
   
   public class Renamed9363 extends Renamed1444 implements Renamed609
   {
      private static const Renamed9735:ConsoleVarFloat = new ConsoleVarFloat("beam_zoffset",100,0,1000);
      
      private static const Renamed9736:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private var Renamed4942:Renamed9737;
      
      private var alive:Boolean;
      
      private var object:Object3D;
      
      private var Renamed9738:Vector3;
      
      private var Renamed9739:Dictionary;
      
      private var container:Renamed908;
      
      public function Renamed9363(param1:Renamed1443)
      {
         this.Renamed9738 = new Vector3();
         super(param1);
         this.Renamed4942 = new Renamed9737(1,1,1,0);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Renamed9725, param4:Dictionary) : void
      {
         this.object = param1;
         this.Renamed9738.copy(param2);
         this.Renamed4942.Renamed1265(param3.Renamed9730,param3.Renamed9729);
         this.Renamed4942.Renamed9740(param3.Renamed9741);
         this.Renamed4942.Renamed858 = param3.Renamed858;
         this.Renamed9742(param3.Renamed9743);
         this.Renamed4942.Renamed9744(param3.Renamed9745);
         this.Renamed4942.alpha = param3.alpha;
         this.alive = true;
         this.Renamed9739 = param4;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         Renamed9736.x = this.object.x;
         Renamed9736.y = this.object.y;
         Renamed9736.z = this.object.z + Renamed9735.value;
         direction.diff(this.Renamed9738,Renamed9736);
         this.Renamed4942.setLength(direction.length());
         direction.normalize();
         Renamed6378.Renamed6415(this.Renamed4942,Renamed9736,direction,param2.position);
         this.Renamed4942.update(param1 * 0.001);
         return this.alive;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed4942);
         this.Renamed9739[this.Renamed4942] = true;
      }
      
      public function destroy() : void
      {
         this.object = null;
         this.container.removeChild(this.Renamed4942);
         this.Renamed4942.setMaterialToAllFaces(null);
         delete this.Renamed9739[this.Renamed4942];
         this.Renamed9739 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function Renamed9742(param1:Number) : void
      {
         this.Renamed4942.setWidth(param1);
         this.Renamed4942.Renamed9746(param1);
      }
   }
}

