package Renamed87
{
   import Renamed136.Renamed663;
   import Renamed1.Renamed2;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed1442;
   import Renamed1.Renamed3193;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import Renamed602.3DPositionVector;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.models.weapon.Renamed3026;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed326.Renamed4677;
   import Renamed326.Renamed7757;
   import Renamed326.Renamed7791;
   import Renamed356.Renamed616;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import Renamed373.Renamed666;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed88 extends Renamed7791 implements Renamed4677, ObjectLoadListener, ObjectUnloadListener, IDumper, Renamed511, Renamed4710, Renamed4711
   {
      [Inject]
      public static var Renamed1233:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed4735:IDumpService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const Renamed10358:Number = 0.5;
      
      private static const Renamed10359:Number = 0.772;
      
      private static const Renamed10360:Number = 0.5;
      
      private static const Renamed10361:Number = 0.9;
      
      private static const Renamed10362:Number = 3;
      
      private static const Renamed10363:Number = 3;
      
      private static const Renamed10364:Number = 0.3;
      
      private static const Renamed3504:Number = 200;
      
      private static const Renamed6993:Vector3 = new Vector3();
      
      private var Renamed10365:Renamed10366;
      
      private var Renamed10367:Dictionary;
      
      private var Renamed10368:Dictionary;
      
      private var Renamed10369:Number;
      
      private var Renamed10370:Vector.<Renamed7757>;
      
      private var Renamed10371:TextureMaterial;
      
      private var Renamed10372:TextureMaterial;
      
      private var Renamed10373:TextureMaterial;
      
      private var Renamed10374:TextureMaterial;
      
      private var Renamed10375:Mesh;
      
      private var Renamed10376:Renamed843;
      
      private var Renamed10377:Renamed10378;
      
      private var Renamed10379:Renamed843;
      
      private var Renamed10380:Renamed10378;
      
      private var Renamed5830:TextureMaterial;
      
      private var Renamed10381:Sound;
      
      private var explosionSound:Sound;
      
      private var Renamed8578:Sound;
      
      private var impactForce:Number;
      
      private var Renamed9663:IGameObject;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed5460:Dictionary;
      
      private var Renamed3014:Tank;
      
      private var Renamed7786:Number;
      
      private var Renamed10382:Renamed3193;
      
      public function Renamed88()
      {
         this.Renamed10365 = new Renamed10366();
         this.Renamed10367 = new Dictionary();
         this.Renamed10368 = new Dictionary();
         this.Renamed10377 = new Renamed10378();
         this.Renamed10380 = new Renamed10378();
         this.Renamed5460 = new Dictionary();
         super();
         Renamed10383.Renamed10384();
         this.Renamed8980();
      }
      
      private static function Renamed10385(param1:Vector3, param2:Renamed843, param3:Renamed10378, param4:Number, param5:Number) : void
      {
         var _loc6_:int = 50;
         var _loc7_:Renamed616 = battleService.Renamed618();
         var _loc8_:set = set(_loc7_.getObject(set));
         _loc8_.init(param1,_loc6_);
         var _loc9_:Renamed3264 = Renamed3264(_loc7_.getObject(Renamed3264));
         _loc9_.init(param3.width,param3.height,param2,0,_loc8_,param4,param5);
         battleService.Renamed621().Renamed636(_loc9_);
      }
      
      private static function Renamed637(param1:Sound, param2:Vector3, param3:Number) : void
      {
         var _loc4_:Renamed1442 = null;
         if(param1 != null)
         {
            _loc4_ = Renamed1442.create(param1,param3);
            battleService.Renamed619().Renamed801().Renamed1121(Renamed1441.create(param2,_loc4_,0));
         }
      }
      
      private static function Renamed5884(param1:MultiframeImageResource, param2:int, param3:Renamed10378) : Renamed843
      {
         var _loc4_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1233,param1);
         _loc4_.material.resolution = param2;
         param3.height = param1.frameHeight * param2;
         param3.width = param1.frameWidth * param2;
         return _loc4_;
      }
      
      private static function Renamed10386(param1:ImageResource) : TextureMaterial
      {
         return Renamed1233.getMaterial(param1.data);
      }
      
      private function Renamed8980() : void
      {
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed894,this.Renamed2830);
         this.Renamed2432.Renamed904(Renamed889,this.Renamed5463);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed905();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed5502() : Number
      {
         return this.Renamed7786;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.Renamed9663 = object;
         Renamed4735.registerDumper(this);
         this.Renamed10365.Renamed10387 = 100;
         this.Renamed10365.Renamed10388 = 300;
         this.Renamed10365.Renamed10389 = 204;
         this.Renamed10365.Renamed10390 = Renamed668.Renamed674(getInitParam().Renamed7782);
         this.Renamed10365.Renamed7033 = Renamed668.Renamed674(getInitParam().Renamed7788);
         this.Renamed10369 = Renamed668.Renamed674(getInitParam().radius);
         this.impactForce = getInitParam().impactForce;
         this.Renamed10381 = getInitParam().Renamed7776.sound;
         this.explosionSound = getInitParam().explosionSound.sound;
         this.Renamed8578 = getInitParam().Renamed7780.sound;
         this.Renamed7786 = Renamed668.Renamed674(getInitParam().Renamed7786);
         this.Renamed10391(Tanks3DSResource(getInitParam().Renamed7787));
         this.Renamed10376 = Renamed5884(getInitParam().Renamed7785,Renamed10362,this.Renamed10377);
         this.Renamed10379 = Renamed5884(getInitParam().Renamed7784,Renamed10363,this.Renamed10380);
         this.Renamed5830 = Renamed10386(getInitParam().explosionMarkTexture);
         this.Renamed10371 = Renamed10386(getInitParam().Renamed7789);
         this.Renamed10372 = Renamed10386(getInitParam().Renamed7779);
         this.Renamed10373 = Renamed10386(getInitParam().Renamed7783);
         this.Renamed10374 = Renamed10386(getInitParam().Renamed7781);
         this.Renamed10382 = Renamed2.Renamed6915;
         this.Renamed10392(getInitParam().Renamed7778);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         Renamed4735.unregisterDumper(this.dumperName);
         this.Renamed10393();
         this.Renamed10381 = null;
         this.Renamed10376 = null;
         this.Renamed10379 = null;
         this.Renamed10371 = null;
         this.Renamed10372 = null;
         this.Renamed10373 = null;
         this.Renamed10374 = null;
         this.Renamed9663 = null;
         this.Renamed3014 = null;
         this.Renamed5830 = null;
         this.Renamed5460 = new Dictionary();
      }
      
      private function Renamed10392(param1:Vector.<Renamed7757>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.length != 0)
         {
            if(this.Renamed10370 == null)
            {
               this.Renamed10370 = new Vector.<Renamed7757>();
            }
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.Renamed10370.push(param1[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7692(param1:String, param2:Number, param3:Number, param4:Number, param5:String) : void
      {
         var _loc6_:Tank = this.Renamed5460[param5];
         if(_loc6_ == null)
         {
            if(this.Renamed10370 == null)
            {
               this.Renamed10370 = new Vector.<Renamed7757>();
            }
            this.Renamed10370.push(new Renamed7757(false,param1,param5,new 3DPositionVector(param2,param3,param4)));
         }
         else
         {
            this.Renamed10354(param1,this.Renamed10369,new Vector3(param2,param3,param4),param5,_loc6_.teamType,this.Renamed10394(_loc6_),false);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7690(param1:String) : void
      {
         var _loc2_:Renamed7757 = null;
         var _loc3_:Renamed4712 = this.Renamed10368[param1];
         if(_loc3_ != null)
         {
            _loc3_.Renamed10395();
            Renamed637(this.Renamed10381,_loc3_.position,Renamed10364);
         }
         else
         {
            for each(_loc2_ in this.Renamed10370)
            {
               if(_loc2_.mineId == param1)
               {
                  _loc2_.activated = true;
                  return;
               }
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7693(param1:String) : void
      {
         var _loc2_:Renamed4712 = null;
         var _loc3_:Renamed4712 = null;
         var _loc4_:Renamed10353 = this.Renamed10367[param1];
         if(_loc4_ != null)
         {
            _loc2_ = _loc4_.head;
            while(_loc2_ != null)
            {
               _loc3_ = _loc2_;
               _loc2_ = _loc2_.next;
               Renamed10385(_loc3_.position,this.Renamed10379,this.Renamed10380,Renamed10360,Renamed10361);
               Renamed637(this.Renamed8578,_loc3_.position,0.1);
               this.Renamed10355(_loc3_,_loc4_);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7691(param1:String, param2:String) : void
      {
         var _loc3_:Renamed10353 = null;
         var _loc4_:Tank = null;
         var _loc5_:Renamed4712 = this.Renamed10368[param1];
         if(_loc5_ != null)
         {
            _loc3_ = this.Renamed10367[_loc5_.ownerId];
            if(_loc3_ != null)
            {
               Renamed10385(_loc5_.position,this.Renamed10376,this.Renamed10377,Renamed10358,Renamed10359);
               this.Renamed10396(_loc5_.position,this.Renamed10382);
               this.Renamed10397(_loc5_);
               Renamed637(this.explosionSound,_loc5_.position,0.5);
               _loc4_ = this.Renamed5460[param2];
               if(_loc4_ != null)
               {
                  _loc4_.Renamed1029(_loc5_.position,_loc5_.Renamed10398,Renamed3026.Renamed3028.getNumber() * this.impactForce);
               }
               this.Renamed10355(_loc5_,_loc3_);
            }
         }
      }
      
      private function Renamed10396(param1:Vector3, param2:Renamed3193) : void
      {
         var _loc3_:set = set(battleService.Renamed618().getObject(set));
         var _loc4_:Renamed3266 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         _loc3_.init(param1,50);
         _loc4_.init(_loc3_,param2);
         battleService.Renamed636(_loc4_);
      }
      
      private function Renamed10397(param1:Renamed4712) : void
      {
         Renamed6993.copy(param1.position);
         Renamed6993.addScaled(100,param1.Renamed10398);
         battleService.Renamed621().addDecal(param1.position,Renamed6993,Renamed3504,this.Renamed5830);
      }
      
      [Obfuscation(rename="false")]
      public function dump(param1:Array) : String
      {
         var _loc2_:Renamed4712 = null;
         var _loc3_:* = "=== Mines ===\n";
         if(this.Renamed10370 != null)
         {
            _loc3_ += "Deferred:\n" + this.Renamed10370.join("\n") + "\n";
         }
         _loc3_ += "On field:\n";
         for each(_loc2_ in this.Renamed10368)
         {
            _loc3_ += _loc2_ + "\n";
         }
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function get dumperName() : String
      {
         return "mines";
      }
      
      public function Renamed10399(param1:Renamed4712) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
      }
      
      private function Renamed10354(param1:String, param2:Number, param3:Vector3, param4:String, param5:Renamed663, param6:Material, param7:Boolean) : void
      {
         var _loc8_:Renamed10353 = null;
         var _loc9_:Renamed4712 = null;
         var _loc10_:RayHit = new RayHit();
         if(battleService.Renamed619().Renamed692().raycastStatic(param3,Vector3.DOWN,Renamed666.Renamed690,10000000000,null,_loc10_))
         {
            _loc8_ = this.Renamed10367[param4];
            if(_loc8_ == null)
            {
               _loc8_ = new Renamed10353();
               this.Renamed10367[param4] = _loc8_;
            }
            _loc9_ = Renamed4712.create(param1,param4,param2,this.Renamed10375,param6,param5,this.Renamed10365,this);
            _loc9_.setPosition(_loc10_.position,_loc10_.normal);
            if(param7)
            {
               _loc9_.Renamed10395();
            }
            _loc8_.Renamed10354(_loc9_);
            this.Renamed10368[param1] = _loc9_;
            _loc9_.Renamed6065();
         }
      }
      
      private function Renamed10393() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Renamed4712 = null;
         var _loc3_:Renamed10353 = null;
         for(_loc1_ in this.Renamed10368)
         {
            _loc2_ = this.Renamed10368[_loc1_];
            _loc2_.Renamed10400();
            delete this.Renamed10368[_loc1_];
         }
         for(_loc1_ in this.Renamed10367)
         {
            _loc3_ = this.Renamed10367[_loc1_];
            _loc3_.Renamed10356();
            delete this.Renamed10367[_loc1_];
         }
         this.Renamed10370 = null;
      }
      
      private function Renamed10391(param1:Tanks3DSResource) : void
      {
         this.Renamed10375 = Mesh(param1.objects[0]);
         if(this.Renamed10375.sorting != Sorting.AVERAGE_Z)
         {
            this.Renamed10375.sorting = Sorting.AVERAGE_Z;
            this.Renamed10375.calculateFacesNormals(true);
         }
      }
      
      private function Renamed10355(param1:Renamed4712, param2:Renamed10353) : void
      {
         delete this.Renamed10368[param1.id];
         param1.Renamed10400();
         param2.Renamed10355(param1);
      }
      
      private function Renamed10394(param1:Tank) : Material
      {
         switch(param1.teamType)
         {
            case Renamed663.NONE:
               return param1 == this.Renamed3014 ? this.Renamed10373 : this.Renamed10374;
            case Renamed663.BLUE:
               return this.Renamed10372;
            case Renamed663.RED:
               return this.Renamed10371;
            default:
               return this.Renamed10374;
         }
      }
      
      private function Renamed5463(param1:Renamed889) : void
      {
         this.Renamed5460[param1.tank.tankData.userName] = param1.tank;
         if(param1.isLocal)
         {
            this.Renamed3014 = param1.tank;
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         delete this.Renamed5460[param1.tank.tankData.userName];
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         if(param1.tank == this.Renamed3014)
         {
            this.Renamed10401();
         }
         else
         {
            this.Renamed10402(param1.tank);
         }
      }
      
      private function Renamed10401() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Renamed7757 = null;
         var _loc3_:Tank = null;
         var _loc4_:Vector3 = null;
         if(this.Renamed10370 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.Renamed10370.length)
            {
               _loc2_ = this.Renamed10370[_loc1_];
               _loc3_ = this.Renamed5460[_loc2_.ownerId];
               if(_loc3_ != null)
               {
                  this.Renamed10370.splice(_loc1_,1);
                  _loc1_--;
                  _loc4_ = Renamed668.Renamed681(_loc2_.position);
                  this.Renamed10354(_loc2_.mineId,this.Renamed10369,_loc4_,_loc2_.ownerId,_loc3_.teamType,this.Renamed10394(_loc3_),_loc2_.activated);
               }
               _loc1_++;
            }
         }
      }
      
      private function Renamed10402(param1:Tank) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Renamed7757 = null;
         var _loc4_:Vector3 = null;
         if(this.Renamed10370 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.Renamed10370.length)
            {
               _loc3_ = this.Renamed10370[_loc2_];
               if(_loc3_.ownerId == param1.tankData.userName)
               {
                  this.Renamed10370.splice(_loc2_,1);
                  _loc2_--;
                  _loc4_ = Renamed668.Renamed681(_loc3_.position);
                  this.Renamed10354(_loc3_.mineId,this.Renamed10369,_loc4_,_loc3_.ownerId,param1.teamType,this.Renamed10394(param1),_loc3_.activated);
               }
               _loc2_++;
            }
         }
      }
      
      [Obfuscation(rename="false")]
      private function Renamed2830(param1:Renamed894) : void
      {
         this.Renamed10393();
      }
   }
}

