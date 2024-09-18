package alternativa.tanks.service.itempropertyparams
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ItemInfoPanelBitmaps;
   import flash.display.BitmapData;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §3y§ implements ItemPropertyParamsService
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var logger:IClientLog;
      
      private static const §]$#§:Number = 180 / Math.PI;
      
      private var §native package extends§:Object;
      
      public function §3y§()
      {
         super();
      }
      
      public function getParams(param1:ItemGarageProperty) : §else package implements§
      {
         var _loc2_:Error = null;
         if(this.§native package extends§ == null)
         {
            this.§"L§();
         }
         var _loc3_:§else package implements§ = this.§native package extends§[param1];
         if(_loc3_ == null)
         {
            _loc2_ = new Error("Not found params for property " + param1);
            logger.logError("error",_loc2_.message);
            throw _loc2_;
         }
         return _loc3_;
      }
      
      public function §"L§() : void
      {
         this.§native package extends§ = {};
         this.§switch const override§(ItemGarageProperty.HULL_ARMOR,1,ItemInfoPanelBitmaps.armor,TanksLocale.TEXT_GARAGE_PROTECTION_PROPERTY,ItemProperty.HULL_ARMOR);
         this.§switch const override§(ItemGarageProperty.HULL_SPEED,2,ItemInfoPanelBitmaps.speed,TanksLocale.TEXT_GARAGE_MAX_SPEED_PROPERTY,ItemProperty.HULL_SPEED);
         this.§switch const override§(ItemGarageProperty.HULL_TURN_SPEED,3,ItemInfoPanelBitmaps.turnspeed,TanksLocale.TEXT_GARAGE_TURN_PROPERTY,ItemProperty.HULL_TURN_SPEED);
         this.§switch const override§(ItemGarageProperty.HULL_MASS,4,ItemInfoPanelBitmaps.hullMass,TanksLocale.TEXT_GARAGE_WEIGHT_PROPERTY,ItemProperty.HULL_MASS);
         this.§switch const override§(ItemGarageProperty.HULL_POWER,5,ItemInfoPanelBitmaps.hullPower,TanksLocale.TEXT_GARAGE_POWER_PROPERTY,ItemProperty.HULL_ACCELERATION,100);
         this.§null var var§(ItemGarageProperty.DAMAGE,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_FROM,ItemProperty.DAMAGE_TO,1,§8!+§.§1!_§);
         this.§switch const override§(ItemGarageProperty.ISIS_HEALING_PER_SECOND,1,ItemInfoPanelBitmaps.healRate,TanksLocale.TEXT_GARAGE_HEAL_PROPERTY,ItemProperty.ISIS_HEALING_PER_PERIOD);
         this.§switch const override§(ItemGarageProperty.ISIS_DAMAGE,2,ItemInfoPanelBitmaps.vampireRate,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_PER_PERIOD);
         this.§switch const override§(ItemGarageProperty.ISIS_SELF_HEALING_PERCENT,3,ItemInfoPanelBitmaps.selfMedicationPercent,TanksLocale.TEXT_GARAGE_SELF_HEAL_PROPERTY,ItemProperty.ISIS_SELF_HEALING_PERCENT);
         this.§switch const override§(ItemGarageProperty.ISIS_RADIUS,22,ItemInfoPanelBitmaps.healingRadius,TanksLocale.TEXT_GARAGE_RANGE_PROPERTY,ItemProperty.ISIS_RADIUS);
         this.§switch const override§(ItemGarageProperty.DAMAGE_PER_SECOND,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_PER_PERIOD);
         this.§null var var§(ItemGarageProperty.WEAPON_COOLDOWN_TIME,5,ItemInfoPanelBitmaps.rateOfFire,TanksLocale.TEXT_GARAGE_RELOAD_PROPERTY,ItemProperty.WEAPON_RELOAD_TIME,ItemProperty.WEAPON_CHARGING_TIME,0.001);
         this.§switch const override§(ItemGarageProperty.WEAPON_CHARGE_RATE,4,ItemInfoPanelBitmaps.rateOfFire,TanksLocale.TEXT_GARAGE_RELOAD_PROPERTY,ItemProperty.WEAPON_RELOAD_TIME,1);
         this.§switch const override§(ItemGarageProperty.AIMING_MODE_DAMAGE,1,ItemInfoPanelBitmaps.shaftDamage,TanksLocale.TEXT_GARAGE_SNIPING_DAMAGE_PROPERTY,ItemProperty.SHAFT_AIMING_MODE_MAX_DAMAGE);
         this.§switch const override§(ItemGarageProperty.SHAFT_AIMED_SHOT_IMPACT,2,ItemInfoPanelBitmaps.aimingImpactForce,TanksLocale.TEXT_GARAGE_SNIPING_IMPACT_PROPERTY,ItemProperty.SHAFT_AIMED_SHOT_IMPACT);
         this.§null var var§(ItemGarageProperty.SHAFT_ARCADE_DAMAGE,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_ARCADE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_FROM,ItemProperty.DAMAGE_TO,1,§8!+§.§1!_§);
         this.§switch const override§(ItemGarageProperty.TURRET_TURN_SPEED,7,ItemInfoPanelBitmaps.turretRotationRate,TanksLocale.TEXT_GARAGE_ROTATION_PROPERTY,ItemProperty.TURRET_TURN_SPEED);
         this.§switch const override§(ItemGarageProperty.SHOT_RANGE,9,ItemInfoPanelBitmaps.range,TanksLocale.TEXT_GARAGE_RANGE_PROPERTY,ItemProperty.WEAPON_MIN_DAMAGE_RADIUS);
         this.§switch const override§(ItemGarageProperty.WEAPON_MIN_DAMAGE_PERCENT,30,ItemInfoPanelBitmaps.minDamagePercent,TanksLocale.TEXT_GARAGE_DISTANT_DAMAGE_PROPERTY,ItemProperty.WEAPON_MIN_DAMAGE_PERCENT);
         this.§switch const override§(ItemGarageProperty.SMOKY_RESISTANCE,13,ItemInfoPanelBitmaps.mechResistance,TanksLocale.TEXT_GARAGE_SMOKY_PROTECTION_PROPERTY,ItemProperty.SMOKY_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.FIREBIRD_RESISTANCE,14,ItemInfoPanelBitmaps.fireResistance,TanksLocale.TEXT_GARAGE_FIREBIRD_PROTECTION_PROPERTY,ItemProperty.FIREBIRD_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.TWINS_RESISTANCE,15,ItemInfoPanelBitmaps.plasmaResistance,TanksLocale.TEXT_GARAGE_TWINS_PROTECTION_PROPERTY,ItemProperty.TWINS_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.RAILGUN_RESISTANCE,16,ItemInfoPanelBitmaps.railResistance,TanksLocale.TEXT_GARAGE_RAILGUN_PROTECTION_PROPERTY,ItemProperty.RAILGUN_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.ISIS_RESISTANCE,17,ItemInfoPanelBitmaps.vampireResistance,TanksLocale.TEXT_GARAGE_ISIDA_PROTECTION_PROPERTY,ItemProperty.ISIS_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.THUNDER_RESISTANCE,18,ItemInfoPanelBitmaps.thunderResistance,TanksLocale.TEXT_GARAGE_THUNDER_PROTECTION_PROPERTY,ItemProperty.THUNDER_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.FREEZE_RESISTANCE,19,ItemInfoPanelBitmaps.freezeResistance,TanksLocale.TEXT_GARAGE_FREEZE_PROTECTION_PROPERTY,ItemProperty.FREEZE_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.RICOCHET_RESISTANCE,20,ItemInfoPanelBitmaps.ricochetResistance,TanksLocale.TEXT_GARAGE_RICOCHET_PROTECTION_PROPERTY,ItemProperty.RICOCHET_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.SHAFT_RESISTANCE,21,ItemInfoPanelBitmaps.shaftResistance,TanksLocale.TEXT_GARAGE_SHAFT_PROTECTION_PROPERTY,ItemProperty.SHAFT_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.MINE_RESISTANCE,22,ItemInfoPanelBitmaps.§6!c§,TanksLocale.TEXT_GARAGE_MINE_PROTECTION_PROPERTY,ItemProperty.MINE_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.SHOTGUN_RESISTANCE,23,ItemInfoPanelBitmaps.§?P§,TanksLocale.TEXT_GARAGE_SHOTGUN_PROTECTION_PROPERTY,ItemProperty.SHOTGUN_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.MACHINE_GUN_RESISTANCE,24,ItemInfoPanelBitmaps.§override for override§,TanksLocale.TEXT_GARAGE_MACHINE_GUN_PROTECTION_PROPERTY,ItemProperty.MACHINE_GUN_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.ALL_RESISTANCE,25,ItemInfoPanelBitmaps.armor,TanksLocale.TEXT_GARAGE_ALL_PROTECTION_PROPERTY,ItemProperty.ALL_RESISTANCE);
         this.§switch const override§(ItemGarageProperty.WEAPON_IMPACT_FORCE,4,ItemInfoPanelBitmaps.impactForce,TanksLocale.TEXT_GARAGE_IMPACT_PROPERTY,ItemProperty.IMPACT_FORCE);
         this.§switch const override§(ItemGarageProperty.WEAPON_WEAKENING_COEFF,28,ItemInfoPanelBitmaps.piercingCoeff,TanksLocale.TEXT_GARAGE_PENETRATING_PROPERTY,ItemProperty.WEAPON_WEAKENING_COEFF);
         this.§switch const override§(ItemGarageProperty.CRITICAL_HIT_CHANCE,23,ItemInfoPanelBitmaps.percent,TanksLocale.TEXT_GARAGE_CRITICAL_CHANCE_PROPERTY,ItemProperty.CRITICAL_HIT_CHANCE);
         this.§switch const override§(ItemGarageProperty.CRITICAL_HIT_DAMAGE,24,ItemInfoPanelBitmaps.smokyCrit,TanksLocale.TEXT_GARAGE_CRITICAL_DAMAGE_PROPERTY,ItemProperty.CRITICAL_HIT_DAMAGE);
         this.§switch const override§(ItemGarageProperty.FIRE_DAMAGE,25,ItemInfoPanelBitmaps.firebird,TanksLocale.TEXT_GARAGE_BURN_PROPERTY,ItemProperty.FLAME_TEMPERATURE_LIMIT);
         this.§switch const override§(ItemGarageProperty.WEAPON_RETICLE_SPEED,26,ItemInfoPanelBitmaps.ricochetResistance,TanksLocale.TEXT_GARAGE_RICOCHET_PROTECTION_PROPERTY,ItemProperty.WEAPON_RETICLE_SPEED);
      }
      
      private function §switch const override§(param1:ItemGarageProperty, param2:int, param3:BitmapData, param4:String, param5:ItemProperty, param6:Number = 1) : void
      {
         var _loc7_:Vector.<ItemProperty> = new Vector.<ItemProperty>();
         _loc7_.push(param5);
         this.§;!7§(param1,param2,param3,localeService.getText(param4),_loc7_,§8!+§.§[2§,param6);
      }
      
      private function §null var var§(param1:ItemGarageProperty, param2:int, param3:BitmapData, param4:String, param5:ItemProperty, param6:ItemProperty, param7:Number = 1, param8:§8!+§ = null) : void
      {
         if(param8 == null)
         {
            param8 = §8!+§.§[2§;
         }
         var _loc9_:Vector.<ItemProperty> = new Vector.<ItemProperty>();
         _loc9_.push(param5);
         _loc9_.push(param6);
         this.§;!7§(param1,param2,param3,localeService.getText(param4),_loc9_,param8,param7);
      }
      
      private function §;!7§(param1:ItemGarageProperty, param2:int, param3:BitmapData, param4:String, param5:Vector.<ItemProperty>, param6:§8!+§, param7:Number = 1) : void
      {
         this.§native package extends§[param1] = new §else package implements§(param2,param3,param4,param5,param6,param7);
      }
   }
}

