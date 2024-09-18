package §9!1§
{
   import alternativa.tanks.models.weapon.shaft.§"!a§;
   import alternativa.tanks.models.weapon.shaft.§-"o§;
   import alternativa.tanks.models.weapon.shaft.§switch var override§;
   
   public class IdleState implements §var§
   {
      private var weapon:§-"o§;
      
      private var §,#P§:Boolean;
      
      public function IdleState(param1:§-"o§)
      {
         super();
         this.weapon = param1;
      }
      
      public function enter(param1:int) : void
      {
         this.§,#P§ = this.weapon.§override for var§();
         this.weapon.§%0§(§"!a§.RECHARGE);
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.§,#P§)
         {
            this.§^"3§();
         }
      }
      
      public function exit() : void
      {
      }
      
      public function §#-§(param1:§switch var override§, param2:*) : void
      {
         switch(param1)
         {
            case §switch var override§.TRIGGER_PULL:
               this.§7$§();
               break;
            case §switch var override§.TRIGGER_RELEASE:
               this.§'"L§();
         }
      }
      
      private function §7$§() : void
      {
         if(!this.§,#P§)
         {
            this.§,#P§ = true;
            this.§^"3§();
         }
      }
      
      private function §'"L§() : void
      {
         this.§,#P§ = false;
      }
      
      private function §^"3§() : void
      {
         if(this.weapon.§true for do§())
         {
            this.weapon.§#-§(§switch var override§.READY_TO_SHOOT);
            this.§,#P§ = false;
         }
      }
   }
}

