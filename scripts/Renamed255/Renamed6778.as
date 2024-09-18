package Renamed3505
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed3506 implements Renamed3532
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed2438:Renamed613;
      
      private var Renamed6777:Number;
      
      private var Renamed3452:Number;
      
      public function Renamed3506(param1:Renamed3046)
      {
         super();
         this.Renamed2438 = battleService.Renamed624();
         this.Renamed3452 = this.Renamed3430(param1);
         var _loc2_:Renamed86 = WeaponsManager.shotDatas[param1.Renamed3048().turret.id];
         this.Renamed6777 = Math.max(_loc2_.Renamed3053(),_loc2_.Renamed3051());
      }
      
      public function Renamed3385(param1:Tank, param2:Number, param3:Number) : Number
      {
         return this.Renamed2438.Renamed3385(param1.Renamed696(),param2,param3,this.Renamed3452,this.Renamed6777);
      }
      
      protected function Renamed3430(param1:Renamed3046) : Number
      {
         return param1.Renamed3058().Renamed3430();
      }
   }
}

