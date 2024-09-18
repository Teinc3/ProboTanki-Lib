package §switch package return§
{
   import § !g§.§class for case§;
   import §7"j§.§""&§;
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
   import alternativa.tanks.battle.§`§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.battle.scene3d.§else if§;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import §for set super§.§super const continue§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class §super catch use§ extends §else package false§ implements §`§, §else if§
   {
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private static var pool:§super catch use§;
      
      private static const §`#P§:int = 1;
      
      private static const §break set override§:int = 2;
      
      private static const §if catch§:int = 3;
      
      private static const INITIAL_BLINK_INTERVAL:int = 320;
      
      private static const MIN_BLINK_INTERVAL:int = 22;
      
      private static const BLINK_INTERVAL_DECREMENT:int = 12;
      
      private static const §do set var§:Number = 0.2;
      
      private static const §extends var class§:Number = 10;
      
      private static const §7&§:Vector3 = new Vector3();
      
      private static const §7#Q§:BoxSphereCollider = new BoxSphereCollider();
      
      public var next:§super catch use§;
      
      public var prev:§super catch use§;
      
      public var id:String;
      
      public var ownerId:String;
      
      public var §0#`§:CollisionSphere;
      
      public var position:Vector3;
      
      public var §var var§:Vector3;
      
      private var callback:§2##§;
      
      private var teamType:§class for case§;
      
      private var mesh:Mesh;
      
      private var state:§static const with§;
      
      private var §in set§:§package var break§;
      
      private var §8w§:int;
      
      private var §true const if§:int;
      
      private var colorTransform:ColorTransform;
      
      private var §@_§:Tank;
      
      private var §="^§:Boolean;
      
      public function §super catch use§(param1:Mesh)
      {
         this.blinker = new §""&§(INITIAL_BLINK_INTERVAL,MIN_BLINK_INTERVAL,BLINK_INTERVAL_DECREMENT,§do set var§,1,§extends var class§);
         this.§0#`§ = new CollisionSphere(1,§super const continue§.WEAPON,PhysicsMaterial.DEFAULT_MATERIAL);
         this.position = new Vector3();
         this.§var var§ = new Vector3();
         this.state = §static const with§.§case else§;
         this.colorTransform = new ColorTransform();
         super();
         this.mesh = Mesh(param1.clone());
      }
      
      public static function create(param1:String, param2:String, param3:Number, param4:Mesh, param5:Material, param6:§class for case§, param7:§package var break§, param8:§2##§) : §super catch use§
      {
         var _loc9_:§super catch use§ = null;
         if(pool == null)
         {
            _loc9_ = new §super catch use§(param4);
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
         this.§in set§ = null;
         this.§@_§ = null;
         this.§="^§ = false;
         this.prev = null;
         this.next = pool == null ? null : pool;
         pool = this;
      }
      
      public function §return set if§() : void
      {
         this.state = §static const with§.§[!9§;
         this.§8w§ = getTimer();
         this.§true const if§ = §`#P§;
         this.mesh.colorTransform = this.colorTransform;
         this.mesh.alpha = 1;
      }
      
      public function setPosition(param1:Vector3, param2:Vector3) : void
      {
         this.position.copy(param1);
         this.§var var§.copy(param2);
         this.mesh.x = param1.x;
         this.mesh.y = param1.y;
         this.mesh.z = param1.z;
         §7&§.cross2(Vector3.Z_AXIS,param2).normalize();
         var _loc3_:Number = Math.acos(param2.dot(Vector3.Z_AXIS));
         var _loc4_:Matrix3 = new Matrix3();
         _loc4_.fromAxisAngle(§7&§,_loc3_);
         _loc4_.getEulerAngles(§7&§);
         this.mesh.rotationX = §7&§.x;
         this.mesh.rotationY = §7&§.y;
         this.mesh.rotationZ = §7&§.z;
         var _loc5_:Matrix4 = this.§0#`§.transform;
         _loc5_.setPosition(param1);
         this.§0#`§.calculateAABB();
      }
      
      public function §const const while§() : void
      {
         §'x§().§;!+§(this);
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.§with catch with§(this.mesh);
         _loc1_.§9"N§(this,0);
      }
      
      public function §+c§() : void
      {
         §'x§().§final const in§(this);
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.§0!n§(this,0);
         _loc1_.removeObject(this.mesh);
      }
      
      public function checkTrigger(param1:Body) : void
      {
         this.§@_§ = param1.tank;
         if(this.§throw set override§(this.§@_§))
         {
            if(this.§switch catch for§(this.§@_§))
            {
               if(!this.§="^§)
               {
                  this.§="^§ = true;
                  this.callback.§try const throw§(this);
               }
            }
            else
            {
               this.§="^§ = false;
            }
         }
      }
      
      private function §throw set override§(param1:Tank) : Boolean
      {
         return this.state == §static const with§.§[!9§ && this.ownerId != param1.tankData.userName && !param1.§="%§(this.teamType) && param1.state == §continue var case§.§?!S§;
      }
      
      private function §switch catch for§(param1:Tank) : Boolean
      {
         var _loc2_:CollisionBox = param1.§;`§();
         return (_loc2_.collisionGroup & this.§0#`§.collisionGroup) != 0 && §7#Q§.haveCollision(_loc2_,this.§0#`§);
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(this.state == §static const with§.§case else§)
         {
            this.mesh.alpha = this.blinker.§default while§(param1,param2);
         }
         else if(this.state == §static const with§.§[!9§)
         {
            if(this.§true const if§ != §if catch§)
            {
               this.§7#4§(param1);
            }
            else
            {
               this.updateVisibility();
            }
         }
      }
      
      private function updateVisibility() : void
      {
         if(this.§null const try§())
         {
            this.mesh.visible = true;
         }
         else if(this.§""§())
         {
            this.§super var return§(this.§@_§);
         }
         else
         {
            this.mesh.visible = false;
         }
      }
      
      private function §null const try§() : Boolean
      {
         return battleInfoService.isSpectatorMode() || this.state != §static const with§.§[!9§ || this.§""§() && (this.ownerId == this.§@_§.tankData.userName || this.§@_§.§="%§(this.teamType));
      }
      
      private function §""§() : Boolean
      {
         return Boolean(this.§@_§) && Boolean(this.§@_§.tankData.userName) && this.§@_§.tankData.health > 0;
      }
      
      private function §super var return§(param1:Tank) : void
      {
         this.mesh.visible = true;
         §7&§.diff(param1.§0"t§().state.position,this.position);
         var _loc2_:Number = §7&§.length();
         if(_loc2_ > this.§in set§.§4@§)
         {
            this.mesh.visible = false;
         }
         else if(_loc2_ < this.§in set§.§?"A§)
         {
            this.mesh.alpha = 1;
         }
         else
         {
            this.mesh.alpha = (this.§in set§.§4@§ - _loc2_) / (this.§in set§.§4@§ - this.§in set§.§?"A§);
         }
      }
      
      private function init(param1:String, param2:String, param3:Number, param4:Material, param5:§class for case§, param6:§package var break§, param7:§2##§) : void
      {
         this.id = param1;
         this.ownerId = param2;
         this.§each package return§(param3);
         this.teamType = param5;
         this.§in set§ = param6;
         this.callback = param7;
         this.mesh.colorTransform = null;
         this.mesh.alpha = 1;
         this.mesh.visible = true;
         this.mesh.setMaterialToAllFaces(param4);
         this.state = §static const with§.§case else§;
         this.§true const if§ = §if catch§;
         this.§8w§ = getTimer();
         this.blinker.init(this.§8w§);
      }
      
      private function §each package return§(param1:Number) : void
      {
         this.§0#`§.r = param1;
         this.§0#`§.calculateAABB();
      }
      
      private function §7#4§(param1:int) : void
      {
         switch(this.§true const if§)
         {
            case §`#P§:
               if(param1 < this.§8w§ + this.§in set§.§+#?§)
               {
                  this.§ #I§(this.§in set§.§each override§ * (param1 - this.§8w§) / this.§in set§.§+#?§);
               }
               else
               {
                  this.§ #I§(this.§in set§.§each override§);
                  this.§8w§ += this.§in set§.§+#?§ + this.§in set§.§""%§;
                  this.§true const if§ = §break set override§;
               }
               break;
            case §break set override§:
               if(param1 < this.§8w§)
               {
                  this.§ #I§(this.§in set§.§each override§ * (this.§8w§ - param1) / this.§in set§.§""%§);
               }
               else
               {
                  this.§ #I§(0);
                  this.§true const if§ = §if catch§;
                  this.mesh.colorTransform = null;
               }
         }
      }
      
      private function § #I§(param1:uint) : void
      {
         this.colorTransform.redOffset = param1;
         this.colorTransform.greenOffset = param1;
         this.colorTransform.blueOffset = param1;
         this.mesh.colorTransform = this.colorTransform;
      }
   }
}

