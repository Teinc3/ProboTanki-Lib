package Renamed70
{
   import Renamed155.Renamed5176;
   import Renamed155.Renamed4555;
   import Renamed4567.Renamed6074;
   import Renamed1.Renamed4604;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed7028;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.utils.MathUtils;
   import Renamed356.Renamed1443;
   import Renamed65.Renamed66;
   import Renamed388.Renamed5834;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Renamed10231 extends Renamed6074
   {
      private var Renamed3326:Renamed3044;
      
      private var sfxData:Renamed10232;
      
      private var callback:Renamed4688;
      
      private var Renamed10233:Renamed66;
      
      private var impactForce:Number;
      
      private var sprite:Renamed1647;
      
      private var Renamed9474:Renamed3266;
      
      private var Renamed10152:Renamed7028;
      
      private var Renamed5836:Renamed5834;
      
      public function Renamed10231(param1:Renamed1443)
      {
         super(param1);
         this.sprite = new Renamed1647(Renamed10234.Renamed10142,Renamed10234.Renamed10142);
         this.sprite.Renamed1648 = true;
      }
      
      override protected function Renamed6064() : Renamed4555
      {
         return Renamed5176.INSTANCE;
      }
      
      public function init(param1:Number, param2:Renamed66, param3:Renamed10232, param4:Renamed3044, param5:Renamed4688, param6:Renamed5834) : void
      {
         this.impactForce = param1;
         this.Renamed10233 = param2;
         this.Renamed3326 = param4;
         this.sfxData = param3;
         this.callback = param5;
         this.Renamed5836 = param6;
         this.sprite.Renamed1651(param3.Renamed10153);
         this.sprite.Renamed1653(this.sprite.getNumFrames() * Math.random());
         this.sprite.alpha = 1;
         this.sprite.rotation = MathUtils.PI2 * Math.random();
         this.Renamed9474 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         this.Renamed10152 = Renamed7028(battleService.Renamed618().getObject(Renamed7028));
         this.Renamed9474.init(this.Renamed10152,param3.Renamed10235,Renamed3266.Renamed7059,true);
      }
      
      override public function Renamed6065(param1:Renamed664, param2:Vector3, param3:Body, param4:int = -1) : void
      {
         super.Renamed6065(param1,param2,param3,param4);
         battleService.Renamed621().Renamed1258(this.sprite);
         battleService.Renamed636(this.Renamed9474);
      }
      
      override protected function Renamed2706() : Number
      {
         return this.Renamed10233.speed;
      }
      
      override protected function Renamed6080() : Number
      {
         return this.Renamed3326.Renamed3429();
      }
      
      override protected function Renamed6072(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:int) : void
      {
         var _loc6_:Tank = null;
         super.Renamed6072(param1,param2,param3,param4,param5);
         var _loc7_:Number = this.Renamed3326.Renamed3447(param4);
         this.Renamed10161(param2,_loc7_);
         var _loc8_:Boolean = true;
         if(Renamed668.Renamed687(param1))
         {
            _loc6_ = param1.tank;
            _loc6_.Renamed1029(param2,param3,this.impactForce * _loc7_);
            if(this.callback)
            {
               this.callback.Renamed10166(Renamed6071(),param1,param2);
            }
         }
         else
         {
            if(Boolean(this.callback) && _loc8_)
            {
               this.callback.Renamed10162(Renamed6071(),param2);
            }
            this.Renamed3204(param2);
         }
         this.destroy();
      }
      
      override public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = param2 / thousandth.getInt();
         this.sprite.update(_loc3_);
         this.sprite.x = Renamed969.x;
         this.sprite.y = Renamed969.y;
         this.sprite.z = Renamed969.z;
         this.sprite.rotation -= 3 * _loc3_;
         var _loc4_:Number = this.Renamed10233.distance - Renamed1469;
         if(_loc4_ < Renamed10234.Renamed10236)
         {
            this.sprite.alpha = _loc4_ / Renamed10234.Renamed10236;
         }
         this.Renamed10152.setPosition(Renamed969);
      }
      
      override protected function destroy() : void
      {
         super.destroy();
         battleService.Renamed621().removeObject(this.sprite);
         this.Renamed10233 = null;
         this.callback = null;
         Renamed6056 = null;
         this.Renamed3326 = null;
         this.sfxData = null;
         this.sprite.material = null;
         this.sprite.colorTransform = null;
         this.Renamed9474.kill();
         this.Renamed9474 = null;
         this.Renamed10152 = null;
      }
      
      override protected function Renamed6070() : Number
      {
         return this.Renamed10233.shellRadius;
      }
      
      private function Renamed10161(param1:Vector3, param2:Number) : void
      {
         var _loc3_:set = set(battleService.Renamed618().getObject(set));
         _loc3_.init(param1,Renamed10234.Renamed3269);
         var _loc4_:Number = Renamed10234.Renamed10143 * (1 + param2) / 2;
         var _loc5_:Renamed3264 = Renamed3264(battleService.Renamed618().getObject(Renamed3264));
         _loc5_.init(_loc4_,_loc4_,this.sfxData.Renamed3188,MathUtils.PI2 * Math.random(),_loc3_,0.5,0.5);
         battleService.Renamed636(_loc5_);
         this.Renamed3285(param1);
      }
      
      private function Renamed3285(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         var _loc3_:set = set(battleService.Renamed618().getObject(set));
         _loc3_.init(param1,Renamed10234.Renamed3269);
         _loc2_.init(_loc3_,this.sfxData.Renamed10237);
         battleService.Renamed636(_loc2_);
      }
      
      private function Renamed3204(param1:Vector3) : void
      {
         var _loc2_:Renamed4604 = null;
         if(GPUCapabilities.gpuEnabled)
         {
            _loc2_ = Renamed4604(battleService.Renamed618().getObject(Renamed4604));
            _loc2_.init(param1,this.sfxData.Renamed3190,Renamed689,Renamed10234.Renamed10238,Renamed10234.Renamed10239,Renamed10234.Renamed10240);
            battleService.Renamed636(_loc2_);
         }
      }
   }
}

