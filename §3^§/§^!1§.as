package §3^§
{
   import § !g§.§class for case§;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§else set override§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.§dynamic for§;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   
   public class §^!1§ implements §%#e§, §else set override§
   {
      private var §2"T§:§class for case§;
      
      public function §^!1§()
      {
         super();
      }
      
      public function §function set in§(param1:§class for case§) : void
      {
         this.§2"T§ = param1;
      }
      
      public function §case var try§(param1:Body, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Tank = param1.tank;
         if(_loc6_.tankData.health > 0 && !_loc6_.§="%§(this.§2"T§))
         {
            return §dynamic for§.§const for each§ - (§dynamic for§.§each null§ * param2 / param4 + (1 - §dynamic for§.§each null§) * Math.abs(param3) / param5);
         }
         return 0;
      }
   }
}

