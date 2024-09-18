package Renamed63
{
   import Renamed155.Renamed5176;
   import Renamed155.Renamed4555;
   import Renamed4567.Renamed4568;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed7028;
   import Renamed1.Renamed1442;
   import Renamed1.Renamed6378;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed616;
   import flash.media.Sound;
   import Renamed373.Renamed666;
   import Renamed388.Renamed5834;
   import Renamed91.Renamed92;
   
   public class Renamed10141 extends Renamed4568
   {
      public static const Renamed10142:Number = 300;
      
      public static const Renamed10143:Number = 266;
      
      public static const Renamed10111:Number = 100;
      
      private static const Renamed10144:Number = 80;
      
      private static const Renamed10145:Number = 300;
      
      private static const Renamed9498:int = 6;
      
      private static const Renamed10100:Vector3 = new Vector3();
      
      private static const Renamed10146:Vector3 = new Vector3();
      
      private static const staticHitPoint:Vector3 = new Vector3();
      
      private var sfxData:Renamed10138;
      
      private var callback:Renamed4671;
      
      private var Renamed8410:Vector.<Vector3>;
      
      private var Renamed10147:Renamed92;
      
      private var sprite:Renamed1647;
      
      private var Renamed3326:Renamed3044;
      
      private var Renamed10148:int;
      
      private var Renamed10149:Renamed10150;
      
      private var impactForce:Number;
      
      private var Renamed10151:Renamed3266;
      
      private var Renamed10152:Renamed7028;
      
      private var Renamed5836:Renamed5834;
      
      public function Renamed10141(param1:Renamed1443)
      {
         super(param1);
         this.sprite = new Renamed1647(Renamed10142,Renamed10142);
         this.sprite.Renamed1648 = true;
         this.Renamed10149 = new Renamed10150(Renamed10111,Renamed10145);
         this.Renamed8410 = new Vector.<Vector3>();
      }
      
      override protected function Renamed6064() : Renamed4555
      {
         return Renamed5176.INSTANCE;
      }
      
      public function init(param1:Number, param2:Renamed92, param3:Renamed10138, param4:Renamed3044, param5:Renamed4671, param6:Renamed5834) : void
      {
         this.impactForce = param1;
         this.Renamed10147 = param2;
         this.sfxData = param3;
         this.Renamed3326 = param4;
         this.callback = param5;
         this.Renamed5836 = param6;
         this.sprite.rotation = 2 * Math.PI * Math.random();
         this.sprite.Renamed1651(param3.Renamed10153);
         this.sprite.Renamed1653(this.sprite.getNumFrames() * Math.random());
         this.Renamed10149.setMaterialToAllFaces(param3.Renamed10154);
         this.Renamed10148 = 0;
         this.Renamed8410.length = 0;
         this.Renamed10151 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         this.Renamed10152 = Renamed7028(battleService.Renamed618().getObject(Renamed7028));
         this.Renamed10151.init(this.Renamed10152,param3.Renamed10155,Renamed3266.Renamed7059,true);
      }
      
      override public function Renamed6065(param1:Renamed664, param2:Vector3, param3:Body, param4:int = -1) : void
      {
         super.Renamed6065(param1,param2,param3,param4);
         var _loc5_:Renamed610 = battleService.Renamed621();
         _loc5_.Renamed1258(this.sprite);
         _loc5_.Renamed1258(this.Renamed10149);
         _loc5_.Renamed1402(this.Renamed10149);
         _loc5_.Renamed636(this.Renamed10151);
      }
      
      override protected function update(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Vector3 = null;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         if(Renamed1469 >= this.Renamed10147.shotDistance)
         {
            this.destroy();
            return;
         }
         var _loc9_:CollisionDetector = battleService.Renamed619().Renamed692();
         var _loc10_:Number = this.Renamed10147.shellSpeed * param1;
         Renamed1148.copy(Renamed6058);
         while(_loc10_ > 0)
         {
            _loc3_ = -1;
            _loc4_ = _loc10_;
            if(_loc9_.raycast(Renamed6058,Renamed6057,Renamed666.WEAPON,_loc10_,this,Renamed672))
            {
               _loc2_ = Renamed672.shape.body;
               _loc3_ = Renamed672.t;
               if(Renamed668.Renamed687(_loc2_))
               {
                  this.Renamed8410.push(Renamed672.position.clone().add(Renamed672.normal));
                  this.Renamed10156(_loc2_,Renamed672.position,Renamed6057,Renamed1469 + _loc3_,this.Renamed8410);
                  return;
               }
               _loc4_ = _loc3_;
               staticHitPoint.copy(Renamed672.position);
               Renamed10100.copy(Renamed672.normal);
            }
            _loc5_ = 0;
            while(_loc5_ < Renamed9498)
            {
               _loc6_ = Renamed6059[_loc5_];
               if(_loc9_.raycast(_loc6_,Renamed6057,Renamed666.WEAPON,_loc4_,this,Renamed672))
               {
                  _loc2_ = Renamed672.shape.body;
                  Renamed6051.copy(Renamed6058).addScaled(Renamed672.t,Renamed6057);
                  _loc7_ = Renamed668.Renamed687(_loc2_) && !this.Renamed10157(Renamed6058,Renamed6051);
                  if(_loc7_)
                  {
                     this.Renamed8410.push(Renamed6051.clone());
                     this.Renamed10156(_loc2_,Renamed6051,Renamed6057,Renamed1469 + Renamed672.t,this.Renamed8410);
                     return;
                  }
               }
               _loc6_.addScaled(_loc4_,Renamed6057);
               _loc5_++;
            }
            if(_loc3_ > -1)
            {
               Renamed1469 += _loc3_;
               _loc10_ -= _loc3_;
               if(this.Renamed10148 >= this.Renamed10147.maxRicochetCount)
               {
                  _loc8_ = this.Renamed3326.Renamed3447(Renamed1469);
                  this.Renamed8410.push(staticHitPoint.clone());
                  this.Renamed10158(Renamed10100,_loc8_,_loc2_);
                  return;
               }
               ++this.Renamed10148;
               Renamed6058.addScaled(_loc3_,Renamed6057);
               this.Renamed10159(Renamed10100);
               this.Renamed10160(Renamed6058);
               this.Renamed8410.push(Renamed6058.clone());
            }
            else
            {
               Renamed1469 += _loc10_;
               Renamed6058.addScaled(_loc10_,Renamed6057);
               _loc10_ = 0;
            }
         }
      }
      
      private function Renamed10158(param1:Vector3, param2:Number = 1, param3:Body = null) : void
      {
         var _loc4_:Vector3 = this.Renamed8410[this.Renamed8410.length - 1];
         _loc4_.addScaled(0.1,param1);
         var _loc5_:Boolean = true;
         this.Renamed10161(_loc4_);
         if(Boolean(this.callback) && _loc5_)
         {
            this.callback.Renamed10162(Renamed6071(),this.Renamed8410);
         }
         this.destroy();
      }
      
      private function Renamed10157(param1:Vector3, param2:Vector3) : Boolean
      {
         return Renamed2943.Renamed2967(param1,param2);
      }
      
      private function Renamed10159(param1:Vector3) : void
      {
         Renamed6058.addScaled(0.1,param1);
         Renamed6057.addScaled(-2 * Renamed6057.dot(param1),param1);
         Renamed6068(Renamed6058,Renamed6057);
      }
      
      override public function render(param1:int, param2:int) : void
      {
         this.sprite.x = Renamed969.x;
         this.sprite.y = Renamed969.y;
         this.sprite.z = Renamed969.z;
         this.sprite.update(param2 / 1000);
         var _loc3_:Number = this.Renamed3326.Renamed3447(Renamed1469);
         var _loc4_:Number = Renamed10142 * _loc3_;
         this.sprite.width = _loc4_;
         this.sprite.height = _loc4_;
         this.sprite.rotation -= 0.003 * param2;
         var _loc5_:Vector3 = battleService.Renamed621().Renamed739().position;
         Renamed6378.Renamed6415(this.Renamed10149,Renamed969,Renamed6057,_loc5_);
         var _loc6_:Number = Renamed6058.x - _loc5_.x;
         var _loc7_:Number = Renamed6058.y - _loc5_.y;
         var _loc8_:Number = Renamed6058.z - _loc5_.z;
         var _loc9_:Number = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
         if(_loc9_ > 0.00001)
         {
            _loc9_ = 1 / Math.sqrt(_loc9_);
            _loc6_ *= _loc9_;
            _loc7_ *= _loc9_;
            _loc8_ *= _loc9_;
         }
         var _loc10_:Number = _loc6_ * Renamed6057.x + _loc7_ * Renamed6057.y + _loc8_ * Renamed6057.z;
         if(_loc10_ < 0)
         {
            _loc10_ = -_loc10_;
         }
         if(_loc10_ > 0.5)
         {
            this.Renamed10149.alpha = 2 * (1 - _loc10_) * _loc3_;
         }
         else
         {
            this.Renamed10149.alpha = _loc3_;
         }
         this.Renamed10152.setPosition(Renamed969);
      }
      
      override protected function destroy() : void
      {
         super.destroy();
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.removeObject(this.sprite);
         this.sprite.material = null;
         _loc1_.removeObject(this.Renamed10149);
         this.Renamed10149.setMaterialToAllFaces(null);
         _loc1_.Renamed1403(this.Renamed10149);
         Renamed6056 = null;
         this.Renamed10147 = null;
         this.sfxData = null;
         this.Renamed3326 = null;
         this.callback = null;
         this.Renamed10151.kill();
         this.Renamed10151 = null;
         this.Renamed10152 = null;
      }
      
      override public function considerBody(param1:Body) : Boolean
      {
         return super.considerBody(param1) || this.Renamed10148 > 0;
      }
      
      private function Renamed10161(param1:Vector3) : void
      {
         var _loc2_:Renamed616 = battleService.Renamed618();
         var _loc3_:set = set(_loc2_.getObject(set));
         var _loc4_:int = 50;
         _loc3_.init(param1,_loc4_);
         var _loc5_:Renamed3264 = Renamed3264(_loc2_.getObject(Renamed3264));
         var _loc6_:Number = Math.random() * Math.PI * 2;
         var _loc7_:int = 0;
         _loc5_.init(Renamed10143,Renamed10143,this.sfxData.Renamed3188,_loc6_,_loc3_,0.5,0.5,null,_loc7_);
         battleService.Renamed636(_loc5_);
         this.Renamed10163(this.sfxData.explosionSound,param1);
         this.Renamed3285(param1);
      }
      
      private function Renamed3285(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         var _loc3_:set = set(battleService.Renamed618().getObject(set));
         _loc3_.init(param1,50);
         _loc2_.init(_loc3_,this.sfxData.Renamed3194);
         battleService.Renamed636(_loc2_);
      }
      
      private function Renamed10164(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         var _loc3_:set = set(battleService.Renamed618().getObject(set));
         _loc3_.init(param1,50);
         _loc2_.init(_loc3_,this.sfxData.Renamed10165);
         battleService.Renamed636(_loc2_);
      }
      
      private function Renamed10163(param1:Sound, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Renamed1442 = null;
         var _loc5_:Renamed1441 = null;
         if(param1 != null)
         {
            _loc3_ = 0.8;
            _loc4_ = Renamed1442.create(param1,_loc3_);
            _loc5_ = Renamed1441.create(param2,_loc4_);
            battleService.Renamed637(_loc5_);
         }
      }
      
      private function Renamed10156(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:Vector.<Vector3>) : void
      {
         this.Renamed10161(param2);
         var _loc6_:Number = this.Renamed3326.Renamed3447(param4);
         var _loc7_:Tank = param1.tank;
         _loc7_.Renamed1029(param2,param3,_loc6_ * this.impactForce);
         this.Renamed10166(param1,param5);
         this.destroy();
      }
      
      private function Renamed10166(param1:Body, param2:Vector.<Vector3>) : void
      {
         if(this.callback)
         {
            this.callback.Renamed10166(Renamed6071(),param1,param2);
         }
      }
      
      private function Renamed10160(param1:Vector3) : void
      {
         var _loc2_:Renamed616 = battleService.Renamed618();
         var _loc3_:set = set(_loc2_.getObject(set));
         var _loc4_:int = 50;
         _loc3_.init(param1,_loc4_);
         var _loc5_:Renamed3264 = Renamed3264(_loc2_.getObject(Renamed3264));
         _loc5_.init(Renamed10144,Renamed10144,this.sfxData.Renamed10167,Math.random() * Math.PI * 2,_loc3_,0.5,0.5);
         battleService.Renamed636(_loc5_);
         this.Renamed10163(this.sfxData.ricochetSound,param1);
         this.Renamed10164(param1);
      }
      
      override protected function Renamed6067() : Boolean
      {
         var _loc1_:CollisionDetector = battleService.Renamed619().Renamed692();
         Renamed10146.diff(Renamed6058,Renamed689);
         var _loc2_:Number = Renamed10146.length();
         Renamed10146.normalize();
         return this.Renamed10168(Renamed10146,_loc2_,_loc1_);
      }
      
      private function Renamed10168(param1:Vector3, param2:Number, param3:CollisionDetector) : Boolean
      {
         if(param3.raycast(Renamed689,param1,Renamed666.WEAPON,param2,this,Renamed672))
         {
            this.Renamed8410.push(Renamed672.position.clone());
            if(Renamed668.Renamed687(Renamed672.shape.body))
            {
               this.Renamed10156(Renamed672.shape.body,Renamed672.position,param1,0,this.Renamed8410);
               return true;
            }
            if(this.Renamed10148 >= this.Renamed10147.maxRicochetCount)
            {
               this.Renamed10158(Renamed672.normal);
               return true;
            }
            ++this.Renamed10148;
            Renamed6058.copy(Renamed672.position);
            this.Renamed10159(Renamed672.normal);
            this.Renamed10160(Renamed672.position);
            return false;
         }
         return this.Renamed10169(param1,param2,param3);
      }
      
      private function Renamed10169(param1:Vector3, param2:Number, param3:CollisionDetector) : Boolean
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Body = null;
         Renamed6068(Renamed689,param1);
         var _loc6_:int = 0;
         while(_loc6_ < Renamed9498)
         {
            _loc4_ = Renamed6059[_loc6_];
            if(param3.raycast(_loc4_,Renamed6057,Renamed666.WEAPON,param2,this,Renamed672))
            {
               _loc5_ = Renamed672.shape.body;
               if(Renamed668.Renamed687(_loc5_))
               {
                  Renamed6051.copy(Renamed689).addScaled(Renamed672.t,param1);
                  this.Renamed8410.push(Renamed6051.clone());
                  this.Renamed10156(_loc5_,Renamed6051,param1,0,this.Renamed8410);
                  return true;
               }
            }
            _loc6_++;
         }
         return false;
      }
      
      override protected function Renamed6070() : Number
      {
         return this.Renamed10147.shellRadius;
      }
      
      override protected function Renamed6062() : int
      {
         return Renamed9498;
      }
   }
}

