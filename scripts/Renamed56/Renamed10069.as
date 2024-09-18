package Renamed56
{
   import Renamed1.Renamed6906;
   import Renamed1.Renamed6441;
   import Renamed1.Renamed7009;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed7018;
   import Renamed1.Renamed7022;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed608;
   import Renamed1.Renamed609;
   import Renamed1.Renamed1442;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import flash.geom.Vector3D;
   
   public class Renamed10069 implements Renamed10078, Renamed7018, Renamed6441
   {
      public static const Renamed10077:int = 300;
      
      public static const Renamed10070:Number = 300;
      
      public static const Renamed10072:Number = 200;
      
      public static const Renamed10074:Number = 30;
      
      private static const Renamed3504:Number = 50;
      
      private static const Renamed10111:Number = 25;
      
      private static const Renamed10112:Number = 0.5;
      
      private static const Renamed10113:Number = 1.5;
      
      private static const Renamed10114:Number = 20;
      
      private static const Renamed10115:int = 500;
      
      private static const Renamed10116:Number = 80;
      
      private static const Renamed10117:Number = 0.5;
      
      private static const Renamed10118:Number = 2;
      
      private static const Renamed6382:Number = 100;
      
      private static const Renamed6381:int = 2200;
      
      private static const Renamed3749:Number = 1;
      
      private static const Renamed939:Vector3D = new Vector3D();
      
      private static const Renamed10119:Vector3D = new Vector3D();
      
      private static const Renamed10120:Vector3 = new Vector3();
      
      private static const Renamed10121:Vector3 = new Vector3();
      
      private static const Renamed10122:Vector3 = new Vector3();
      
      private static const Renamed9196:Vector3 = new Vector3();
      
      private static const v:Vector3 = new Vector3();
      
      private var sfxData:Renamed10064;
      
      private var battleService:BattleService;
      
      private var Renamed10123:Renamed10050;
      
      private var Renamed10124:Renamed3266;
      
      private var Renamed9472:Renamed1441;
      
      public function Renamed10069(param1:Renamed10064, param2:BattleService)
      {
         super();
         this.sfxData = param1;
         this.battleService = param2;
      }
      
      private static function Renamed10125(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         param4.copy(param1).subtract(param2);
         var _loc5_:Number = param4.dot(param3);
         param4.copy(param2).addScaled(_loc5_,param3);
      }
      
      private static function Renamed10126(param1:Vector3D, param2:Vector3D, param3:Renamed917) : RayIntersectionData
      {
         var _loc4_:RayIntersectionData = raycast(param3.Renamed1023(),param1,param2);
         var _loc5_:RayIntersectionData = raycast(param3.Renamed1268(),param1,param2);
         if(_loc4_ == null)
         {
            return _loc5_;
         }
         if(_loc5_ == null)
         {
            return _loc4_;
         }
         if(_loc5_.time < _loc4_.time)
         {
            return _loc5_;
         }
         return _loc4_;
      }
      
      private static function raycast(param1:Object3D, param2:Vector3D, param3:Vector3D) : RayIntersectionData
      {
         var _loc4_:Vector3D = param1.globalToLocal(param2);
         var _loc5_:Vector3D = param3.clone();
         _loc5_.x += param1.x;
         _loc5_.y += param1.y;
         _loc5_.z += param1.z;
         var _loc6_:Vector3D = param1.globalToLocal(_loc5_);
         return param1.intersectRay(_loc4_,_loc6_);
      }
      
      private static function Renamed1303(param1:Vector3) : Vector3
      {
         Renamed9196.x = Math.atan2(param1.z,Math.sqrt(param1.x * param1.x + param1.y * param1.y)) - Math.PI / 2;
         Renamed9196.y = 0;
         Renamed9196.z = -Math.atan2(param1.x,param1.y);
         return Renamed9196;
      }
      
      public function Renamed10083(param1:Vector3, param2:Object3D, param3:int) : void
      {
         if(this.Renamed10123 != null)
         {
            this.Renamed10123.kill();
         }
         this.Renamed10123 = Renamed10050(this.battleService.Renamed618().getObject(Renamed10050));
         this.Renamed10123.init(Renamed10077,Renamed10077,this.sfxData.Renamed10066,param1,param2,0,this.Renamed10127(param3),this);
         this.battleService.Renamed636(this.Renamed10123);
         this.Renamed10128(param1,param2,param3);
      }
      
      public function Renamed10128(param1:Vector3, param2:Object3D, param3:int) : void
      {
         if(this.Renamed10124 != null)
         {
            this.Renamed10124.kill();
         }
         this.Renamed10124 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc4_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc4_.init(param2,param1);
         this.Renamed10124.Renamed6911(_loc4_,param3,this.sfxData.Renamed10075);
         this.battleService.Renamed636(this.Renamed10124);
      }
      
      private function Renamed10127(param1:int) : Number
      {
         return 1000 * this.sfxData.Renamed10066.Renamed1652.length / param1;
      }
      
      public function Renamed5252(param1:Vector3) : void
      {
         if(this.Renamed9472 != null)
         {
            this.Renamed9472.kill();
         }
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.sound,Renamed3749);
         this.Renamed9472 = Renamed1441.create(param1,_loc2_,0,0,this);
         this.battleService.Renamed637(this.Renamed9472);
      }
      
      public function Renamed10084(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Renamed10052 = null;
         var _loc5_:Renamed10109 = null;
         if(param2 == null)
         {
            param2 = Renamed10058.Renamed10060(param1,param3);
         }
         v.diff(param2,param1);
         if(v.dot(param3) > 0)
         {
            _loc4_ = Renamed10052(this.battleService.Renamed618().getObject(Renamed10052));
            _loc4_.init(param1,param2,this.sfxData.Renamed3189,Renamed10111,Renamed10112,Renamed10113,Renamed10114,Renamed10115);
            this.battleService.Renamed636(_loc4_);
            _loc5_ = Renamed10109(this.battleService.Renamed618().getObject(Renamed10109));
            _loc5_.init(param1,param2,this.sfxData.Renamed10065,Renamed10116,Renamed10117,Renamed10118,Renamed6382,Renamed6381);
            this.battleService.Renamed636(_loc5_);
         }
         this.Renamed10129(param1);
         this.Renamed10130(param1,param2);
      }
      
      private function Renamed10130(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:set = set(this.battleService.Renamed618().getObject(set));
         var _loc4_:set = set(this.battleService.Renamed618().getObject(set));
         _loc3_.init(param1,0);
         _loc4_.init(param2,0);
         var _loc5_:Renamed6906 = Renamed6906(this.battleService.Renamed618().getObject(Renamed6906));
         _loc5_.init(_loc3_,_loc4_,this.sfxData.Renamed10076);
         this.battleService.Renamed636(_loc5_);
      }
      
      public function Renamed10129(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc3_:set = set(this.battleService.Renamed618().getObject(set));
         _loc3_.init(param1,0);
         _loc2_.init(_loc3_,this.sfxData.Renamed3192);
         this.battleService.Renamed636(_loc2_);
      }
      
      public function Renamed10085(param1:Vector3, param2:Vector3) : void
      {
         if(param2 != null)
         {
            this.battleService.Renamed621().addDecal(param2,param1,Renamed3504,this.sfxData.Renamed3190);
         }
      }
      
      public function Renamed3062() : void
      {
         if(this.Renamed10123 != null)
         {
            this.Renamed10123.kill();
            this.Renamed10123 = null;
         }
         if(this.Renamed10124 != null)
         {
            this.Renamed10124.kill();
            this.Renamed10124 = null;
         }
         if(this.Renamed9472 != null)
         {
            this.Renamed9472.kill();
            this.Renamed9472 = null;
         }
      }
      
      public function Renamed7019(param1:Renamed609) : void
      {
         if(this.Renamed10123 == param1)
         {
            this.Renamed10123 = null;
         }
      }
      
      public function Renamed6447(param1:Renamed608) : void
      {
         if(this.Renamed9472 == param1)
         {
            this.Renamed9472 = null;
         }
      }
      
      public function Renamed10086(param1:Vector3, param2:Vector3, param3:Vector.<Vector3>, param4:Vector.<Body>) : void
      {
         var _loc5_:Body = null;
         var _loc6_:Tank = null;
         var _loc7_:RayIntersectionData = null;
         var _loc8_:Object3D = null;
         var _loc9_:Vector3D = null;
         Renamed939.x = param1.x;
         Renamed939.y = param1.y;
         Renamed939.z = param1.z;
         Renamed10119.x = param2.x - param1.x;
         Renamed10119.y = param2.y - param1.y;
         Renamed10119.z = param2.z - param1.z;
         Renamed10122.copy(param2).subtract(param1).normalize();
         var _loc10_:int = 0;
         while(_loc10_ < param4.length)
         {
            _loc5_ = param4[_loc10_];
            if(_loc5_ != null && _loc5_.tank != null)
            {
               _loc6_ = _loc5_.tank;
               _loc7_ = Renamed10126(Renamed939,Renamed10119,_loc6_.Renamed1075());
               if(_loc7_ == null)
               {
                  Renamed10125(param3[_loc10_],param1,Renamed10122,Renamed10120);
                  Renamed10121.copy(Renamed10122);
               }
               else
               {
                  _loc8_ = _loc7_.object;
                  Renamed10120.copyFromVector3D(_loc8_.localToGlobal(_loc7_.point));
                  _loc9_ = _loc8_.localToGlobal(_loc7_.face.normal);
                  Renamed10121.x = _loc9_.x - _loc8_.x;
                  Renamed10121.y = _loc9_.y - _loc8_.y;
                  Renamed10121.z = _loc9_.z - _loc8_.z;
               }
               this.Renamed10131(Renamed10120,Renamed10121,Renamed10122);
               this.Renamed10132(Renamed10120,Renamed10121);
            }
            _loc10_++;
         }
      }
      
      private function Renamed10132(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc4_:Renamed7009 = Renamed7009(this.battleService.Renamed618().getObject(Renamed7009));
         _loc4_.init(param1,param2,50);
         _loc3_.init(_loc4_,this.sfxData.Renamed3194);
         this.battleService.Renamed636(_loc3_);
      }
      
      private function Renamed10131(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Renamed7022 = Renamed7022(this.battleService.Renamed618().getObject(Renamed7022));
         _loc4_.init(Renamed10070,param1,Renamed1303(param2),this.sfxData.Renamed10068,1);
         this.battleService.Renamed621().Renamed636(_loc4_);
         var _loc5_:Renamed3264 = Renamed3264(this.battleService.Renamed618().getObject(Renamed3264));
         var _loc6_:set = set(this.battleService.Renamed618().getObject(set));
         _loc6_.init(param1,30);
         _loc5_.init(Renamed10072,Renamed10072,this.sfxData.Renamed10071,0,_loc6_,0.5,0.5,null,0);
         this.battleService.Renamed621().Renamed636(_loc5_);
         var _loc7_:Renamed10041 = Renamed10041(this.battleService.Renamed618().getObject(Renamed10041));
         _loc7_.init(param1,param3,this.sfxData.Renamed10073);
         this.battleService.Renamed621().Renamed636(_loc7_);
      }
      
      public function Renamed10087(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         Renamed10122.copy(param2).subtract(param1).normalize();
         this.Renamed10131(param2,param3,Renamed10122);
         this.Renamed10132(param2,param3);
      }
   }
}

