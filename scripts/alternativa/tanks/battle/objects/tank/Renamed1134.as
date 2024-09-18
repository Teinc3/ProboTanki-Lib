package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.utils.MathUtils;
   import Renamed373.Renamed606;
   import Renamed373.Renamed666;
   
   public class Renamed1050
   {
      private static const Renamed1131:PhysicsMaterial = new PhysicsMaterial(0,1);
      
      private static const Renamed1132:PhysicsMaterial = new PhysicsMaterial(0,0.2);
      
      public function Renamed1050()
      {
         super();
      }
      
      public static function Renamed1052(param1:Vector3, param2:Number, param3:Renamed606) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2 - 10;
         var _loc7_:Number = param1.y;
         var _loc8_:Number = _loc6_ / 2;
         var _loc9_:Number = 0.82;
         var _loc10_:Number = 1 - (1 - _loc9_) * (1 - _loc9_) * _loc7_ * _loc7_ / (_loc8_ * _loc8_);
         if(_loc10_ > 0)
         {
            _loc10_ = Math.sqrt(_loc10_);
         }
         else
         {
            _loc10_ = 1 - (1 - _loc9_) * _loc7_ / _loc8_;
         }
         var _loc11_:Number = (_loc9_ - 1) * _loc7_ / ((1 + _loc10_) * _loc8_);
         var _loc12_:Number = _loc10_ * _loc8_ - _loc11_ * _loc7_;
         var _loc13_:Number = (1 - _loc9_) * _loc7_ / ((1 + _loc10_) * _loc8_);
         var _loc14_:Number = (1 - _loc10_) * _loc8_ / ((1 - _loc9_) * _loc7_);
         if(MathUtils.numbersEqual(_loc13_,_loc14_,0.00001) || _loc13_ < _loc14_)
         {
            _loc4_ = _loc9_ * _loc7_;
            _loc5_ = _loc11_ * _loc4_ + _loc12_;
         }
         else
         {
            _loc4_ = (1 - _loc10_) * _loc8_ / _loc11_ + _loc7_;
            _loc5_ = _loc8_;
         }
         var _loc15_:Number = _loc5_ - _loc10_ * _loc8_;
         var _loc16_:Number = _loc7_ - _loc4_;
         var _loc17_:Number = Math.sqrt(_loc15_ * _loc15_ + _loc16_ * _loc16_) / 2;
         _loc15_ = (1 + _loc10_) * _loc8_;
         _loc16_ = (1 - _loc9_) * _loc7_;
         var _loc18_:Number = Math.sqrt(_loc15_ * _loc15_ + _loc16_ * _loc16_) / 2;
         var _loc19_:CollisionBox = new CollisionBox(new Vector3(param1.x,_loc17_,_loc18_),Renamed666.Renamed690,Renamed1132);
         var _loc20_:Matrix4 = new Matrix4();
         var _loc21_:Number = Math.atan(_loc13_);
         _loc20_.setRotationMatrix(-_loc21_,0,0);
         var _loc22_:Number = _loc9_ * _loc7_ + _loc18_ * Math.sin(_loc21_) - _loc17_ * Math.cos(_loc21_);
         var _loc23_:Number = -_loc8_ + _loc18_ * Math.cos(_loc21_) + _loc17_ * Math.sin(_loc21_) - (param1.z - _loc6_ / 2);
         _loc20_.setPosition(new Vector3(0,_loc22_,_loc23_));
         param3.body.addCollisionShape(_loc19_,_loc20_);
         param3.Renamed1133.push(_loc19_);
         _loc19_ = new CollisionBox(new Vector3(param1.x,_loc17_,_loc18_),Renamed666.Renamed690,Renamed1132);
         _loc20_.setRotationMatrix(_loc21_,0,0);
         _loc20_.setPosition(new Vector3(0,-_loc22_,_loc23_));
         param3.body.addCollisionShape(_loc19_,_loc20_);
         param3.Renamed1133.push(_loc19_);
         var _loc24_:Number = param2 * 3 / 4;
         var _loc25_:Vector3 = new Vector3(param1.x,param1.y * _loc9_,_loc24_ / 2);
         var _loc26_:Matrix4;
         (_loc26_ = new Matrix4()).m23 = _loc25_.z - param1.z;
         var _loc27_:CollisionBox = new CollisionBox(_loc25_,Renamed666.Renamed690,Renamed1132);
         param3.body.addCollisionShape(_loc27_,_loc26_);
         param3.Renamed1133.push(_loc27_);
         var _loc28_:Number = param2 * 3 / 4;
         var _loc29_:Vector3 = new Vector3(param1.x,param1.y * _loc9_,_loc28_ / 2);
         var _loc30_:Matrix4;
         (_loc30_ = new Matrix4()).m23 = param2 - _loc29_.z - param1.z;
         var _loc31_:CollisionBox = new CollisionBox(_loc29_,Renamed666.Renamed690,Renamed1131);
         param3.body.addCollisionShape(_loc31_,_loc30_);
         param3.Renamed1133.push(_loc31_);
      }
      
      public static function Renamed1051(param1:Vector3, param2:Number, param3:Renamed606) : void
      {
         var _loc4_:Vector3 = new Vector3(param1.x,param1.y,param2 / 2);
         var _loc5_:CollisionBox = new CollisionBox(_loc4_,0,Renamed1132);
         var _loc6_:Matrix4;
         (_loc6_ = new Matrix4()).m23 = param2 / 2 - param1.z;
         param3.body.addCollisionShape(_loc5_,_loc6_);
         param3.Renamed1043 = _loc5_;
      }
   }
}

