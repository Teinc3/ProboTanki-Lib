package Renamed342
{
   import Renamed1.set;
   import Renamed1342.Renamed7595;
   import Renamed483.Renamed7969;
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   import alternativa.physics.collision.types.AABB;
   import alternativa.proplib.PropLibRegistry;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.tanks.utils.StaticCollisionBoxValidator;
   import alternativa.tanks.utils.StaticCollisionTriangleValidator;
   import alternativa.tanks.utils.StaticCollisoinRectValidator;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed356.Renamed616;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.type.AutoClosable;
   
   use namespace alternativa3d;
   
   public class Renamed2412 implements AutoClosable
   {
      [Inject]
      public static var Renamed2419:DataValidator;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var commandService:CommandService;
      
      private static const Renamed7970:ConsoleVarInt = new ConsoleVarInt("map_delay",0,0,600);
      
      private static const Renamed7971:Number = 0.1;
      
      private static const Renamed7972:int = 20;
      
      private var Renamed1368:TextureMaterialRegistry;
      
      private var Renamed7973:PropLibRegistry;
      
      private var Renamed7974:Renamed7975;
      
      private var Renamed1354:KDContainer;
      
      private var Renamed7976:Function;
      
      private var Renamed7977:AABB;
      
      private var textures:Vector.<BitmapData>;
      
      private var Renamed7978:Renamed7979;
      
      private var Renamed7980:uint;
      
      private var Renamed7981:Boolean;
      
      private var isComplete:Boolean;
      
      public function Renamed2412(param1:TextureMaterialRegistry, param2:PropLibRegistry)
      {
         super();
         this.Renamed1368 = param1;
         this.Renamed7973 = param2;
      }
      
      private function Renamed7982(param1:FormattedOutput) : void
      {
      }
      
      public function Renamed1382() : Object3DContainer
      {
         return this.Renamed1354;
      }
      
      public function build(param1:XML, param2:Function) : void
      {
         this.Renamed7976 = param2;
         this.Renamed7983(param1);
         this.Renamed7984(param1);
         this.Renamed7985();
      }
      
      private function Renamed7983(param1:XML) : void
      {
         var _loc2_:Vector.<CollisionShape> = Renamed7986.parse(param1);
         var _loc3_:Renamed620 = battleService.Renamed619();
         _loc3_.Renamed802(_loc2_);
         this.Renamed7987(_loc2_);
      }
      
      private function Renamed7987(param1:Vector.<CollisionShape>) : void
      {
         var _loc2_:CollisionShape = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ is CollisionBox)
            {
               Renamed2419.addValidator(new StaticCollisionBoxValidator(CollisionBox(_loc2_)));
            }
            else if(_loc2_ is CollisionRect)
            {
               Renamed2419.addValidator(new StaticCollisoinRectValidator(CollisionRect(_loc2_)));
            }
            else if(_loc2_ is CollisionTriangle)
            {
               Renamed2419.addValidator(new StaticCollisionTriangleValidator(CollisionTriangle(_loc2_)));
            }
         }
      }
      
      private function Renamed7984(param1:XML) : void
      {
         this.Renamed7978 = new Renamed7979(this.Renamed7973);
         this.Renamed7978.parse(param1);
         this.Renamed7977 = this.Renamed7978.Renamed2506();
      }
      
      private function Renamed7985() : void
      {
         this.Renamed7974 = new Renamed7975(this.Renamed1368,Renamed7972);
         this.Renamed7974.addEventListener(Event.COMPLETE,this.onTexturesReady);
         this.Renamed7974.run(this.Renamed7978.Renamed7988());
      }
      
      private function onTexturesReady(param1:Event) : void
      {
         var _loc2_:int = 0;
         this.Renamed7981 = true;
         this.Renamed7974.removeEventListener(Event.COMPLETE,this.onTexturesReady);
         this.Renamed7980 = setTimeout(this.complete,_loc2_);
      }
      
      private function complete() : void
      {
         this.isComplete = true;
         clearTimeout(this.Renamed7980);
         this.textures = this.Renamed7974.Renamed7989();
         this.Renamed7990();
         this.Renamed7991();
         this.Renamed7992();
         this.Renamed7993();
         this.Renamed7978.clear();
         this.Renamed7978 = null;
         this.Renamed7974 = null;
         this.Renamed1368 = null;
         this.Renamed7973 = null;
         this.Renamed7976();
      }
      
      private function Renamed7990() : void
      {
         if(this.Renamed7978.Renamed7994() == null)
         {
            return;
         }
         (this.Renamed7978.Renamed7994() as BSP).alternativa3d::faces[0].material.alphaTestThreshold = 0.5;
      }
      
      private function Renamed7993() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Object3D = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         var _loc5_:set = null;
         var _loc6_:Renamed7969 = null;
         if(this.Renamed7978.Renamed7994() == null)
         {
            return;
         }
         var _loc7_:Vector.<Object3D> = this.Renamed7978.Renamed7995();
         var _loc8_:int = int(_loc7_.length);
         var _loc9_:Renamed616 = battleService.Renamed618();
         _loc3_ = new Vector3();
         _loc1_ = 0;
         while(_loc1_ < _loc8_)
         {
            _loc2_ = _loc7_[_loc1_];
            _loc3_.x += _loc2_.x;
            _loc3_.y += _loc2_.y;
            _loc3_.z += _loc2_.z;
            _loc1_++;
         }
         _loc3_.x /= _loc8_;
         _loc3_.y /= _loc8_;
         _loc3_.z /= _loc8_;
         _loc4_ = new Vector3();
         _loc1_ = 0;
         while(_loc1_ < _loc8_)
         {
            _loc2_ = _loc7_[_loc1_];
            _loc4_.x = _loc2_.x;
            _loc4_.y = _loc2_.y;
            _loc4_.z = _loc2_.z;
            _loc5_ = set(_loc9_.getObject(set));
            _loc5_.init(_loc4_,150);
            _loc6_ = Renamed7969(_loc9_.getObject(Renamed7969));
            _loc6_.init(_loc2_ as Sprite3D,_loc5_,_loc3_);
            battleService.Renamed621().Renamed636(_loc6_);
            _loc1_++;
         }
      }
      
      private function Renamed7991() : void
      {
         var _loc4_:Light3D = null;
         var _loc1_:Object3D = null;
         this.Renamed1354 = new KDContainer();
         this.Renamed1354.threshold = Renamed7971;
         this.Renamed1354.ignoreChildrenInCollider = true;
         var _loc2_:Vector.<Object3D> = this.Renamed7978.Renamed7996();
         _loc2_.push(new Renamed7997());
         this.Renamed1354.createTree(_loc2_,this.Renamed7978.Renamed7998());
         var _loc3_:Renamed610 = battleService.Renamed621();
         for each(_loc1_ in this.Renamed7978.Renamed7999())
         {
            this.Renamed1354.addChild(_loc1_);
            _loc3_.Renamed1377.add(new Renamed7595(_loc1_));
         }
         for each(_loc4_ in this.Renamed7978.Renamed8000())
         {
            _loc3_.Renamed1258(_loc4_);
         }
         this.Renamed1354.calculateBounds();
         _loc3_.Renamed1417(this.Renamed1354);
      }
      
      private function Renamed7992() : void
      {
         var _loc1_:Mesh = null;
         var _loc2_:Vector.<Mesh> = this.Renamed7978.Renamed8001();
         var _loc3_:Renamed610 = battleService.Renamed621();
         for each(_loc1_ in _loc2_)
         {
            _loc3_.Renamed1427(_loc1_);
         }
      }
      
      public function Renamed2506() : AABB
      {
         return this.Renamed7977;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         clearTimeout(this.Renamed7980);
         if(this.Renamed1354 != null)
         {
            this.Renamed1354.destroyTree();
            this.Renamed1354 = null;
         }
         if(this.Renamed7974 != null)
         {
            this.Renamed7974.removeEventListener(Event.COMPLETE,this.onTexturesReady);
            this.Renamed7974.destroy();
            this.Renamed7974 = null;
         }
         if(this.Renamed7978 != null)
         {
            this.Renamed7978.clear();
            this.Renamed7978 = null;
         }
         this.Renamed7976 = null;
         this.Renamed8002();
      }
      
      private function Renamed8002() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.textures)
         {
            _loc1_.dispose();
            _loc2_++;
         }
         this.textures = null;
      }
   }
}

