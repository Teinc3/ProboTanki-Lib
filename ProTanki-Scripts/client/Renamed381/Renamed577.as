package Renamed381
{
   import Renamed479.Renamed3149;
   import Renamed479.Renamed914;
   import Renamed479.Renamed915;
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed3026;
   import alternativa.tanks.models.weapon.Renamed2984;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.common.IWeaponCommonModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.common.WeaponCommonModelBase;
   
   public class Renamed577 extends WeaponCommonModelBase implements IWeaponCommonModelBase, Renamed2768
   {
      private var Renamed2969:Renamed2407;
      
      public function Renamed577()
      {
         super();
         _interfaces.push(IModel,IWeaponCommonModelBase,IObjectLoadListener,Renamed2768,Renamed2984);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.Renamed2969 = OSGi.getInstance().getService(Renamed2408) as Renamed2407;
         var _loc6_:Renamed3045 = new Renamed3045(param5,param4,param2 * Renamed3026.Renamed3028.getNumber(),param3 * Renamed3026.Renamed3028.getNumber());
         param1.putParams(Renamed577,_loc6_);
      }
      
      public function Renamed1085(param1:Renamed775) : Renamed914
      {
         var _loc2_:* = Renamed99.Renamed124(param1.turret);
         var _loc3_:Renamed915 = null;
         var _loc4_:Renamed914 = Renamed914(param1.user.getParams(Renamed914));
         if(_loc4_ == null)
         {
            _loc3_ = new Renamed915(false,param1);
            param1.user.putParams(Renamed915,_loc3_);
            if(_loc2_ is Renamed3149)
            {
               _loc4_ = _loc2_.createLocalTurretController(_loc3_,param1);
            }
            else
            {
               _loc4_ = new Renamed914(_loc3_);
            }
            param1.user.putParams(Renamed914,_loc4_);
         }
         return _loc4_;
      }
      
      public function Renamed3057(param1:ClientObject) : Renamed3045
      {
         return Renamed3045(param1.getParams(Renamed577));
      }
      
      public function Renamed3038(param1:ClientObject) : Number
      {
         return this.Renamed3057(param1).Renamed3137();
      }
      
      public function Renamed3039(param1:ClientObject) : Number
      {
         return this.Renamed3057(param1).Renamed8341();
      }
   }
}

