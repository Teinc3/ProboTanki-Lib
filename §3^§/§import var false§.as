package §3^§
{
   import § !g§.§class for case§;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§<E§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.§]!m§;
   
   public class §import var false§ implements §]!m§, §<E§
   {
      private static const §;!>§:Number = 0.0001;
      
      private var §2"T§:§class for case§;
      
      public function §import var false§()
      {
         super();
      }
      
      public function §function set in§(param1:§class for case§) : void
      {
         this.§2"T§ = param1;
      }
      
      public function §case var try§(param1:Body) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Tank = param1.tank;
         if(_loc3_.§="%§(this.§2"T§))
         {
            _loc2_ = 0;
            if(_loc3_.§^"Y§() > §;!>§)
            {
               _loc2_ = 5;
            }
            else if(_loc3_.§^"Y§() < -§;!>§)
            {
               _loc2_ = 4;
            }
            return _loc3_.tankData.health > _loc3_.§9"7§() - §;!>§ ? Number(1) : Number(3 + _loc2_);
         }
         return 2;
      }
      
      public function §%"W§(param1:Body) : void
      {
      }
   }
}

