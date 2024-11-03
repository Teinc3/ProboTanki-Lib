package Renamed462
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1.set;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed9214 extends Renamed1444 implements Renamed609
   {
      private static const Renamed9215:Number = 90;
      
      private static const Renamed9216:Number = 200;
      
      private static const Renamed9217:Number = 60;
      
      private static const Renamed9218:Number = 0.15;
      
      private static const Renamed6475:Number = 0.25;
      
      private static const Renamed9219:Object3D = new Object3D();
      
      private static const Renamed9220:Vector3 = new Vector3();
      
      private var dust:Renamed9180;
      
      private var Renamed9221:Renamed9200;
      
      private var Renamed6909:set;
      
      private var time:Number;
      
      public function Renamed9214(param1:Renamed1443)
      {
         this.dust = new Renamed9180(Renamed9215,Renamed9216,Renamed9217,Renamed9218);
         this.Renamed9221 = new Renamed9200();
         super(param1);
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.Renamed9221.Renamed1418(param1);
         this.Renamed9221.start();
         this.dust.Renamed1418(param1);
         this.dust.start();
      }
      
      public function init(param1:set, param2:Renamed3075) : void
      {
         this.Renamed6909 = param1;
         param1.Renamed6904(Renamed9219);
         this.dust.Renamed9183(param2.dustTexture);
         this.Renamed9221.Renamed1179(param2.crumbsTexture);
         this.time = 0;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         this.Renamed6909.Renamed6905(Renamed9219,param2,param1);
         this.Renamed9222();
         var _loc3_:Number = param1 / 1000;
         this.time += _loc3_;
         if(this.time >= Renamed6475)
         {
            this.dust.stop();
            this.Renamed9221.stop();
         }
         var _loc4_:Boolean = this.dust.update(_loc3_);
         return Boolean(this.Renamed9221.update(_loc3_) || _loc4_);
      }
      
      private function Renamed9222() : void
      {
         Renamed9220.x = Renamed9219.x;
         Renamed9220.y = Renamed9219.y;
         Renamed9220.z = Renamed9219.z;
         this.dust.Renamed9191(Renamed9220);
         this.Renamed9221.Renamed9191(Renamed9220);
      }
      
      public function destroy() : void
      {
         this.dust.clear();
         this.Renamed9221.clear();
         this.Renamed6909.destroy();
         this.Renamed6909 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.dust.stop();
         this.Renamed9221.stop();
      }
   }
}

