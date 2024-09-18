package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.§<"]§;
   import alternativa.tanks.utils.BitMask;
   
   public class §8"x§ extends §else package false§ implements §function package while§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var weapon:§4"3§;
      
      private var §get static§:BitMask;
      
      public function §8"x§(param1:§4"3§)
      {
         this.§get static§ = new BitMask();
         super();
         this.weapon = param1;
         this.§get static§.setBits(§<"]§.DEAD);
      }
      
      public function §break catch false§() : void
      {
         this.weapon.activate();
      }
      
      public function §8#0§() : void
      {
         this.weapon.deactivate();
      }
      
      public function §-!e§(param1:int, param2:Boolean) : void
      {
         var _loc3_:Boolean = this.§get static§.isEmpty();
         this.§get static§.setBits(param1);
         if(_loc3_)
         {
            this.weapon.disable(param2);
         }
      }
      
      public function §9!-§(param1:int) : void
      {
         var _loc2_:Boolean = this.§get static§.isEmpty();
         this.§get static§.clearBits(param1);
         if(!_loc2_ && this.§get static§.isEmpty())
         {
            this.weapon.enable();
         }
      }
   }
}

