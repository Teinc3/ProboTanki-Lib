package alternativa.tanks.camera
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed610;
   
   public class Renamed1458 implements Renamed611
   {
      [Inject]
      public static var battleService:BattleService;
      
      public function Renamed1458()
      {
         super();
      }
      
      public function activate() : void
      {
         this.Renamed1496().Renamed638(this);
      }
      
      public function update(param1:int, param2:int) : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      protected function Renamed739() : Renamed842
      {
         return this.Renamed1496().Renamed739();
      }
      
      protected function Renamed1496() : Renamed610
      {
         return battleService.Renamed621();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
      }
   }
}

