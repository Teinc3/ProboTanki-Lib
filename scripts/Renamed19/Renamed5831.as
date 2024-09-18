package Renamed19
{
   import Renamed1.Renamed3264;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed1442;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import Renamed356.Renamed616;
   
   public class Renamed5822 implements Renamed5823
   {
      private static const Renamed5824:Number = 0.7;
      
      private static const Renamed5825:Number = 0.7;
      
      private static const Renamed3269:Number = 110;
      
      private static const Renamed3504:Number = 250;
      
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed693:Vector3 = new Vector3();
      
      private var battleService:BattleService;
      
      private var sfxData:Renamed5826;
      
      public function Renamed5822(param1:BattleService, param2:Renamed5826)
      {
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function Renamed3348(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed5827 = Renamed5827(this.battleService.Renamed618().getObject(Renamed5827));
         _loc3_.init(param2,param1,this.sfxData.Renamed5828);
         this.battleService.Renamed636(_loc3_);
         Renamed1273.setMatrix(param2.x,param2.y,param2.z,param2.rotationX,param2.rotationY,param2.rotationZ);
         Renamed1273.transformVector(param1,Renamed693);
         var _loc4_:Renamed1442 = Renamed1442.create(this.sfxData.shotSound,Renamed5824);
         this.battleService.Renamed637(Renamed1441.create(Renamed693,_loc4_));
         this.Renamed5829(param1,param2);
      }
      
      public function Renamed5829(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc4_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.Renamed3192);
         this.battleService.Renamed636(_loc3_);
      }
      
      public function Renamed3472(param1:Vector3) : void
      {
         this.Renamed3283(param1);
         this.Renamed3284(param1);
         this.Renamed3285(param1);
      }
      
      private function Renamed3285(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc3_:set = set(this.battleService.Renamed618().getObject(set));
         _loc3_.init(param1,Renamed3269);
         _loc2_.init(_loc3_,this.sfxData.Renamed3194);
         this.battleService.Renamed636(_loc2_);
      }
      
      public function Renamed3473(param1:Vector3, param2:Vector3) : void
      {
         this.battleService.Renamed621().addDecal(param2,param1,Renamed3504,this.sfxData.Renamed5830);
      }
      
      private function Renamed3283(param1:Vector3) : void
      {
         var _loc2_:Renamed616 = this.battleService.Renamed618();
         var _loc3_:set = set(_loc2_.getObject(set));
         _loc3_.init(param1,Renamed3269);
         var _loc4_:Renamed3264 = Renamed3264(_loc2_.getObject(Renamed3264));
         _loc4_.init(this.sfxData.explosionSize,this.sfxData.explosionSize,this.sfxData.Renamed3188,Math.random() * 2 * Math.PI,_loc3_);
         this.battleService.Renamed636(_loc4_);
      }
      
      private function Renamed3284(param1:Vector3) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.explosionSound,Renamed5825);
         this.battleService.Renamed637(Renamed1441.create(param1,_loc2_));
      }
   }
}

