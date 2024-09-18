package §%3§
{
   import § !g§.§class for case§;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§<E§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.§dynamic for§;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   
   public class §null package super§ implements §%#e§, §<E§
   {
      private static const §get for extends§:Number = 5;
      
      private var §2"T§:§class for case§;
      
      private var §0"u§:Body;
      
      public function §null package super§()
      {
         super();
      }
      
      public function §function set in§(param1:§class for case§) : void
      {
         this.§2"T§ = param1;
      }
      
      public function §%"W§(param1:Body) : void
      {
         this.§0"u§ = param1;
      }
      
      public function §case var try§(param1:Body, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Number = NaN;
         var _loc7_:Tank = param1.tank;
         if(_loc7_.tankData.health > 0 && !_loc7_.§="%§(this.§2"T§))
         {
            _loc6_ = param1 == this.§0"u§ ? Number(§get for extends§) : Number(0);
            return §dynamic for§.§const for each§ - (§dynamic for§.§each null§ * param2 / param4 + (1 - §dynamic for§.§each null§) * Math.abs(param3) / param5) + _loc6_;
         }
         return 0;
      }
   }
}

