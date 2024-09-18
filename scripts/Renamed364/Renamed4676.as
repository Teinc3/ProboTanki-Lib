package Renamed364
{
   import Renamed1.Renamed7004;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed1442;
   import Renamed1.Renamed3193;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import Renamed1.Renamed7061;
   import Renamed4605.Renamed4606;
   import Renamed4605.Renamed7116;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.types.Long;
   import Renamed356.Renamed616;
   import flash.media.Sound;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4676 extends Renamed7116 implements Renamed4606, ObjectLoadListener, ObjectUnloadListener, Renamed4674
   {
      [Inject]
      public static var Renamed1368:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed8210:Number = 800;
      
      private static const Renamed6385:Number = 400;
      
      private static const Renamed8211:Number = 1000;
      
      private static const Renamed8212:Number = 600;
      
      private static const Renamed8213:Number = 800;
      
      private static const Renamed8214:Number = 200;
      
      private static const Renamed8215:Number = -2000;
      
      private static const Renamed8216:int = 200;
      
      private static const Renamed3271:Number = 0.4;
      
      private var Renamed8217:Renamed8207;
      
      public function Renamed4676()
      {
         this.Renamed1299 = new RayHit();
         this.position = new Vector3();
         this.eulerAngles = new Vector3();
         this.velocity = new Vector3();
         this.matrix = new Matrix3();
         super();
      }
      
      private static function Renamed6628(param1:Tank) : Number
      {
         var _loc2_:Mesh = param1.Renamed1075().Renamed1023();
         var _loc3_:Number = _loc2_.boundMaxX - _loc2_.boundMinX;
         var _loc4_:Number = _loc2_.boundMaxY - _loc2_.boundMinY;
         var _loc5_:Number = _loc2_.boundMaxZ - _loc2_.boundMinZ;
         var _loc6_:Number = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
         return _loc6_ / Renamed8212;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         var _loc1_:Renamed843 = this.getTextureAnimation(MultiframeImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,450080))),Renamed8210);
         var _loc2_:Renamed843 = this.getTextureAnimation(MultiframeImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,644720))),Renamed8211);
         var _loc3_:Renamed843 = this.getTextureAnimation(MultiframeImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,839177))),Renamed6385);
         var _loc4_:Renamed8207 = new Renamed8207(_loc1_,_loc2_,_loc3_);
         this.Renamed8217 = _loc4_;
      }
      
      private function getTextureAnimation(param1:MultiframeImageResource, param2:Number) : Renamed843
      {
         var _loc3_:Renamed843 = GraphicsUtils.getTextureAnimationFromResource(Renamed1368,param1);
         _loc3_.material.resolution = param2 / param1.frameWidth;
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.Renamed1264(this.Renamed8217);
      }
      
      public function Renamed3472(param1:IGameObject, param2:Tank, param3:Renamed3193) : void
      {
         var _loc4_:Renamed8207 = this.Renamed8217;
         var _loc5_:Renamed616 = battleService.Renamed618();
         var _loc6_:Number = Renamed6628(param2);
         this.Renamed8218(param2,_loc5_,_loc6_,_loc4_);
         this.Renamed8219(_loc5_,_loc6_,_loc4_);
         this.Renamed8220(_loc5_,_loc6_,_loc4_);
         this.Renamed8221(_loc5_,param3);
         this.Renamed8222(param2);
      }
      
      private function Renamed8222(param1:Tank) : void
      {
         var _loc2_:Renamed1442 = null;
         var _loc3_:Object3D = null;
         var _loc4_:Sound = battleService.Renamed632();
         if(_loc4_ != null)
         {
            _loc2_ = Renamed1442.create(_loc4_,Renamed3271);
            _loc3_ = param1.Renamed1075().Renamed1268();
            battleService.Renamed637(Renamed1441.create(new Vector3(_loc3_.x,_loc3_.y,_loc3_.z),_loc2_,0,0));
         }
      }
      
      private function Renamed8221(param1:Renamed616, param2:Renamed3193) : void
      {
         var _loc3_:set = set(param1.getObject(set));
         var _loc4_:Renamed3266 = Renamed3266(param1.getObject(Renamed3266));
         _loc3_.init(this.position,0);
         _loc4_.init(_loc3_,param2);
         battleService.Renamed636(_loc4_);
      }
      
      private function Renamed1264(param1:Renamed8207) : void
      {
         Renamed1368.releaseMaterial(param1.Renamed8208.material);
         Renamed1368.releaseMaterial(param1.Renamed8209.material);
         Renamed1368.releaseMaterial(param1.Renamed6423.material);
      }
      
      private function Renamed8218(param1:Tank, param2:Renamed616, param3:Number, param4:Renamed8207) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Vector3 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Vector3 = null;
         var _loc10_:Renamed7004 = null;
         var _loc11_:Vector3 = new Vector3(0,0,-1);
         var _loc12_:Number = 500;
         this.position.copy(param1.Renamed696().state.position);
         if(battleService.Renamed619().Renamed692().raycastStatic(this.position,_loc11_,255,_loc12_,null,this.Renamed1299))
         {
            this.Renamed1299.position.z += 10;
            _loc5_ = Renamed8211;
            _loc6_ = 200;
            if(this.Renamed1299.t > _loc6_)
            {
               _loc5_ *= (_loc12_ - this.Renamed1299.t) / (_loc12_ - _loc6_);
            }
            _loc7_ = this.Renamed1299.normal;
            _loc8_ = Math.acos(_loc7_.z);
            _loc9_ = new Vector3(-_loc7_.y,_loc7_.x,0);
            _loc9_.normalize();
            this.matrix.fromAxisAngle(_loc9_,_loc8_);
            this.matrix.getEulerAngles(this.eulerAngles);
            _loc10_ = Renamed7004(param2.getObject(Renamed7004));
            _loc10_.init(param3 * _loc5_,this.Renamed1299.position,this.eulerAngles,param4.Renamed8209,1);
            battleService.Renamed621().Renamed636(_loc10_);
         }
      }
      
      private function Renamed8219(param1:Renamed616, param2:Number, param3:Renamed8207) : void
      {
         this.position.z += 50;
         var _loc4_:set = set(param1.getObject(set));
         _loc4_.init(this.position,Renamed8216);
         var _loc5_:Renamed3264 = Renamed3264(param1.getObject(Renamed3264));
         var _loc6_:Number = Renamed8210 * param2;
         _loc5_.init(_loc6_,_loc6_,param3.Renamed8208,Math.random() * 2 * Math.PI,_loc4_);
         battleService.Renamed621().Renamed636(_loc5_);
      }
      
      private function Renamed8220(param1:Renamed616, param2:Number, param3:Renamed8207) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Renamed7061 = null;
         var _loc6_:Renamed3264 = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         while(_loc8_ < 3)
         {
            _loc4_ = Renamed8213 + Math.random() * Renamed8214;
            this.velocity.x = _loc4_ * (1 - 2 * Math.random());
            this.velocity.y = _loc4_ * (1 - 2 * Math.random());
            this.velocity.z = _loc4_ * 0.5 * (1 + Math.random());
            _loc5_ = Renamed7061(param1.getObject(Renamed7061));
            _loc5_.init(this.position,this.velocity,Renamed8215);
            _loc6_ = Renamed3264(param1.getObject(Renamed3264));
            _loc7_ = Renamed6385 * param2;
            _loc6_.init(_loc7_,_loc7_,param3.Renamed6423,Math.random() * 2 * Math.PI,_loc5_);
            battleService.Renamed621().Renamed636(_loc6_);
            _loc8_++;
         }
      }
   }
}

