package §9!1§
{
   import §]#R§.§else for include§;
   import §]#R§.§try set for§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.models.weapon.shaft.§"!a§;
   import alternativa.tanks.models.weapon.shaft.§#"X§;
   import alternativa.tanks.models.weapon.shaft.§-"o§;
   import alternativa.tanks.models.weapon.shaft.§switch var override§;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.events.FullScreenEvent;
   import flash.geom.Point;
   import §while const const§.§^"x§;
   
   public class §false package finally§ implements §var§
   {
      [Inject]
      public static var display:IDisplay;
      
      private var context:§&#T§;
      
      private var weapon:§-"o§;
      
      private var §true package dynamic§:int;
      
      private var §finally set final§:Number;
      
      private var §override false§:Vector3;
      
      private var camera:§3!0§;
      
      private var skin:§false catch set§;
      
      private var §in if§:int;
      
      private var §9X§:§#"X§;
      
      private var §with for for§:§#"X§;
      
      private var §%!N§:§#"X§;
      
      private var §for set import§:§#"X§;
      
      private var §switch super§:§#"X§;
      
      private var § !4§:Quaternion;
      
      private var §0"5§:Quaternion;
      
      private var §,!N§:Quaternion;
      
      private var §#!8§:Vector3;
      
      private var §for package function§:Vector3;
      
      private var § !N§:Matrix4;
      
      private var §with const false§:Matrix4;
      
      private var §7#a§:Vector3;
      
      private var §?"@§:§^"x§;
      
      private var §finally for var§:§else for include§;
      
      private var §^"g§:Number;
      
      private var §try do§:§1"o§;
      
      private var §%!6§:TankSpecification;
      
      public function §false package finally§(param1:§&#T§, param2:§-"o§, param3:int, param4:Number, param5:Vector3, param6:§3!0§, param7:§false catch set§, param8:§1"o§, param9:§else for include§, param10:§^"x§, param11:TankSpecification)
      {
         this.§9X§ = new §#"X§();
         this.§with for for§ = new §#"X§();
         this.§%!N§ = new §#"X§();
         this.§for set import§ = new §#"X§();
         this.§switch super§ = new §#"X§();
         this.§ !N§ = new Matrix4();
         this.§with const false§ = new Matrix4();
         this.§7#a§ = new Vector3();
         super();
         this.context = param1;
         this.weapon = param2;
         this.§true package dynamic§ = param3;
         this.§finally set final§ = param4;
         this.§override false§ = param5.clone();
         this.camera = param6;
         this.skin = param7;
         this.§ !4§ = new Quaternion();
         this.§0"5§ = Quaternion.createFromAxisAngle(Vector3.X_AXIS,-Math.PI / 2);
         this.§#!8§ = new Vector3();
         this.§for package function§ = new Vector3();
         this.§,!N§ = new Quaternion();
         this.§%!N§.setInterval(0,1);
         this.§finally for var§ = param9;
         this.§?"@§ = param10;
         this.§try do§ = param8;
         this.§%!6§ = param11;
      }
      
      public function enter(param1:int) : void
      {
         this.§try do§.stopMovement();
         this.§try do§.§catch var extends§(true);
         this.§^"g§ = §try set for§(this.§finally for var§.§3H§()).getTurnAcceleration();
         §try set for§(this.§finally for var§.§3H§()).setTurnAcceleration(this.§?"@§.targetingAcceleration);
         §try set for§(this.§finally for var§.§3H§()).setMaxTurnSpeed(this.§?"@§.§="S§ * this.§%!6§.turretTurnAcceleration,false);
         this.context.§?#]§ = this.weapon.§6#r§(param1);
         this.§in if§ = this.§true package dynamic§;
         this.§9X§.setInterval(this.skin.§7!T§().alpha,0);
         this.§with for for§.setInterval(this.camera.fov,this.§finally set final§);
         var _loc2_:Point = new Point();
         var _loc3_:Point = new Point();
         this.weapon.§implements for do§(_loc2_,_loc3_);
         this.§for set import§.setInterval(_loc2_.x,_loc3_.x);
         this.§switch super§.setInterval(_loc2_.y,_loc3_.y);
         this.weapon.§native const do§(0);
         this.weapon.§0n§();
         this.weapon.§%0§(§"!a§.DRAIN);
         this.§final const null§();
         this.§finally for var§.§each catch while§();
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
      }
      
      private function §final const null§() : void
      {
         var _loc1_:Object3D = this.skin.§2"F§();
         this.§with const false§.setMatrix(_loc1_.x,_loc1_.y,_loc1_.z,_loc1_.rotationX,_loc1_.rotationY,_loc1_.rotationZ);
         this.§ !N§.setMatrix(this.camera.x,this.camera.y,this.camera.z,this.camera.rotationX,this.camera.rotationY,this.camera.rotationZ);
         this.§with const false§.invert();
         this.§ !N§.append(this.§with const false§);
         this.§ !N§.getEulerAngles(this.§7#a§);
         this.§ !4§.setFromEulerAnglesXYZ(this.§7#a§.x,this.§7#a§.y,this.§7#a§.z);
         this.§ !N§.getAxis(3,this.§#!8§);
      }
      
      public function exit() : void
      {
         this.§try do§.§catch var extends§(false);
         §try set for§(this.§finally for var§.§3H§()).setMaxTurnSpeed(this.§%!6§.turretRotationSpeed,true);
         §try set for§(this.§finally for var§.§3H§()).setTurnAcceleration(this.§^"g§);
         this.§finally for var§.§true class§();
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
      }
      
      private function §3"M§(param1:FullScreenEvent) : void
      {
         this.weapon.§#-§(§switch var override§.EXIT);
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.§in if§ <= 0)
         {
            this.weapon.§#-§(§switch var override§.SWITCH);
         }
         else
         {
            this.§in if§ -= param2;
            _loc3_ = 1 - this.§in if§ / this.§true package dynamic§;
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            this.weapon.§`"g§(this.§for set import§.interpolate(_loc3_),this.§switch super§.interpolate(_loc3_));
            this.weapon.§native const do§(this.§%!N§.interpolate(_loc3_));
            this.camera.fov = this.§with for for§.interpolate(_loc3_);
            _loc4_ = this.§9X§.interpolate(_loc3_);
            this.skin.setAlpha(_loc4_);
            this.§2"y§(_loc3_);
         }
      }
      
      private function §2"y§(param1:Number) : void
      {
         this.§for package function§.interpolate(param1,this.§#!8§,this.§override false§);
         this.§,!N§.slerp(this.§ !4§,this.§0"5§,param1);
         this.§,!N§.toMatrix4(this.§ !N§);
         this.§ !N§.setPosition(this.§for package function§);
         var _loc2_:Object3D = this.skin.§2"F§();
         this.§with const false§.setMatrix(_loc2_.x,_loc2_.y,_loc2_.z,_loc2_.rotationX,_loc2_.rotationY,_loc2_.rotationZ);
         this.§ !N§.append(this.§with const false§);
         this.§ !N§.getEulerAngles(this.§7#a§);
         this.camera.x = this.§ !N§.m03;
         this.camera.y = this.§ !N§.m13;
         this.camera.z = this.§ !N§.m23;
         this.camera.rotationX = this.§7#a§.x;
         this.camera.rotationY = this.§7#a§.y;
         this.camera.rotationZ = this.§7#a§.z;
      }
      
      public function §#-§(param1:§switch var override§, param2:*) : void
      {
         switch(param1)
         {
            case §switch var override§.TRIGGER_RELEASE:
               this.weapon.§#-§(§switch var override§.TRIGGER_RELEASE,this.context.§?#]§);
         }
      }
   }
}

