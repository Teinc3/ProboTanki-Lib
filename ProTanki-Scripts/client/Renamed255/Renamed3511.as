package Renamed3505
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   import alternativa.tanks.models.weapon.shared.Renamed615;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed3511 implements Renamed3532
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const Renamed6779:Number = 0.000001;
      
      private const Renamed6780:Number = 10000;
      
      private var Renamed2438:Renamed613;
      
      private var Renamed3427:Renamed615;
      
      private var Renamed6777:Number;
      
      public function Renamed3511(param1:String)
      {
         super();
         this.Renamed2438 = battleService.Renamed624();
         this.Renamed3427 = battleService.Renamed629();
         var _loc2_:Renamed86 = WeaponsManager.shotDatas[param1];
         this.Renamed6777 = Math.max(_loc2_.Renamed3053(),_loc2_.Renamed3051());
      }
      
      public function Renamed3385(param1:Tank, param2:Number, param3:Number) : Number
      {
         var _loc4_:Body = param1.Renamed696();
         var _loc5_:Number = this.Renamed2438.Renamed3385(_loc4_,param2,param3,this.Renamed6780,this.Renamed6777);
         return this.Renamed3427.Renamed3416(_loc4_) + _loc5_ * this.Renamed6779;
      }
   }
}

