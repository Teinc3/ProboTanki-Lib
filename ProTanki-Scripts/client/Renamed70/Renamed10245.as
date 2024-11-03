package Renamed70
{
   import Renamed1.Renamed6724;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed1442;
   import Renamed1.Renamed3266;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   
   public class Renamed10245
   {
      public static const Renamed10246:int = 120;
      
      private static const Renamed10247:int = 50;
      
      private var battleService:BattleService;
      
      private var sfxData:Renamed10232;
      
      public function Renamed10245(param1:BattleService, param2:Renamed10232)
      {
         super();
         this.battleService = param1;
         this.sfxData = param2;
      }
      
      public function Renamed3348(param1:Object3D, param2:Vector3) : void
      {
         this.Renamed6445(param2,param1);
         this.Renamed10248(param2,param1);
         this.Renamed5252(param1);
      }
      
      private function Renamed6445(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed6724 = Renamed6724(this.battleService.Renamed618().getObject(Renamed6724));
         _loc3_.init(param1,param2,this.sfxData.Renamed5828,Renamed10247,Renamed10246,Renamed10246);
         this.battleService.Renamed636(_loc3_);
      }
      
      private function Renamed10248(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc4_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.Renamed10249);
         this.battleService.Renamed636(_loc3_);
      }
      
      private function Renamed5252(param1:Object3D) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Renamed1442 = null;
         if(this.sfxData.shotSound != null)
         {
            _loc2_ = 0.8;
            _loc3_ = Renamed1442.create(this.sfxData.shotSound,_loc2_);
            Renamed668.Renamed669.reset(param1.x,param1.y,param1.z);
            this.battleService.Renamed637(Renamed1441.create(Renamed668.Renamed669,_loc3_));
         }
      }
   }
}

