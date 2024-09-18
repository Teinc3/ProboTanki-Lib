package Renamed1
{
   import Renamed141.Renamed4937;
   import Renamed141.Renamed4940;
   import Renamed141.Renamed4947;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import Renamed373.Renamed666;
   import forms.ranks.BigRankIcon;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class Renamed4603
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var Renamed1368:TextureMaterialRegistry;
      
      private static const Renamed6946:Class = Renamed6947;
      
      private static const Renamed6948:BitmapData = new Renamed6946().bitmapData;
      
      private static const Renamed6949:Class = Renamed6950;
      
      private static const Renamed6951:BitmapData = new Renamed6949().bitmapData;
      
      private static const Renamed6952:Class = Renamed6953;
      
      private static const Renamed6954:BitmapData = new Renamed6952().bitmapData;
      
      private static const origin:Vector3 = new Vector3();
      
      private static const Renamed6955:Vector3 = new Vector3(0,0,1);
      
      private static const Renamed1299:RayHit = new RayHit();
      
      public function Renamed4603()
      {
         super();
      }
      
      private static function Renamed6956(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         origin.reset(param1,param2,param3);
         var _loc5_:CollisionDetector = battleService.Renamed619().Renamed692();
         if(_loc5_.raycastStatic(origin,Renamed6955,Renamed666.Renamed690,param4,null,Renamed1299))
         {
            return Renamed1299.t;
         }
         return param4;
      }
      
      public function Renamed5251(param1:Tank, param2:int) : void
      {
         var _loc3_:Object3D = param1.Renamed1075().Renamed1268();
         var _loc4_:Number = this.Renamed6957(_loc3_.x,_loc3_.y,_loc3_.z);
         this.Renamed6958(_loc4_,_loc3_);
         this.createLabel(param1.tankData.userName,_loc4_,param2,_loc3_);
         this.Renamed6959(_loc4_,_loc3_);
         this.Renamed6960(_loc3_);
      }
      
      private function Renamed6957(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = 500;
         var _loc5_:Number = 2000;
         var _loc6_:Number = Renamed6956(param1,param2,param3,_loc5_);
         return Math.max(_loc4_,_loc6_);
      }
      
      private function Renamed6958(param1:Number, param2:Object3D) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Renamed4940 = null;
         var _loc6_:int = 6;
         var _loc7_:Number = 90;
         var _loc8_:Number = 0;
         var _loc9_:Number = Math.PI * 2 / _loc6_;
         var _loc10_:TextureMaterial = Renamed1368.getMaterial(Renamed6948);
         var _loc11_:int = 0;
         while(_loc11_ < _loc6_)
         {
            _loc3_ = Math.sin(_loc8_) * _loc7_;
            _loc4_ = Math.cos(_loc8_) * _loc7_;
            _loc5_ = Renamed4940(battleService.Renamed618().getObject(Renamed4940));
            _loc5_.init(500,200,30,param1,0.8,0.5,_loc3_,_loc4_,-50,param2,_loc10_);
            battleService.Renamed621().Renamed636(_loc5_);
            _loc8_ += _loc9_;
            _loc11_++;
         }
      }
      
      private function createLabel(param1:String, param2:Number, param3:int, param4:Object3D) : void
      {
         var _loc5_:BigRankIcon = new BigRankIcon();
         var _loc6_:Boolean = userInfoService.hasPremium(param1);
         _loc5_.init(_loc6_,param3);
         var _loc7_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         _loc7_.draw(_loc5_);
         var _loc8_:TextureMaterial = new TextureMaterial(_loc7_,false,true,MipMapping.PER_PIXEL,1);
         var _loc9_:Renamed4947 = Renamed4947(battleService.Renamed618().getObject(Renamed4947));
         _loc9_.init(500,270,270,0,param2 * 0.8,param2 * 0.15,0.35,0,0,50,param4,_loc8_,BlendMode.NORMAL);
         battleService.Renamed621().Renamed636(_loc9_);
      }
      
      private function Renamed6959(param1:Number, param2:Object3D) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:TextureMaterial = null;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Renamed4947 = null;
         if(GPUCapabilities.gpuEnabled)
         {
            _loc3_ = 15;
            _loc4_ = 100;
            _loc5_ = Renamed1368.getMaterial(Renamed6951);
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc7_ = Math.PI * 2 * Math.random();
               _loc8_ = Math.sin(_loc7_) * _loc4_;
               _loc9_ = Math.cos(_loc7_) * _loc4_;
               _loc10_ = -110 * _loc6_ - 50;
               _loc11_ = Renamed4947(battleService.Renamed618().getObject(Renamed4947));
               _loc11_.init(400,150,150,_loc7_,param1 * 0.7,param1 * 0.15,0.7,_loc8_,_loc9_,_loc10_,param2,_loc5_,BlendMode.ADD);
               battleService.Renamed621().Renamed636(_loc11_);
               _loc6_++;
            }
         }
      }
      
      private function Renamed6960(param1:Object3D) : void
      {
         var _loc2_:TextureMaterial = Renamed1368.getMaterial(Renamed6954);
         var _loc3_:Renamed4937 = Renamed4937(battleService.Renamed618().getObject(Renamed4937));
         _loc3_.init(900,220,3,true,param1,_loc2_);
         battleService.Renamed621().Renamed636(_loc3_);
      }
   }
}

