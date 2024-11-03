package Renamed79
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.Renamed1230;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.utils.SetControllerForTemporaryItems;
   import alternativa.tanks.utils.Renamed3238;
   import Renamed356.Renamed616;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   
   public class Renamed2769 implements Renamed609
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed10283:Class = Renamed10284;
      
      public static var Renamed3246:BitmapData = new Renamed10283().bitmapData;
      
      private static const Renamed9736:Vector3 = new Vector3();
      
      private static const Renamed9738:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const Renamed10285:Dictionary = new Dictionary();
      
      private static const Renamed10286:int = 0;
      
      private static const Renamed10287:int = 1;
      
      private static const Renamed10288:int = 2;
      
      private static const Renamed10289:int = 3;
      
      private static const Renamed10290:int = 4;
      
      private static const Renamed10291:int = 200;
      
      private static const Renamed10292:Number = 100000;
      
      private static const Renamed10293:Number = 200;
      
      private static const Renamed5087:Number = 2.2;
      
      private static const Renamed10294:Number = 0.333;
      
      private static const Renamed10295:Number = 30;
      
      private static const Renamed10296:Number = 10;
      
      private static const Renamed10297:Number = 0.001;
      
      private static const Renamed10298:Number = 1;
      
      private var visible:Boolean;
      
      private var state:int;
      
      private var time:int;
      
      private var fadeInTimeMs:int;
      
      private var turret:Object3D;
      
      private var laser:Renamed10299;
      
      private var container:Renamed908;
      
      private var Renamed10300:Renamed3265;
      
      private var Renamed10301:Sprite3D;
      
      private var Renamed10302:Number;
      
      private var Renamed10303:Number;
      
      private var Renamed10304:Number;
      
      private var targetTank:Tank;
      
      private var Renamed10305:Vector3;
      
      private var Renamed3323:SetControllerForTemporaryItems;
      
      private var Renamed1372:Dictionary;
      
      public function Renamed2769(param1:int, param2:Tank)
      {
         this.Renamed10305 = new Vector3();
         super();
         this.fadeInTimeMs = param1;
         this.laser = new Renamed10299();
         this.Renamed10301 = new Sprite3D(Renamed10295,Renamed10295);
         this.Renamed10301.useShadowMap = false;
         this.Renamed10301.useLight = false;
         this.Renamed10301.blendMode = BlendMode.ADD;
         this.Renamed10301.sorting = Sorting.DYNAMIC_BSP;
         this.Renamed10301.shadowMapAlphaThreshold = 2;
         this.Renamed10301.depthMapAlphaThreshold = 2;
         this.turret = param2.Renamed1075().Renamed1268();
         var _loc3_:Renamed616 = battleService.Renamed618();
         this.Renamed10300 = Renamed3265(_loc3_.getObject(Renamed3265));
         this.Renamed10300.init(this.turret,param2.Renamed1072());
         this.Renamed1372 = battleService.Renamed621().Renamed1404();
         this.Renamed3323 = new SetControllerForTemporaryItems(this.Renamed1372);
      }
      
      public function show(param1:uint) : void
      {
         this.visible = true;
         this.state = Renamed10286;
         this.Renamed10303 = 0;
         this.Renamed10304 = 1;
         this.laser.alpha = 0;
         this.laser.visible = false;
         this.laser.init(param1);
         this.Renamed10301.alpha = 0;
         this.Renamed10301.visible = false;
         this.Renamed10301.material = Renamed3238.Renamed3888(Renamed10285,param1,Renamed3246);
         if(this.container == null)
         {
            battleService.Renamed636(this);
         }
      }
      
      public function Renamed10306() : void
      {
         this.visible = true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.laser);
         param1.addChild(this.Renamed10301);
      }
      
      public function Renamed7194(param1:Number) : Boolean
      {
         if(this.state == Renamed10286 || this.targetTank != null || Math.abs(this.Renamed10302 - param1) > Renamed10297)
         {
            this.Renamed10307();
            this.Renamed10302 = param1;
            this.targetTank = null;
            return true;
         }
         return false;
      }
      
      public function Renamed7192(param1:Tank, param2:Vector3) : Boolean
      {
         this.Renamed10307();
         if(this.targetTank != param1 || param2.distanceToSquared(this.Renamed10305) > Renamed10298)
         {
            this.targetTank = param1;
            this.Renamed10305.copy(param2);
            return true;
         }
         return false;
      }
      
      private function Renamed10307() : void
      {
         if(this.state == Renamed10286)
         {
            this.time = 0;
            this.state = Renamed10287;
         }
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         this.updateState(param1);
         if(this.state == Renamed10290)
         {
            return false;
         }
         if(this.state == Renamed10286)
         {
            this.laser.alpha = 0;
            this.laser.visible = false;
            this.Renamed10301.alpha = 0;
            this.Renamed10301.visible = false;
            return true;
         }
         this.Renamed10300.Renamed6905(this.laser,param2,param1);
         Renamed9736.x = this.laser.x;
         Renamed9736.y = this.laser.y;
         Renamed9736.z = this.laser.z;
         this.Renamed10308();
         var _loc3_:Number = Vector3.distanceBetween(Renamed9736,Renamed9738);
         this.laser.update(param1,_loc3_);
         this.laser.visible = _loc3_ >= Renamed10293;
         this.Renamed10301.x = Renamed9738.x;
         this.Renamed10301.y = Renamed9738.y;
         this.Renamed10301.z = Renamed9738.z;
         this.Renamed10301.visible = _loc3_ < Renamed10292;
         Renamed6378.Renamed6415(this.laser,Renamed9736,direction,param2.position);
         return true;
      }
      
      private function Renamed10308() : void
      {
         var _loc1_:Matrix3 = Renamed668.Renamed670;
         _loc1_.setRotationMatrixForObject3D(this.turret);
         var _loc2_:Vector3 = Renamed668.Renamed669;
         _loc1_.getUp(_loc2_);
         if(this.targetTank != null && this.targetTank.Renamed696() != null)
         {
            Renamed9738.copy(this.Renamed10305);
            Renamed668.localToGlobal(this.targetTank.Renamed696(),Renamed9738);
            direction.diff(Renamed9738,Renamed9736).normalize();
            this.Renamed10302 = _loc2_.dot(direction);
            if(Math.abs(this.Renamed10302 - this.Renamed10303) < Renamed10297)
            {
               Renamed9738.addScaled(-Renamed10296,direction);
               return;
            }
         }
         if(Math.abs(this.Renamed10302 - this.Renamed10303) > Renamed10297)
         {
            this.Renamed10303 += Renamed10294 * (this.Renamed10302 - this.Renamed10303);
            this.Renamed10304 = Math.sqrt(1 - this.Renamed10303 * this.Renamed10303);
         }
         direction.copy(_loc2_);
         direction.scale(this.Renamed10303);
         _loc1_.getForward(_loc2_);
         direction.addScaled(this.Renamed10304,_loc2_);
         this.Renamed10309();
      }
      
      private function updateState(param1:int) : void
      {
         var _loc2_:Number = 0;
         switch(this.state)
         {
            case Renamed10287:
               _loc2_ = this.Renamed10310(param1,Renamed10288,this.fadeInTimeMs);
               break;
            case Renamed10289:
               _loc2_ = 1 - this.Renamed10310(param1,Renamed10290,Renamed10291);
               break;
            default:
               return;
         }
         var _loc3_:Number = Math.pow(_loc2_,Renamed5087);
         this.laser.alpha = _loc3_;
         this.Renamed10301.alpha = _loc3_;
      }
      
      private function Renamed10310(param1:int, param2:int, param3:int) : Number
      {
         this.time += param1;
         if(this.time >= param3)
         {
            this.state = param2;
            this.time = param3;
         }
         return this.time / param3;
      }
      
      private function Renamed10309() : void
      {
         var _loc1_:RayIntersectionData = null;
         var _loc2_:Object3D = null;
         this.Renamed3323.addTemporaryItem(this.turret);
         while(true)
         {
            _loc1_ = battleService.Renamed621().raycast(Renamed9736,direction,this.Renamed1372);
            if(_loc1_ == null)
            {
               break;
            }
            _loc2_ = _loc1_.object;
            if(_loc2_.name == Renamed1230.Renamed690 || _loc2_.name == Renamed1230.TANK_PART)
            {
               Renamed9738.copy(Renamed9736);
               Renamed9738.addScaled(_loc1_.time - Renamed10296,direction);
               this.Renamed3323.deleteAllTemporaryItems();
               return;
            }
            this.Renamed3323.addTemporaryItem(_loc1_.object);
         }
         this.Renamed3323.deleteAllTemporaryItems();
         Renamed9738.copy(Renamed9736);
         Renamed9738.addScaled(Renamed10292,direction);
      }
      
      public function hide() : void
      {
         this.visible = false;
         if(this.container)
         {
            this.state = Renamed10289;
            this.time = 0;
         }
         else
         {
            this.kill();
         }
      }
      
      public function isVisible() : Boolean
      {
         return this.visible;
      }
      
      public function destroy() : void
      {
         this.kill();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.kill();
         this.Renamed10300.destroy();
         this.Renamed10300 = null;
         this.turret = null;
         this.laser = null;
         this.Renamed10301 = null;
         this.Renamed1372 = null;
         this.Renamed3323 = null;
      }
      
      public function kill() : void
      {
         if(this.container)
         {
            this.container.removeChild(this.laser);
            this.container.removeChild(this.Renamed10301);
            this.container = null;
            this.laser.close();
            this.Renamed10301.material = null;
            this.state = Renamed10290;
         }
         else
         {
            this.state = Renamed10286;
         }
         this.targetTank = null;
         this.Renamed10305.reset();
         this.Renamed10302 = 0;
         this.Renamed10303 = 0;
         this.Renamed10304 = 1;
      }
   }
}

