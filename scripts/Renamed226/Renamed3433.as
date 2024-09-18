package Renamed226
{
   import Renamed1.Renamed6441;
   import Renamed1.Renamed3263;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import Renamed1.Renamed3266;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.shotgun.Renamed3438;
   import Renamed356.Renamed616;
   import flash.media.Sound;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed3433 implements AutoClosable, Renamed6441
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed5824:Number = 1;
      
      private static const Renamed6442:int = 500;
      
      private static const Renamed6443:int = 1000;
      
      private var Renamed6404:Renamed4585;
      
      private var Renamed6444:Renamed3263;
      
      public function Renamed3433(param1:Renamed4585)
      {
         super();
         this.Renamed6404 = param1;
      }
      
      public function Renamed3348(param1:Renamed3438, param2:Renamed664, param3:Renamed925, param4:Vector3) : void
      {
         this.Renamed6445(param1,param2,param3,param4);
         this.Renamed5252(param2);
         this.Renamed5829(param3);
      }
      
      private function Renamed5252(param1:Renamed664) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.Renamed6404.shotSound,Renamed5824);
         battleService.Renamed637(Renamed1441.create(param1.Renamed693,_loc2_));
      }
      
      private function Renamed6445(param1:Renamed3438, param2:Renamed664, param3:Renamed925, param4:Vector3) : void
      {
         var _loc5_:Renamed4584 = Renamed4584(battleService.Renamed618().getObject(Renamed4584));
         _loc5_.init(param1,param2,param3,param4,this.Renamed6404);
         battleService.Renamed636(_loc5_);
      }
      
      public function Renamed3456(param1:Object3D, param2:int) : void
      {
         var _loc3_:Sound = this.Renamed6404.reloadSound;
         this.Renamed6446(_loc3_,param2,Renamed6442,param1);
      }
      
      public function Renamed3455(param1:Object3D, param2:int) : void
      {
         var _loc3_:Sound = this.Renamed6404.magazineReloadSound;
         this.Renamed6446(_loc3_,param2,Renamed6443,param1);
      }
      
      public function Renamed3062() : void
      {
         if(this.Renamed6444 != null)
         {
            this.Renamed6444.kill();
         }
      }
      
      private function Renamed6446(param1:Sound, param2:int, param3:int, param4:Object3D) : void
      {
         var _loc5_:Renamed1442 = Renamed1442.create(param1,Renamed5824);
         var _loc6_:Renamed616 = battleService.Renamed618();
         this.Renamed6444 = Renamed3263(_loc6_.getObject(Renamed3263));
         var _loc7_:int = param2 - param1.length + param3;
         var _loc8_:int = 0;
         if(_loc7_ < 0)
         {
            _loc8_ = -_loc7_;
            _loc7_ = 0;
         }
         this.Renamed6444.init(_loc5_,param4,_loc7_,1,_loc8_,this);
         battleService.Renamed637(this.Renamed6444);
      }
      
      private function Renamed5829(param1:Renamed925) : void
      {
         var _loc2_:Renamed917 = param1.Renamed1075();
         var _loc3_:Object3D = _loc2_.Renamed1020();
         var _loc4_:Vector3 = param1.Renamed1071();
         var _loc5_:Renamed3266 = Renamed3266(battleService.Renamed618().getObject(Renamed3266));
         var _loc6_:Renamed3265 = Renamed3265(battleService.Renamed618().getObject(Renamed3265));
         _loc6_.init(_loc3_,_loc4_);
         _loc5_.init(_loc6_,this.Renamed6404.Renamed3192);
         battleService.Renamed636(_loc5_);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed6404 = null;
         if(this.Renamed6444 != null)
         {
            this.Renamed6444.kill();
         }
      }
      
      public function Renamed6447(param1:Renamed608) : void
      {
         if(this.Renamed6444 == param1)
         {
            this.Renamed6444 = null;
         }
      }
   }
}

