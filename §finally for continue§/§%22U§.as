package §finally for continue§
{
   import §-!!§.§6!<§;
   import §7"j§.§!"_§;
   import §7"j§.§finally const package§;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §"U§ implements §finally const package§
   {
      private static var §6"o§:IModelService = IModelService(OSGi.getInstance().getService(IModelService));
      
      private var tankData:§7!9§;
      
      private var time:int;
      
      private var §-!R§:Boolean;
      
      public function §"U§(param1:§7!9§)
      {
         super();
         this.tankData = param1;
      }
      
      public function destroy() : void
      {
         this.tankData = null;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§-!R§)
         {
            return false;
         }
         if(this.time >= 0)
         {
            this.§extends set dynamic§();
            return false;
         }
         this.time += param1;
         return true;
      }
      
      public function kill() : void
      {
         this.§-!R§ = true;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.time = 0;
         this.§-!R§ = false;
      }
      
      private function §extends set dynamic§() : void
      {
         var _loc1_:Tank = null;
         var _loc2_:§true override§ = null;
         try
         {
            _loc1_ = this.tankData.tank;
            _loc1_.§0"t§().clearAccumulators();
            _loc1_.§in package default§().§2!<§();
            _loc1_.§0"t§().state.velocity.z = _loc1_.§0"t§().state.velocity.z + 500;
            _loc1_.§0"t§().state.angularVelocity.reset(2,2,2);
            _loc2_ = §true override§(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(1983242842,420087132)));
            _loc2_.§throw catch use§(null,this.tankData.tank,§!"_§.§var var use§);
         }
         catch(e:Error)
         {
         }
      }
   }
}

