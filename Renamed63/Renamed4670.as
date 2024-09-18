package Renamed63
{
   import Renamed301.Renamed3044;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.Renamed3046;
   import Renamed388.Renamed5834;
   import Renamed91.Renamed92;
   
   public class Renamed4670
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var impactForce:Number;
      
      private var sfxData:Renamed10138;
      
      private var Renamed3326:Renamed3044;
      
      private var callback:Renamed4671;
      
      private var Renamed5836:Renamed5834;
      
      private var Renamed4962:Renamed92;
      
      public function Renamed4670(param1:Renamed3046, param2:Renamed92, param3:Renamed10138, param4:Renamed4671 = null)
      {
         super();
         this.Renamed4962 = param2;
         this.impactForce = param1.Renamed3055().Renamed3067();
         this.sfxData = param3;
         this.Renamed3326 = param1.Renamed3058();
         this.Renamed5836 = null;
         this.callback = param4;
      }
      
      public function Renamed10189() : Renamed10141
      {
         var _loc1_:Renamed10141 = Renamed10141(battleService.Renamed618().getObject(Renamed10141));
         _loc1_.init(this.impactForce,this.Renamed4962,this.sfxData,this.Renamed3326,this.callback,this.Renamed5836);
         return _loc1_;
      }
   }
}

