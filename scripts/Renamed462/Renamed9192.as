package Renamed462
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed6377;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import Renamed1.set;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.models.weapon.Renamed921;
   import alternativa.tanks.models.weapon.Renamed922;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.display.BlendMode;
   
   public class Renamed4720 extends Renamed1444 implements Renamed609
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed9158:int = 150;
      
      private static const Renamed9159:int = 200;
      
      private static const Renamed9160:int = 50;
      
      private static const Renamed9161:Number = 150;
      
      private static const Renamed9162:Number = 210;
      
      private static const Renamed9163:Number = -10;
      
      private static const Renamed9164:Number = 130;
      
      private static const Renamed9165:Number = 35;
      
      private static const Renamed9166:Number = 60;
      
      private static const Renamed6385:Number = 170;
      
      private static const Renamed9167:Number = 300;
      
      private static const Renamed9168:Number = 170;
      
      private static const Renamed9169:Number = 0.3;
      
      private static const Renamed9170:Number = 50;
      
      private static const Renamed9171:Number = 22222;
      
      private static const Renamed3077:Renamed922 = new Renamed922();
      
      private static const origin:Vector3 = new Vector3();
      
      private static const Renamed9172:Vector3 = new Vector3();
      
      private var time:Number = 0;
      
      private var container:Renamed908;
      
      private var Renamed9173:Renamed3075;
      
      private var turret:Object3D;
      
      private var Renamed9174:set;
      
      private var Renamed7002:Boolean;
      
      private var Renamed3091:Boolean;
      
      private var Renamed9175:Boolean;
      
      private var Renamed9176:Boolean;
      
      private var Renamed9177:Boolean;
      
      public function Renamed4720(param1:Renamed1443)
      {
         this.Renamed6396 = new Renamed6377(Renamed9161,Renamed9162,0,Renamed9162 * 0.5,0);
         this.Renamed6397 = new Renamed6377(Renamed9164,Renamed9164,0,0,0);
         this.Renamed6402 = new Renamed1647(Renamed9158,Renamed9158);
         this.Renamed9178 = new Renamed1647(Renamed9159,Renamed9159);
         this.tracer = new Renamed9179();
         this.Renamed6398 = new Renamed9180(Renamed6385,Renamed9167,Renamed9168,Renamed9169);
         this.Renamed1530 = new Vector3();
         this.Renamed9181 = new Vector3();
         super(param1);
         Renamed6378.Renamed7054(this.Renamed6396);
         Renamed6378.Renamed7054(this.Renamed6397);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Renamed3075) : void
      {
         this.Renamed9173 = param3;
         this.turret = param1;
         this.Renamed9181.copy(param2);
         Renamed921.Renamed1060(param1,param2,Renamed3077);
         this.Renamed9182(param3);
         this.Renamed1530.copy(Renamed3077.Renamed693);
         this.Renamed6398.Renamed9183(param3.smokeTexture);
         this.tracer.init(param3.tracerTexture);
         this.Renamed9174 = set(battleService.Renamed618().getObject(set));
         this.Renamed9174.init(this.Renamed1530,Renamed9160);
         this.Renamed6402.Renamed1648 = true;
         this.Renamed6402.Renamed1651(param3.sparklesTexture);
         this.Renamed9178.Renamed1648 = true;
         this.Renamed9178.Renamed1651(param3.tankSparklesTexture);
         this.time = 0;
         this.Renamed9175 = false;
         this.Renamed9177 = false;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed6396);
         param1.addChild(this.Renamed6397);
         param1.addChild(this.tracer);
         param1.addChild(this.Renamed6402);
         param1.addChild(this.Renamed9178);
         this.Renamed6398.Renamed1418(param1);
         this.Renamed6398.start();
         this.tracer.visible = true;
         this.Renamed6396.visible = true;
         this.Renamed6397.visible = true;
         this.Renamed3091 = true;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         Renamed921.Renamed1060(this.turret,this.Renamed9181,Renamed3077);
         var _loc3_:Number = param1 / 1000;
         this.Renamed6407(param2);
         this.Renamed9184(_loc3_,param2,param1);
         this.Renamed9185(_loc3_);
         this.time += _loc3_;
         return this.Renamed7002 || this.Renamed3091;
      }
      
      public function Renamed3099(param1:Vector3, param2:Boolean) : void
      {
         this.Renamed1530.copy(param1);
         this.Renamed9175 = true;
         this.Renamed9176 = param2;
      }
      
      public function Renamed3100(param1:Boolean) : void
      {
         this.Renamed9175 = false;
         this.Renamed9177 = param1;
      }
      
      public function destroy() : void
      {
         this.kill();
         this.Renamed6397.clear();
         this.Renamed6396.clear();
         this.Renamed6398.clear();
         this.Renamed6402.clear();
         this.Renamed9178.clear();
         this.container = null;
         this.Renamed9173 = null;
         this.turret = null;
         this.Renamed9174.destroy();
         this.Renamed9174 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.container.removeChild(this.Renamed6396);
         this.container.removeChild(this.Renamed6397);
         this.container.removeChild(this.tracer);
         this.container.removeChild(this.Renamed6402);
         this.container.removeChild(this.Renamed9178);
      }
      
      public function stop() : void
      {
         this.Renamed6398.stop();
         this.tracer.visible = false;
         this.Renamed6396.visible = false;
         this.Renamed6397.visible = false;
         this.Renamed6402.visible = false;
         this.Renamed9178.visible = false;
         this.Renamed3091 = false;
      }
      
      private function Renamed9182(param1:Renamed3075) : void
      {
         var _loc2_:Renamed843 = param1.fireAlongTexture;
         this.Renamed6396.init(_loc2_,_loc2_.fps);
         this.Renamed6396.blendMode = BlendMode.ADD;
         var _loc3_:Renamed843 = param1.fireAcrossTexture;
         this.Renamed6397.init(_loc3_,_loc3_.fps);
         this.Renamed6397.blendMode = BlendMode.ADD;
         this.Renamed9186();
      }
      
      private function Renamed9186() : void
      {
         var _loc1_:Number = Renamed3077.direction.x;
         var _loc2_:Number = Renamed3077.direction.y;
         this.Renamed6397.rotationX = Math.atan2(Renamed3077.direction.z,Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_)) - Math.PI / 2;
         this.Renamed6397.rotationY = 0;
         this.Renamed6397.rotationZ = -Math.atan2(_loc1_,_loc2_);
      }
      
      private function Renamed6407(param1:Renamed842) : void
      {
         Renamed6378.Renamed6413(this.Renamed6396,param1.position,Renamed3077.direction,false,8,0.9);
         Renamed6378.Renamed6413(this.Renamed6397,param1.position,Renamed3077.direction,true,4,0.3);
         this.Renamed9187(Renamed3077.Renamed693,Renamed3077.direction,Renamed9163,origin);
         Renamed6378.Renamed6415(this.Renamed6396,origin,Renamed3077.direction,param1.position);
         this.Renamed6396.setTime(this.time % this.Renamed6396.Renamed6419());
         this.Renamed9186();
         this.Renamed9188(this.Renamed6397,Renamed3077.Renamed693,Renamed3077.direction,Renamed9165);
         this.Renamed6397.setTime(this.time % this.Renamed6397.Renamed6419());
      }
      
      private function Renamed9184(param1:Number, param2:Renamed842, param3:int) : void
      {
         var _loc4_:Number = NaN;
         if(this.Renamed9175)
         {
            Renamed9172.copy(this.Renamed1530);
            Renamed9172.subtract(Renamed3077.Renamed693);
            _loc4_ = Renamed9172.length();
            Renamed9172.normalize();
            this.Renamed9189(param1,param2,param3);
         }
         else
         {
            _loc4_ = this.Renamed9177 ? Number(0) : Number(Renamed9171);
            Renamed9172.copy(Renamed3077.direction);
            this.Renamed9190();
         }
         this.Renamed9187(Renamed3077.Renamed693,Renamed3077.direction,Renamed9170,origin);
         Renamed6378.Renamed6415(this.tracer,origin,Renamed9172,param2.position);
         this.tracer.update(param3,_loc4_ - Renamed9170);
      }
      
      private function Renamed9189(param1:Number, param2:Renamed842, param3:int) : void
      {
         this.Renamed9190();
         var _loc4_:Renamed1647;
         (_loc4_ = this.Renamed9176 ? this.Renamed9178 : this.Renamed6402).visible = this.Renamed3091;
         _loc4_.update(param1);
         this.Renamed9174.init(this.Renamed1530,Renamed9160);
         this.Renamed9174.Renamed6905(_loc4_,param2,param3);
      }
      
      private function Renamed9190() : void
      {
         this.Renamed6402.visible = false;
         this.Renamed9178.visible = false;
      }
      
      private function Renamed9185(param1:Number) : void
      {
         this.Renamed9187(Renamed3077.Renamed693,Renamed3077.direction,Renamed9166,origin);
         this.Renamed6398.Renamed9191(origin);
         this.Renamed7002 = this.Renamed6398.update(param1);
      }
      
      private function Renamed9187(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         param4.copy(param1).addScaled(param3,param2);
      }
      
      private function Renamed9188(param1:Object3D, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.x = param2.x + param4 * param3.x;
         param1.y = param2.y + param4 * param3.y;
         param1.z = param2.z + param4 * param3.z;
      }
   }
}

