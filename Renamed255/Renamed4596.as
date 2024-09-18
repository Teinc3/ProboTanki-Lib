package Renamed3505
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed4596 implements Renamed3532
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const Renamed2948:Number = 10000000000;
      
      private var Renamed2438:Renamed613;
      
      private var Renamed6777:Number;
      
      public function Renamed4596(param1:String)
      {
         super();
         this.Renamed2438 = battleService.Renamed624();
         var _loc2_:Renamed86 = WeaponsManager.shotDatas[param1];
         this.Renamed6777 = Math.max(_loc2_.Renamed3054.getNumber(),_loc2_.Renamed3052.getNumber());
      }
      
      public function Renamed3385(param1:Tank, param2:Number, param3:Number) : Number
      {
         return this.Renamed2438.Renamed3385(param1.Renamed696(),param2,param3,this.Renamed2948,this.Renamed6777);
      }
   }
}

