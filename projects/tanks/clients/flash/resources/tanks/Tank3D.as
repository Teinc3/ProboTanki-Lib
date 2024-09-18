package projects.tanks.clients.flash.resources.tanks
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.battle.objects.tank.tankskin.§"§;
   import alternativa.tanks.materials.AnimatedPaintMaterial;
   import alternativa.tanks.materials.PaintMaterial;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Tank3D extends Object3DContainer
   {
      private static var defaultColormap:BitmapData;
      
      private static const EXCLUDED:RegExp = /(box.*|fmnt|muzzle.*)/i;
      
      public static const TANK_PART:String = "tankPart";
      
      private static const HULL_PART:int = 0;
      
      private static const TURRET_PART:int = 1;
      
      private var hullResource:Tanks3DSResource;
      
      private var turretResource:Tanks3DSResource;
      
      private var hull:Mesh;
      
      private var turret:MeshContainer;
      
      private var colormap:BitmapData;
      
      private var multiframeImageResource:MultiframeImageResource;
      
      private var leftTrackSkin:§"#3§;
      
      private var rightTrackSkin:§"#3§;
      
      private var materials:Vector.<TextureMaterial>;
      
      public var shadow:Shadow;
      
      public function Tank3D()
      {
         this.materials = new Vector.<TextureMaterial>(2);
         super();
      }
      
      private static function getDefaultColorMap() : BitmapData
      {
         if(defaultColormap == null)
         {
            defaultColormap = new BitmapData(1,1,false,6710886);
         }
         return defaultColormap;
      }
      
      public static function cloneMesh(param1:Mesh) : Mesh
      {
         var _loc2_:Mesh = null;
         _loc2_ = Mesh(param1.clone());
         _loc2_.name = TANK_PART;
         _loc2_.colorTransform = new ColorTransform();
         _loc2_.shadowMapAlphaThreshold = 0.1;
         _loc2_.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _loc2_;
      }
      
      public function setColorMap(param1:BitmapData) : void
      {
         this.multiframeImageResource = null;
         this.destroyMaterials();
         this.colormap = param1 != null ? param1 : getDefaultColorMap();
         this.updateTurretTexture(this.turretResource,this.turret);
         this.updatePartTexture(this.hullResource,this.hull,HULL_PART);
      }
      
      public function setHull(param1:Tanks3DSResource) : void
      {
         if(this.hull != null)
         {
            this.hull.setMaterialToAllFaces(null);
            removeChild(this.hull);
         }
         if(param1 == null)
         {
            return;
         }
         this.hullResource = param1;
         this.hull = this.initMesh(cloneMesh(param1.objects[0] as Mesh));
         addChild(this.hull);
         if(this.turret != null)
         {
            addChild(this.turret);
         }
         this.hull.x = 0;
         this.hull.y = 0;
         this.hull.z = 0;
         this.updatePartTexture(param1,this.hull,HULL_PART);
         this.updateMountPoint();
      }
      
      public function setTurret(param1:Tanks3DSResource) : void
      {
         var _loc2_:Mesh = null;
         if(this.turret != null)
         {
            for each(_loc2_ in this.turret.getMeshes())
            {
               _loc2_.setMaterialToAllFaces(null);
            }
            removeChild(this.turret);
         }
         if(param1 == null)
         {
            return;
         }
         this.turretResource = param1;
         this.turret = new MeshContainer();
         this.turret.setMeshes(this.getMeshes(param1));
         addChild(this.turret);
         this.updateTurretTexture(param1,this.turret);
         this.updateMountPoint();
      }
      
      private function getMeshes(param1:Tanks3DSResource) : Vector.<Mesh>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Mesh> = new Vector.<Mesh>();
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && !EXCLUDED.test(_loc2_.name))
            {
               _loc3_.push(this.initMesh(cloneMesh(_loc2_ as Mesh)));
            }
         }
         return _loc3_;
      }
      
      private function updateTurretTexture(param1:Tanks3DSResource, param2:MeshContainer) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:Vector.<Mesh> = param2.getMeshes();
         var _loc4_:TextureMaterial = this.updatePartTexture(param1,_loc3_[0],TURRET_PART);
         var _loc5_:int = 1;
         while(_loc5_ < _loc3_.length)
         {
            _loc3_[_loc5_].setMaterialToAllFaces(_loc4_);
            _loc5_++;
         }
      }
      
      private function updatePartTexture(param1:Tanks3DSResource, param2:Mesh, param3:int) : TextureMaterial
      {
         var _loc4_:TextureMaterial = null;
         if(param1 == null || param2 == null || this.colormap == null && this.multiframeImageResource == null)
         {
            return null;
         }
         if(this.multiframeImageResource != null)
         {
            _loc4_ = this.createAnimatedTexture(param1,param3);
         }
         else
         {
            _loc4_ = this.createTexture(param1,param3);
         }
         this.createTrackSkins(param2,param1);
         param2.setMaterialToAllFaces(_loc4_);
         return _loc4_;
      }
      
      private function createAnimatedTexture(param1:Tanks3DSResource, param2:int) : TextureMaterial
      {
         var _loc3_:BitmapData = param1.textures["lightmap.jpg"];
         var _loc4_:BitmapData = param1.textures["details.png"];
         var _loc5_:int = this.multiframeImageResource.data.width / this.multiframeImageResource.frameWidth;
         var _loc6_:int = this.multiframeImageResource.data.height / this.multiframeImageResource.frameHeight;
         var _loc7_:AnimatedPaintMaterial = new AnimatedPaintMaterial(this.multiframeImageResource.data,_loc3_,_loc4_,_loc5_,_loc6_,this.multiframeImageResource.fps,this.multiframeImageResource.numFrames);
         if(this.materials[param2] != null)
         {
            this.materials[param2].dispose();
         }
         this.materials[param2] = _loc7_;
         return _loc7_;
      }
      
      private function createTexture(param1:Tanks3DSResource, param2:int) : TextureMaterial
      {
         var _loc3_:BitmapData = param1.textures["lightmap.jpg"];
         var _loc4_:BitmapData = param1.textures["details.png"];
         var _loc5_:TextureMaterial = new PaintMaterial(this.colormap,_loc3_,_loc4_);
         if(this.materials[param2] != null)
         {
            this.materials[param2].dispose();
         }
         this.materials[param2] = _loc5_;
         return _loc5_;
      }
      
      public function createTrackSkins(param1:Mesh, param2:Tanks3DSResource) : void
      {
         var _loc3_:Face = null;
         this.leftTrackSkin = new §"#3§();
         this.rightTrackSkin = new §"#3§();
         for each(_loc3_ in param1.faces)
         {
            if(_loc3_.id == "track" || _loc3_.material.name == "track")
            {
               this.addFaceToTrackSkin(_loc3_);
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
      
      private function updateMountPoint() : void
      {
         if(this.hull == null || this.turret == null)
         {
            return;
         }
         var _loc1_:Object3D = this.hullResource.getObjectsByName(/mount/i)[0];
         this.turret.x = _loc1_.x;
         this.turret.y = _loc1_.y;
         this.turret.z = _loc1_.z;
      }
      
      public function destroy() : void
      {
         this.destroyMaterials();
         this.materials = null;
         this.multiframeImageResource = null;
         this.hull = null;
         this.turret = null;
         this.colormap = null;
         this.hullResource = null;
         this.turretResource = null;
      }
      
      private function destroyMaterials() : void
      {
         if(this.materials[HULL_PART] != null)
         {
            this.materials[HULL_PART].dispose();
            this.materials[HULL_PART] = null;
         }
         if(this.materials[TURRET_PART] != null)
         {
            this.materials[TURRET_PART].dispose();
            this.materials[TURRET_PART] = null;
         }
      }
      
      protected function initMesh(param1:Mesh) : Mesh
      {
         if(param1.sorting != Sorting.DYNAMIC_BSP)
         {
            param1.sorting = Sorting.DYNAMIC_BSP;
            param1.calculateFacesNormals(true);
            param1.optimizeForDynamicBSP();
            param1.threshold = 0.01;
         }
         return param1;
      }
   }
}

