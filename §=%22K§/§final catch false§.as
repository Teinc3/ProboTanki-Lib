package §="K§
{
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.§class package try§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import flash.errors.IllegalOperationError;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class §final catch false§ extends §else package false§ implements §4"3§, §class package try§, §;!t§
   {
      [Inject]
      public static var battleService:BattleService;
      
      protected static const §=#0§:§ !8§ = new § !8§();
      
      private var enabled:Boolean;
      
      private var §,#P§:Boolean;
      
      private var §finally catch var§:Boolean;
      
      private var controller:§6#L§;
      
      private var §try do§:§1"o§;
      
      public function §final catch false§(param1:§extends for final§)
      {
         super();
         if(param1.isLocal())
         {
            this.controller = new §6#L§();
            this.controller.setWeapon(this);
         }
         this.reset();
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         if(this.controller != null)
         {
            this.controller.init();
            §'x§().§%#9§(this);
         }
      }
      
      public function destroy() : void
      {
         if(this.controller != null)
         {
            this.controller.destroy();
            this.§try do§ = null;
            §'x§().§%"7§(this);
         }
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.disable(true);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.§,#P§ = this.controller.§override for var§();
            if(this.§,#P§)
            {
               if(this.§8"G§())
               {
                  this.start(§'x§().§]"d§());
               }
            }
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            if(this.§,#P§)
            {
               this.§,#P§ = false;
               this.stop(§'x§().§]"d§(),param1);
            }
            this.enabled = false;
         }
      }
      
      public function reset() : void
      {
         this.§finally catch var§ = false;
         this.§,#P§ = false;
      }
      
      public function §;>§() : void
      {
         if(this.enabled)
         {
            this.§,#P§ = true;
            if(this.§8"G§())
            {
               this.start(§'x§().§]"d§());
            }
         }
      }
      
      public function §#w§() : void
      {
         if(this.enabled)
         {
            this.§,#P§ = false;
            this.stop(§'x§().§]"d§(),true);
         }
      }
      
      protected function start(param1:int) : void
      {
         this.§finally catch var§ = true;
      }
      
      protected function stop(param1:int, param2:Boolean) : void
      {
         this.§finally catch var§ = false;
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(this.isEnabled() && this.§,#P§ && !this.§5#T§() && this.§8"G§())
         {
            this.start(param1);
         }
      }
      
      public function §5#T§() : Boolean
      {
         return this.isEnabled() && this.§finally catch var§;
      }
      
      public function isEnabled() : Boolean
      {
         return this.enabled;
      }
      
      public function §2#N§() : §1"o§
      {
         return this.§try do§;
      }
      
      protected function §8"G§() : Boolean
      {
         return true;
      }
      
      public function §catch var§() : ItemProperty
      {
         throw new IllegalOperationError();
      }
      
      protected function §]"d§() : int
      {
         return battleService.§]"d§();
      }
   }
}

