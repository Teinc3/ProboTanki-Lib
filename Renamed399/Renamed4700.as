package Renamed399
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.battle.Renamed623;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   
   use namespace alternativa3d;
   
   public class Renamed4700 implements Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed8511:ConsoleVarFloat = new ConsoleVarFloat("ph_scale",0.12,0.00001,10);
      
      private static const Renamed8512:ConsoleVarFloat = new ConsoleVarFloat("pfh_scale",0.1,0.00001,10);
      
      private static const m:Matrix4 = new Matrix4();
      
      private static const m1:Matrix4 = new Matrix4();
      
      private static const v:Vector3 = new Vector3();
      
      private static const Renamed8513:Vector3 = new Vector3();
      
      private static const Renamed1466:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private var camera:Camera3D;
      
      private var Renamed8514:Renamed8515;
      
      public function Renamed4700(param1:Camera3D, param2:Vector3)
      {
         super();
         this.camera = param1;
         this.Renamed8514 = new Renamed8515(param2);
         this.Renamed8514.visible = false;
         battleService.Renamed622().Renamed744(this.Renamed8514);
      }
      
      private static function Renamed8516(param1:Camera3D, param2:Vector3) : Number
      {
         var _loc3_:Number = Math.cos(param1.rotationX);
         var _loc4_:Number = Math.sin(param1.rotationX);
         var _loc5_:Number = Math.cos(param1.rotationY);
         var _loc6_:Number = Math.sin(param1.rotationY);
         var _loc7_:Number = Math.cos(param1.rotationZ);
         var _loc8_:Number = Math.sin(param1.rotationZ);
         var _loc9_:Number = _loc7_ * _loc6_ * _loc3_ + _loc8_ * _loc4_;
         var _loc10_:Number = -_loc7_ * _loc4_ + _loc6_ * _loc8_ * _loc3_;
         var _loc11_:Number = _loc5_ * _loc3_;
         var _loc12_:Number = -_loc9_ * param1.x - _loc10_ * param1.y - _loc11_ * param1.z;
         var _loc13_:Number = param1.view.width * 0.5;
         var _loc14_:Number = param1.view.height * 0.5;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_) / Math.tan(param1.fov * 0.5);
         var _loc16_:Number = _loc9_ * param2.x + _loc10_ * param2.y + _loc11_ * param2.z + _loc12_;
         return _loc15_ / _loc16_;
      }
      
      private static function Renamed8517(param1:Object3D) : Matrix4
      {
         var _loc2_:Number = Math.cos(param1.rotationX);
         var _loc3_:Number = Math.sin(param1.rotationX);
         var _loc4_:Number = Math.cos(param1.rotationY);
         var _loc5_:Number = Math.sin(param1.rotationY);
         var _loc6_:Number = Math.cos(param1.rotationZ);
         var _loc7_:Number = Math.sin(param1.rotationZ);
         var _loc8_:Number = _loc6_ * _loc5_;
         var _loc9_:Number = _loc7_ * _loc5_;
         var _loc10_:Number = _loc4_ * param1.scaleX;
         var _loc11_:Number = _loc3_ * param1.scaleY;
         var _loc12_:Number = _loc2_ * param1.scaleY;
         var _loc13_:Number = _loc2_ * param1.scaleZ;
         var _loc14_:Number = _loc3_ * param1.scaleZ;
         m1.m00 = _loc6_ * _loc10_;
         m1.m01 = _loc8_ * _loc11_ - _loc7_ * _loc12_;
         m1.m02 = _loc8_ * _loc13_ + _loc7_ * _loc14_;
         m1.m03 = param1.x;
         m1.m10 = _loc7_ * _loc10_;
         m1.m11 = _loc9_ * _loc11_ + _loc6_ * _loc12_;
         m1.m12 = _loc9_ * _loc13_ - _loc6_ * _loc14_;
         m1.m13 = param1.y;
         m1.m20 = -_loc5_ * param1.scaleX;
         m1.m21 = _loc4_ * _loc11_;
         m1.m22 = _loc4_ * _loc13_;
         m1.m23 = param1.z;
         return m1;
      }
      
      public function show() : void
      {
         this.Renamed8514.visible = true;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Matrix4 = this.Renamed8518();
         this.Renamed8519(_loc3_);
      }
      
      private function Renamed8519(param1:Matrix4) : void
      {
         var _loc2_:Number = NaN;
         this.Renamed8514.Renamed8520(v);
         v.transform4(param1);
         this.Renamed8521(v);
         var _loc3_:Number = 15;
         var _loc4_:Number = this.Renamed8522();
         var _loc5_:Boolean = this.Renamed8523(v.x,v.y,_loc3_,_loc4_);
         if(v.z > 0 && _loc5_)
         {
            _loc2_ = this.Renamed8524();
            if(_loc2_ == 0)
            {
               this.Renamed8514.visible = false;
               this.Renamed8514.alpha = 0;
            }
            else
            {
               this.Renamed8514.visible = true;
               this.Renamed8514.alpha = _loc2_;
            }
         }
         else
         {
            this.Renamed8514.alpha = 1;
            this.Renamed8514.visible = false;
         }
         var _loc6_:Renamed623 = battleService.Renamed622();
         this.Renamed8514.x = int(v.x + _loc6_.Renamed745() / 2 - 12);
         this.Renamed8514.y = int(v.y + _loc6_.Renamed746() / 2 - 12);
      }
      
      private function Renamed8524() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:RayIntersectionData = null;
         this.Renamed8514.Renamed8520(Renamed8513);
         var _loc4_:Number = Renamed8516(this.camera,Renamed8513);
         if(_loc4_ < Renamed8512.value)
         {
            return 1;
         }
         Renamed1466.reset(this.camera.x,this.camera.y,this.camera.z);
         direction.diff(Renamed8513,Renamed1466);
         _loc2_ = direction.length();
         direction.normalize();
         _loc3_ = battleService.Renamed621().raycast(Renamed1466,direction,battleService.Renamed647());
         if(_loc3_ != null && _loc3_.time < _loc2_)
         {
            _loc1_ = 1;
         }
         else if(_loc4_ > Renamed8511.value)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = (Renamed8511.value - _loc4_) / (Renamed8511.value - Renamed8512.value);
         }
         return _loc1_;
      }
      
      private function Renamed8521(param1:Vector3) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1.z > 0.001)
         {
            param1.x = param1.x * this.camera.alternativa3d::viewSizeX / param1.z;
            param1.y = param1.y * this.camera.alternativa3d::viewSizeY / param1.z;
         }
         else if(param1.z < -0.001)
         {
            param1.x = -param1.x * this.camera.alternativa3d::viewSizeX / param1.z;
            param1.y = -param1.y * this.camera.alternativa3d::viewSizeY / param1.z;
         }
         else
         {
            _loc2_ = battleService.Renamed622().Renamed747();
            _loc3_ = Math.sqrt(param1.x * param1.x + param1.y * param1.y);
            param1.x *= _loc2_ / _loc3_;
            param1.y *= _loc2_ / _loc3_;
         }
      }
      
      private function Renamed8522() : int
      {
         switch(battleService.Renamed622().Renamed733())
         {
            case Renamed623.Renamed721:
               return 70;
            case Renamed623.Renamed721 - 1:
               return 40;
            default:
               return 15;
         }
      }
      
      private function Renamed8523(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Renamed623 = battleService.Renamed622();
         var _loc6_:Number = _loc5_.Renamed745() / 2 - param3;
         var _loc7_:Number = _loc5_.Renamed746() / 2 - param4;
         return param1 >= -_loc6_ && param1 <= _loc6_ && param2 >= -_loc7_ && param2 <= _loc7_;
      }
      
      private function Renamed8518() : Matrix4
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = this.camera.alternativa3d::viewSizeX / this.camera.alternativa3d::focalLength;
         var _loc9_:Number = this.camera.alternativa3d::viewSizeY / this.camera.alternativa3d::focalLength;
         var _loc10_:Number = Math.cos(this.camera.rotationX);
         var _loc11_:Number = Math.sin(this.camera.rotationX);
         _loc1_ = Math.cos(this.camera.rotationY);
         _loc2_ = Math.sin(this.camera.rotationY);
         _loc3_ = Math.cos(this.camera.rotationZ);
         _loc4_ = Math.sin(this.camera.rotationZ);
         var _loc12_:Number = _loc3_ * _loc2_;
         _loc5_ = _loc4_ * _loc2_;
         var _loc13_:Number = _loc1_ * this.camera.scaleX;
         _loc6_ = _loc11_ * this.camera.scaleY;
         var _loc14_:Number = _loc10_ * this.camera.scaleY;
         _loc7_ = _loc10_ * this.camera.scaleZ;
         var _loc15_:Number = _loc11_ * this.camera.scaleZ;
         m.m00 = _loc3_ * _loc13_ * _loc8_;
         m.m01 = (_loc12_ * _loc6_ - _loc4_ * _loc14_) * _loc9_;
         m.m02 = _loc12_ * _loc7_ + _loc4_ * _loc15_;
         m.m03 = this.camera.x;
         m.m10 = _loc4_ * _loc13_ * _loc8_;
         m.m11 = (_loc5_ * _loc6_ + _loc3_ * _loc14_) * _loc9_;
         m.m12 = _loc5_ * _loc7_ - _loc3_ * _loc15_;
         m.m13 = this.camera.y;
         m.m20 = -_loc2_ * this.camera.scaleX * _loc8_;
         m.m21 = _loc1_ * _loc6_ * _loc9_;
         m.m22 = _loc1_ * _loc7_;
         m.m23 = this.camera.z;
         var _loc16_:Object3D = this.camera;
         while(_loc16_.alternativa3d::_parent != null)
         {
            _loc16_ = _loc16_.alternativa3d::_parent;
            m.append(Renamed8517(_loc16_));
         }
         m.invert();
         return m;
      }
   }
}

