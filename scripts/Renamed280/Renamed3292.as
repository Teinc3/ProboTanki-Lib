package Renamed280
{
   import Renamed479.Renamed3148;
   import Renamed479.Renamed915;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.weapon.shaft.Renamed3140;
   import alternativa.tanks.models.weapon.shaft.Renamed3138;
   import alternativa.tanks.models.weapon.shaft.Renamed3208;
   import alternativa.tanks.models.weapon.shaft.Renamed3212;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.events.FullScreenEvent;
   import flash.geom.Point;
   import Renamed94.Renamed96;
   
   public class Renamed3292 implements Renamed3230
   {
      [Inject]
      public static var display:IDisplay;
      
      private var context:Renamed3290;
      
      private var weapon:Renamed3208;
      
      private var Renamed7159:int;
      
      private var Renamed7160:Number;
      
      private var Renamed7161:Vector3;
      
      private var camera:Renamed842;
      
      private var skin:Renamed917;
      
      private var Renamed4234:int;
      
      private var Renamed7162:Renamed3138;
      
      private var Renamed7163:Renamed3138;
      
      private var Renamed7164:Renamed3138;
      
      private var Renamed7165:Renamed3138;
      
      private var Renamed7166:Renamed3138;
      
      private var Renamed7167:Quaternion;
      
      private var Renamed7168:Quaternion;
      
      private var Renamed7169:Quaternion;
      
      private var Renamed7170:Vector3;
      
      private var Renamed1466:Vector3;
      
      private var Renamed5708:Matrix4;
      
      private var Renamed1273:Matrix4;
      
      private var Renamed2446:Vector3;
      
      private var Renamed3196:Renamed96;
      
      private var Renamed991:Renamed3148;
      
      private var Renamed3364:Number;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed3129:TankSpecification;
      
      public function Renamed3292(param1:Renamed3290, param2:Renamed3208, param3:int, param4:Number, param5:Vector3, param6:Renamed842, param7:Renamed917, param8:Renamed925, param9:Renamed3148, param10:Renamed96, param11:TankSpecification)
      {
         this.Renamed7162 = new Renamed3138();
         this.Renamed7163 = new Renamed3138();
         this.Renamed7164 = new Renamed3138();
         this.Renamed7165 = new Renamed3138();
         this.Renamed7166 = new Renamed3138();
         this.Renamed5708 = new Matrix4();
         this.Renamed1273 = new Matrix4();
         this.Renamed2446 = new Vector3();
         super();
         this.context = param1;
         this.weapon = param2;
         this.Renamed7159 = param3;
         this.Renamed7160 = param4;
         this.Renamed7161 = param5.clone();
         this.camera = param6;
         this.skin = param7;
         this.Renamed7167 = new Quaternion();
         this.Renamed7168 = Quaternion.createFromAxisAngle(Vector3.X_AXIS,-Math.PI / 2);
         this.Renamed7170 = new Vector3();
         this.Renamed1466 = new Vector3();
         this.Renamed7169 = new Quaternion();
         this.Renamed7164.setInterval(0,1);
         this.Renamed991 = param9;
         this.Renamed3196 = param10;
         this.Renamed3110 = param8;
         this.Renamed3129 = param11;
      }
      
      public function enter(param1:int) : void
      {
         this.Renamed3110.stopMovement();
         this.Renamed3110.Renamed1078(true);
         this.Renamed3364 = Renamed915(this.Renamed991.Renamed1062()).getTurnAcceleration();
         Renamed915(this.Renamed991.Renamed1062()).setTurnAcceleration(this.Renamed3196.targetingAcceleration);
         Renamed915(this.Renamed991.Renamed1062()).setMaxTurnSpeed(this.Renamed3196.Renamed127 * this.Renamed3129.turretTurnAcceleration,false);
         this.context.Renamed7157 = this.weapon.Renamed2961(param1);
         this.Renamed4234 = this.Renamed7159;
         this.Renamed7162.setInterval(this.skin.Renamed1023().alpha,0);
         this.Renamed7163.setInterval(this.camera.fov,this.Renamed7160);
         var _loc2_:Point = new Point();
         var _loc3_:Point = new Point();
         this.weapon.Renamed3213(_loc2_,_loc3_);
         this.Renamed7165.setInterval(_loc2_.x,_loc3_.x);
         this.Renamed7166.setInterval(_loc2_.y,_loc3_.y);
         this.weapon.Renamed3214(0);
         this.weapon.Renamed3215();
         this.weapon.Renamed3210(Renamed3140.DRAIN);
         this.Renamed7171();
         this.Renamed991.Renamed7172();
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
      }
      
      private function Renamed7171() : void
      {
         var _loc1_:Object3D = this.skin.Renamed1020();
         this.Renamed1273.setMatrix(_loc1_.x,_loc1_.y,_loc1_.z,_loc1_.rotationX,_loc1_.rotationY,_loc1_.rotationZ);
         this.Renamed5708.setMatrix(this.camera.x,this.camera.y,this.camera.z,this.camera.rotationX,this.camera.rotationY,this.camera.rotationZ);
         this.Renamed1273.invert();
         this.Renamed5708.append(this.Renamed1273);
         this.Renamed5708.getEulerAngles(this.Renamed2446);
         this.Renamed7167.setFromEulerAnglesXYZ(this.Renamed2446.x,this.Renamed2446.y,this.Renamed2446.z);
         this.Renamed5708.getAxis(3,this.Renamed7170);
      }
      
      public function exit() : void
      {
         this.Renamed3110.Renamed1078(false);
         Renamed915(this.Renamed991.Renamed1062()).setMaxTurnSpeed(this.Renamed3129.turretRotationSpeed,true);
         Renamed915(this.Renamed991.Renamed1062()).setTurnAcceleration(this.Renamed3364);
         this.Renamed991.Renamed7173();
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
      }
      
      private function Renamed3407(param1:FullScreenEvent) : void
      {
         this.weapon.Renamed3211(Renamed3212.EXIT);
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.Renamed4234 <= 0)
         {
            this.weapon.Renamed3211(Renamed3212.SWITCH);
         }
         else
         {
            this.Renamed4234 -= param2;
            _loc3_ = 1 - this.Renamed4234 / this.Renamed7159;
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            this.weapon.Renamed3216(this.Renamed7165.interpolate(_loc3_),this.Renamed7166.interpolate(_loc3_));
            this.weapon.Renamed3214(this.Renamed7164.interpolate(_loc3_));
            this.camera.fov = this.Renamed7163.interpolate(_loc3_);
            _loc4_ = this.Renamed7162.interpolate(_loc3_);
            this.skin.setAlpha(_loc4_);
            this.Renamed7174(_loc3_);
         }
      }
      
      private function Renamed7174(param1:Number) : void
      {
         this.Renamed1466.interpolate(param1,this.Renamed7170,this.Renamed7161);
         this.Renamed7169.slerp(this.Renamed7167,this.Renamed7168,param1);
         this.Renamed7169.toMatrix4(this.Renamed5708);
         this.Renamed5708.setPosition(this.Renamed1466);
         var _loc2_:Object3D = this.skin.Renamed1020();
         this.Renamed1273.setMatrix(_loc2_.x,_loc2_.y,_loc2_.z,_loc2_.rotationX,_loc2_.rotationY,_loc2_.rotationZ);
         this.Renamed5708.append(this.Renamed1273);
         this.Renamed5708.getEulerAngles(this.Renamed2446);
         this.camera.x = this.Renamed5708.m03;
         this.camera.y = this.Renamed5708.m13;
         this.camera.z = this.Renamed5708.m23;
         this.camera.rotationX = this.Renamed2446.x;
         this.camera.rotationY = this.Renamed2446.y;
         this.camera.rotationZ = this.Renamed2446.z;
      }
      
      public function Renamed3211(param1:Renamed3212, param2:*) : void
      {
         switch(param1)
         {
            case Renamed3212.TRIGGER_RELEASE:
               this.weapon.Renamed3211(Renamed3212.TRIGGER_RELEASE,this.context.Renamed7157);
         }
      }
   }
}

