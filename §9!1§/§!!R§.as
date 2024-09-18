package §9!1§
{
   import alternativa.tanks.models.weapon.shaft.§-"o§;
   import alternativa.tanks.models.weapon.shaft.§switch var override§;
   
   public class §!!R§ implements §var§
   {
      private var weapon:§-"o§;
      
      private var §6!v§:int;
      
      private var §9#]§:int;
      
      public function §!!R§(param1:§-"o§, param2:int)
      {
         super();
         this.weapon = param1;
         this.§6!v§ = param2;
      }
      
      public function enter(param1:int) : void
      {
         this.§9#]§ = param1 + this.§6!v§;
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.weapon.§%! §())
         {
            this.weapon.§#-§(§switch var override§.STOP);
         }
         else if(param1 >= this.§9#]§ && this.weapon.§6#r§(param1) == this.weapon.§function for native§())
         {
            this.weapon.§#-§(§switch var override§.SWITCH);
         }
      }
      
      public function exit() : void
      {
      }
      
      public function §#-§(param1:§switch var override§, param2:*) : void
      {
         switch(param1)
         {
            case §switch var override§.TRIGGER_RELEASE:
               this.weapon.§#-§(§switch var override§.TRIGGER_RELEASE);
         }
      }
   }
}

