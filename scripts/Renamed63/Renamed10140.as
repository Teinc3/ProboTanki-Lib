package Renamed63
{
   import Renamed1.Renamed6724;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed1442;
   import Renamed1.Renamed3266;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   
   public class Renamed10140
   {
      public static const Renamed3260:Number = 150;
      
      private static const Renamed10206:int = 100;
      
      private var battleService:BattleService;
      
      private var sfxData:Renamed10138;
      
      public function Renamed10140(param1:BattleService, param2:Renamed10138)
      {
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function Renamed3348(param1:Object3D, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Renamed1442 = null;
         var _loc6_:Renamed1441 = null;
         var _loc7_:Renamed6724 = Renamed6724(this.battleService.Renamed618().getObject(Renamed6724));
         _loc7_.init(param2,param1,this.sfxData.Renamed5828,Renamed10206,Renamed3260,Renamed3260);
         this.battleService.Renamed636(_loc7_);
         if(this.sfxData.shotSound != null)
         {
            _loc4_ = 0.8;
            _loc5_ = Renamed1442.create(this.sfxData.shotSound,_loc4_);
            _loc6_ = Renamed1441.create(param3,_loc5_);
            this.battleService.Renamed637(_loc6_);
         }
      }
      
      public function Renamed9475(param1:Object3D, param2:Vector3) : void
      {
         var _loc3_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc4_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc4_.init(param1,param2);
         _loc3_.init(_loc4_,this.sfxData.Renamed3192);
         this.battleService.Renamed636(_loc3_);
      }
   }
}

