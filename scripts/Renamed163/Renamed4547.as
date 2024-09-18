package Renamed4543
{
   import Renamed479.Renamed5281;
   import Renamed479.Renamed3840;
   import Renamed479.Renamed915;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   
   public class Renamed4547 extends Renamed4545 implements Renamed5281
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var camera:Renamed842;
      
      public function Renamed4547(param1:Renamed915)
      {
         super(param1);
         Renamed3841(new Renamed3840(Renamed717.CHASSIS_LEFT_MOVEMENT,Renamed717.CHASSIS_RIGHT_MOVEMENT,Renamed717.CENTER_TURRET,Renamed717.CHASSIS_FORWARD_MOVEMENT,Renamed717.CHASSIS_BACKWARD_MOVEMENT));
         this.camera = battleService.Renamed621().Renamed739();
      }
      
      public function Renamed3352(param1:Vector3) : void
      {
         param1.copy(this.camera.Renamed596);
      }
      
      override protected function Renamed5272(param1:Renamed717, param2:Boolean) : void
      {
         super.Renamed5272(param1,param2);
         switch(param1)
         {
            case Renamed717.ROTATE_TURRET_LEFT:
               Renamed991.rotateLeft(param2);
               break;
            case Renamed717.ROTATE_TURRET_RIGHT:
               Renamed991.rotateRight(param2);
               break;
            case Renamed717.CENTER_TURRET:
               Renamed991.center(param2);
         }
      }
   }
}

