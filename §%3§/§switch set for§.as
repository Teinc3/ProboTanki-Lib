package §%3§
{
   import § !g§.§class for case§;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§<E§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.§set set get§;
   
   public class §switch set for§ implements §set set get§, §<E§
   {
      private var §2"T§:§class for case§;
      
      private var §0"u§:Body;
      
      public function §switch set for§()
      {
         super();
      }
      
      public function §do do§(param1:Body) : Number
      {
         var _loc2_:Tank = param1.tank;
         if(_loc2_.tankData.health <= 0)
         {
            return 0;
         }
         if(_loc2_.§="%§(this.§2"T§))
         {
            return 0;
         }
         if(param1 == this.§0"u§)
         {
            return 10;
         }
         return 1;
      }
      
      public function §function set in§(param1:§class for case§) : void
      {
         this.§2"T§ = param1;
      }
      
      public function §%"W§(param1:Body) : void
      {
         this.§0"u§ = param1;
      }
      
      public function §throw set break§(param1:Body) : Boolean
      {
         var _loc2_:Tank = param1.tank;
         return _loc2_.§="%§(this.§2"T§);
      }
   }
}

