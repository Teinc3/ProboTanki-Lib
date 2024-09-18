package alternativa.tanks.battle.objects.tank.tankskin
{
   import Renamed293.Renamed1228;
   import Renamed293.Renamed1229;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed1230;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.models.tank.Renamed1231;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.geom.ColorTransform;
   import flash.geom.Vector3D;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DS;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import Renamed456.Renamed923;
   import Renamed456.Renamed1232;
   import Renamed456.Renamed924;
   
   public class Renamed917
   {
      [Inject]
      public static var Renamed1233:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed1234:ColorTransform = new ColorTransform();
      
      private static const Renamed1235:Renamed1231 = new Renamed1231();
      
      private static var Renamed1236:Number = 0.4;
      
      private static var Renamed1237:Matrix4 = new Matrix4();
      
      private var leftTrackSkin:Renamed1175;
      
      private var rightTrackSkin:Renamed1175;
      
      public var Renamed1238:Number = 0;
      
      private var Renamed1239:Renamed1203;
      
      private var Renamed1240:Renamed1203;
      
      private var Renamed1241:Renamed918;
      
      private var Renamed1242:Mesh;
      
      private var Renamed1243:Renamed924;
      
      private var Renamed1244:Mesh;
      
      private var Renamed1245:Renamed1232;
      
      private var Renamed1246:ColorTransform;
      
      private var Renamed1247:ColorTransform;
      
      private var Renamed1248:ColorTransform;
      
      private var Renamed1249:ColorTransform;
      
      private var Renamed1250:ColorTransform;
      
      private var Renamed1251:Renamed1229;
      
      private var Renamed1252:Shadow;
      
      public function Renamed917(param1:IGameObject, param2:IGameObject, param3:IGameObject, param4:ImageResource)
      {
         this.Renamed1248 = new ColorTransform();
         this.Renamed1249 = new ColorTransform();
         this.Renamed1250 = new ColorTransform();
         this.Renamed1251 = new Renamed1228();
         super();
         var _loc5_:Tanks3DSResource = IObject3DS(param1.adapt(IObject3DS)).getResource3DS();
         this.Renamed1241 = Renamed1235.Renamed996(_loc5_);
         var _loc6_:Tanks3DSResource = IObject3DS(param2.adapt(IObject3DS)).getResource3DS();
         this.Renamed1243 = Renamed1235.Renamed1057(_loc6_);
         this.Renamed1242 = this.cloneMesh(this.Renamed1241.mesh);
         var _loc7_:Mesh = this.cloneMesh(this.Renamed1243.meshes[0]);
         this.Renamed1245 = new Renamed1232(_loc7_);
         this.createTrackSkins(this.Renamed1242);
         var _loc8_:IColoring = IColoring(param3.adapt(IColoring));
         this.Renamed1239 = this.Renamed1251.Renamed1253(this,_loc8_);
         this.Renamed1240 = this.Renamed1251.Renamed1254(this,param4);
         this.Renamed1246 = new ColorTransform(1,0.75,0.6,1,-16,-66,-66);
         this.Renamed1247 = new ColorTransform(0.8,1,1.2,1,40,60,70);
         this.Renamed1255();
      }
      
      private static function Renamed1256(param1:ColorTransform, param2:String, param3:ColorTransform, param4:ColorTransform, param5:Number) : void
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
      
      private function Renamed1255() : void
      {
         this.Renamed1252 = new Shadow(128,8,100,1,1,1118498,0.6);
         this.Renamed1252.direction = new Vector3D(0,0,-1);
         this.Renamed1252.offset = 90;
         this.Renamed1252.backFadeRange = 90;
         this.Renamed1252.addCaster(this.Renamed1242);
         this.Renamed1245.Renamed1257(this.Renamed1252);
      }
      
      public function addToScene() : void
      {
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.Renamed1258(this.Renamed1242);
         _loc1_.Renamed1259(this.Renamed1245);
         _loc1_.Renamed1260(this.Renamed1252);
      }
      
      public function removeFromScene() : void
      {
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.removeObject(this.Renamed1242);
         _loc1_.Renamed1261(this.Renamed1245);
         _loc1_.Renamed1262(this.Renamed1252);
      }
      
      public function Renamed1063(param1:Number) : void
      {
         if(this.Renamed1241 != null && this.Renamed1243 != null)
         {
            Renamed1237.setMatrix(this.Renamed1242.x,this.Renamed1242.y,this.Renamed1242.z,this.Renamed1242.rotationX,this.Renamed1242.rotationY,this.Renamed1242.rotationZ);
            this.Renamed1245.Renamed1063(Renamed1237,this.Renamed1241,param1);
         }
      }
      
      public function Renamed1138(param1:Vector3, param2:Vector3) : void
      {
         if(this.Renamed1241 != null)
         {
            this.Renamed1242.x = param1.x;
            this.Renamed1242.y = param1.y;
            this.Renamed1242.z = param1.z;
            this.Renamed1242.rotationX = param2.x;
            this.Renamed1242.rotationY = param2.y;
            this.Renamed1242.rotationZ = param2.z;
         }
      }
      
      public function dispose() : void
      {
         this.Renamed1242.setMaterialToAllFaces(null);
         this.Renamed1245.destroy();
         this.Renamed1263(null,null);
         this.Renamed1264(this.Renamed1239);
         this.Renamed1264(this.Renamed1240);
         this.Renamed1239 = null;
         this.Renamed1240 = null;
         this.Renamed1242 = null;
         this.Renamed1245 = null;
         this.leftTrackSkin = null;
         this.rightTrackSkin = null;
      }
      
      private function Renamed1264(param1:Renamed1203) : void
      {
         Renamed1233.releaseMaterial(param1.Renamed1204);
         Renamed1233.releaseMaterial(param1.Renamed1205);
         Renamed1233.releaseMaterial(param1.Renamed1206);
         Renamed1233.releaseMaterial(param1.Renamed1207);
      }
      
      public function Renamed1083() : void
      {
         this.Renamed1242.setMaterialToAllFaces(this.Renamed1239.Renamed1204);
         this.Renamed1245.Renamed1265(this.Renamed1239.Renamed1205,this.Renamed1239.Renamed1208);
         this.Renamed1263(this.Renamed1239.Renamed1206,this.Renamed1239.Renamed1207);
      }
      
      public function Renamed1266() : void
      {
         this.Renamed1242.setMaterialToAllFaces(this.Renamed1240.Renamed1204);
         this.Renamed1245.Renamed1265(this.Renamed1240.Renamed1205,this.Renamed1240.Renamed1208);
         this.Renamed1263(this.Renamed1240.Renamed1204,this.Renamed1240.Renamed1204);
         this.Renamed1082();
      }
      
      private function Renamed1263(param1:Material, param2:Material) : void
      {
         this.leftTrackSkin.Renamed1179(param1);
         this.rightTrackSkin.Renamed1179(param2);
      }
      
      public function Renamed1082() : void
      {
         this.Renamed1238 = 0;
         this.Renamed1248.redMultiplier = 1;
         this.Renamed1248.greenMultiplier = 1;
         this.Renamed1248.blueMultiplier = 1;
         this.Renamed1248.redOffset = 0;
         this.Renamed1248.greenOffset = 0;
         this.Renamed1248.blueOffset = 0;
         copyColorTransform(this.Renamed1248,this.Renamed1249);
      }
      
      public function Renamed1064(param1:Number) : void
      {
         var _loc2_:ColorTransform = null;
         if(param1 == 0)
         {
            _loc2_ = Renamed1234;
         }
         else if(param1 < 0)
         {
            _loc2_ = this.Renamed1247;
         }
         else
         {
            _loc2_ = this.Renamed1246;
         }
         Renamed1256(this.Renamed1250,"redMultiplier",Renamed1234,_loc2_,param1);
         Renamed1256(this.Renamed1250,"blueMultiplier",Renamed1234,_loc2_,param1);
         Renamed1256(this.Renamed1250,"greenMultiplier",Renamed1234,_loc2_,param1);
         Renamed1256(this.Renamed1250,"redOffset",Renamed1234,_loc2_,param1);
         Renamed1256(this.Renamed1250,"blueOffset",Renamed1234,_loc2_,param1);
         Renamed1256(this.Renamed1250,"greenOffset",Renamed1234,_loc2_,param1);
         Renamed1256(this.Renamed1249,"redMultiplier",this.Renamed1249,this.Renamed1250,0.03);
         Renamed1256(this.Renamed1249,"blueMultiplier",this.Renamed1249,this.Renamed1250,0.03);
         Renamed1256(this.Renamed1249,"greenMultiplier",this.Renamed1249,this.Renamed1250,0.03);
         Renamed1256(this.Renamed1249,"redOffset",this.Renamed1249,this.Renamed1250,0.03);
         Renamed1256(this.Renamed1249,"blueOffset",this.Renamed1249,this.Renamed1250,0.03);
         Renamed1256(this.Renamed1249,"greenOffset",this.Renamed1249,this.Renamed1250,0.03);
      }
      
      public function setAlpha(param1:Number) : void
      {
         this.Renamed1245.alpha = param1;
         this.Renamed1242.alpha = param1;
         this.Renamed1252.alpha = param1 * 0.6;
      }
      
      public function Renamed1267() : Number
      {
         return this.Renamed1242.alpha;
      }
      
      public function Renamed1023() : Mesh
      {
         return this.Renamed1242;
      }
      
      public function Renamed1268() : Object3D
      {
         return this.Renamed1245.Renamed1020();
      }
      
      public function Renamed1020() : Object3D
      {
         return this.Renamed1245.Renamed1020();
      }
      
      public function Renamed1056() : Object3D
      {
         return this.Renamed1245.Renamed1056();
      }
      
      public function Renamed1269() : Renamed1232
      {
         return this.Renamed1245;
      }
      
      public function Renamed996() : Renamed918
      {
         return this.Renamed1241;
      }
      
      public function Renamed1057() : Renamed924
      {
         return this.Renamed1243;
      }
      
      public function Renamed1270() : Renamed1185
      {
         return this.Renamed1245.Renamed1270();
      }
      
      private function cloneMesh(param1:Mesh) : Mesh
      {
         var _loc2_:Mesh = Mesh(param1.clone());
         _loc2_.name = Renamed1230.TANK_PART;
         _loc2_.colorTransform = this.Renamed1249;
         _loc2_.shadowMapAlphaThreshold = 0.1;
         _loc2_.calculateVerticesNormalsBySmoothingGroups(0.01);
         return _loc2_;
      }
      
      public function Renamed1044() : Vector.<Renamed923>
      {
         return this.Renamed1243.Renamed1271();
      }
      
      public function Renamed1212(param1:Number, param2:Number) : void
      {
         this.leftTrackSkin.move(param1);
         this.rightTrackSkin.move(param2);
      }
      
      private function createTrackSkins(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         this.leftTrackSkin = new Renamed1175();
         this.rightTrackSkin = new Renamed1175();
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
      
      public function Renamed1272(param1:Vector3) : void
      {
         var _loc2_:Matrix4 = Renamed1232.Renamed1273;
         var _loc3_:Object3D = this.Renamed1245.Renamed1020();
         _loc2_.setMatrix(_loc3_.x,_loc3_.y,_loc3_.z,_loc3_.rotationX,_loc3_.rotationY,_loc3_.rotationZ);
         _loc2_.transformVector(this.Renamed1243.Renamed1274,param1);
      }
   }
}

