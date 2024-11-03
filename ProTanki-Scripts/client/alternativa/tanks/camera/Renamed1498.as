package alternativa.tanks.camera
{
   import Renamed479.Renamed912;
   import alternativa.engine3d.core.EllipsoidCollider;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Renamed887;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.Renamed1497;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Renamed1498 extends Renamed1457 implements Renamed1497, Renamed511
   {
      [Inject]
      public static var settings:ISettingsService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      private static const Renamed1500:ConsoleVarFloat = new ConsoleVarFloat("cam_vspeed",0.7,0,10);
      
      private static const Renamed1501:Number = 0.001;
      
      private static const Renamed1502:Number = 5 * Math.PI / 180;
      
      private static const Renamed1503:Number = 50;
      
      private static const Renamed1504:Number = 5;
      
      private static const Renamed1505:Number = 3;
      
      private static const Renamed1506:Number = 9;
      
      private static const collisionPoint:Vector3 = new Vector3();
      
      private static const Renamed943:Vector3 = new Vector3();
      
      private static const Renamed1507:Vector3D = new Vector3D();
      
      private static const Renamed1508:Vector3D = new Vector3D();
      
      private static const Renamed1509:Vector3D = new Vector3D();
      
      private static const Renamed1510:Vector3D = new Vector3D();
      
      private static const Renamed1511:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const Renamed1512:Vector3 = new Vector3();
      
      private static var Renamed1513:ConsoleVarFloat = new ConsoleVarFloat("cam_maxmove",Renamed1504,0,Renamed1504);
      
      public static var Renamed1514:Number = 10;
      
      public static var Renamed1515:Number = Math.PI / 180;
      
      public static var Renamed1516:Number = 10;
      
      private static const Renamed1517:Number = 10 * Math.PI / 180;
      
      private static const Renamed1518:Number = 1;
      
      private static const Renamed1519:Number = 300;
      
      private static const Renamed1520:Vector3 = new Vector3();
      
      private static const Renamed1521:Vector3 = new Vector3();
      
      private static const Renamed1522:Vector3 = new Vector3();
      
      private static const Renamed1523:Vector3 = new Vector3();
      
      private static const Renamed1524:Vector3 = new Vector3();
      
      private var Renamed1525:Boolean;
      
      public var Renamed1526:Boolean;
      
      private var stage:Stage;
      
      private var Renamed1527:Number = 0;
      
      private var locked:Boolean;
      
      private var Renamed1528:Boolean;
      
      private var Renamed1529:Boolean;
      
      private var active:Boolean;
      
      private var target:Renamed920;
      
      private var position:Vector3;
      
      private var rotation:Vector3;
      
      private var Renamed1530:Vector3;
      
      private var Renamed1531:Vector3;
      
      private var Renamed1532:Number = 0;
      
      private var Renamed1533:Number = 0;
      
      private var Renamed1534:Number = 0;
      
      private var Renamed1535:int;
      
      private var Renamed1536:Renamed1488;
      
      private var Renamed1537:Number;
      
      private var Renamed1538:Number = 0;
      
      private var Renamed1466:Point;
      
      private var Renamed1539:Point;
      
      private var Renamed1540:Point;
      
      private var Renamed1541:Point;
      
      private var Renamed1542:Point;
      
      private var Renamed1543:EllipsoidCollider;
      
      private var Renamed1544:Object3D;
      
      private var Renamed1545:int;
      
      private var Renamed1546:Number = 0;
      
      private var Renamed1482:Number = 0;
      
      private var targetingMode:int;
      
      public function Renamed1498()
      {
         this.position = new Vector3();
         this.rotation = new Vector3();
         this.Renamed1530 = new Vector3();
         this.Renamed1531 = new Vector3();
         this.Renamed1536 = new Renamed1488();
         this.Renamed1466 = new Point();
         super();
         this.stage = display.stage;
         this.Renamed1539 = new Point(145,545);
         this.Renamed1540 = new Point(930,1395);
         this.Renamed1541 = new Point(2245,1565);
         this.Renamed1542 = new Point(3105,760);
         this.Renamed1543 = new EllipsoidCollider(Renamed1503,Renamed1503,Renamed1503);
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.Renamed1547);
         this.Renamed1547();
         var _loc1_:Number = Number(storageService.getStorage().data["cameraT"]);
         if(isNaN(_loc1_))
         {
            _loc1_ = 0.2;
         }
         this.Renamed1548(_loc1_);
      }
      
      private static function Renamed1549(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private static function Renamed1550(param1:Number) : Number
      {
         return Renamed1513.value * param1;
      }
      
      private static function Renamed1473(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Number = 3 * (param3 - param2);
         var _loc7_:Number = 3 * param2 - 6 * param3 + 3 * param4;
         var _loc8_:Number = -param2 + 3 * param3 - 3 * param4 + param5;
         return param2 + param1 * _loc6_ + param1 * param1 * _loc7_ + param1 * param1 * param1 * _loc8_;
      }
      
      private function Renamed1547(param1:SettingsServiceEvent = null) : void
      {
         if(settings.alternateCamera)
         {
            this.Renamed1551();
         }
         else
         {
            this.Renamed1552();
         }
      }
      
      public function Renamed1553(param1:Object3D) : void
      {
         this.Renamed1544 = param1;
      }
      
      public function Renamed1552() : void
      {
         this.Renamed1525 = true;
      }
      
      public function Renamed1551() : void
      {
         this.Renamed1525 = false;
      }
      
      public function Renamed1554(param1:Renamed920) : void
      {
         this.target = param1;
      }
      
      public function Renamed1555(param1:Vector3, param2:Vector3) : void
      {
         this.Renamed1530.copy(param1);
         this.Renamed1531.copy(param2);
         this.Renamed1535 = 0;
         this.Renamed1556(param1,param2,this.Renamed1536);
         this.position.copy(this.Renamed1536.position);
         this.rotation.x = this.Renamed1557(this.Renamed1536) - 0.5 * Math.PI;
         this.rotation.y = 0;
         this.rotation.z = Math.atan2(-param2.x,param2.y);
         setPosition(this.position);
         setOrientation(this.rotation);
      }
      
      public function Renamed1486() : void
      {
         this.position.copy(Renamed1460());
         this.rotation.reset(Renamed1461(),Renamed1462(),Renamed1463());
      }
      
      override public function activate() : void
      {
         super.activate();
         this.Renamed1486();
         if(!this.active)
         {
            this.active = true;
            Renamed1499.addListener(this);
            battleEventDispatcher.Renamed539(Renamed887,this);
         }
      }
      
      override public function deactivate() : void
      {
         if(this.active)
         {
            this.active = false;
            Renamed1499.removeListener(this);
            battleEventDispatcher.Renamed866(Renamed887,this);
            this.Renamed1528 = false;
            this.Renamed1529 = false;
         }
      }
      
      override public function update(param1:int, param2:int) : void
      {
         if(this.target == null)
         {
            return;
         }
         var _loc3_:Number = param2 * 0.001;
         if(_loc3_ > 0.1)
         {
            _loc3_ = 0.1;
         }
         this.Renamed1558(_loc3_);
         if(!this.locked)
         {
            this.Renamed1559();
         }
         this.Renamed1556(this.Renamed1530,this.Renamed1531,this.Renamed1536);
         Renamed1524.diff(this.Renamed1536.position,this.position);
         var _loc4_:Number = Renamed1524.length();
         if(_loc4_ > Renamed1514)
         {
            this.Renamed1532 = Renamed1550(_loc4_ - Renamed1514);
         }
         var _loc5_:Number = this.Renamed1532 * _loc3_;
         if(_loc5_ > _loc4_)
         {
            _loc5_ = _loc4_;
         }
         Renamed1524.normalize().scale(_loc5_);
         var _loc6_:Number = this.Renamed1557(this.Renamed1536);
         var _loc7_:Number = Math.atan2(-this.Renamed1531.x,this.Renamed1531.y);
         var _loc8_:Number = MathUtils.clampAngle(this.rotation.x + 0.5 * Math.PI);
         var _loc9_:Number = MathUtils.clampAngle(this.rotation.z);
         var _loc10_:Number = MathUtils.clampAngleFast(_loc6_ - _loc8_);
         this.Renamed1533 = this.Renamed1560(_loc10_,this.Renamed1533);
         var _loc11_:Number = this.Renamed1533 * _loc3_;
         if(_loc10_ > 0 && _loc11_ > _loc10_ || _loc10_ < 0 && _loc11_ < _loc10_)
         {
            _loc11_ = _loc10_;
         }
         var _loc12_:Number = MathUtils.clampAngleFast(_loc7_ - _loc9_);
         this.Renamed1534 = this.Renamed1560(_loc12_,this.Renamed1534);
         var _loc13_:Number = this.Renamed1534 * _loc3_;
         if(_loc12_ > 0 && _loc13_ > _loc12_ || _loc12_ < 0 && _loc13_ < _loc12_)
         {
            _loc13_ = _loc12_;
         }
         this.Renamed1532 = MathUtils.snap(this.Renamed1532,0,Renamed1516);
         this.Renamed1533 = MathUtils.snap(this.Renamed1533,0,Renamed1516);
         this.Renamed1534 = MathUtils.snap(this.Renamed1534,0,Renamed1516);
         this.position.add(Renamed1524);
         this.rotation.x += _loc11_;
         this.rotation.z += _loc13_;
         Renamed1520.copy(this.position);
         Renamed1521.copy(this.rotation);
         setPosition(Renamed1520);
         setOrientation(Renamed1521);
      }
      
      public function Renamed1483(param1:Boolean) : void
      {
         this.locked = param1;
         if(param1)
         {
            this.Renamed1545 = 0;
         }
      }
      
      public function Renamed1561() : Number
      {
         return this.Renamed1538;
      }
      
      public function Renamed1548(param1:Number) : void
      {
         this.Renamed1538 = MathUtils.clamp(param1,0,1);
         var _loc2_:Number = MathUtils.clamp(this.Renamed1538 + this.Renamed1546 * 0.1,0,1);
         this.Renamed1466.x = Renamed1473(_loc2_,this.Renamed1539.x,this.Renamed1540.x,this.Renamed1541.x,this.Renamed1542.x);
         this.Renamed1466.y = Renamed1473(_loc2_,this.Renamed1539.y,this.Renamed1540.y,this.Renamed1541.y,this.Renamed1542.y);
         this.Renamed1537 = Math.atan2(this.Renamed1466.x,this.Renamed1466.y);
         this.Renamed1527 = this.Renamed1466.length;
         this.Renamed1535 = 0;
      }
      
      public function Renamed1487(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         this.Renamed1556(param1,param2,this.Renamed1536);
         param4.x = this.Renamed1557(this.Renamed1536) - 0.5 * Math.PI;
         param4.z = Math.atan2(-param2.x,param2.y);
         param3.copy(this.Renamed1536.position);
      }
      
      public function Renamed1559() : void
      {
         this.target.Renamed1018(this.Renamed1530,this.Renamed1531);
      }
      
      private function Renamed1556(param1:Vector3, param2:Vector3, param3:Renamed1488) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = this.Renamed1537;
         var _loc6_:Number = Math.sqrt(param2.x * param2.x + param2.y * param2.y);
         if(_loc6_ < 0.00001)
         {
            Renamed1523.x = 1;
            Renamed1523.y = 0;
         }
         else
         {
            Renamed1523.x = param2.x / _loc6_;
            Renamed1523.y = param2.y / _loc6_;
         }
         param3.Renamed1489 = 0;
         param3.t = 1;
         Renamed1522.copy(param1);
         axis.x = Renamed1523.y;
         axis.y = -Renamed1523.x;
         Renamed1523.reverse();
         Renamed1511.fromAxisAngle(axis,-_loc5_);
         Renamed1511.transformVector(Renamed1523,Renamed1512);
         this.Renamed1562(Renamed1522,Renamed1512,this.Renamed1527,collisionPoint);
         var _loc7_:Number = Renamed943.copy(Renamed1522).subtract(collisionPoint).length();
         param3.t = _loc7_ / this.Renamed1527;
         if(_loc7_ < Renamed1519)
         {
            Renamed1522.copy(collisionPoint);
            _loc4_ = Renamed1519 - _loc7_;
            this.Renamed1562(Renamed1522,Vector3.Z_AXIS,_loc4_,collisionPoint);
         }
         param3.position.copy(collisionPoint);
      }
      
      private function Renamed1562(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         var _loc5_:Number = NaN;
         Renamed1549(param1,Renamed1507);
         Renamed1508.x = param3 * param2.x;
         Renamed1508.y = param3 * param2.y;
         Renamed1508.z = param3 * param2.z;
         if(this.Renamed1543.getCollision(Renamed1507,Renamed1508,Renamed1509,Renamed1510,this.Renamed1544))
         {
            _loc5_ = Renamed1503 + 0.1;
            param4.x = Renamed1509.x + _loc5_ * Renamed1510.x;
            param4.y = Renamed1509.y + _loc5_ * Renamed1510.y;
            param4.z = Renamed1509.z + _loc5_ * Renamed1510.z;
         }
         else
         {
            param4.copy(param1).addScaled(param3,param2);
         }
      }
      
      private function Renamed1558(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(this.Renamed1545 < 0)
         {
            this.Renamed1528 = true;
            this.Renamed1529 = false;
            ++this.Renamed1545;
            if(this.Renamed1545 == 0)
            {
               this.Renamed1528 = false;
            }
         }
         else if(this.Renamed1545 > 0)
         {
            this.Renamed1528 = false;
            this.Renamed1529 = true;
            --this.Renamed1545;
            if(this.Renamed1545 == 0)
            {
               this.Renamed1529 = false;
            }
         }
         if(!this.Renamed1526 && this.Renamed1528 != this.Renamed1529)
         {
            _loc2_ = this.Renamed1528 ? int(1) : int(-1);
            this.Renamed1482 = this.Renamed1561() + _loc2_ * Renamed1500.value * param1;
            this.Renamed1548(this.Renamed1482);
         }
         else
         {
            this.Renamed1548(this.Renamed1538);
         }
      }
      
      private function Renamed1560(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = this.Renamed1563();
         if(param1 < -Renamed1515)
         {
            return _loc3_ * (param1 + Renamed1515);
         }
         if(param1 > Renamed1515)
         {
            return _loc3_ * (param1 - Renamed1515);
         }
         return param2;
      }
      
      private function Renamed1557(param1:Renamed1488) : Number
      {
         var _loc2_:Number = this.Renamed1537 - Renamed1517;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = param1.t;
         if(_loc3_ >= 1 || _loc2_ < Renamed1502 || !this.Renamed1525)
         {
            return param1.Renamed1489 - _loc2_;
         }
         var _loc4_:Number = this.Renamed1466.x;
         return param1.Renamed1489 - Math.atan2(_loc3_ * _loc4_,Renamed1518 * _loc4_ * (1 / Math.tan(_loc2_) - (1 - _loc3_) / Math.tan(this.Renamed1537)));
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         storageService.getStorage().data["cameraT"] = this.Renamed1561();
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.Renamed1547);
      }
      
      private function Renamed1563() : Number
      {
         return this.targetingMode == Renamed912.Renamed1026 ? Number(Renamed1506) : Number(Renamed1505);
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
         if(!this.locked)
         {
            this.Renamed1546 += param2 * Renamed1501 * this.Renamed1564();
            this.Renamed1546 = MathUtils.clamp(this.Renamed1546,-1,1);
         }
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(param1:int) : void
      {
         var _loc2_:Boolean = false;
         param1 *= this.Renamed1564();
         if(!this.locked)
         {
            _loc2_ = false;
            if(param1 > 1)
            {
               if(this.Renamed1545 < 0)
               {
                  this.Renamed1545 = 0;
               }
               _loc2_ = true;
            }
            if(param1 < 1)
            {
               if(this.Renamed1545 > 0)
               {
                  this.Renamed1545 = 0;
               }
               _loc2_ = true;
            }
            if(_loc2_)
            {
               this.Renamed1545 = param1 * 2;
            }
         }
      }
      
      public function mouseRightButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         var _loc3_:Renamed717 = Renamed719.Renamed729(param1);
         switch(_loc3_)
         {
            case Renamed717.FOLLOW_CAMERA_UP:
               this.Renamed1528 = param2;
               break;
            case Renamed717.FOLLOW_CAMERA_DOWN:
               this.Renamed1529 = param2;
         }
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed887 = param1 as Renamed887;
         if(_loc2_ != null)
         {
            this.targetingMode = _loc2_.targetingMode;
         }
      }
      
      private function Renamed1564() : int
      {
         return settings.mouseYInverse ? int(-1) : int(1);
      }
   }
}

