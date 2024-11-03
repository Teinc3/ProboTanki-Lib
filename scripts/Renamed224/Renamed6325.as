package Renamed224
{
   import Renamed136.Renamed663;
   import Renamed17.Renamed5410;
   import Renamed199.Renamed3823;
   import Renamed199.Renamed3820;
   import Renamed1342.Renamed1448;
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
   import alternativa.tanks.battle.Renamed804;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import Renamed373.Renamed666;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed4578 implements Renamed1448, Renamed804, Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed4730:ILightingEffectsService;
      
      private static const Renamed6324:int = 1000;
      
      private static const Renamed5404:EncryptedInt = new EncryptedIntImpl(95);
      
      private static const Renamed5405:EncryptedInt = new EncryptedIntImpl(400);
      
      private static const contacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private static const Renamed1522:Vector3 = new Vector3();
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private static const Renamed5406:Vector3 = new Vector3();
      
      private static const Renamed1512:Vector3 = new Vector3();
      
      public var teamType:Renamed663;
      
      public var Renamed5407:CollisionShape;
      
      private var Renamed5408:Tank;
      
      private var Renamed5409:String;
      
      private var _state:Renamed5410;
      
      private var Renamed5411:Vector3;
      
      private var skin:Renamed1647;
      
      private var startTime:int;
      
      private var Renamed5413:Number = 1;
      
      private var Renamed5414:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      private var callback:Renamed4580;
      
      private var lightSource:OmniLight;
      
      private var _id:int;
      
      public function Renamed4578(param1:int, param2:Renamed663, param3:Vector3, param4:int, param5:int, param6:Renamed843, param7:CollisionDetector, param8:Renamed4580)
      {
         this._state = Renamed5410.AT_BASE;
         super();
         this._id = param1;
         this.teamType = param2;
         this.Renamed5411 = param3.clone();
         this._state = Renamed5410.AT_BASE;
         this.collisionDetector = param7;
         this.callback = param8;
         this.createSkin(param4,param5,param6);
         this.Renamed5415(param2);
         this.setPosition(param3);
         this.startTime = Renamed6324 * Math.random();
      }
      
      private function Renamed5415(param1:Renamed663) : void
      {
         var _loc2_:Renamed3820 = Renamed4730.Renamed3822(Renamed1587.CTF);
         var _loc3_:Renamed3823 = _loc2_.Renamed5102(Renamed663.RED);
         this.lightSource = new OmniLight(_loc3_.Renamed772(),_loc2_.Renamed5111(),_loc2_.Renamed5112());
         this.lightSource.intensity = _loc3_.Renamed5124();
      }
      
      public function setAlphaMultiplier(param1:Number) : void
      {
         this.Renamed5413 = param1 < 0.2 ? Number(0.2) : Number(param1);
         this.Renamed5416(this.Renamed5414 ? Number(0.5) : Number(1));
      }
      
      private function Renamed5416(param1:Number) : void
      {
         if(this._state == Renamed5410.CARRIED)
         {
            this.skin.alpha = param1;
         }
         else
         {
            this.skin.alpha = this.Renamed5413;
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
            this.collisionDetector.getContacts(_loc2_,this.Renamed5407,contacts);
            if(contacts.length > 0)
            {
               _loc3_ = contacts[0];
               Renamed1522.copy(_loc3_.position);
               Renamed1512.x = this.Renamed5407.transform.m03 - Renamed1522.x;
               Renamed1512.y = this.Renamed5407.transform.m13 - Renamed1522.y;
               Renamed1512.z = this.Renamed5407.transform.m23 - Renamed1522.z;
               if(!this.collisionDetector.raycastStatic(Renamed1522,Renamed1512,Renamed666.Renamed690,1,null,Renamed1299))
               {
                  break;
               }
               Renamed1522.x = _loc2_.transform.m03;
               Renamed1522.y = _loc2_.transform.m13;
               Renamed1522.z = _loc2_.transform.m23;
               Renamed1512.x = this.Renamed5407.transform.m03 - Renamed1522.x;
               Renamed1512.y = this.Renamed5407.transform.m13 - Renamed1522.y;
               Renamed1512.z = this.Renamed5407.aabb.minZ - Renamed1522.z + 1;
               if(!this.collisionDetector.raycastStatic(Renamed1522,Renamed1512,Renamed666.Renamed690,1,null,Renamed1299))
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
         this.callback.Renamed5395(this._id);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.skin.Renamed1653(int((param1 - this.startTime) / Renamed6324));
         if(this.Renamed5408 != null)
         {
            this.Renamed5408.Renamed1075().Renamed1272(Renamed5406);
            Renamed5406.z -= 50;
            this.setPosition(Renamed5406);
         }
      }
      
      public function get Renamed5417() : Tank
      {
         return this.Renamed5408;
      }
      
      public function get Renamed5418() : String
      {
         return this.Renamed5409;
      }
      
      private function setPosition(param1:Vector3) : void
      {
         this.skin.x = param1.x;
         this.skin.y = param1.y;
         this.skin.z = param1.z;
         this.Renamed5407.transform.m03 = param1.x;
         this.Renamed5407.transform.m13 = param1.y;
         this.Renamed5407.transform.m23 = param1.z + 0.5 * Renamed5405.getInt();
         this.Renamed5407.calculateAABB();
         this.lightSource.x = param1.x;
         this.lightSource.y = param1.y;
         this.lightSource.z = param1.z + 0.75 * Renamed5405.getInt();
      }
      
      public function addToScene() : void
      {
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.addObjToAbsPacket(this.skin);
         _loc1_.addObjToAbsPacket(this.lightSource);
      }
      
      public function get state() : Renamed5410
      {
         return this._state;
      }
      
      public function Renamed5419(param1:String, param2:Tank) : void
      {
         this.Renamed5414 = true;
         this.Renamed5420(param1,param2,0.5);
      }
      
      public function Renamed5421(param1:String, param2:Tank) : void
      {
         this.Renamed5414 = false;
         this.Renamed5420(param1,param2,1);
      }
      
      private function Renamed5420(param1:String, param2:Tank, param3:Number) : void
      {
         this.Renamed5409 = param1;
         this.Renamed5408 = param2;
         this._state = Renamed5410.CARRIED;
         if(param2 != null)
         {
            this.skin.visible = true;
            this.Renamed5416(param3);
         }
         else
         {
            this.skin.visible = false;
         }
      }
      
      public function Renamed5422() : void
      {
         this.reset(Renamed5410.AT_BASE);
         this.setPosition(this.Renamed5411);
      }
      
      public function Renamed5423(param1:Vector3) : void
      {
         this.reset(Renamed5410.DROPPED);
         this.setPosition(param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.removeObject(this.skin);
         _loc1_.removeObject(this.lightSource);
      }
      
      private function createSkin(param1:int, param2:int, param3:Renamed843) : void
      {
         var _loc4_:Number = param1 * Renamed5405.getInt() / param2;
         this.skin = new Renamed1647(_loc4_,Renamed5405.getInt());
         this.skin.softAttenuation = 10;
         this.skin.Renamed1651(param3);
         this.skin.Renamed1653(0);
         this.skin.originY = 1;
         param3.material.resolution = 1;
         this.Renamed5407 = new CollisionBox(new Vector3(0.5 * Renamed5404.getInt(),0.5 * Renamed5404.getInt(),0.5 * Renamed5405.getInt()),Renamed666.TANK,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      private function reset(param1:Renamed5410) : void
      {
         this._state = param1;
         this.Renamed5409 = null;
         this.Renamed5408 = null;
         this.Renamed5416(1);
         this.skin.visible = true;
      }
      
      public function getId() : int
      {
         return this._id;
      }
   }
}

