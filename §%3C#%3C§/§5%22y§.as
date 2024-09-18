package §<#<§
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.battle.battlefield.§dynamic for§;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   
   public class §5"y§ implements §%#e§
   {
      public function §5"y§()
      {
         super();
      }
      
      public function §case var try§(param1:Body, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         if(param1.tank.tankData.health > 0)
         {
            return §dynamic for§.§const for each§ - (§dynamic for§.§each null§ * param2 / param4 + (1 - §dynamic for§.§each null§) * Math.abs(param3) / param5);
         }
         return 0;
      }
   }
}

