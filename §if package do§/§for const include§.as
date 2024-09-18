package §if package do§
{
   import §]#R§.§native var var§;
   import §]#R§.§switch var implements§;
   import §]#R§.§try set for§;
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§%"J§;
   import alternativa.tanks.models.weapon.§catch for for§;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.common.IWeaponCommonModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.common.WeaponCommonModelBase;
   
   public class §for const include§ extends WeaponCommonModelBase implements IWeaponCommonModelBase, §?"0§
   {
      private var §,n§:§2!s§;
      
      public function §for const include§()
      {
         super();
         _interfaces.push(IModel,IWeaponCommonModelBase,IObjectLoadListener,§?"0§,§catch for for§);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.§,n§ = OSGi.getInstance().getService(§finally var return§) as §2!s§;
         var _loc6_:§'!L§ = new §'!L§(param5,param4,param2 * §%"J§.§^"j§.getNumber(),param3 * §%"J§.§^"j§.getNumber());
         param1.putParams(§for const include§,_loc6_);
      }
      
      public function §class catch false§(param1:§7!9§) : §switch var implements§
      {
         var _loc2_:* = §7;§.§"!$§(param1.turret);
         var _loc3_:§try set for§ = null;
         var _loc4_:§switch var implements§ = §switch var implements§(param1.user.getParams(§switch var implements§));
         if(_loc4_ == null)
         {
            _loc3_ = new §try set for§(false,param1);
            param1.user.putParams(§try set for§,_loc3_);
            if(_loc2_ is §native var var§)
            {
               _loc4_ = _loc2_.createLocalTurretController(_loc3_,param1);
            }
            else
            {
               _loc4_ = new §switch var implements§(_loc3_);
            }
            param1.user.putParams(§switch var implements§,_loc4_);
         }
         return _loc4_;
      }
      
      public function §each const false§(param1:ClientObject) : §'!L§
      {
         return §'!L§(param1.getParams(§for const include§));
      }
      
      public function §null return§(param1:ClientObject) : Number
      {
         return this.§each const false§(param1).§@[§();
      }
      
      public function §&!M§(param1:ClientObject) : Number
      {
         return this.§each const false§(param1).§0#U§();
      }
   }
}

