package Renamed3294
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.camera.Renamed611;
   import alternativa.tanks.camera.Renamed1458;
   
   public class Renamed3296 extends Renamed1458 implements Renamed611
   {
      private static const Renamed5707:Matrix3 = new Matrix3();
      
      private static const Renamed5708:Matrix3 = new Matrix3();
      
      private static const vector:Vector3 = new Vector3();
      
      private var Renamed5709:Object3D;
      
      private var Renamed5710:Number = 0;
      
      private var Renamed5711:Vector3;
      
      private var Renamed5712:Number;
      
      private var Renamed5713:Number;
      
      private var Renamed5714:int;
      
      private var Renamed5715:Number = 1;
      
      private var Renamed5716:Number = 1;
      
      private var Renamed5717:Number = 0;
      
      private var Renamed5718:Number = 5;
      
      public function Renamed3296(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         this.Renamed5711 = new Vector3();
         super();
         this.Renamed5712 = param1;
         this.Renamed5713 = param2;
         this.Renamed5715 = param3;
         this.Renamed5718 = param4;
      }
      
      public function set Renamed3341(param1:int) : void
      {
         if(this.Renamed5714 != param1)
         {
            this.Renamed5714 = param1;
            this.Renamed5717 = 0;
         }
      }
      
      public function Renamed5719() : Boolean
      {
         return this.Renamed5710 == this.Renamed5712 || this.Renamed5710 == this.Renamed5713;
      }
      
      public function Renamed3351(param1:Vector3) : void
      {
         var _loc2_:Renamed842 = null;
         _loc2_ = Renamed739();
         param1.x = _loc2_.x;
         param1.y = _loc2_.y;
         param1.z = _loc2_.z;
      }
      
      public function Renamed3347(param1:Vector3) : void
      {
         var _loc2_:Renamed842 = Renamed739();
         var _loc3_:Vector3 = _loc2_.Renamed596;
         param1.copy(_loc3_);
      }
      
      public function get Renamed3340() : Number
      {
         return this.Renamed5710;
      }
      
      public function set Renamed3340(param1:Number) : void
      {
         if(param1 > this.Renamed5712)
         {
            this.Renamed5710 = this.Renamed5712;
         }
         else if(param1 < this.Renamed5713)
         {
            this.Renamed5710 = this.Renamed5713;
         }
         else
         {
            this.Renamed5710 = param1;
         }
      }
      
      public function Renamed3333(param1:Object3D) : void
      {
         this.Renamed5709 = param1;
      }
      
      public function Renamed3339(param1:Vector3) : void
      {
         this.Renamed5711.copy(param1);
      }
      
      public function Renamed5720(param1:Number) : void
      {
         this.Renamed5716 = param1;
      }
      
      override public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = param2 / 1000;
         if(this.Renamed5714 != 0)
         {
            this.Renamed5717 += this.Renamed5718 * _loc4_;
            _loc3_ = this.Renamed5715 * this.Renamed5716;
            if(this.Renamed5717 > _loc3_)
            {
               this.Renamed5717 = _loc3_;
            }
            this.Renamed5710 += this.Renamed5714 * this.Renamed5717 * _loc4_;
            if(this.Renamed5710 > this.Renamed5712)
            {
               this.Renamed5710 = this.Renamed5712;
            }
            else if(this.Renamed5710 < this.Renamed5713)
            {
               this.Renamed5710 = this.Renamed5713;
            }
         }
         Renamed5707.setRotationMatrix(this.Renamed5709.rotationX,this.Renamed5709.rotationY,this.Renamed5709.rotationZ);
         Renamed5708.fromAxisAngle(Vector3.X_AXIS,this.Renamed5710 - Math.PI / 2);
         Renamed5708.append(Renamed5707);
         Renamed5708.getEulerAngles(vector);
         var _loc5_:Renamed842;
         (_loc5_ = Renamed739()).rotationX = vector.x;
         _loc5_.rotationY = vector.y;
         _loc5_.rotationZ = vector.z;
         Renamed5707.transformVector(this.Renamed5711,vector);
         _loc5_.x = vector.x + this.Renamed5709.x;
         _loc5_.y = vector.y + this.Renamed5709.y;
         _loc5_.z = vector.z + this.Renamed5709.z;
      }
      
      public function Renamed5721(param1:Number) : void
      {
         Renamed739().fov = param1;
      }
   }
}

