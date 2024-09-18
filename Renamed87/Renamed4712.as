package Renamed87
{
   import Renamed136.Renamed663;
   import Renamed1.Renamed1450;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.colliders.BoxSphereCollider;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionSphere;
   import alternativa.tanks.battle.Renamed804;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import Renamed373.Renamed666;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Renamed4712 extends Renamed832 implements Renamed804, Renamed919
   {
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private static var pool:Renamed4712;
      
      private static const Renamed10407:int = 1;
      
      private static const Renamed9591:int = 2;
      
      private static const Renamed9592:int = 3;
      
      private static const INITIAL_BLINK_INTERVAL:int = 320;
      
      private static const MIN_BLINK_INTERVAL:int = 22;
      
      private static const BLINK_INTERVAL_DECREMENT:int = 12;
      
      private static const Renamed10408:Number = 0.2;
      
      private static const Renamed10409:Number = 10;
      
      private static const Renamed10410:Vector3 = new Vector3();
      
      private static const Renamed1543:BoxSphereCollider = new BoxSphereCollider();
      
      public var next:Renamed4712;
      
      public var prev:Renamed4712;
      
      public var id:String;
      
      public var ownerId:String;
      
      public var Renamed5407:CollisionSphere;
      
      public var position:Vector3;
      
      public var Renamed10398:Vector3;
      
      private var callback:Renamed4710;
      
      private var teamType:Renamed663;
      
      private var mesh:Mesh;
      
      private var state:Renamed10404;
      
      private var Renamed10365:Renamed10366;
      
      private var Renamed10411:int;
      
      private var Renamed9600:int;
      
      private var colorTransform:ColorTransform;
      
      private var Renamed3014:Tank;
      
      private var Renamed10412:Boolean;
      
      public function Renamed4712(param1:Mesh)
      {
         this.blinker = new Renamed1450(INITIAL_BLINK_INTERVAL,MIN_BLINK_INTERVAL,BLINK_INTERVAL_DECREMENT,Renamed10408,1,Renamed10409);
         this.Renamed5407 = new CollisionSphere(1,Renamed666.WEAPON,PhysicsMaterial.DEFAULT_MATERIAL);
         this.position = new Vector3();
         this.Renamed10398 = new Vector3();
         this.state = Renamed10404.Renamed10405;
         this.colorTransform = new ColorTransform();
         super();
         this.mesh = Mesh(param1.clone());
      }
      
      public static function create(param1:String, param2:String, param3:Number, param4:Mesh, param5:Material, param6:Renamed663, param7:Renamed10366, param8:Renamed4710) : Renamed4712
      {
         var _loc9_:Renamed4712 = null;
         if(pool == null)
         {
            _loc9_ = new Renamed4712(param4);
         }
         else
         {
            _loc9_ = pool;
            pool = pool.next;
            _loc9_.next = null;
         }
         _loc9_.init(param1,param2,param3,param5,param6,param7,param8);
         return _loc9_;
      }
      
      public function dispose() : void
      {
         this.id = null;
         this.ownerId = null;
         this.Renamed10365 = null;
         this.Renamed3014 = null;
         this.Renamed10412 = false;
         this.prev = null;
         this.next = pool == null ? null : pool;
         pool = this;
      }
      
      public function Renamed10395() : void
      {
         this.state = Renamed10404.Renamed10406;
         this.Renamed10411 = getTimer();
         this.Renamed9600 = Renamed10407;
         this.mesh.colorTransform = this.colorTransform;
         this.mesh.alpha = 1;
      }
      
      public function setPosition(param1:Vector3, param2:Vector3) : void
      {
         this.position.copy(param1);
         this.Renamed10398.copy(param2);
         this.mesh.x = param1.x;
         this.mesh.y = param1.y;
         this.mesh.z = param1.z;
         Renamed10410.cross2(Vector3.Z_AXIS,param2).normalize();
         var _loc3_:Number = Math.acos(param2.dot(Vector3.Z_AXIS));
         var _loc4_:Matrix3 = new Matrix3();
         _loc4_.fromAxisAngle(Renamed10410,_loc3_);
         _loc4_.getEulerAngles(Renamed10410);
         this.mesh.rotationX = Renamed10410.x;
         this.mesh.rotationY = Renamed10410.y;
         this.mesh.rotationZ = Renamed10410.z;
         var _loc5_:Matrix4 = this.Renamed5407.transform;
         _loc5_.setPosition(param1);
         this.Renamed5407.calculateAABB();
      }
      
      public function Renamed6065() : void
      {
         Renamed619().Renamed803(this);
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.Renamed1258(this.mesh);
         _loc1_.Renamed1287(this,0);
      }
      
      public function Renamed10400() : void
      {
         Renamed619().Renamed805(this);
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.Renamed1289(this,0);
         _loc1_.removeObject(this.mesh);
      }
      
      public function checkTrigger(param1:Body) : void
      {
         this.Renamed3014 = param1.tank;
         if(this.Renamed10413(this.Renamed3014))
         {
            if(this.Renamed10414(this.Renamed3014))
            {
               if(!this.Renamed10412)
               {
                  this.Renamed10412 = true;
                  this.callback.Renamed10399(this);
               }
            }
            else
            {
               this.Renamed10412 = false;
            }
         }
      }
      
      private function Renamed10413(param1:Tank) : Boolean
      {
         return this.state == Renamed10404.Renamed10406 && this.ownerId != param1.tankData.userName && !param1.Renamed1017(this.teamType) && param1.state == Renamed841.Renamed854;
      }
      
      private function Renamed10414(param1:Tank) : Boolean
      {
         var _loc2_:CollisionBox = param1.Renamed1042();
         return (_loc2_.collisionGroup & this.Renamed5407.collisionGroup) != 0 && Renamed1543.haveCollision(_loc2_,this.Renamed5407);
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(this.state == Renamed10404.Renamed10405)
         {
            this.mesh.alpha = this.blinker.Renamed1452(param1,param2);
         }
         else if(this.state == Renamed10404.Renamed10406)
         {
            if(this.Renamed9600 != Renamed9592)
            {
               this.Renamed9578(param1);
            }
            else
            {
               this.updateVisibility();
            }
         }
      }
      
      private function updateVisibility() : void
      {
         if(this.Renamed10415())
         {
            this.mesh.visible = true;
         }
         else if(this.Renamed10416())
         {
            this.Renamed10417(this.Renamed3014);
         }
         else
         {
            this.mesh.visible = false;
         }
      }
      
      private function Renamed10415() : Boolean
      {
         return battleInfoService.isSpectatorMode() || this.state != Renamed10404.Renamed10406 || this.Renamed10416() && (this.ownerId == this.Renamed3014.tankData.userName || this.Renamed3014.Renamed1017(this.teamType));
      }
      
      private function Renamed10416() : Boolean
      {
         return Boolean(this.Renamed3014) && Boolean(this.Renamed3014.tankData.userName) && this.Renamed3014.tankData.health > 0;
      }
      
      private function Renamed10417(param1:Tank) : void
      {
         this.mesh.visible = true;
         Renamed10410.diff(param1.Renamed696().state.position,this.position);
         var _loc2_:Number = Renamed10410.length();
         if(_loc2_ > this.Renamed10365.Renamed10390)
         {
            this.mesh.visible = false;
         }
         else if(_loc2_ < this.Renamed10365.Renamed7033)
         {
            this.mesh.alpha = 1;
         }
         else
         {
            this.mesh.alpha = (this.Renamed10365.Renamed10390 - _loc2_) / (this.Renamed10365.Renamed10390 - this.Renamed10365.Renamed7033);
         }
      }
      
      private function init(param1:String, param2:String, param3:Number, param4:Material, param5:Renamed663, param6:Renamed10366, param7:Renamed4710) : void
      {
         this.id = param1;
         this.ownerId = param2;
         this.Renamed10418(param3);
         this.teamType = param5;
         this.Renamed10365 = param6;
         this.callback = param7;
         this.mesh.colorTransform = null;
         this.mesh.alpha = 1;
         this.mesh.visible = true;
         this.mesh.setMaterialToAllFaces(param4);
         this.state = Renamed10404.Renamed10405;
         this.Renamed9600 = Renamed9592;
         this.Renamed10411 = getTimer();
         this.blinker.init(this.Renamed10411);
      }
      
      private function Renamed10418(param1:Number) : void
      {
         this.Renamed5407.r = param1;
         this.Renamed5407.calculateAABB();
      }
      
      private function Renamed9578(param1:int) : void
      {
         switch(this.Renamed9600)
         {
            case Renamed10407:
               if(param1 < this.Renamed10411 + this.Renamed10365.Renamed10387)
               {
                  this.Renamed8454(this.Renamed10365.Renamed10389 * (param1 - this.Renamed10411) / this.Renamed10365.Renamed10387);
               }
               else
               {
                  this.Renamed8454(this.Renamed10365.Renamed10389);
                  this.Renamed10411 += this.Renamed10365.Renamed10387 + this.Renamed10365.Renamed10388;
                  this.Renamed9600 = Renamed9591;
               }
               break;
            case Renamed9591:
               if(param1 < this.Renamed10411)
               {
                  this.Renamed8454(this.Renamed10365.Renamed10389 * (this.Renamed10411 - param1) / this.Renamed10365.Renamed10388);
               }
               else
               {
                  this.Renamed8454(0);
                  this.Renamed9600 = Renamed9592;
                  this.mesh.colorTransform = null;
               }
         }
      }
      
      private function Renamed8454(param1:uint) : void
      {
         this.colorTransform.redOffset = param1;
         this.colorTransform.greenOffset = param1;
         this.colorTransform.blueOffset = param1;
         this.mesh.colorTransform = this.colorTransform;
      }
   }
}

