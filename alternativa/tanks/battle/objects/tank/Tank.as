package alternativa.tanks.battle.objects.tank
{
   import Renamed136.Renamed663;
   import Renamed211.Renamed908;
   import Renamed1.Renamed909;
   import Renamed602.3DPositionVector;
   import Renamed838.Renamed910;
   import Renamed838.Renamed911;
   import Renamed838.Renamed840;
   import Renamed479.Renamed912;
   import Renamed479.Renamed913;
   import Renamed479.Renamed914;
   import Renamed479.Renamed915;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.PhysicsUtils;
   import alternativa.physics.collision.BodyCollisionFilter;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed752;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.Renamed793;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed916;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed918;
   import alternativa.tanks.battle.Renamed790;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import alternativa.tanks.battle.Renamed844;
   import alternativa.tanks.camera.Renamed920;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed921;
   import alternativa.tanks.models.weapon.Renamed922;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.BitmapData;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import Renamed373.Renamed776;
   import Renamed373.Renamed606;
   import Renamed373.Renamed666;
   import Renamed456.Renamed923;
   import Renamed456.Renamed924;
   
   public class Tank implements Renamed790, Renamed752, Renamed793, Renamed919, BodyCollisionFilter, Renamed920, Renamed925
   {
      public static var Renamed926:TargetingModeService;
      
      private static const Renamed927:int = 1;
      
      private static const BACK:int = 2;
      
      private static const LEFT:int = 4;
      
      private static const RIGHT:int = 8;
      
      private static const Renamed928:int = 16;
      
      private static const Renamed929:int = 32;
      
      private static const CENTER_TURRET:int = 64;
      
      private static const Renamed930:int = 128;
      
      private static const Renamed931:Matrix4 = new Matrix4();
      
      private static const Renamed932:Matrix4 = new Matrix4();
      
      private static const Renamed933:Vector3 = new Vector3();
      
      private static const Renamed934:Vector3 = new Vector3();
      
      private static const Renamed935:Vector3 = new Vector3();
      
      private static const Renamed936:Vector3 = new Vector3();
      
      private static const Renamed937:Vector3 = new Vector3();
      
      private static const Renamed938:Vector3 = new Vector3();
      
      private static const Renamed672:RayHit = new RayHit();
      
      private static const Renamed939:Vector3 = new Vector3();
      
      private static const Renamed940:Vector3 = new Vector3();
      
      private static const PI:Number = Math.PI;
      
      private static const PI2:Number = 2 * Math.PI;
      
      private static var _m:Matrix3 = new Matrix3();
      
      private static var Renamed941:Quaternion = new Quaternion();
      
      private static var Renamed942:Vector3 = new Vector3();
      
      private static var Renamed943:Vector3 = new Vector3();
      
      private static var Renamed944:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      private static var Renamed945:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      public var tankData:Renamed775;
      
      private var Renamed946:Renamed947;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      public var Renamed948:Vector3;
      
      public var Renamed949:Boolean;
      
      public var Renamed950:CollisionBox;
      
      public var Renamed951:Vector.<Vector3>;
      
      private const Renamed952:Number = 5;
      
      private var Renamed953:Vector3;
      
      private var skin:Renamed917;
      
      public var title:UserTitle;
      
      public var Renamed954:Renamed840;
      
      public var Renamed955:Renamed840;
      
      public var prevState:Renamed841;
      
      private var Renamed956:Renamed663;
      
      public var Renamed957:Number = 0;
      
      public var Renamed958:Number = 0;
      
      private var Renamed959:Boolean;
      
      private var Renamed960:Boolean;
      
      private var Renamed961:Dictionary;
      
      private var container:Renamed908;
      
      private var battleService:BattleService;
      
      public var local:Boolean;
      
      private var Renamed962:Number;
      
      private var Renamed963:int;
      
      private var Renamed964:Renamed965;
      
      private var Renamed966:Number;
      
      public var state:Renamed841;
      
      private var Renamed967:Renamed968;
      
      public var Renamed969:Vector3;
      
      public var Renamed970:Quaternion;
      
      private var Renamed971:Number = 0;
      
      public var Renamed972:Vector3;
      
      private const Renamed973:Number = 0;
      
      private var Renamed974:Renamed909;
      
      private var Renamed975:Boolean;
      
      public var Renamed976:int = 0;
      
      public var Renamed977:int = 0;
      
      private var Renamed978:Renamed979;
      
      public var Renamed980:Renamed910;
      
      private var Renamed981:Renamed916;
      
      private var Renamed982:Renamed606;
      
      private var Renamed983:Renamed911;
      
      private var Renamed984:BodyState;
      
      public var Renamed985:Vector.<CollisionBox>;
      
      private var Renamed986:Renamed947;
      
      private var Renamed987:Renamed947;
      
      public var Renamed988:int;
      
      private var Renamed989:Number;
      
      private var weapon:Renamed990;
      
      private var Renamed991:Renamed915;
      
      private var Renamed992:Renamed914;
      
      private var temperature:Number = 0;
      
      private var inBattle:Boolean;
      
      private var maxHealth:int;
      
      public function Tank(param1:Renamed917, param2:Renamed915, param3:Renamed909, param4:Renamed914, param5:Renamed990, param6:UserTitle, param7:Number, param8:Boolean, param9:BattleEventDispatcher, param10:int, param11:Number = 1250)
      {
         this.Renamed953 = new Vector3();
         this.Renamed961 = new Dictionary();
         this.Renamed972 = new Vector3();
         this.Renamed948 = new Vector3();
         super();
         this.Renamed991 = param2;
         this.Renamed992 = param4;
         this.Renamed986 = new Renamed993(100,1000,0,0);
         this.Renamed987 = new Renamed993(0.3,10,0,0);
         this.skin = param1;
         this.battleEventDispatcher = param9;
         this.Renamed974 = param3;
         this.local = param8;
         this.maxHealth = param10;
         this.Renamed985 = new Vector.<CollisionBox>();
         this.Renamed969 = new Vector3();
         this.Renamed970 = new Quaternion();
         this.Renamed984 = new BodyState();
         this.Renamed983 = new Renamed911();
         this.Renamed983.dampingCoeff = param11;
         param3.Renamed994(this);
         this.title = param6;
         var _loc12_:Vector3 = this.Renamed995(param1.Renamed996().mesh);
         var _loc13_:Vector3 = new Vector3(_loc12_.x / 2,_loc12_.y / 2,_loc12_.z / 2);
         this.Renamed989 = _loc13_.y;
         this.Renamed997(_loc12_);
         this.Renamed998(param7,_loc13_);
         this.Renamed999(_loc13_);
         this.Renamed1000(_loc13_);
         this.Renamed1001(param1);
         this.Renamed980 = new Renamed910(this.Renamed982.body,this.Renamed983,this.Renamed986,_loc12_);
         this.Renamed981 = new Renamed916(this.Renamed980,param1,this.Renamed986);
         this.Renamed964 = new Renamed965(this.Renamed982.body,param9);
         this.weapon = param5;
         param5.init(this);
         Renamed926 = TargetingModeService(OSGi.getInstance().getService(TargetingModeService));
         this.Renamed982.Renamed1002();
      }
      
      private static function Renamed1003(param1:BodyState, param2:3DPositionVector, param3:3DPositionVector, param4:3DPositionVector, param5:3DPositionVector) : void
      {
         Renamed668.Renamed679(param1.position,param2);
         var _loc6_:Quaternion = param1.orientation;
         _loc6_.getEulerAngles(Renamed943);
         param3.x = Renamed943.x;
         param3.y = Renamed943.y;
         param3.z = Renamed943.z;
         Renamed668.Renamed679(param1.velocity,param4);
         Renamed668.Renamed679(param1.angularVelocity,param5);
      }
      
      public function Renamed1004(param1:Vector3) : Boolean
      {
         var _loc2_:int = int(this.Renamed951.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            Renamed938.copy(this.Renamed951[_loc3_]);
            if(this.Renamed1005(Renamed938,param1))
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function Renamed1005(param1:Vector3, param2:Vector3) : Boolean
      {
         var _loc3_:Body = this.Renamed982.body;
         param1.transform3(_loc3_.baseMatrix);
         var _loc4_:BodyState = _loc3_.state;
         param1.add(_loc4_.position);
         Renamed939.copy(param2);
         Renamed940.diff(param1,Renamed939);
         var _loc5_:PhysicsScene = _loc3_.scene;
         if(_loc5_ == null)
         {
            return false;
         }
         var _loc6_:CollisionDetector = _loc5_.collisionDetector;
         return !_loc6_.raycastStatic(Renamed939,Renamed940,Renamed666.Renamed690,1,null,Renamed672);
      }
      
      public function Renamed1006() : Vector3
      {
         return this.Renamed972;
      }
      
      public function Renamed1007() : Boolean
      {
         return this.Renamed982.Renamed1008;
      }
      
      public function Renamed1009() : Boolean
      {
         return this.Renamed982.Renamed1010();
      }
      
      public function Renamed1011() : Vector.<Body>
      {
         return this.Renamed982.Renamed1012;
      }
      
      public function Renamed697() : Number
      {
         return this.Renamed991.Renamed1013();
      }
      
      public function Renamed1014(param1:Vector3D) : void
      {
         this.title.readPosition(param1);
      }
      
      public function Renamed1015() : Number
      {
         return this.Renamed989;
      }
      
      public function Renamed1016() : int
      {
         return this.maxHealth;
      }
      
      public function Renamed1017(param1:Renamed663) : Boolean
      {
         return this.teamType == param1 && param1 != Renamed663.NONE;
      }
      
      public function Renamed695() : ClientObject
      {
         return this.tankData.user;
      }
      
      public function Renamed1018(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:int = -11;
         var _loc4_:int = this.Renamed1019();
         var _loc5_:Object3D = this.skin.Renamed1020();
         if(_loc4_ == Renamed913.TURRET)
         {
            Renamed932.setMatrix(_loc5_.x,_loc5_.y,_loc5_.z,_loc5_.rotationX,_loc5_.rotationY,_loc5_.rotationZ);
         }
         else if(_loc4_ == Renamed913.Renamed1021)
         {
            Renamed932.setMatrix(_loc5_.x,_loc5_.y,_loc5_.z,_loc5_.rotationX,_loc5_.rotationY,this.Renamed991.Renamed1022());
         }
         else
         {
            Renamed932.setMatrix(_loc5_.x,_loc5_.y,_loc5_.z,0,0,0);
         }
         var _loc6_:Mesh = this.skin.Renamed1023();
         Renamed931.setRotationMatrix(_loc6_.rotationX,_loc6_.rotationY,_loc6_.rotationZ);
         var _loc7_:Vector3 = Renamed668.Renamed669;
         Renamed931.getUp(_loc7_);
         Renamed932.getPosition(param1);
         param1.addScaled(_loc3_,_loc7_);
         param2.reset(Renamed932.m01,Renamed932.m11,Renamed932.m21);
         this.prevState = this.state;
      }
      
      private function Renamed1019() : int
      {
         switch(Renamed926.Renamed1024())
         {
            case Renamed912.Renamed1025:
               return Renamed913.TURRET;
            case Renamed912.Renamed1026:
               return this.Renamed991.Renamed1027() && this.prevState != Renamed841.DEAD ? int(Renamed913.Renamed1021) : int(Renamed913.TURRET);
            default:
               return Renamed913.TURRET;
         }
      }
      
      public function Renamed1028() : Number
      {
         return this.Renamed962;
      }
      
      public function disable() : void
      {
         this.title.hideIndicators();
      }
      
      public function Renamed1029(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         if(this.tankData.health > 0)
         {
            this.Renamed982.body.addWorldForceScaled(param1,param2,param3);
            this.Renamed982.Renamed1030.addScaled(param3,param2);
            this.Renamed1031(param1);
         }
      }
      
      public function Renamed1031(param1:Vector3) : void
      {
         this.Renamed948.copy(param1);
         Renamed668.globalToLocal(this.Renamed696(),this.Renamed948);
         this.Renamed949 = true;
      }
      
      public function Renamed1032(param1:int = 7) : void
      {
         var _loc2_:Renamed844 = this.battleService.Renamed621().Renamed1033();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_.Renamed855(this,0,0.9);
            _loc3_++;
         }
      }
      
      public function Renamed1034(param1:int, param2:int, param3:Boolean) : void
      {
         this.Renamed980.Renamed1035 = param1;
         this.Renamed980.Renamed1036 = param2;
         this.Renamed980.Renamed1037 = param3;
         if(!this.Renamed980.Renamed1038)
         {
            if(param1 != 0)
            {
               this.Renamed974.Renamed1039();
            }
            else if(param2 != 0)
            {
               this.Renamed974.Renamed1040();
            }
            else
            {
               this.Renamed974.Renamed1041();
            }
         }
      }
      
      public function Renamed1042() : CollisionBox
      {
         return this.Renamed982.Renamed1043;
      }
      
      private function Renamed1001(param1:Renamed917) : void
      {
         var _loc2_:Renamed923 = null;
         var _loc3_:CollisionBox = null;
         var _loc4_:Vector.<Renamed923> = param1.Renamed1044();
         for each(_loc2_ in _loc4_)
         {
            _loc3_ = this.Renamed1045(_loc2_.Renamed1046());
            this.Renamed985.push(_loc3_);
            this.Renamed982.body.addCollisionShape(_loc3_,new Matrix4());
         }
         this.Renamed1047(0);
      }
      
      private function Renamed1045(param1:Vector3) : CollisionBox
      {
         return new CollisionBox(param1,0,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      private function Renamed1000(param1:Vector3) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         this.Renamed951 = Vector.<Vector3>([new Vector3(-_loc2_,_loc3_,0),new Vector3(_loc2_,_loc3_,0),new Vector3(-_loc2_,0,0),new Vector3(_loc2_,0,0),new Vector3(-_loc2_,-_loc3_,0),new Vector3(_loc2_,-_loc3_,0)]);
      }
      
      private function Renamed999(param1:Vector3) : void
      {
         var _loc2_:Number = 2 * param1.z - (this.Renamed983.Renamed1048 - Renamed1049.Renamed952);
         Renamed1050.Renamed1051(param1,_loc2_,this.Renamed982);
         Renamed1050.Renamed1052(param1,_loc2_,this.Renamed982);
         this.Renamed1053(param1,_loc2_);
      }
      
      public function Renamed1054(param1:Renamed664, param2:int = 0) : void
      {
         Renamed921.Renamed1055(this.skin.Renamed1056(),this.skin.Renamed1057().Renamed1058[param2],param1);
      }
      
      public function Renamed1059(param1:Renamed922, param2:int = 0) : void
      {
         Renamed921.Renamed1060(this.skin.Renamed1056(),this.skin.Renamed1057().Renamed1058[param2],param1);
      }
      
      public function Renamed1061(param1:Renamed915) : void
      {
         this.Renamed991 = param1;
      }
      
      public function Renamed1062() : Renamed915
      {
         return this.Renamed991;
      }
      
      private function Renamed998(param1:Number, param2:Vector3) : void
      {
         var _loc3_:Body = new Body(param1,Matrix3.IDENTITY,0);
         PhysicsUtils.setBoxInvInertia(param1,param2,_loc3_.invInertia);
         _loc3_.tank = this;
         this.Renamed982 = new Renamed606(_loc3_);
      }
      
      private function Renamed997(param1:Vector3) : void
      {
         var _loc2_:Mesh = this.skin.Renamed1023();
         _loc2_.calculateBounds();
         this.Renamed972.x = -0.5 * (_loc2_.boundMinX + _loc2_.boundMaxX);
         this.Renamed972.y = -0.5 * (_loc2_.boundMinY + _loc2_.boundMaxY);
         this.Renamed972.z = -0.5 * param1.z - this.Renamed983.Renamed1048 + 10;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = param2 * 0.001;
         this.Renamed967.update(_loc3_);
         this.skin.Renamed1063(this.Renamed971);
         this.skin.Renamed1064(this.temperature);
         this.Renamed981.Renamed1065(_loc3_);
         var _loc4_:Object3D = this.skin.Renamed1020();
         Renamed943.x = _loc4_.x;
         Renamed943.y = _loc4_.y;
         Renamed943.z = _loc4_.z;
         this.title.setWeaponStatus(100 * this.weapon.getStatus());
         this.title.update(Renamed943);
         var _loc5_:Renamed918 = this.skin.Renamed996();
         if(_loc5_.hasIncorrectData())
         {
            this.battleEventDispatcher.Renamed867(new DataValidationErrorEvent(_loc5_.getType()));
         }
         var _loc6_:Renamed924 = this.skin.Renamed1057();
         if(_loc6_.hasIncorrectData())
         {
            this.battleEventDispatcher.Renamed867(new DataValidationErrorEvent(_loc6_.getType()));
         }
         if(this.Renamed992 != null && this.state != Renamed841.DEAD)
         {
            this.Renamed962 = this.Renamed1066();
         }
      }
      
      public function Renamed1067() : DataUnitValidator
      {
         if(this.Renamed978 == null)
         {
            this.Renamed978 = new Renamed979(this.Renamed982.body.collisionShapes);
         }
         return this.Renamed978;
      }
      
      public function Renamed852() : Number
      {
         return this.Renamed966;
      }
      
      public function Renamed1068() : void
      {
         var _loc1_:Renamed620 = null;
         var _loc2_:Renamed610 = null;
         if(this.battleService != null)
         {
            this.inBattle = false;
            this.weapon.deactivate();
            this.battleService.Renamed621().Renamed1033().Renamed853(this);
            _loc1_ = this.battleService.Renamed619();
            _loc2_ = this.battleService.Renamed621();
            _loc1_.Renamed807(this.Renamed982);
            _loc1_.Renamed826(this);
            _loc1_.Renamed828(this);
            _loc1_.Renamed830(this);
            Renamed776.Renamed1069(this.Renamed982.id);
            this.skin.removeFromScene();
            this.title.removeFromContainer();
            _loc2_.Renamed853(this);
            _loc1_.Renamed801().Renamed1070(this.Renamed974);
            this.battleService = null;
         }
      }
      
      private function Renamed1066() : Number
      {
         this.Renamed970.toMatrix3(_m);
         _m.transformVector(Vector3.Z_AXIS,Renamed935);
         Renamed935.normalize();
         Renamed943.copy(this.Renamed972);
         Renamed943.transform3(_m);
         Renamed943.add(this.Renamed969);
         Renamed931.setFromMatrix3(_m,Renamed943);
         Renamed933.reset(Renamed931.m03,Renamed931.m13,Renamed931.m23);
         Renamed934.reset(Renamed931.m01,Renamed931.m11,Renamed931.m21);
         Renamed934.normalize();
         Renamed937.copy(Vector3.X_AXIS);
         Renamed936.copy(Vector3.Y_AXIS);
         Renamed937.projectOnPlane(Renamed935);
         Renamed936.projectOnPlane(Renamed935);
         Renamed937.normalize();
         Renamed936.normalize();
         var _loc1_:Number = MathUtils.clamp(Renamed936.dot(Renamed934),-1,1);
         var _loc2_:Number = Renamed937.dot(Renamed934);
         return Math.acos(_loc1_) * (_loc2_ > 0 ? -1 : 1);
      }
      
      public function Renamed1071(param1:int = 0) : Vector3
      {
         return this.skin.Renamed1057().Renamed1058[param1];
      }
      
      public function Renamed1072() : Vector3
      {
         return this.skin.Renamed1057().Renamed1073;
      }
      
      public function Renamed1074(param1:int = 0) : Number
      {
         return Vector3(this.skin.Renamed1057().Renamed1058[param1]).y;
      }
      
      public function Renamed1020() : Object3D
      {
         return this.skin.Renamed1020();
      }
      
      public function Renamed1023() : Mesh
      {
         return this.skin.Renamed1023();
      }
      
      public function Renamed1075() : Renamed917
      {
         return this.skin;
      }
      
      public function Renamed1076() : void
      {
         this.title.show();
      }
      
      public function Renamed1077() : void
      {
         this.title.hide();
      }
      
      public function stopMovement() : void
      {
         this.Renamed974.Renamed1041();
      }
      
      public function Renamed1078(param1:Boolean) : void
      {
         this.Renamed980.Renamed1038 = param1;
      }
      
      public function Renamed1079(param1:Boolean) : void
      {
         this.Renamed974.Renamed1080 = param1;
      }
      
      public function spawn(param1:Renamed663, param2:int) : void
      {
         this.Renamed956 = param1;
         this.Renamed963 = param2;
         this.temperature = 0;
         this.Renamed986.reset(this.Renamed986.Renamed1081());
         this.Renamed987.reset(this.Renamed987.Renamed1081());
         this.Renamed982.body.clearAccumulators();
         this.skin.Renamed1082();
         this.skin.Renamed1083();
         this.weapon.reset();
         this.Renamed974.Renamed1041();
         this.Renamed974.Renamed1080 = true;
         this.Renamed980.reset();
         this.Renamed991.reset();
         this.Renamed991.Renamed1084();
         if(this.Renamed992 != null)
         {
            this.Renamed992.reset();
         }
         this.title.setTeamType(param1);
      }
      
      public function kill() : void
      {
         this.state = Renamed841.DEAD;
         this.Renamed974.enabled = false;
         this.battleService.Renamed619().Renamed801().Renamed1070(this.Renamed974);
         this.title.hideIndicators();
         this.title.hide();
         if(this.Renamed992 != null)
         {
            this.Renamed992.reset();
         }
      }
      
      public function Renamed1085() : Renamed914
      {
         return this.Renamed992;
      }
      
      public function Renamed1086(param1:Renamed914) : void
      {
         this.Renamed992 = param1;
      }
      
      public function destroy() : void
      {
         this.state = Renamed841.DEAD;
         this.skin.dispose();
         this.skin = null;
         this.weapon.destroy();
         this.Renamed982.destroy();
         if(this.Renamed978 != null)
         {
            this.Renamed978.destroy();
         }
      }
      
      private function Renamed1053(param1:Vector3, param2:Number) : void
      {
         var _loc3_:Vector3 = new Vector3(param1.x,param1.y,param2 / 2);
         var _loc4_:Matrix4 = this.Renamed982.Renamed1043.transform;
         this.Renamed966 = _loc3_.length() + Math.abs(_loc4_.m23);
      }
      
      public function Renamed1087() : Renamed606
      {
         return this.Renamed982;
      }
      
      private function Renamed995(param1:Mesh) : Vector3
      {
         return new Vector3(param1.boundMaxX - param1.boundMinX,param1.boundMaxY - param1.boundMinY,param1.boundMaxZ - param1.boundMinZ);
      }
      
      public function setMaxTurnSpeed(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.Renamed987.reset(param1);
         }
         else
         {
            this.Renamed987.Renamed1088(param1);
         }
      }
      
      public function Renamed1089(param1:Number) : void
      {
         this.temperature = param1;
      }
      
      public function Renamed1090() : Number
      {
         return this.temperature;
      }
      
      public function Renamed1091(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.Renamed986.reset(param1);
         }
         else
         {
            this.Renamed986.Renamed1088(param1);
         }
      }
      
      public function Renamed1092() : int
      {
         return CollisionShape(this.Renamed982.Renamed1043).collisionGroup;
      }
      
      public function Renamed1093(param1:int) : void
      {
         var _loc2_:CollisionBox = null;
         this.Renamed982.Renamed1043.collisionGroup = param1;
         for each(_loc2_ in this.Renamed985)
         {
            _loc2_.collisionGroup = param1 & Renamed666.WEAPON;
         }
      }
      
      public function Renamed1094() : BitmapData
      {
         return this.title.getTexture();
      }
      
      public function Renamed1095(param1:Number) : void
      {
         this.Renamed991.rotate(param1);
         this.Renamed1047(this.Renamed991.Renamed1013());
         this.Renamed974.Renamed1096(this.Renamed991.isRotating());
      }
      
      private function Renamed1047(param1:Number) : void
      {
         var _loc2_:CollisionBox = null;
         var _loc3_:Matrix4 = null;
         var _loc4_:Renamed923 = null;
         var _loc5_:Renamed918 = this.skin.Renamed996();
         var _loc6_:CollisionBox = this.Renamed982.Renamed1043;
         var _loc7_:Matrix4 = _loc6_.localTransform;
         var _loc8_:Vector.<Renamed923> = this.skin.Renamed1044();
         var _loc9_:int = 0;
         while(_loc9_ < this.Renamed985.length)
         {
            _loc2_ = this.Renamed985[_loc9_];
            _loc3_ = _loc2_.localTransform;
            _loc3_.setMatrix(_loc5_.Renamed1097() - _loc7_.m03 + this.Renamed972.x,_loc5_.Renamed1098() - _loc7_.m13 + this.Renamed972.y,_loc5_.Renamed1099() - _loc7_.m23 + this.Renamed972.z,0,0,param1);
            _loc4_ = _loc8_[_loc9_];
            _loc3_.prepend(_loc4_.Renamed1100());
            _loc9_++;
         }
      }
      
      public function Renamed825() : void
      {
         this.interpolatePhysicsState(1);
         this.Renamed967.update(0);
         this.skin.Renamed1063(this.Renamed971);
      }
      
      public function interpolatePhysicsState(param1:Number) : void
      {
         this.Renamed982.body.interpolate(param1,this.Renamed969,this.Renamed970);
         this.Renamed970.normalize();
         this.Renamed971 = this.Renamed991.Renamed1101(param1);
      }
      
      public function Renamed1102(param1:Vector3, param2:int = 0) : void
      {
         param1.copy(this.skin.Renamed1057().Renamed1058[param2]);
         param1.y = 0;
      }
      
      public function Renamed1103() : int
      {
         return this.skin.Renamed1057().Renamed1058.length;
      }
      
      public function Renamed856() : Renamed840
      {
         return this.Renamed980.Renamed954;
      }
      
      public function Renamed857() : Renamed840
      {
         return this.Renamed980.Renamed955;
      }
      
      public function Renamed1104() : Boolean
      {
         return this.Renamed856().Renamed1008() || this.Renamed857().Renamed1008();
      }
      
      public function Renamed1105() : Number
      {
         return this.Renamed696().state.velocity.length();
      }
      
      public function Renamed1106(param1:3DPositionVector, param2:3DPositionVector, param3:3DPositionVector, param4:3DPositionVector) : void
      {
         var _loc5_:Body = this.Renamed982.body;
         var _loc6_:BodyState = _loc5_.state;
         Renamed668.Renamed683(param1,_loc6_.position);
         _loc6_.orientation.setFromEulerAnglesXYZ(param2.x,param2.y,param2.z);
         Renamed668.Renamed683(param3,_loc6_.velocity);
         Renamed668.Renamed683(param4,_loc6_.angularVelocity);
         _loc5_.saveState();
         _loc5_.calcDerivedData();
         this.Renamed964.refresh();
      }
      
      public function Renamed1107(param1:Number) : void
      {
         this.Renamed980.Renamed1107(param1);
      }
      
      public function Renamed1108(param1:Number) : void
      {
         this.Renamed980.Renamed1108(param1);
      }
      
      public function Renamed1109(param1:Number) : void
      {
         this.Renamed980.Renamed1109(param1);
      }
      
      public function setTurnAcceleration(param1:Number) : void
      {
         this.Renamed980.setTurnAcceleration(param1);
      }
      
      public function Renamed1110(param1:Number) : void
      {
         this.Renamed980.Renamed1110(param1);
      }
      
      public function Renamed1111(param1:3DPositionVector, param2:3DPositionVector, param3:3DPositionVector, param4:3DPositionVector) : void
      {
         Renamed1003(this.Renamed982.body.state,param1,param2,param3,param4);
      }
      
      public function Renamed1112(param1:3DPositionVector, param2:3DPositionVector, param3:3DPositionVector, param4:3DPositionVector) : void
      {
         Renamed1003(this.Renamed982.body.prevState,param1,param2,param3,param4);
      }
      
      public function Renamed1113() : void
      {
         this.state = Renamed841.Renamed1114;
         this.tankData.spawnState = Renamed841.Renamed1114;
         this.Renamed1093(Renamed666.TANK);
         this.Renamed1115(Renamed666.Renamed1116);
         this.skin.setAlpha(0.5);
         this.Renamed982.body.postCollisionFilter = this;
      }
      
      public function Renamed1117() : void
      {
         this.state = Renamed841.Renamed854;
         this.tankData.spawnState = Renamed841.Renamed854;
         this.Renamed1093(Renamed666.TANK | Renamed666.Renamed1118 | Renamed666.WEAPON);
         this.Renamed1115(Renamed666.Renamed1118);
         this.skin.setAlpha(1);
         this.Renamed982.body.postCollisionFilter = null;
      }
      
      public function considerBodies(param1:Body, param2:Body) : Boolean
      {
         if(param1.postCollisionFilter != null && param2.postCollisionFilter == null)
         {
            ++param1.tank.Renamed988;
         }
         else if(param1.postCollisionFilter == null && param2.postCollisionFilter != null)
         {
            ++param2.tank.Renamed988;
         }
         return false;
      }
      
      public function Renamed1119(param1:BattleService) : void
      {
         var _loc2_:Renamed620 = param1.Renamed619();
         var _loc3_:Renamed610 = param1.Renamed621();
         if(this.battleService == null)
         {
            this.inBattle = true;
            this.battleService = param1;
            this.Renamed982.id = Renamed776.Renamed1120();
            _loc2_ = param1.Renamed619();
            _loc2_.Renamed806(this.Renamed982);
            _loc2_.Renamed811(this);
            _loc2_.Renamed827(this);
            _loc2_.Renamed829(this);
            this.skin.addToScene();
            this.title.addToContainer();
            _loc3_ = param1.Renamed621();
            _loc3_.Renamed851(this);
            _loc2_.Renamed801().Renamed1121(this.Renamed974);
            this.Renamed967.reset();
            _loc3_.Renamed1033().Renamed851(this);
         }
      }
      
      public function Renamed753(param1:Number) : void
      {
         this.Renamed1122();
         this.Renamed964.refresh();
         this.Renamed991.Renamed1123(this.Renamed696());
      }
      
      private function Renamed1122() : void
      {
         var _loc1_:Body = this.Renamed982.body;
         var _loc2_:BodyState = _loc1_.state;
         if(!_loc2_.isValid())
         {
            _loc2_.copy(this.Renamed984);
            _loc1_.saveState();
         }
      }
      
      public function Renamed1115(param1:int) : void
      {
         this.Renamed980.Renamed1115(param1);
      }
      
      public function runBeforePhysicsUpdate(param1:Number) : void
      {
         this.Renamed988 = 0;
         var _loc2_:Number = this.Renamed986.update(param1);
         var _loc3_:Number = this.Renamed987.update(param1);
         this.Renamed982.body.setMaxSpeedXY(_loc2_);
         this.Renamed980.applyForces(_loc2_,_loc3_,param1);
         this.Renamed982.body.slipperyMode = !this.Renamed1104() && this.Renamed982.Renamed1124();
         this.Renamed1095(param1);
         this.Renamed1125();
      }
      
      private function Renamed1125() : void
      {
         this.Renamed984.copy(this.Renamed982.body.state);
         this.Renamed964.validate();
      }
      
      public function Renamed1126(param1:Renamed968) : void
      {
         this.Renamed967 = param1;
      }
      
      public function get teamType() : Renamed663
      {
         return this.Renamed956;
      }
      
      public function get incarnation() : int
      {
         return this.Renamed963;
      }
      
      public function Renamed696() : Body
      {
         return this.Renamed982.body;
      }
      
      public function Renamed1127() : int
      {
         return this.Renamed988;
      }
      
      public function isInBattle() : Boolean
      {
         return this.inBattle;
      }
      
      public function Renamed1128() : Boolean
      {
         return this.Renamed982.Renamed1128();
      }
      
      public function Renamed1129() : Boolean
      {
         return this.Renamed982.Renamed1129();
      }
      
      public function Renamed1130() : Boolean
      {
         return this.Renamed982.Renamed1130();
      }
   }
}

