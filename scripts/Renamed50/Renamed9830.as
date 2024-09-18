package Renamed50
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed1647;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import Renamed82.Renamed8544;
   
   public class Renamed9830 extends Renamed1444 implements Renamed609
   {
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed9841:Matrix4 = new Matrix4();
      
      private static const Renamed9738:Vector3 = new Vector3();
      
      private static const Renamed9736:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const Renamed1466:Vector3 = new Vector3();
      
      private static const Renamed9842:Number = 0.1;
      
      private static const Renamed9843:Number = 100;
      
      private var container:Renamed908;
      
      private var Renamed9844:Renamed9753;
      
      private var Renamed9845:Renamed1647;
      
      private var Renamed9846:Renamed1647;
      
      private var turret:Object3D;
      
      private var Renamed9828:Vector3;
      
      private var Renamed9847:Object3D;
      
      private var Renamed9848:Number = 0;
      
      private var show:Boolean;
      
      private var dead:Boolean;
      
      private var time:int;
      
      private var mode:Renamed8544;
      
      private var sfxData:Renamed9775;
      
      private var hitPoint:Vector3;
      
      private var Renamed9849:Vector3;
      
      private var targetPoint:Vector3;
      
      private var Renamed9850:Number;
      
      private var Renamed9851:Boolean;
      
      private var isLocal:Boolean;
      
      public function Renamed9830(param1:Renamed1443)
      {
         this.Renamed9828 = new Vector3();
         this.hitPoint = new Vector3();
         this.Renamed9849 = new Vector3();
         this.targetPoint = new Vector3();
         super(param1);
         this.Renamed9844 = new Renamed9753();
         this.Renamed9844.init(Renamed9757.Renamed9773,100);
         this.Renamed9845 = new Renamed1647(Renamed9757.Renamed9770,Renamed9757.Renamed9770);
         this.Renamed9846 = new Renamed1647(Renamed9757.Renamed9771,Renamed9757.Renamed9771);
         this.Renamed9846.originY = 0.5;
      }
      
      public function Renamed9837(param1:Renamed9775, param2:Object3D, param3:Vector3) : void
      {
         this.isLocal = true;
         this.init(param1,param2,param3);
      }
      
      public function Renamed9838(param1:Renamed9775, param2:Object3D, param3:Vector3) : void
      {
         this.isLocal = false;
         this.init(param1,param2,param3);
      }
      
      public function Renamed9839(param1:Renamed8544, param2:Object3D = null, param3:Vector3 = null) : void
      {
         var _loc4_:Number = NaN;
         this.Renamed9851 = false;
         if(param2 != null)
         {
            if(this.Renamed9847 == param2)
            {
               if(this.isLocal && this.targetPoint != null)
               {
                  this.Renamed9849.copy(this.targetPoint);
               }
               else
               {
                  this.Renamed9849.copy(this.hitPoint);
               }
               _loc4_ = this.Renamed9849.distanceToSquared(param3);
               if(_loc4_ > Renamed9843)
               {
                  this.Renamed9851 = true;
                  this.Renamed9850 = 0;
               }
            }
            this.hitPoint.copy(param3);
         }
         if(this.mode != param1 || this.Renamed9847 != param2)
         {
            this.Renamed9847 = param2;
            this.mode = param1;
            switch(param1)
            {
               case Renamed8544.IDLE:
                  this.Renamed9852();
                  break;
               case Renamed8544.HEALING:
                  this.Renamed9853();
                  break;
               case Renamed8544.DAMAGING:
                  this.Renamed9854();
            }
            this.Renamed9848 = 0;
         }
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.show)
         {
            this.Renamed9848 += Renamed9757.Renamed9769 * param1 / 1000;
            if(this.Renamed9848 > 1)
            {
               this.Renamed9848 = 1;
            }
         }
         else
         {
            this.Renamed9848 -= Renamed9757.Renamed9769 * param1 / 1000;
            if(this.Renamed9848 <= 0)
            {
               if(this.dead)
               {
                  return false;
               }
            }
         }
         this.updateVisibility();
         this.time += param1;
         var _loc3_:int = this.Renamed9855();
         if(this.mode == Renamed8544.DAMAGING || this.mode == Renamed8544.HEALING)
         {
            this.Renamed9856();
            this.Renamed9857(param2,param1,_loc3_);
         }
         return true;
      }
      
      private function init(param1:Renamed9775, param2:Object3D, param3:Vector3) : void
      {
         this.sfxData = param1;
         this.turret = param2;
         this.Renamed9828.copy(param3);
         this.mode = Renamed8544.OFF;
         this.Renamed9848 = 0;
         this.show = true;
         this.dead = false;
         this.time = 0;
         this.updateVisibility();
      }
      
      private function Renamed9856() : void
      {
         if(this.targetPoint == null)
         {
            this.targetPoint = new Vector3();
         }
         if(this.Renamed9851)
         {
            this.Renamed9858();
         }
         else
         {
            this.targetPoint.copy(this.hitPoint);
         }
      }
      
      private function Renamed9855() : int
      {
         Renamed1273.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         Renamed1273.transformVector(this.Renamed9828,Renamed9736);
         this.Renamed9845.x = Renamed9736.x;
         this.Renamed9845.y = Renamed9736.y;
         this.Renamed9845.z = Renamed9736.z;
         var _loc1_:int = this.Renamed9845.Renamed1654() * this.time / 1000;
         this.Renamed9845.Renamed1653(_loc1_);
         return _loc1_;
      }
      
      private function Renamed9858() : void
      {
         this.Renamed9850 += Renamed9842;
         if(this.Renamed9850 >= 1)
         {
            this.Renamed9850 = 1;
            this.Renamed9851 = false;
         }
         Vector3.interpolate(this.Renamed9850,this.Renamed9849,this.hitPoint,this.targetPoint);
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed9844);
         this.Renamed9844.setMaterialToAllFaces(null);
         this.container.removeChild(this.Renamed9846);
         this.Renamed9846.clear();
         this.container.removeChild(this.Renamed9845);
         this.Renamed9845.clear();
         this.container = null;
         this.sfxData = null;
         this.turret = null;
         this.Renamed9847 = null;
         this.targetPoint = null;
         recycle();
      }
      
      public function stop() : void
      {
         this.dead = true;
         this.show = false;
      }
      
      public function kill() : void
      {
         this.dead = true;
         this.show = false;
         this.Renamed9848 = 0;
      }
      
      private function Renamed9857(param1:Renamed842, param2:int, param3:int) : void
      {
         this.Renamed9846.Renamed1653(param3);
         Renamed9841.setMatrix(this.Renamed9847.x,this.Renamed9847.y,this.Renamed9847.z,this.Renamed9847.rotationX,this.Renamed9847.rotationY,this.Renamed9847.rotationZ);
         Renamed9841.transformVector(this.targetPoint,Renamed9738);
         direction.diff(Renamed9738,Renamed9736);
         var _loc4_:Number = direction.length() - Renamed9757.Renamed9772;
         if(_loc4_ < 0)
         {
            _loc4_ = 10;
         }
         this.Renamed9844.update(param2,_loc4_);
         direction.normalize();
         Renamed9738.x = Renamed9736.x + _loc4_ * direction.x;
         Renamed9738.y = Renamed9736.y + _loc4_ * direction.y;
         Renamed9738.z = Renamed9736.z + _loc4_ * direction.z;
         this.Renamed9846.x = Renamed9738.x;
         this.Renamed9846.y = Renamed9738.y;
         this.Renamed9846.z = Renamed9738.z;
         Renamed1466.x = param1.x;
         Renamed1466.y = param1.y;
         Renamed1466.z = param1.z;
         Renamed6378.Renamed6415(this.Renamed9844,Renamed9736,direction,Renamed1466);
      }
      
      private function updateVisibility() : void
      {
         this.Renamed9844.alpha = this.Renamed9848;
         this.Renamed9845.alpha = this.Renamed9848;
         this.Renamed9846.alpha = this.Renamed9848;
         var _loc1_:Number = Renamed9757.Renamed9206 + (1 - Renamed9757.Renamed9206) * this.Renamed9848;
         this.Renamed9844.scaleX = _loc1_;
         this.Renamed9845.scaleX = _loc1_;
         this.Renamed9845.scaleY = _loc1_;
         this.Renamed9845.scaleZ = _loc1_;
         this.Renamed9846.scaleX = _loc1_;
         this.Renamed9846.scaleY = _loc1_;
         this.Renamed9846.scaleZ = _loc1_;
      }
      
      private function hide() : void
      {
         this.show = false;
      }
      
      private function Renamed9852() : void
      {
         if(this.container != null)
         {
            this.container.removeChild(this.Renamed9844);
            this.container.removeChild(this.Renamed9846);
            this.container.addChild(this.Renamed9845);
            this.Renamed9845.Renamed1651(this.sfxData.Renamed9776);
            this.Renamed9845.Renamed1653(0);
         }
      }
      
      private function Renamed9853() : void
      {
         if(this.container != null)
         {
            this.container.addChild(this.Renamed9845);
            this.container.addChild(this.Renamed9844);
            this.container.addChild(this.Renamed9846);
            this.Renamed9844.Renamed1179(this.sfxData.Renamed9779,1);
            this.Renamed9845.Renamed1651(this.sfxData.Renamed9777);
            this.Renamed9845.Renamed1653(0);
            this.Renamed9846.Renamed1651(this.sfxData.Renamed9778);
            this.Renamed9846.Renamed1653(0);
         }
      }
      
      private function Renamed9854() : void
      {
         if(this.container != null)
         {
            this.container.addChild(this.Renamed9845);
            this.container.addChild(this.Renamed9844);
            this.container.addChild(this.Renamed9846);
            this.Renamed9844.Renamed1179(this.sfxData.Renamed9783,-1);
            this.Renamed9845.Renamed1651(this.sfxData.Renamed9781);
            this.Renamed9845.Renamed1653(0);
            this.Renamed9846.Renamed1651(this.sfxData.Renamed9782);
            this.Renamed9846.Renamed1653(0);
         }
      }
   }
}

