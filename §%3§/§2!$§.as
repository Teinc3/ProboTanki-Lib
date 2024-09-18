package §%3§
{
   import § !g§.§class for case§;
   import §'H§.§const const case§;
   import §'H§.§implements set else§;
   import §@"]§.§with super§;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§`§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.battle.scene3d.§else if§;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import §for set super§.§super const continue§;
   import projects.tanks.client.battleservice.§final package import§;
   
   public class §2!$§ implements §with super§, §`§, §else if§
   {
      [Inject]
      public static var §get const true§:ILightingEffectsService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §]#5§:EncryptedInt = new EncryptedIntImpl(95);
      
      private static const §!"R§:EncryptedInt = new EncryptedIntImpl(400);
      
      private static const contacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private static const §3#q§:Vector3 = new Vector3();
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private static const §final for each§:Vector3 = new Vector3();
      
      private static const §2#D§:Vector3 = new Vector3();
      
      public var teamType:§class for case§;
      
      public var §0#`§:CollisionShape;
      
      private var §!!I§:Tank;
      
      private var §="0§:String;
      
      private var _state:§=x§;
      
      private var §package const use§:Vector3;
      
      private var skin:§7J§;
      
      private var startTime:int;
      
      private var §var for function§:int = 1000;
      
      private var §with package false§:Number = 1;
      
      private var §extends const break§:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      private var callback:§?"p§;
      
      private var lightSource:OmniLight;
      
      public function §2!$§(param1:§class for case§, param2:Vector3, param3:int, param4:int, param5:§throw const switch§, param6:CollisionDetector, param7:§?"p§)
      {
         this._state = §=x§.AT_BASE;
         super();
         this.teamType = param1;
         this.§package const use§ = param2.clone();
         this._state = §=x§.AT_BASE;
         this.collisionDetector = param6;
         this.callback = param7;
         this.createSkin(param3,param4,param5);
         this.§4#I§(param1);
         this.setPosition(param2);
         this.startTime = this.§var for function§ * Math.random();
      }
      
      private function §4#I§(param1:§class for case§) : void
      {
         var _loc2_:§implements set else§ = §get const true§.§try const include§(§final package import§.CTF);
         var _loc3_:§const const case§ = _loc2_.§ #i§(param1);
         this.lightSource = new OmniLight(_loc3_.§#!@§(),_loc2_.§super const native§(),_loc2_.§with set true§());
         this.lightSource.intensity = _loc3_.§"#`§();
      }
      
      public function setAlphaMultiplier(param1:Number) : void
      {
         this.§with package false§ = param1 < 0.2 ? Number(0.2) : Number(param1);
         this.§8"2§(this.§extends const break§ ? Number(0.5) : Number(1));
      }
      
      private function §8"2§(param1:Number) : void
      {
         if(this._state == §=x§.CARRIED)
         {
            this.skin.alpha = param1;
         }
         else
         {
            this.skin.alpha = this.§with package false§;
         }
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.skin.x;
         param1.y = this.skin.y;
         param1.z = this.skin.z;
      }
      
      public function checkTrigger(param1:Body) : void
      {
         var _loc2_:CollisionShape = null;
         var _loc3_:ShapeContact = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(true)
         {
            if(_loc5_ >= param1.numCollisionShapes)
            {
               return;
            }
            _loc2_ = param1.collisionShapes[0];
            this.collisionDetector.getContacts(_loc2_,this.§0#`§,contacts);
            if(contacts.length > 0)
            {
               _loc3_ = contacts[0];
               §3#q§.copy(_loc3_.position);
               §2#D§.x = this.§0#`§.transform.m03 - §3#q§.x;
               §2#D§.y = this.§0#`§.transform.m13 - §3#q§.y;
               §2#D§.z = this.§0#`§.transform.m23 - §3#q§.z;
               if(!this.collisionDetector.raycastStatic(§3#q§,§2#D§,§super const continue§.§finally catch while§,1,null,§extends const default§))
               {
                  break;
               }
               §3#q§.x = _loc2_.transform.m03;
               §3#q§.y = _loc2_.transform.m13;
               §3#q§.z = _loc2_.transform.m23;
               §2#D§.x = this.§0#`§.transform.m03 - §3#q§.x;
               §2#D§.y = this.§0#`§.transform.m13 - §3#q§.y;
               §2#D§.z = this.§0#`§.aabb.minZ - §3#q§.z + 1;
               if(!this.collisionDetector.raycastStatic(§3#q§,§2#D§,§super const continue§.§finally catch while§,1,null,§extends const default§))
               {
                  break;
               }
            }
            _loc5_++;
         }
         _loc4_ = 0;
         while(_loc4_ < contacts.length)
         {
            _loc3_ = contacts[_loc4_];
            _loc3_.dispose();
            _loc4_++;
         }
         contacts.length = 0;
         this.callback.§const set native§(this);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.skin.§true const switch§(int((param1 - this.startTime) / this.§var for function§));
         if(this.§!!I§ != null)
         {
            this.§!!I§.§in package default§().§7#B§(§final for each§);
            §final for each§.z -= 50;
            this.setPosition(§final for each§);
         }
      }
      
      public function get §in null§() : Tank
      {
         return this.§!!I§;
      }
      
      public function get §<#K§() : String
      {
         return this.§="0§;
      }
      
      private function setPosition(param1:Vector3) : void
      {
         this.skin.x = param1.x;
         this.skin.y = param1.y;
         this.skin.z = param1.z;
         this.§0#`§.transform.m03 = param1.x;
         this.§0#`§.transform.m13 = param1.y;
         this.§0#`§.transform.m23 = param1.z + 0.5 * §!"R§.getInt();
         this.§0#`§.calculateAABB();
         this.lightSource.x = param1.x;
         this.lightSource.y = param1.y;
         this.lightSource.z = param1.z + 0.75 * §!"R§.getInt();
      }
      
      public function addToScene() : void
      {
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.§with catch with§(this.skin);
         _loc1_.§with catch with§(this.lightSource);
      }
      
      public function get state() : §=x§
      {
         return this._state;
      }
      
      public function §continue package else§(param1:String, param2:Tank) : void
      {
         this.§extends const break§ = true;
         this.§8!`§(param1,param2,0.5);
      }
      
      public function §final set finally§(param1:String, param2:Tank) : void
      {
         this.§extends const break§ = false;
         this.§8!`§(param1,param2,1);
      }
      
      private function §8!`§(param1:String, param2:Tank, param3:Number) : void
      {
         this.§="0§ = param1;
         this.§!!I§ = param2;
         this._state = §=x§.CARRIED;
         if(param2 != null)
         {
            this.skin.visible = true;
            this.§8"2§(param3);
         }
         else
         {
            this.skin.visible = false;
         }
      }
      
      public function §'#I§() : void
      {
         this.reset(§=x§.AT_BASE);
         this.setPosition(this.§package const use§);
      }
      
      public function §false set import§(param1:Vector3) : void
      {
         this.reset(§=x§.DROPPED);
         this.setPosition(param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.removeObject(this.skin);
         _loc1_.removeObject(this.lightSource);
      }
      
      private function createSkin(param1:int, param2:int, param3:§throw const switch§) : void
      {
         var _loc4_:Number = param1 * §!"R§.getInt() / param2;
         this.skin = new §7J§(_loc4_,§!"R§.getInt());
         this.skin.softAttenuation = 10;
         this.skin.§do var super§(param3);
         this.skin.§true const switch§(0);
         this.skin.originY = 1;
         param3.material.resolution = 1;
         this.§0#`§ = new CollisionBox(new Vector3(0.5 * §]#5§.getInt(),0.5 * §]#5§.getInt(),0.5 * §!"R§.getInt()),§super const continue§.TANK,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      private function reset(param1:§=x§) : void
      {
         this._state = param1;
         this.§="0§ = null;
         this.§!!I§ = null;
         this.§8"2§(1);
         this.skin.visible = true;
      }
   }
}

