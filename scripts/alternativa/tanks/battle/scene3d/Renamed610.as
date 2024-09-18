package alternativa.tanks.battle.scene3d
{
   import Renamed211.Renamed1341;
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1342.Renamed1343;
   import Renamed306.Renamed1344;
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed710;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed834;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.Renamed844;
   import alternativa.tanks.battle.Renamed864;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.camera.Renamed611;
   import alternativa.tanks.camera.Renamed1345;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed342.Renamed1346;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import Renamed409.Renamed1347;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import Renamed456.Renamed1232;
   
   public class Renamed610
   {
      private static const Renamed1348:int = 10;
      
      private static const Renamed1349:int = 20000;
      
      private static const Renamed1350:Vector3D = new Vector3D();
      
      private static const Renamed1351:Vector3D = new Vector3D();
      
      private var rootContainer:Object3DContainer;
      
      private var Renamed1352:Object3DContainer;
      
      private var mainContainer:Object3DContainer;
      
      private var Renamed1353:Object3DContainer;
      
      public var Renamed1354:Object3DContainer;
      
      private var Renamed1355:Renamed1341;
      
      private var Renamed1356:Renamed1341;
      
      private var camera:Renamed842;
      
      private var Renamed1357:Vector.<Renamed1284>;
      
      private var Renamed1358:Renamed611;
      
      private var effects:Vector.<Renamed609>;
      
      private var Renamed1359:int;
      
      private var Renamed1360:Renamed864;
      
      private var Renamed1361:Renamed1304;
      
      private var Renamed1362:Renamed1297;
      
      private var fog:Renamed1363;
      
      private var Renamed1364:Renamed1322;
      
      private var lighting:Renamed1311;
      
      private var Renamed1365:Renamed710;
      
      private var stage:Stage;
      
      private var Renamed1366:Renamed844;
      
      private var Renamed1367:Renamed1346;
      
      private var Renamed1368:TextureMaterialRegistry;
      
      private var Renamed1369:Number;
      
      private var Renamed1370:Renamed1340;
      
      private var Renamed1371:Boolean;
      
      private var tanks:Vector.<Tank>;
      
      public function Renamed610(param1:Stage, param2:TextureMaterialRegistry, param3:Number)
      {
         this.Renamed1372 = new Dictionary();
         this.Renamed1373 = new Dictionary();
         this.Renamed1374 = new Renamed1347();
         this.Renamed1375 = new Dictionary();
         this.Renamed1376 = new Renamed834(100);
         this.Renamed1377 = new Renamed1343();
         this.Renamed1355 = new Renamed1341();
         this.Renamed1357 = Vector.<Renamed1284>([new Renamed1284(),new Renamed1284()]);
         this.Renamed1358 = Renamed1345.INSTANCE;
         this.effects = new Vector.<Renamed609>();
         this.tanks = new Vector.<Tank>();
         super();
         this.Renamed1368 = param2;
         this.stage = param1;
         this.Renamed1369 = param3;
         this.Renamed1378();
         this.Renamed1379();
         this.Renamed1380();
         this.Renamed1367 = new Renamed1346();
         this.fog = new Renamed1363(this.camera);
         this.Renamed1364 = new Renamed1322(this.camera);
         this.lighting = new Renamed1311(this.camera);
      }
      
      public function Renamed1381() : Renamed908
      {
         return this.Renamed1356;
      }
      
      public function Renamed1382() : Renamed908
      {
         return this.Renamed1355;
      }
      
      public function Renamed727(param1:View) : void
      {
         this.camera.view = param1;
      }
      
      public function Renamed1383(param1:Number, param2:uint, param3:Number, param4:Number, param5:Number) : void
      {
      }
      
      public function Renamed1384() : void
      {
         this.Renamed1287(this.Renamed1377,0);
      }
      
      public function Renamed1385(param1:BattleService, param2:Renamed1344) : void
      {
         this.Renamed1366 = new Renamed844(param1);
         this.Renamed1366.init(param2.dustParticle,this.Renamed1368,param2.dustFarDistance,param2.dustNearDistance,param2.dustSize,param2.alpha,param2.Renamed849);
      }
      
      public function Renamed1033() : Renamed844
      {
         return this.Renamed1366;
      }
      
      public function Renamed1386() : void
      {
         this.Renamed1289(this.Renamed1377,0);
         this.Renamed1377.Renamed1387();
      }
      
      public function Renamed1388(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            if(this.Renamed1365 == null)
            {
               this.Renamed1389(true);
               this.Renamed1390(true);
               this.Renamed1391(true);
               this.Renamed1392(true);
               this.Renamed1393(true);
               this.Renamed1394(true);
               this.Renamed1319(true);
               this.Renamed1395(true);
               this.Renamed1396(true);
               this.Renamed1365 = new Renamed710();
               this.Renamed1365.Renamed712(this.stage,this.camera,param2);
            }
         }
         else if(this.Renamed1365 != null)
         {
            this.Renamed1365.stop();
            this.Renamed1365 = null;
         }
      }
      
      public function Renamed1397(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         this.fog.setup(param1,param2,param3,param4);
      }
      
      public function Renamed1398(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.lighting.setup(param1,param2,param3,param4);
      }
      
      public function Renamed1389(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.Renamed1364.enable();
            }
            else
            {
               this.Renamed1364.disable();
            }
         }
      }
      
      public function Renamed1390(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.lighting.Renamed1317();
            }
            else
            {
               this.lighting.Renamed1318();
            }
         }
      }
      
      public function Renamed1391(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.fog.enable();
            }
            else
            {
               this.fog.disable();
            }
         }
      }
      
      public function Renamed1399() : void
      {
         this.Renamed1391(this.camera.fogAlpha == 0);
      }
      
      public function Renamed1400(param1:Renamed1297) : void
      {
         this.Renamed1362 = param1;
      }
      
      public function Renamed1401(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.Renamed1375)
         {
            param1[_loc2_] = true;
         }
      }
      
      public function Renamed1402(param1:Object3D) : void
      {
         this.Renamed1372[param1] = true;
      }
      
      public function Renamed1403(param1:Object3D) : void
      {
         delete this.Renamed1372[param1];
      }
      
      public function Renamed1404() : Dictionary
      {
         return this.Renamed1372;
      }
      
      public function Renamed1405() : Dictionary
      {
         return this.Renamed1373;
      }
      
      private function Renamed1378() : void
      {
         this.rootContainer = new Object3DContainer();
         this.rootContainer.addChild(this.Renamed1352 = new Object3DContainer());
         this.rootContainer.addChild(this.mainContainer = new Object3DContainer());
         this.rootContainer.addChild(this.Renamed1353 = new Object3DContainer());
         this.Renamed1356 = new Renamed1341(this.Renamed1353);
      }
      
      private function Renamed1379() : void
      {
         this.camera = new Renamed842();
         this.camera.ssaoRadius = 400;
         this.camera.ssaoRange = 1200;
         this.camera.ssaoColor = 0;
         this.camera.ssaoAlpha = 1.4;
         this.camera.addToDebug(Debug.BOUNDS,Object3D);
         this.camera.addToDebug(Debug.EDGES,Object3D);
         this.rootContainer.addChild(this.camera);
      }
      
      public function Renamed1406(param1:uint) : void
      {
         this.camera.ssaoColor = param1;
      }
      
      private function Renamed1380() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.Renamed1361 = new Renamed1304(Renamed1349);
            this.Renamed1287(this.Renamed1361,0);
         }
      }
      
      public function Renamed1260(param1:Shadow) : void
      {
         this.Renamed1364.add(param1);
      }
      
      public function Renamed1262(param1:Shadow) : void
      {
         this.Renamed1364.remove(param1);
      }
      
      public function Renamed1259(param1:Renamed1232) : void
      {
         this.addObjToAbsPacket(param1.Renamed1020());
      }
      
      public function Renamed1261(param1:Renamed1232) : void
      {
         this.removeObject(param1.Renamed1020());
      }
      
      public function Renamed1407(param1:Boolean) : void
      {
         this.camera.debug = param1;
      }
      
      public function isDebug() : Boolean
      {
         return this.camera.debug;
      }
      
      public function Renamed1408() : void
      {
         this.Renamed1371 = true;
      }
      
      public function Renamed1409() : void
      {
         this.Renamed1371 = false;
      }
      
      public function Renamed1410(param1:Renamed864) : void
      {
         this.Renamed1360 = param1;
      }
      
      public function Renamed851(param1:Tank) : void
      {
         this.tanks.push(param1);
      }
      
      public function Renamed853(param1:Tank) : void
      {
         var _loc2_:int = int(this.tanks.indexOf(param1));
         if(_loc2_ != -1)
         {
            this.tanks.splice(_loc2_,1);
         }
      }
      
      public function Renamed1287(param1:Renamed919, param2:int = 0) : void
      {
         var _loc3_:Renamed1284 = this.Renamed1357[param2];
         _loc3_.Renamed1287(param1);
      }
      
      public function Renamed1289(param1:Renamed919, param2:int = 0) : void
      {
         var _loc3_:Renamed1284 = this.Renamed1357[param2];
         _loc3_.Renamed1289(param1);
      }
      
      public function Renamed636(param1:Renamed609) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError();
         }
         var _loc2_:* = this.Renamed1359++;
         this.effects[_loc2_] = param1;
         param1.Renamed1411(this.Renamed1355);
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(this.Renamed1371)
         {
            this.Renamed1376.update();
            this.Renamed1364.Renamed1331(this.Renamed1376.Renamed835());
            this.Renamed1366.update();
            this.Renamed1412(param1,param2);
            this.Renamed1358.update(param1,param2);
            this.camera.Renamed1413();
            this.Renamed1414(param1,param2);
            this.Renamed1415(param2);
            if(this.Renamed1360 != null)
            {
               this.Renamed1360.Renamed865();
            }
            _loc3_ = this.camera.shadowMap != null ? Number(this.camera.shadowMapStrength) : Number(0);
            if(this.camera.directionalLight != null)
            {
               this.camera.directionalLight.intensity = this.Renamed1369 + _loc3_ * (1 - this.Renamed1369);
            }
            this.camera.render();
         }
      }
      
      private function Renamed1412(param1:int, param2:int) : void
      {
         var _loc3_:Tank = null;
         for each(_loc3_ in this.tanks)
         {
            _loc3_.render(param1,param2);
         }
      }
      
      private function Renamed1415(param1:int) : void
      {
         var _loc2_:Renamed609 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed1359)
         {
            _loc2_ = this.effects[_loc3_];
            if(!_loc2_.play(param1,this.camera))
            {
               _loc2_.destroy();
               var _loc4_:*;
               this.effects[_loc4_ = _loc3_--] = this.effects[--this.Renamed1359];
               this.effects[this.Renamed1359] = null;
            }
            _loc3_++;
         }
      }
      
      public function Renamed739() : Renamed842
      {
         return this.camera;
      }
      
      public function Renamed1416(param1:Object3D) : void
      {
         if(this.Renamed1352.numChildren > 0)
         {
            this.Renamed1352.removeChildAt(0);
         }
         this.Renamed1352.addChild(param1);
      }
      
      public function Renamed1394(param1:Boolean) : void
      {
         this.camera.ssao = param1;
      }
      
      public function Renamed1417(param1:Object3DContainer) : void
      {
         if(this.Renamed1354 != null)
         {
            this.mainContainer.removeChild(this.Renamed1354);
            this.Renamed1354 = null;
         }
         this.Renamed1355.Renamed1418(param1);
         this.Renamed1354 = param1;
         if(this.Renamed1354 != null)
         {
            this.mainContainer.addChild(this.Renamed1354);
            this.camera.farClipping = 1.5 * this.Renamed1419(this.Renamed1354);
         }
      }
      
      public function Renamed1419(param1:Object3D) : Number
      {
         var _loc2_:Number = param1.boundMaxX - param1.boundMinX;
         var _loc3_:Number = param1.boundMaxY - param1.boundMinY;
         var _loc4_:Number = param1.boundMaxZ - param1.boundMinZ;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public function addObjToAbsPacket(param1:Object3D) : void
      {
         this.Renamed1355.addChild(param1);
         if(param1.name != Renamed1230.Renamed690 && param1.name != Renamed1230.TANK_PART)
         {
            this.Renamed1373[param1] = true;
         }
      }
      
      public function removeObject(param1:Object3D) : void
      {
         this.Renamed1355.removeChild(param1);
         if(param1.name != Renamed1230.Renamed690 && param1.name != Renamed1230.TANK_PART)
         {
            delete this.Renamed1373[param1];
         }
      }
      
      public function raycast(param1:Vector3, param2:Vector3, param3:Dictionary, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:Object3D = null;
         Renamed668.Renamed684(param1,Renamed1350);
         Renamed668.Renamed684(param2,Renamed1351);
         var _loc6_:RayIntersectionData = this.Renamed1354.intersectRay(Renamed1350,Renamed1351,param3,param4);
         if(_loc6_)
         {
            _loc5_ = _loc6_.object;
            while(_loc5_ != null && !_loc5_.mouseEnabled)
            {
               _loc5_ = _loc5_.parent;
            }
            _loc6_.object = _loc5_;
         }
         return _loc6_;
      }
      
      public function Renamed1420(param1:Boolean) : void
      {
         var _loc2_:Object3D = this.Renamed1421();
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function Renamed1422() : Boolean
      {
         var _loc1_:Object3D = this.Renamed1421();
         if(_loc1_ != null)
         {
            return _loc1_.visible;
         }
         return false;
      }
      
      public function addDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:Renamed1292 = null) : void
      {
         var _loc6_:Decal = this.createDecal(param1,param2,param3,param4,param5);
         if(_loc6_ != null)
         {
            this.Renamed1374.put(_loc6_);
            if(this.Renamed1374.getSize() > Renamed1348)
            {
               this.Renamed1361.add(this.Renamed1374.pop());
            }
         }
      }
      
      public function Renamed1423(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial) : Decal
      {
         return this.createDecal(param1,param2,param3,param4);
      }
      
      private function createDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:Renamed1292 = null) : Decal
      {
         var _loc6_:Decal = null;
         if(param5 == null)
         {
            param5 = Renamed1292.Renamed1294;
         }
         if(GPUCapabilities.gpuEnabled && this.Renamed1354 is KDContainer)
         {
            _loc6_ = this.Renamed1362.createDecal(param1,param2,param3,param4,KDContainer(this.Renamed1354),param5);
            this.Renamed1355.addChildAt(_loc6_,0);
            this.Renamed1375[_loc6_] = true;
            this.Renamed1402(_loc6_);
            this.Renamed1373[_loc6_] = true;
            return _loc6_;
         }
         return null;
      }
      
      public function Renamed1307(param1:Decal) : void
      {
         if(param1 != null && GPUCapabilities.gpuEnabled)
         {
            this.Renamed1355.removeChild(param1);
            this.Renamed1403(param1);
            delete this.Renamed1373[param1];
            delete this.Renamed1375[param1];
         }
      }
      
      public function Renamed638(param1:Renamed611) : void
      {
         this.Renamed1358 = param1;
      }
      
      public function Renamed1424() : Renamed611
      {
         return this.Renamed1358;
      }
      
      private function Renamed1421() : Object3D
      {
         if(this.Renamed1352.numChildren == 0)
         {
            return null;
         }
         return this.Renamed1352.getChildAt(0);
      }
      
      private function Renamed1414(param1:int, param2:int) : void
      {
         var _loc3_:Renamed1284 = null;
         for each(_loc3_ in this.Renamed1357)
         {
            _loc3_.render(param1,param2);
         }
      }
      
      public function shutdown() : void
      {
         if(this.Renamed1358 != null)
         {
            this.Renamed1358.deactivate();
         }
         this.Renamed1388(false,"");
         this.Renamed1425(this.Renamed1352);
         this.Renamed1425(this.mainContainer);
         this.Renamed1425(this.Renamed1353);
         this.Renamed1425(this.rootContainer);
         this.Renamed1377.clear();
      }
      
      private function Renamed1425(param1:Object3DContainer) : void
      {
         while(param1.numChildren > 0)
         {
            param1.removeChildAt(0);
         }
      }
      
      public function Renamed1392(param1:Boolean) : void
      {
         this.camera.softTransparency = param1;
      }
      
      public function Renamed1393(param1:Boolean) : void
      {
         this.Renamed1033().enabled = param1;
      }
      
      public function Renamed1426() : void
      {
         this.lighting.toggle();
      }
      
      public function Renamed1427(param1:Mesh) : void
      {
         this.Renamed1367.add(param1);
      }
      
      public function Renamed651(param1:BitmapData) : void
      {
         this.Renamed1367.setImage(param1);
      }
      
      public function Renamed1319(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            if(param1)
            {
               this.lighting.Renamed1319();
            }
            else
            {
               this.lighting.Renamed1320();
            }
         }
      }
      
      public function Renamed1395(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.camera.deferredLighting = param1;
         }
      }
      
      public function Renamed1396(param1:Boolean) : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.camera.view.antiAliasEnabled = param1;
         }
      }
      
      public function Renamed1428() : Number
      {
         return this.Renamed1354 == null ? Number(0) : Number(this.Renamed1354.boundMinZ);
      }
   }
}

