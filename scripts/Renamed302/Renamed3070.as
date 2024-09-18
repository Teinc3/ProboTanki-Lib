package Renamed3069
{
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Renamed1150;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import flash.errors.IllegalOperationError;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class Renamed3070 extends Renamed832 implements Renamed990, Renamed1150, Renamed768
   {
      [Inject]
      public static var battleService:BattleService;
      
      protected static const Renamed3077:Renamed664 = new Renamed664();
      
      private var enabled:Boolean;
      
      private var Renamed3399:Boolean;
      
      private var Renamed3109:Boolean;
      
      private var controller:Renamed3150;
      
      private var Renamed3110:Renamed925;
      
      public function Renamed3070(param1:Renamed3046)
      {
         super();
         if(param1.isLocal())
         {
            this.controller = new Renamed3150();
            this.controller.setWeapon(this);
         }
         this.reset();
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         if(this.controller != null)
         {
            this.controller.init();
            Renamed619().Renamed815(this);
         }
      }
      
      public function destroy() : void
      {
         if(this.controller != null)
         {
            this.controller.destroy();
            this.Renamed3110 = null;
            Renamed619().Renamed816(this);
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
            this.Renamed3399 = this.controller.Renamed3209();
            if(this.Renamed3399)
            {
               if(this.Renamed3104())
               {
                  this.start(Renamed619().Renamed653());
               }
            }
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            if(this.Renamed3399)
            {
               this.Renamed3399 = false;
               this.stop(Renamed619().Renamed653(),param1);
            }
            this.enabled = false;
         }
      }
      
      public function reset() : void
      {
         this.Renamed3109 = false;
         this.Renamed3399 = false;
      }
      
      public function Renamed1151() : void
      {
         if(this.enabled)
         {
            this.Renamed3399 = true;
            if(this.Renamed3104())
            {
               this.start(Renamed619().Renamed653());
            }
         }
      }
      
      public function Renamed1152() : void
      {
         if(this.enabled)
         {
            this.Renamed3399 = false;
            this.stop(Renamed619().Renamed653(),true);
         }
      }
      
      protected function start(param1:int) : void
      {
         this.Renamed3109 = true;
      }
      
      protected function stop(param1:int, param2:Boolean) : void
      {
         this.Renamed3109 = false;
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(this.isEnabled() && this.Renamed3399 && !this.Renamed3091() && this.Renamed3104())
         {
            this.start(param1);
         }
      }
      
      public function Renamed3091() : Boolean
      {
         return this.isEnabled() && this.Renamed3109;
      }
      
      public function isEnabled() : Boolean
      {
         return this.enabled;
      }
      
      public function Renamed3095() : Renamed925
      {
         return this.Renamed3110;
      }
      
      protected function Renamed3104() : Boolean
      {
         return true;
      }
      
      public function Renamed2721() : ItemProperty
      {
         throw new IllegalOperationError();
      }
      
      protected function Renamed653() : int
      {
         return battleService.Renamed653();
      }
   }
}

