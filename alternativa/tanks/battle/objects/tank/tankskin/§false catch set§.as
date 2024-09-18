package alternativa.tanks.battle.objects.tank.tankskin
{
   import §;$$§.§3?§;
   import §;$$§.§try var static§;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.§?!2§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.models.tank.§each use§;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DS;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import §while catch use§.§9!u§;
   import §while catch use§.§finally for false§;
   import §while catch use§.§get for try§;
   
   public class §false catch set§
   {
      [Inject]
      public static var §false for package§:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §override set continue§:ColorTransform = new ColorTransform();
      
      private static const §%"h§:§each use§ = new §each use§();
      
      private static var §try for return§:Number = 0.4;
      
      private static var §null package class§:Matrix4 = new Matrix4();
      
      private var leftTrackSkin:§"#3§;
      
      private var rightTrackSkin:§"#3§;
      
      public var §3!U§:Number = 0;
      
      private var §final package null§:§-l§;
      
      private var §]"n§:§-l§;
      
      private var § #v§:§for for if§;
      
      private var §each for try§:Mesh;
      
      private var §with set continue§:§get for try§;
      
      private var §%#C§:Mesh;
      
      private var §-#m§:§finally for false§;
      
      private var §throw package else§:ColorTransform;
      
      private var §static get§:ColorTransform;
      
      private var §=#§:ColorTransform;
      
      private var §,#w§:ColorTransform;
      
      private var §default var continue§:ColorTransform;
      
      private var §dynamic for default§:§try var static§;
      
      private var §<k§:Shadow;
      
      public function §false catch set§(param1:IGameObject, param2:IGameObject, param3:IGameObject, param4:ImageResource)
      {
         this.§=#§ = new ColorTransform();
         this.§,#w§ = new ColorTransform();
         this.§default var continue§ = new ColorTransform();
         this.§dynamic for default§ = new §3?§();
         super();
         var _loc5_:Tanks3DSResource = IObject3DS(param1.adapt(IObject3DS)).getResource3DS();
         this.§ #v§ = §%"h§.§-w§(_loc5_);
         var _loc6_:Tanks3DSResource = IObject3DS(param2.adapt(IObject3DS)).getResource3DS();
         this.§with set continue§ = §%"h§.§4W§(_loc6_);
         this.§each for try§ = this.cloneMesh(this.§ #v§.mesh);
         var _loc7_:Mesh = this.cloneMesh(this.§with set continue§.meshes[0]);
         this.§-#m§ = new §finally for false§(_loc7_);
         this.createTrackSkins(this.§each for try§);
         var _loc8_:IColoring = IColoring(param3.adapt(IColoring));
         this.§final package null§ = this.§dynamic for default§.§2"b§(this,_loc8_);
         this.§]"n§ = this.§dynamic for default§.§class var static§(this,param4);
         this.§throw package else§ = new ColorTransform(1,0.75,0.6,1,-16,-66,-66);
         this.§static get§ = new ColorTransform(0.8,1,1.2,1,40,60,70);
         this.§3#"§();
      }
      
      private static function §extends package do§(param1:ColorTransform, param2:String, param3:ColorTransform, param4:ColorTransform, param5:Number) : void
      {
         var _loc6_:Number = param4[param2] - param3[param2];
         param1[param2] = param3[param2] + Math.abs(param5) * _loc6_;
      }
      
      private static function copyColorTransform(param1:ColorTransform, param2:ColorTransform) : void
      {
         param2.redMultiplier = param1.redMultiplier;
         param2.greenMultiplier = param1.greenMultiplier;
         param2.blueMultiplier = param1.blueMultiplier;
         param2.alphaMultiplier = param1.alphaMultiplier;
         param2.redOffset = param1.redOffset;
         param2.greenOffset = param1.greenOffset;
         param2.blueOffset = param1.blueOffset;
         param2.alphaOffset = param1.alphaOffset;
      }
      
      private function §3#"§() : void
      {
         this.§<k§ = new Shadow(128,8,100,1,1,1118498,0.6);
         this.§<k§.direction = new Vector3D(0,0,-1);
         this.§<k§.offset = 90;
         this.§<k§.backFadeRange = 90;
         this.§<k§.addCaster(this.§each for try§);
         this.§-#m§.§for const static§(this.§<k§);
      }
      
      public function addToScene() : void
      {
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.§with catch with§(this.§each for try§);
         _loc1_.§84§(this.§-#m§);
         _loc1_.§?!Y§(this.§<k§);
      }
      
      public function removeFromScene() : void
      {
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.removeObject(this.§each for try§);
         _loc1_.§break for while§(this.§-#m§);
         _loc1_.§-#F§(this.§<k§);
      }
      
      public function §3!V§(param1:Number) : void
      {
         if(this.§ #v§ != null && this.§with set continue§ != null)
         {
            §null package class§.setMatrix(this.§each for try§.x,this.§each for try§.y,this.§each for try§.z,this.§each for try§.rotationX,this.§each for try§.rotationY,this.§each for try§.rotationZ);
            this.§-#m§.§3!V§(§null package class§,this.§ #v§,param1);
         }
      }
      
      public function §function set catch§(param1:Vector3, param2:Vector3) : void
      {
         if(this.§ #v§ != null)
         {
            this.§each for try§.x = param1.x;
            this.§each for try§.y = param1.y;
            this.§each for try§.z = param1.z;
            this.§each for try§.rotationX = param2.x;
            this.§each for try§.rotationY = param2.y;
            this.§each for try§.rotationZ = param2.z;
         }
      }
      
      public function dispose() : void
      {
         this.§each for try§.setMaterialToAllFaces(null);
         this.§-#m§.destroy();
         this.§extends for else§(null,null);
         this.§<V§(this.§final package null§);
         this.§<V§(this.§]"n§);
         this.§final package null§ = null;
         this.§]"n§ = null;
         this.§each for try§ = null;
         this.§-#m§ = null;
         this.leftTrackSkin = null;
         this.rightTrackSkin = null;
      }
      
      private function §<V§(param1:§-l§) : void
      {
         §false for package§.releaseMaterial(param1.§do package true§);
         §false for package§.releaseMaterial(param1.§0$$§);
         §false for package§.releaseMaterial(param1.§?U§);
         §false for package§.releaseMaterial(param1.§catch set false§);
      }
      
      public function §else set extends§() : void
      {
         this.§each for try§.setMaterialToAllFaces(this.§final package null§.§do package true§);
         this.§-#m§.§7Y§(this.§final package null§.§0$$§,this.§final package null§.§dynamic const with§);
         this.§extends for else§(this.§final package null§.§?U§,this.§final package null§.§catch set false§);
      }
      
      public function §2!<§() : void
      {
         this.§each for try§.setMaterialToAllFaces(this.§]"n§.§do package true§);
         this.§-#m§.§7Y§(this.§]"n§.§0$$§,this.§]"n§.§dynamic const with§);
         this.§extends for else§(this.§]"n§.§do package true§,this.§]"n§.§do package true§);
         this.§]!b§();
      }
      
      private function §extends for else§(param1:Material, param2:Material) : void
      {
         this.leftTrackSkin.§28§(param1);
         this.rightTrackSkin.§28§(param2);
      }
      
      public function §]!b§() : void
      {
         this.§3!U§ = 0;
         this.§=#§.redMultiplier = 1;
         this.§=#§.greenMultiplier = 1;
         this.§=#§.blueMultiplier = 1;
         this.§=#§.redOffset = 0;
         this.§=#§.greenOffset = 0;
         this.§=#§.blueOffset = 0;
         copyColorTransform(this.§=#§,this.§,#w§);
      }
      
      public function §each var get§(param1:Number) : void
      {
         var _loc2_:ColorTransform = null;
         if(param1 == 0)
         {
            _loc2_ = §override set continue§;
         }
         else if(param1 < 0)
         {
            _loc2_ = this.§static get§;
         }
         else
         {
            _loc2_ = this.§throw package else§;
         }
         §extends package do§(this.§default var continue§,"redMultiplier",§override set continue§,_loc2_,param1);
         §extends package do§(this.§default var continue§,"blueMultiplier",§override set continue§,_loc2_,param1);
         §extends package do§(this.§default var continue§,"greenMultiplier",§override set continue§,_loc2_,param1);
         §extends package do§(this.§default var continue§,"redOffset",§override set continue§,_loc2_,param1);
         §extends package do§(this.§default var continue§,"blueOffset",§override set continue§,_loc2_,param1);
         §extends package do§(this.§default var continue§,"greenOffset",§override set continue§,_loc2_,param1);
         §extends package do§(this.§,#w§,"redMultiplier",this.§,#w§,this.§default var continue§,0.03);
         §extends package do§(this.§,#w§,"blueMultiplier",this.§,#w§,this.§default var continue§,0.03);
         §extends package do§(this.§,#w§,"greenMultiplier",this.§,#w§,this.§default var continue§,0.03);
         §extends package do§(this.§,#w§,"redOffset",this.§,#w§,this.§default var continue§,0.03);
         §extends package do§(this.§,#w§,"blueOffset",this.§,#w§,this.§default var continue§,0.03);
         §extends package do§(this.§,#w§,"greenOffset",this.§,#w§,this.§default var continue§,0.03);
      }
      
      public function setAlpha(param1:Number) : void
      {
         this.§-#m§.alpha = param1;
         this.§each for try§.alpha = param1;
         this.§<k§.alpha = param1 * 0.6;
      }
      
      public function §catch in§() : Number
      {
         return this.§each for try§.alpha;
      }
      
      public function §7!T§() : Mesh
      {
         return this.§each for try§;
      }
      
      public function §&K§() : Object3D
      {
         return this.§-#m§.§2"F§();
      }
      
      public function §2"F§() : Object3D
      {
         return this.§-#m§.§2"F§();
      }
      
      public function §include while§() : Object3D
      {
         return this.§-#m§.§include while§();
      }
      
      public function §7F§() : §finally for false§
      {
         return this.§-#m§;
      }
      
      public function §-w§() : §for for if§
      {
         return this.§ #v§;
      }
      
      public function §4W§() : §get for try§
      {
         return this.§with set continue§;
      }
      
      public function §do catch else§() : §"#g§
      {
         return this.§-#m§.§do catch else§();
      }
      
      private function cloneMesh(param1:Mesh) : Mesh
      {
         var _loc2_:Mesh = Mesh(param1.clone());
         _loc2_.name = §?!2§.TANK_PART;
         _loc2_.colorTransform = this.§,#w§;
         _loc2_.shadowMapAlphaThreshold = 0.1;
         _loc2_.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _loc2_;
      }
      
      public function §]c§() : Vector.<§9!u§>
      {
         return this.§with set continue§.§class catch function§();
      }
      
      public function §,!0§(param1:Number, param2:Number) : void
      {
         this.leftTrackSkin.move(param1);
         this.rightTrackSkin.move(param2);
      }
      
      private function createTrackSkins(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         this.leftTrackSkin = new §"#3§();
         this.rightTrackSkin = new §"#3§();
         for each(_loc2_ in param1.faces)
         {
            if(_loc2_.material.name == "tracks")
            {
               this.addFaceToTrackSkin(_loc2_);
            }
         }
         this.leftTrackSkin.init();
         this.rightTrackSkin.init();
      }
      
      private function addFaceToTrackSkin(param1:Face) : void
      {
         var _loc2_:Vertex = param1.vertices[0];
         if(_loc2_.x < 0)
         {
            this.leftTrackSkin.addFace(param1);
         }
         else
         {
            this.rightTrackSkin.addFace(param1);
         }
      }
      
      public function §7#B§(param1:Vector3) : void
      {
         var _loc2_:Matrix4 = §finally for false§.§with const false§;
         var _loc3_:Object3D = this.§-#m§.§2"F§();
         _loc2_.setMatrix(_loc3_.x,_loc3_.y,_loc3_.z,_loc3_.rotationX,_loc3_.rotationY,_loc3_.rotationZ);
         _loc2_.transformVector(this.§with set continue§.§include var while§,param1);
      }
   }
}

