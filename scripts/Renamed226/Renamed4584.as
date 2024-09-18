package Renamed226
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed6377;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import Renamed301.Renamed3044;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.scene3d.Renamed1292;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3031;
   import alternativa.tanks.models.weapon.shotgun.Renamed3438;
   import alternativa.tanks.models.weapon.shotgun.Renamed3426;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.display.BlendMode;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   
   public class Renamed4584 extends Renamed1444 implements Renamed609
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed3504:Number = 16;
      
      private static const Renamed6379:Number = 270;
      
      private static const Renamed6380:Number = 100;
      
      private static const Renamed6381:Number = 1.3;
      
      private static const Renamed6382:Number = 400;
      
      private static const Renamed6383:Number = 150;
      
      private static const Renamed6384:Number = 2.5;
      
      private static const Renamed6385:Number = 200;
      
      private static const Renamed6386:Number = 0.08;
      
      private static const Renamed6387:Number = 0.3;
      
      private static const Renamed6388:Number = 0.05;
      
      private static const Renamed2948:Number = 5000;
      
      private static const Renamed6389:Number = 6;
      
      private static const Renamed6390:Number = 0.2;
      
      private static const Renamed6391:Number = 30;
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private static const Renamed3107:Renamed3031 = new Renamed3031();
      
      private static const Renamed6392:Vector3 = new Vector3();
      
      private static const Renamed6393:Vector3 = new Vector3();
      
      private static const Renamed6394:Vector3 = new Vector3();
      
      private static const Renamed6395:Vector3 = new Vector3();
      
      private var Renamed6396:Renamed6377;
      
      private var Renamed6397:Renamed6377;
      
      private var Renamed6398:Renamed1647;
      
      private var Renamed6399:Vector.<Renamed6400>;
      
      private var Renamed6401:Vector.<Renamed6400>;
      
      private var Renamed6402:Vector.<Sprite3D>;
      
      private var Renamed693:Vector3;
      
      private var Renamed6403:Vector3;
      
      private var time:Number = 0;
      
      private var container:Renamed908;
      
      private var Renamed6404:Renamed4585;
      
      private var Renamed6405:Number;
      
      public function Renamed4584(param1:Renamed1443)
      {
         this.Renamed6396 = new Renamed6377(Renamed6379,Renamed6379,0,Renamed6379 / 2,0);
         this.Renamed6397 = new Renamed6377(Renamed6379,Renamed6379,0,0,0);
         this.Renamed6398 = new Renamed1647(Renamed6385,Renamed6385);
         this.Renamed6399 = new Vector.<Renamed6400>();
         this.Renamed6401 = new Vector.<Renamed6400>();
         this.Renamed6402 = new Vector.<Sprite3D>();
         this.Renamed693 = new Vector3();
         this.Renamed6403 = new Vector3();
         super(param1);
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed6396);
         param1.addChild(this.Renamed6397);
         param1.addChild(this.Renamed6398);
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed6399.length)
         {
            param1.addChild(this.Renamed6399[_loc2_]);
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed6402.length)
         {
            param1.addChild(this.Renamed6402[_loc3_]);
            _loc3_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.Renamed6401.length)
         {
            param1.addChild(this.Renamed6401[_loc4_]);
            _loc4_++;
         }
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.Renamed6406())
         {
            return false;
         }
         var _loc3_:Number = param1 / 1000;
         this.Renamed6407(param2);
         this.Renamed6408(param2,this.Renamed6399);
         this.Renamed6409(_loc3_);
         this.Renamed6410();
         if(this.time >= Renamed6388)
         {
            this.Renamed6411(param2,this.Renamed6401);
         }
         this.time += _loc3_;
         this.Renamed6412();
         return true;
      }
      
      private function Renamed6406() : Boolean
      {
         return this.Renamed6396.parent == null && this.Renamed6397.parent == null && this.Renamed6398.parent == null && this.Renamed6399[0].parent == null && this.Renamed6402[0].parent == null && this.Renamed6401[0].parent == null;
      }
      
      private function Renamed6407(param1:Renamed842) : void
      {
         var _loc2_:Number = NaN;
         Renamed6378.Renamed6413(this.Renamed6396,param1.position,this.Renamed6403,false,8,0.9);
         Renamed6378.Renamed6413(this.Renamed6397,param1.position,this.Renamed6403,true,4,0.3);
         this.Renamed6396.setTime(this.time);
         var _loc3_:int = this.time * this.Renamed6404.Renamed6414.fps;
         if(_loc3_ == 5)
         {
            _loc2_ = Renamed6379 * 0.35;
            Renamed6392.copy(this.Renamed693).addScaled(_loc2_,this.Renamed6403);
         }
         else if(_loc3_ >= 6)
         {
            _loc2_ = Renamed6379 * 0.5;
            Renamed6392.copy(this.Renamed693).addScaled(_loc2_,this.Renamed6403);
         }
         else
         {
            Renamed6392.copy(this.Renamed693);
         }
         Renamed6378.Renamed6415(this.Renamed6396,Renamed6392,this.Renamed6403,param1.position);
         this.Renamed6397.setTime(this.time);
         _loc3_ = this.time * this.Renamed6404.Renamed6416.fps;
         _loc2_ = 0.1 * Renamed6379 + _loc3_ * 0.1 * Renamed6379;
         this.Renamed6397.x = this.Renamed693.x + this.Renamed6403.x * _loc2_;
         this.Renamed6397.y = this.Renamed693.y + this.Renamed6403.y * _loc2_;
         this.Renamed6397.z = this.Renamed693.z + this.Renamed6403.z * _loc2_;
      }
      
      private function Renamed6408(param1:Renamed842, param2:Vector.<Renamed6400>) : void
      {
         var _loc3_:Renamed6400 = null;
         var _loc4_:Number = this.time / Renamed6387;
         for each(_loc3_ in param2)
         {
            this.Renamed6417(_loc3_,_loc4_,param1);
         }
      }
      
      private function Renamed6417(param1:Renamed6400, param2:Number, param3:Renamed842) : Number
      {
         var _loc4_:Number = param1.distance * param2;
         Renamed6393.copy(param1.position).addScaled(_loc4_,param1.direction);
         param1.alpha = 1 - 2 * Math.abs(0.5 - param2);
         Renamed6378.Renamed6415(param1,Renamed6393,param1.direction,param3.position);
         param1.visible = true;
         return _loc4_;
      }
      
      private function Renamed6411(param1:Renamed842, param2:Vector.<Renamed6400>) : void
      {
         var _loc3_:Renamed6400 = null;
         var _loc4_:Number = (this.time - Renamed6388) / Renamed6387;
         for each(_loc3_ in param2)
         {
            if(!_loc3_.Renamed6418)
            {
               return;
            }
            this.Renamed6417(_loc3_,_loc4_,param1);
         }
      }
      
      private function Renamed6409(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.time > Renamed6386)
         {
            this.Renamed6398.visible = true;
            _loc2_ = this.time * this.Renamed6398.Renamed1654();
            this.Renamed6398.Renamed1653(_loc2_);
            _loc3_ = this.time - Renamed6386;
            _loc4_ = Math.sqrt(_loc3_ / Renamed6381);
            if(this.Renamed6405 > Renamed6380)
            {
               _loc7_ = Math.min(this.Renamed6405 - Renamed6380,Renamed6382);
               _loc5_ = Renamed6380 + _loc7_ * _loc4_;
            }
            else
            {
               _loc5_ = 0;
               this.Renamed6398.visible = false;
            }
            this.Renamed6398.x = this.Renamed693.x + this.Renamed6403.x * _loc5_;
            this.Renamed6398.y = this.Renamed693.y + this.Renamed6403.y * _loc5_;
            this.Renamed6398.z = this.Renamed693.z + this.Renamed6403.z * _loc5_ + Renamed6383 * _loc4_;
            _loc6_ = 1 + (Renamed6384 - 1) * _loc4_;
            this.Renamed6398.scaleX = _loc6_;
            this.Renamed6398.scaleY = _loc6_;
            this.Renamed6398.scaleZ = _loc6_;
            this.Renamed6398.alpha = 1 - _loc4_;
            this.Renamed6398.rotation -= 0.3 * param1;
         }
         else
         {
            this.Renamed6398.visible = false;
         }
      }
      
      private function Renamed6410() : void
      {
         var _loc1_:Sprite3D = null;
         var _loc2_:Number = (this.time - Renamed6388) / Renamed6390;
         _loc2_ *= _loc2_;
         var _loc3_:Number = 1 + (Renamed6391 - 1) * _loc2_;
         for each(_loc1_ in this.Renamed6402)
         {
            _loc1_.scaleX = _loc3_;
            _loc1_.scaleY = _loc3_;
            _loc1_.scaleZ = _loc3_;
            _loc1_.alpha = 1 - _loc2_;
         }
      }
      
      private function Renamed6412() : void
      {
         var _loc1_:Renamed6400 = null;
         var _loc2_:Renamed6400 = null;
         var _loc3_:Sprite3D = null;
         if(this.time > Renamed6387)
         {
            for each(_loc1_ in this.Renamed6399)
            {
               this.container.removeChild(_loc1_);
            }
         }
         if(this.time > Renamed6387 + Renamed6388)
         {
            for each(_loc2_ in this.Renamed6401)
            {
               if(_loc2_.parent != null)
               {
                  this.container.removeChild(_loc2_);
               }
            }
         }
         if(this.time > this.Renamed6396.Renamed6419())
         {
            this.container.removeChild(this.Renamed6396);
         }
         if(this.time > this.Renamed6397.Renamed6419())
         {
            this.container.removeChild(this.Renamed6397);
         }
         if(this.time > Renamed6386 + Renamed6381)
         {
            this.container.removeChild(this.Renamed6398);
         }
         if(this.time > Renamed6390)
         {
            for each(_loc3_ in this.Renamed6402)
            {
               this.container.removeChild(_loc3_);
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed6399.length)
         {
            this.Renamed6399[_loc1_].clear();
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed6401.length)
         {
            this.Renamed6401[_loc2_].clear();
            this.Renamed6401[_loc2_].visible = false;
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed6402.length)
         {
            this.Renamed6402[_loc3_].material = null;
            _loc3_++;
         }
         this.Renamed6397.clear();
         this.Renamed6396.clear();
         this.Renamed6398.clear();
         recycle();
      }
      
      public function kill() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed6399.length)
         {
            this.container.removeChild(this.Renamed6399[_loc1_]);
            this.container.removeChild(this.Renamed6401[_loc1_]);
            this.container.removeChild(this.Renamed6402[_loc1_]);
            _loc1_++;
         }
         this.container.removeChild(this.Renamed6396);
         this.container.removeChild(this.Renamed6397);
         this.container.removeChild(this.Renamed6398);
      }
      
      public function init(param1:Renamed3438, param2:Renamed664, param3:Renamed925, param4:Vector3, param5:Renamed4585) : void
      {
         this.Renamed6404 = param5;
         this.Renamed693.copy(param2.Renamed693);
         this.Renamed6403.copy(param2.direction);
         this.Renamed6420();
         this.Renamed6421();
         this.Renamed6422(param1,param2,param4,param3.Renamed696());
         this.time = 0;
      }
      
      private function Renamed6420() : void
      {
         this.Renamed6396.blendMode = BlendMode.ADD;
         var _loc1_:Renamed843 = this.Renamed6404.Renamed6414;
         this.Renamed6396.init(_loc1_,_loc1_.fps);
         this.Renamed6396.shadowMapAlphaThreshold = 2;
         this.Renamed6396.useShadowMap = false;
         this.Renamed6396.depthMapAlphaThreshold = 2;
         this.Renamed6396.useLight = false;
         var _loc2_:Renamed843 = this.Renamed6404.Renamed6416;
         this.Renamed6397.init(_loc2_,_loc2_.fps);
         this.Renamed6397.blendMode = BlendMode.ADD;
         this.Renamed6397.rotationX = Math.atan2(this.Renamed6403.z,Math.sqrt(this.Renamed6403.x * this.Renamed6403.x + this.Renamed6403.y * this.Renamed6403.y)) - Math.PI / 2;
         this.Renamed6397.rotationY = 0;
         this.Renamed6397.rotationZ = -Math.atan2(this.Renamed6403.x,this.Renamed6403.y);
         this.Renamed6397.shadowMapAlphaThreshold = 2;
         this.Renamed6397.useShadowMap = false;
         this.Renamed6397.depthMapAlphaThreshold = 2;
         this.Renamed6397.useLight = false;
      }
      
      private function Renamed6421() : void
      {
         this.Renamed6398.Renamed1651(this.Renamed6404.Renamed6423);
         this.Renamed6398.Renamed1653(0);
         this.Renamed6398.rotation = Math.random() * Math.PI * 2;
         this.Renamed6398.shadowMapAlphaThreshold = 2;
         this.Renamed6398.useShadowMap = false;
         this.Renamed6398.depthMapAlphaThreshold = 2;
         this.Renamed6398.useLight = false;
         this.Renamed6398.softAttenuation = 130;
         this.Renamed6405 = Renamed2948;
      }
      
      private function Renamed6422(param1:Renamed3438, param2:Renamed664, param3:Vector3, param4:Body) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Vector.<Vector3> = this.Renamed6424(param1,param2,param3);
         var _loc7_:Renamed665 = battleService.Renamed619().Renamed692();
         Renamed3107.Renamed3032 = param4;
         var _loc8_:Renamed3044 = param1.Renamed3058();
         var _loc9_:Number = _loc8_.Renamed3429();
         while(this.Renamed6399.length < _loc6_.length)
         {
            this.Renamed6425();
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_.length)
         {
            _loc5_ = _loc6_[_loc10_];
            this.Renamed6426(_loc10_,_loc7_,_loc5_,param2.Renamed689,_loc9_);
            _loc10_++;
         }
      }
      
      private function Renamed6424(param1:Renamed3438, param2:Renamed664, param3:Vector3) : Vector.<Vector3>
      {
         var _loc4_:Renamed3426 = param1.Renamed3461();
         _loc4_.next();
         return _loc4_.Renamed3431(param2.Renamed3025,param3);
      }
      
      private function Renamed6425() : void
      {
         this.Renamed6399.push(this.Renamed6427());
         this.Renamed6401.push(this.Renamed6427());
         var _loc1_:Sprite3D = new Sprite3D(0,0);
         _loc1_.blendMode = BlendMode.ADD;
         _loc1_.shadowMapAlphaThreshold = 2;
         _loc1_.useShadowMap = false;
         _loc1_.depthMapAlphaThreshold = 2;
         _loc1_.useLight = false;
         this.Renamed6402.push(_loc1_);
      }
      
      private function Renamed6427() : Renamed6400
      {
         var _loc1_:Renamed6400 = new Renamed6400();
         _loc1_.blendMode = BlendMode.ADD;
         _loc1_.shadowMapAlphaThreshold = 2;
         _loc1_.useShadowMap = false;
         _loc1_.depthMapAlphaThreshold = 2;
         _loc1_.useLight = false;
         return _loc1_;
      }
      
      private function Renamed6426(param1:int, param2:Renamed665, param3:Vector3, param4:Vector3, param5:Number) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Sprite3D = null;
         var _loc8_:Boolean = param2.raycast(param4,param3,Renamed666.WEAPON,param5,Renamed3107,Renamed1299);
         var _loc9_:Number = Renamed2948;
         var _loc10_:Renamed6400 = this.Renamed6399[param1];
         _loc10_.position.copy(this.Renamed693);
         if(_loc8_)
         {
            _loc6_ = Renamed668.Renamed687(Renamed1299.shape.body);
            _loc10_.direction.diff(Renamed1299.position,this.Renamed693);
            _loc9_ = this.Renamed6428(param4,_loc9_,_loc10_,_loc6_);
            _loc10_.direction.normalize();
            _loc7_ = this.Renamed6402[param1];
            this.Renamed6429(_loc7_,Renamed1299.position,param3);
            if(!_loc6_)
            {
               this.Renamed6430(param4,Renamed1299.position);
            }
         }
         else
         {
            _loc10_.direction.copy(param3);
         }
         this.Renamed6431(_loc10_,_loc9_);
      }
      
      private function Renamed6428(param1:Vector3, param2:Number, param3:Renamed6400, param4:Boolean) : Number
      {
         var _loc5_:Number = param1.distanceTo(Renamed1299.position);
         var _loc6_:Number = param1.distanceTo(this.Renamed693);
         if(_loc5_ > _loc6_)
         {
            param2 = param3.direction.length();
         }
         else
         {
            param2 = 0;
         }
         if(!param4)
         {
            this.Renamed6405 = Math.min(param2,this.Renamed6405);
         }
         return param2;
      }
      
      private function Renamed6432(param1:Vector3, param2:Renamed6400, param3:Boolean) : Number
      {
         if(!param3)
         {
            return param2.direction.length();
         }
         return param1.distanceTo(Renamed1299.position);
      }
      
      private function Renamed6431(param1:Renamed6400, param2:Number) : void
      {
         var _loc3_:Number = 3 + Math.random() * 8;
         var _loc4_:Number = 0.3 + Math.random() * 0.3;
         var _loc5_:Number = Math.min(Math.random() * 200,param2);
         var _loc6_:Number = Math.min(400 + Math.random() * 2100,param2);
         var _loc7_:Number = 300 + Math.random() * 500;
         if(_loc7_ + _loc6_ > param2)
         {
            _loc7_ = Math.max(0,param2 - _loc6_);
         }
         param1.init(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,this.Renamed6404.Renamed6433);
      }
      
      private function Renamed6429(param1:Sprite3D, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = Renamed6389 + Math.random() * Renamed6389;
         var _loc5_:Number = _loc4_ / 2;
         param1.width = _loc4_;
         param1.height = _loc4_;
         param1.material = this.Renamed6404.Renamed6434;
         param1.x = param2.x - _loc5_ * param3.x;
         param1.y = param2.y - _loc5_ * param3.y;
         param1.z = param2.z - _loc5_ * param3.z;
         param1.rotation = Math.random() * Math.PI * 2;
         param1.visible = true;
      }
      
      private function Renamed6430(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Vector.<TextureMaterial> = this.Renamed6404.Renamed6435;
         var _loc4_:int = Math.floor(Math.random() * _loc3_.length);
         battleService.Renamed621().addDecal(param2,param1,Renamed3504,_loc3_[_loc4_],Renamed1292.Renamed1293);
      }
   }
}

