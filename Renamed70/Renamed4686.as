package Renamed70
{
   import Renamed301.Renamed3044;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.Renamed3046;
   import Renamed65.Renamed66;
   import Renamed388.Renamed5834;
   
   public class Renamed4686
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed3326:Renamed3044;
      
      private var impactForce:Number;
      
      private var Renamed10233:Renamed66;
      
      private var sfxData:Renamed10232;
      
      private var callback:Renamed4688;
      
      private var Renamed5836:Renamed5834;
      
      public function Renamed4686(param1:Renamed3046, param2:Renamed66, param3:Renamed10232, param4:Renamed4688 = null)
      {
         super();
         this.Renamed3326 = param1.Renamed3058();
         this.impactForce = param1.Renamed3055().Renamed3067();
         this.Renamed10233 = param2;
         this.sfxData = param3;
         this.Renamed5836 = null;
         this.callback = param4;
      }
      
      public function Renamed10189() : Renamed10231
      {
         var _loc1_:Renamed10231 = Renamed10231(battleService.Renamed618().getObject(Renamed10231));
         _loc1_.init(this.impactForce,this.Renamed10233,this.sfxData,this.Renamed3326,this.callback,this.Renamed5836);
         return _loc1_;
      }
   }
}

