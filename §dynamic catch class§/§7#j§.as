package §dynamic catch class§
{
   import §7"j§.set;
   import §@"]§.§class default§;
   import §]3§.§6#a§;
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
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.tanks.utils.StaticCollisionBoxValidator;
   import alternativa.tanks.utils.StaticCollisionTriangleValidator;
   import alternativa.tanks.utils.StaticCollisoinRectValidator;
   import alternativa.utils.TextureMaterialRegistry;
   import §extends for const§.§import use§;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.type.AutoClosable;
   
   use namespace alternativa3d;
   
   public class §7#j§ implements AutoClosable
   {
      [Inject]
      public static var §'!1§:DataValidator;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var commandService:CommandService;
      
      private static const §[!d§:ConsoleVarInt = new ConsoleVarInt("map_delay",0,0,600);
      
      private static const §+5§:Number = 0.1;
      
      private static const §get set include§:int = 20;
      
      private var §@#R§:TextureMaterialRegistry;
      
      private var § "I§:PropLibRegistry;
      
      private var §6!t§:§include set return§;
      
      private var §`#0§:KDContainer;
      
      private var §continue var return§:Function;
      
      private var §switch catch function§:AABB;
      
      private var textures:Vector.<BitmapData>;
      
      private var §null package dynamic§:§native package default§;
      
      private var §implements set true§:uint;
      
      private var §0"9§:Boolean;
      
      private var isComplete:Boolean;
      
      public function §7#j§(param1:TextureMaterialRegistry, param2:PropLibRegistry)
      {
         super();
         this.§@#R§ = param1;
         this.§ "I§ = param2;
      }
      
      private function §native const switch§(param1:FormattedOutput) : void
      {
      }
      
      public function §9#"§() : Object3DContainer
      {
         return this.§`#0§;
      }
      
      public function build(param1:XML, param2:Function) : void
      {
         this.§continue var return§ = param2;
         this.§case var extends§(param1);
         this.§true for const§(param1);
         this.§]"&§();
      }
      
      private function §case var extends§(param1:XML) : void
      {
         var _loc2_:Vector.<CollisionShape> = §else package return§.parse(param1);
         var _loc3_:§class true§ = battleService.§'x§();
         _loc3_.§do set implements§(_loc2_);
         this.§""S§(_loc2_);
      }
      
      private function §""S§(param1:Vector.<CollisionShape>) : void
      {
         var _loc2_:CollisionShape = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ is CollisionBox)
            {
               §'!1§.addValidator(new StaticCollisionBoxValidator(CollisionBox(_loc2_)));
            }
            else if(_loc2_ is CollisionRect)
            {
               §'!1§.addValidator(new StaticCollisoinRectValidator(CollisionRect(_loc2_)));
            }
            else if(_loc2_ is CollisionTriangle)
            {
               §'!1§.addValidator(new StaticCollisionTriangleValidator(CollisionTriangle(_loc2_)));
            }
         }
      }
      
      private function §true for const§(param1:XML) : void
      {
         this.§null package dynamic§ = new §native package default§(this.§ "I§);
         this.§null package dynamic§.parse(param1);
         this.§switch catch function§ = this.§null package dynamic§.§native continue§();
      }
      
      private function §]"&§() : void
      {
         this.§6!t§ = new §include set return§(this.§@#R§,§get set include§);
         this.§6!t§.addEventListener(Event.COMPLETE,this.onTexturesReady);
         this.§6!t§.run(this.§null package dynamic§.§'1§());
      }
      
      private function onTexturesReady(param1:Event) : void
      {
         var _loc2_:int = 0;
         this.§0"9§ = true;
         this.§6!t§.removeEventListener(Event.COMPLETE,this.onTexturesReady);
         this.§implements set true§ = setTimeout(this.complete,_loc2_);
      }
      
      private function complete() : void
      {
         this.isComplete = true;
         clearTimeout(this.§implements set true§);
         this.textures = this.§6!t§.§9"T§();
         this.§'e§();
         this.§const package package§();
         this.§=9§();
         this.§<"R§();
         this.§null package dynamic§.clear();
         this.§null package dynamic§ = null;
         this.§6!t§ = null;
         this.§@#R§ = null;
         this.§ "I§ = null;
         this.§continue var return§();
      }
      
      private function §'e§() : void
      {
         if(this.§null package dynamic§.§,!l§() == null)
         {
            return;
         }
         (this.§null package dynamic§.§,!l§() as BSP).alternativa3d::faces[0].material.alphaTestThreshold = 0.5;
      }
      
      private function §<"R§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Object3D = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         var _loc5_:set = null;
         var _loc6_:§6#a§ = null;
         if(this.§null package dynamic§.§,!l§() == null)
         {
            return;
         }
         var _loc7_:Vector.<Object3D> = this.§null package dynamic§.§0!e§();
         var _loc8_:int = int(_loc7_.length);
         var _loc9_:§import use§ = battleService.§class while§();
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
            _loc6_ = §6#a§(_loc9_.getObject(§6#a§));
            _loc6_.init(_loc2_ as Sprite3D,_loc5_,_loc3_);
            battleService.§3l§().§7"0§(_loc6_);
            _loc1_++;
         }
      }
      
      private function §const package package§() : void
      {
         var _loc4_:Light3D = null;
         var _loc1_:Object3D = null;
         this.§`#0§ = new KDContainer();
         this.§`#0§.threshold = §+5§;
         this.§`#0§.ignoreChildrenInCollider = true;
         var _loc2_:Vector.<Object3D> = this.§null package dynamic§.§ #§();
         _loc2_.push(new §@!>§());
         this.§`#0§.createTree(_loc2_,this.§null package dynamic§.§package const try§());
         var _loc3_:§[!r§ = battleService.§3l§();
         for each(_loc1_ in this.§null package dynamic§.§9u§())
         {
            this.§`#0§.addChild(_loc1_);
            _loc3_.§,_§.add(new §class default§(_loc1_));
         }
         for each(_loc4_ in this.§null package dynamic§.§'"!§())
         {
            _loc3_.§with catch with§(_loc4_);
         }
         this.§`#0§.calculateBounds();
         _loc3_.§else for extends§(this.§`#0§);
      }
      
      private function §=9§() : void
      {
         var _loc1_:Mesh = null;
         var _loc2_:Vector.<Mesh> = this.§null package dynamic§.§super var use§();
         var _loc3_:§[!r§ = battleService.§3l§();
         for each(_loc1_ in _loc2_)
         {
            _loc3_.§<!u§(_loc1_);
         }
      }
      
      public function §native continue§() : AABB
      {
         return this.§switch catch function§;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         clearTimeout(this.§implements set true§);
         if(this.§`#0§ != null)
         {
            this.§`#0§.destroyTree();
            this.§`#0§ = null;
         }
         if(this.§6!t§ != null)
         {
            this.§6!t§.removeEventListener(Event.COMPLETE,this.onTexturesReady);
            this.§6!t§.destroy();
            this.§6!t§ = null;
         }
         if(this.§null package dynamic§ != null)
         {
            this.§null package dynamic§.clear();
            this.§null package dynamic§ = null;
         }
         this.§continue var return§ = null;
         this.§3"p§();
      }
      
      private function §3"p§() : void
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

