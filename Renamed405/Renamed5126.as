package Renamed405
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import flash.media.Sound;
   
   public class Renamed5126
   {
      private var battleService:BattleService;
      
      private var Renamed8577:Sound;
      
      private var Renamed8578:Sound;
      
      private var Renamed8579:Renamed8574;
      
      private var Renamed8580:Renamed8574;
      
      public function Renamed5126(param1:BattleService, param2:Sound, param3:Sound)
      {
         super();
         this.battleService = param1;
         this.Renamed8577 = param2;
         this.Renamed8578 = param3;
      }
      
      public function Renamed5145(param1:Vector3) : void
      {
         this.Renamed8581();
         if(this.Renamed8579 == null)
         {
            this.Renamed8579 = Renamed8574(this.battleService.Renamed618().getObject(Renamed8574));
            this.Renamed8579.init(this.Renamed8577,param1);
            this.battleService.Renamed619().Renamed801().Renamed1121(this.Renamed8579);
         }
      }
      
      public function Renamed5146(param1:Vector3) : void
      {
         this.Renamed8582();
         if(this.Renamed8580 == null)
         {
            this.Renamed8580 = Renamed8574(this.battleService.Renamed618().getObject(Renamed8574));
            this.Renamed8580.init(this.Renamed8578,param1);
            this.battleService.Renamed619().Renamed801().Renamed1121(this.Renamed8580);
         }
      }
      
      public function Renamed2317() : void
      {
         this.Renamed8582();
         this.Renamed8581();
      }
      
      private function Renamed8581() : void
      {
         if(this.Renamed8580 != null)
         {
            this.Renamed8580.kill();
            this.Renamed8580 = null;
         }
      }
      
      private function Renamed8582() : void
      {
         if(this.Renamed8579 != null)
         {
            this.Renamed8579.kill();
            this.Renamed8579 = null;
         }
      }
   }
}

