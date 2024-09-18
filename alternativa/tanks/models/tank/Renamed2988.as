package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Renamed1140;
   import alternativa.tanks.utils.BitMask;
   
   public class Renamed2893 extends Renamed832 implements Renamed2712
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var weapon:Renamed990;
      
      private var Renamed2987:BitMask;
      
      public function Renamed2893(param1:Renamed990)
      {
         this.Renamed2987 = new BitMask();
         super();
         this.weapon = param1;
         this.Renamed2987.setBits(Renamed1140.DEAD);
      }
      
      public function Renamed2715() : void
      {
         this.weapon.activate();
      }
      
      public function Renamed2716() : void
      {
         this.weapon.deactivate();
      }
      
      public function Renamed2713(param1:int, param2:Boolean) : void
      {
         var _loc3_:Boolean = this.Renamed2987.isEmpty();
         this.Renamed2987.setBits(param1);
         if(_loc3_)
         {
            this.weapon.disable(param2);
         }
      }
      
      public function Renamed2714(param1:int) : void
      {
         var _loc2_:Boolean = this.Renamed2987.isEmpty();
         this.Renamed2987.clearBits(param1);
         if(!_loc2_ && this.Renamed2987.isEmpty())
         {
            this.weapon.enable();
         }
      }
   }
}

