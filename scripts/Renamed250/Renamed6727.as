package Renamed250
{
   import Renamed235.Renamed607;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed6724;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed1442;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.smoky.Renamed3471;
   import alternativa.tanks.models.weapon.smoky.Renamed3499;
   import Renamed356.Renamed616;
   import flash.display.BlendMode;
   
   public class Renamed4592 implements Renamed3471
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed633:Renamed607;
      
      private var Renamed2460:Renamed616;
      
      private var sfxData:Renamed6721;
      
      public function Renamed4592(param1:Renamed607, param2:Renamed616, param3:Renamed6721)
      {
         super();
         this.Renamed633 = param1;
         this.Renamed2460 = param2;
         this.sfxData = param3;
      }
      
      public function Renamed3348(param1:Vector3, param2:Object3D) : void
      {
         this.Renamed3203(param2);
         this.Renamed3202(param1,param2);
         this.Renamed6725(param1,param2);
      }
      
      private function Renamed3203(param1:Object3D) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.shotSound,Renamed3499.Renamed3270);
         this.Renamed633.Renamed1121(Renamed1441.create(new Vector3(param1.x,param1.y,param1.z),_loc2_));
      }
      
      private function Renamed3202(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed6724 = Renamed6724(this.Renamed2460.getObject(Renamed6724));
         _loc3_.init(param1,param2,this.sfxData.Renamed5828,Renamed3499.Renamed3502,Renamed3499.Renamed3500,Renamed3499.Renamed3501);
         battleService.Renamed621().Renamed636(_loc3_);
      }
      
      private function Renamed6725(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed3266 = Renamed3266(this.Renamed2460.getObject(Renamed3266));
         var _loc4_:Renamed3265 = Renamed3265(this.Renamed2460.getObject(Renamed3265));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.Renamed3192);
         battleService.Renamed621().Renamed636(_loc3_);
      }
      
      public function Renamed3472(param1:Vector3) : void
      {
         this.Renamed3284(param1);
         this.Renamed3283(param1);
         this.Renamed3285(param1);
      }
      
      private function Renamed3285(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(this.Renamed2460.getObject(Renamed3266));
         var _loc3_:set = set(this.Renamed2460.getObject(set));
         _loc3_.init(param1,Renamed3499.Renamed3269);
         _loc2_.init(_loc3_,this.sfxData.Renamed3194);
         battleService.Renamed621().Renamed636(_loc2_);
      }
      
      private function Renamed3284(param1:Vector3) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.explosionSound,1);
         this.Renamed633.Renamed1121(Renamed1441.create(param1,_loc2_,Renamed3499.Renamed3503));
      }
      
      private function Renamed3283(param1:Vector3) : void
      {
         var _loc2_:set = set(this.Renamed2460.getObject(set));
         _loc2_.init(param1,Renamed3499.Renamed3269);
         var _loc3_:Renamed3264 = Renamed3264(this.Renamed2460.getObject(Renamed3264));
         _loc3_.init(this.sfxData.explosionSize,this.sfxData.explosionSize,this.sfxData.Renamed3188,0,_loc2_);
         battleService.Renamed621().Renamed636(_loc3_);
      }
      
      public function Renamed3473(param1:Vector3, param2:Vector3) : void
      {
         battleService.Renamed621().addDecal(param2,param1,Renamed3499.Renamed3504,this.sfxData.Renamed5830);
      }
      
      public function Renamed3474(param1:Vector3) : void
      {
         var _loc2_:set = set(this.Renamed2460.getObject(set));
         _loc2_.init(param1,Renamed3499.Renamed3269 + 50);
         var _loc3_:Renamed3264 = Renamed3264(this.Renamed2460.getObject(Renamed3264));
         _loc3_.Renamed6726(this.sfxData.criticalHitSize,this.sfxData.criticalHitSize,this.sfxData.Renamed6722,0,_loc2_,0.5,0.5,null,70,BlendMode.NORMAL,2);
         battleService.Renamed621().Renamed636(_loc3_);
      }
   }
}

