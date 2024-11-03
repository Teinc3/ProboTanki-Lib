package alternativa.tanks.service.itempropertyparams
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ItemInfoPanelBitmaps;
   import flash.display.BitmapData;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed564 implements ItemPropertyParamsService
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var logger:IClientLog;
      
      private static const Renamed3705:Number = 180 / Math.PI;
      
      private var Renamed3706:Object;
      
      public function Renamed564()
      {
         super();
      }
      
      public function getParams(param1:ItemGarageProperty) : Renamed1710
      {
         var _loc2_:Error = null;
         if(this.Renamed3706 == null)
         {
            this.Renamed3707();
         }
         var _loc3_:Renamed1710 = this.Renamed3706[param1];
         if(_loc3_ == null)
         {
            _loc2_ = new Error("Not found params for property " + param1);
            logger.logError("error",_loc2_.message);
            throw _loc2_;
         }
         return _loc3_;
      }
      
      public function Renamed3707() : void
      {
         this.Renamed3706 = {};
         this.Renamed3708(ItemGarageProperty.HULL_ARMOR,1,ItemInfoPanelBitmaps.armor,TanksLocale.TEXT_GARAGE_PROTECTION_PROPERTY,ItemProperty.HULL_ARMOR);
         this.Renamed3708(ItemGarageProperty.HULL_SPEED,2,ItemInfoPanelBitmaps.speed,TanksLocale.TEXT_GARAGE_MAX_SPEED_PROPERTY,ItemProperty.HULL_SPEED);
         this.Renamed3708(ItemGarageProperty.HULL_TURN_SPEED,3,ItemInfoPanelBitmaps.turnspeed,TanksLocale.TEXT_GARAGE_TURN_PROPERTY,ItemProperty.HULL_TURN_SPEED);
         this.Renamed3708(ItemGarageProperty.HULL_MASS,4,ItemInfoPanelBitmaps.hullMass,TanksLocale.TEXT_GARAGE_WEIGHT_PROPERTY,ItemProperty.HULL_MASS);
         this.Renamed3708(ItemGarageProperty.HULL_POWER,5,ItemInfoPanelBitmaps.hullPower,TanksLocale.TEXT_GARAGE_POWER_PROPERTY,ItemProperty.HULL_ACCELERATION,100);
         this.Renamed3709(ItemGarageProperty.DAMAGE,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_FROM,ItemProperty.DAMAGE_TO,1,Renamed2149.Renamed2151);
         this.Renamed3708(ItemGarageProperty.ISIS_HEALING_PER_SECOND,1,ItemInfoPanelBitmaps.healRate,TanksLocale.TEXT_GARAGE_HEAL_PROPERTY,ItemProperty.ISIS_HEALING_PER_PERIOD);
         this.Renamed3708(ItemGarageProperty.ISIS_DAMAGE,2,ItemInfoPanelBitmaps.vampireRate,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_PER_PERIOD);
         this.Renamed3708(ItemGarageProperty.ISIS_SELF_HEALING_PERCENT,3,ItemInfoPanelBitmaps.selfMedicationPercent,TanksLocale.TEXT_GARAGE_SELF_HEAL_PROPERTY,ItemProperty.ISIS_SELF_HEALING_PERCENT);
         this.Renamed3708(ItemGarageProperty.ISIS_RADIUS,22,ItemInfoPanelBitmaps.healingRadius,TanksLocale.TEXT_GARAGE_RANGE_PROPERTY,ItemProperty.ISIS_RADIUS);
         this.Renamed3708(ItemGarageProperty.DAMAGE_PER_SECOND,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_PER_PERIOD);
         this.Renamed3709(ItemGarageProperty.WEAPON_COOLDOWN_TIME,5,ItemInfoPanelBitmaps.rateOfFire,TanksLocale.TEXT_GARAGE_RELOAD_PROPERTY,ItemProperty.WEAPON_RELOAD_TIME,ItemProperty.WEAPON_CHARGING_TIME,0.001);
         this.Renamed3708(ItemGarageProperty.WEAPON_CHARGE_RATE,4,ItemInfoPanelBitmaps.rateOfFire,TanksLocale.TEXT_GARAGE_RELOAD_PROPERTY,ItemProperty.WEAPON_RELOAD_TIME,1);
         this.Renamed3708(ItemGarageProperty.AIMING_MODE_DAMAGE,1,ItemInfoPanelBitmaps.shaftDamage,TanksLocale.TEXT_GARAGE_SNIPING_DAMAGE_PROPERTY,ItemProperty.SHAFT_AIMING_MODE_MAX_DAMAGE);
         this.Renamed3708(ItemGarageProperty.SHAFT_AIMED_SHOT_IMPACT,2,ItemInfoPanelBitmaps.aimingImpactForce,TanksLocale.TEXT_GARAGE_SNIPING_IMPACT_PROPERTY,ItemProperty.SHAFT_AIMED_SHOT_IMPACT);
         this.Renamed3709(ItemGarageProperty.SHAFT_ARCADE_DAMAGE,3,ItemInfoPanelBitmaps.damage,TanksLocale.TEXT_GARAGE_ARCADE_DAMAGE_PROPERTY,ItemProperty.DAMAGE_FROM,ItemProperty.DAMAGE_TO,1,Renamed2149.Renamed2151);
         this.Renamed3708(ItemGarageProperty.TURRET_TURN_SPEED,7,ItemInfoPanelBitmaps.turretRotationRate,TanksLocale.TEXT_GARAGE_ROTATION_PROPERTY,ItemProperty.TURRET_TURN_SPEED);
         this.Renamed3708(ItemGarageProperty.SHOT_RANGE,9,ItemInfoPanelBitmaps.range,TanksLocale.TEXT_GARAGE_RANGE_PROPERTY,ItemProperty.WEAPON_MIN_DAMAGE_RADIUS);
         this.Renamed3708(ItemGarageProperty.WEAPON_MIN_DAMAGE_PERCENT,30,ItemInfoPanelBitmaps.minDamagePercent,TanksLocale.TEXT_GARAGE_DISTANT_DAMAGE_PROPERTY,ItemProperty.WEAPON_MIN_DAMAGE_PERCENT);
         this.Renamed3708(ItemGarageProperty.SMOKY_RESISTANCE,13,ItemInfoPanelBitmaps.mechResistance,TanksLocale.TEXT_GARAGE_SMOKY_PROTECTION_PROPERTY,ItemProperty.SMOKY_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.FIREBIRD_RESISTANCE,14,ItemInfoPanelBitmaps.fireResistance,TanksLocale.TEXT_GARAGE_FIREBIRD_PROTECTION_PROPERTY,ItemProperty.FIREBIRD_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.TWINS_RESISTANCE,15,ItemInfoPanelBitmaps.plasmaResistance,TanksLocale.TEXT_GARAGE_TWINS_PROTECTION_PROPERTY,ItemProperty.TWINS_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.RAILGUN_RESISTANCE,16,ItemInfoPanelBitmaps.railResistance,TanksLocale.TEXT_GARAGE_RAILGUN_PROTECTION_PROPERTY,ItemProperty.RAILGUN_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.ISIS_RESISTANCE,17,ItemInfoPanelBitmaps.vampireResistance,TanksLocale.TEXT_GARAGE_ISIDA_PROTECTION_PROPERTY,ItemProperty.ISIS_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.THUNDER_RESISTANCE,18,ItemInfoPanelBitmaps.thunderResistance,TanksLocale.TEXT_GARAGE_THUNDER_PROTECTION_PROPERTY,ItemProperty.THUNDER_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.FREEZE_RESISTANCE,19,ItemInfoPanelBitmaps.freezeResistance,TanksLocale.TEXT_GARAGE_FREEZE_PROTECTION_PROPERTY,ItemProperty.FREEZE_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.RICOCHET_RESISTANCE,20,ItemInfoPanelBitmaps.ricochetResistance,TanksLocale.TEXT_GARAGE_RICOCHET_PROTECTION_PROPERTY,ItemProperty.RICOCHET_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.SHAFT_RESISTANCE,21,ItemInfoPanelBitmaps.shaftResistance,TanksLocale.TEXT_GARAGE_SHAFT_PROTECTION_PROPERTY,ItemProperty.SHAFT_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.MINE_RESISTANCE,22,ItemInfoPanelBitmaps.Renamed1785,TanksLocale.TEXT_GARAGE_MINE_PROTECTION_PROPERTY,ItemProperty.MINE_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.SHOTGUN_RESISTANCE,23,ItemInfoPanelBitmaps.Renamed1788,TanksLocale.TEXT_GARAGE_SHOTGUN_PROTECTION_PROPERTY,ItemProperty.SHOTGUN_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.MACHINE_GUN_RESISTANCE,24,ItemInfoPanelBitmaps.Renamed1791,TanksLocale.TEXT_GARAGE_MACHINE_GUN_PROTECTION_PROPERTY,ItemProperty.MACHINE_GUN_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.ALL_RESISTANCE,25,ItemInfoPanelBitmaps.armor,TanksLocale.TEXT_GARAGE_ALL_PROTECTION_PROPERTY,ItemProperty.ALL_RESISTANCE);
         this.Renamed3708(ItemGarageProperty.WEAPON_IMPACT_FORCE,4,ItemInfoPanelBitmaps.impactForce,TanksLocale.TEXT_GARAGE_IMPACT_PROPERTY,ItemProperty.IMPACT_FORCE);
         this.Renamed3708(ItemGarageProperty.WEAPON_WEAKENING_COEFF,28,ItemInfoPanelBitmaps.piercingCoeff,TanksLocale.TEXT_GARAGE_PENETRATING_PROPERTY,ItemProperty.WEAPON_WEAKENING_COEFF);
         this.Renamed3708(ItemGarageProperty.CRITICAL_HIT_CHANCE,23,ItemInfoPanelBitmaps.percent,TanksLocale.TEXT_GARAGE_CRITICAL_CHANCE_PROPERTY,ItemProperty.CRITICAL_HIT_CHANCE);
         this.Renamed3708(ItemGarageProperty.CRITICAL_HIT_DAMAGE,24,ItemInfoPanelBitmaps.smokyCrit,TanksLocale.TEXT_GARAGE_CRITICAL_DAMAGE_PROPERTY,ItemProperty.CRITICAL_HIT_DAMAGE);
         this.Renamed3708(ItemGarageProperty.FIRE_DAMAGE,25,ItemInfoPanelBitmaps.firebird,TanksLocale.TEXT_GARAGE_BURN_PROPERTY,ItemProperty.FLAME_TEMPERATURE_LIMIT);
         this.Renamed3708(ItemGarageProperty.WEAPON_RETICLE_SPEED,26,ItemInfoPanelBitmaps.ricochetResistance,TanksLocale.TEXT_GARAGE_RICOCHET_PROTECTION_PROPERTY,ItemProperty.WEAPON_RETICLE_SPEED);
      }
      
      private function Renamed3708(param1:ItemGarageProperty, param2:int, param3:BitmapData, param4:String, param5:ItemProperty, param6:Number = 1) : void
      {
         var _loc7_:Vector.<ItemProperty> = new Vector.<ItemProperty>();
         _loc7_.push(param5);
         this.Renamed3710(param1,param2,param3,localeService.getText(param4),_loc7_,Renamed2149.Renamed2152,param6);
      }
      
      private function Renamed3709(param1:ItemGarageProperty, param2:int, param3:BitmapData, param4:String, param5:ItemProperty, param6:ItemProperty, param7:Number = 1, param8:Renamed2149 = null) : void
      {
         if(param8 == null)
         {
            param8 = Renamed2149.Renamed2152;
         }
         var _loc9_:Vector.<ItemProperty> = new Vector.<ItemProperty>();
         _loc9_.push(param5);
         _loc9_.push(param6);
         this.Renamed3710(param1,param2,param3,localeService.getText(param4),_loc9_,param8,param7);
      }
      
      private function Renamed3710(param1:ItemGarageProperty, param2:int, param3:BitmapData, param4:String, param5:Vector.<ItemProperty>, param6:Renamed2149, param7:Number = 1) : void
      {
         this.Renamed3706[param1] = new Renamed1710(param2,param3,param4,param5,param6,param7);
      }
   }
}

