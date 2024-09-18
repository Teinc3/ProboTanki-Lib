package alternativa.tanks.models.weapon.shotgun
{
   import Renamed226.Renamed3432;
   import Renamed226.Renamed3433;
   import Renamed34.Renamed3434;
   import Renamed34.Renamed36;
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed3435;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed921;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.models.weapon.Renamed3046;
   import Renamed58.Renamed59;
   import Renamed349.Renamed3105;
   import Renamed74.Renamed3436;
   import scpacker.tanks.WeaponsManager;
   
   public class Renamed46 extends Renamed3434 implements Renamed36, Renamed43, Renamed3436
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var shooter:ClientObject;
      
      private var Renamed3077:Renamed664;
      
      private var Renamed3437:Renamed3438;
      
      public function Renamed46()
      {
         this.Renamed3077 = new Renamed664();
         super();
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed3433
      {
         var _loc2_:Renamed3432 = WeaponsManager.Renamed3439(param1);
         return _loc2_.Renamed3159(param1);
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         this.shooter = param1;
         return new Renamed3440(getInitParam(),this.Renamed3441(param1),this.Renamed3442(_loc2_.turret).Renamed3443(param1),Renamed3159(param1));
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         return new Renamed2720();
      }
      
      public function Renamed3444(param1:ClientObject, param2:Vector3, param3:Vector.<Renamed3105>) : void
      {
         this.Renamed3445(param1);
         this.Renamed3446(param1,param3);
      }
      
      private function Renamed3441(param1:ClientObject) : Renamed3438
      {
         if(this.Renamed3437 == null)
         {
            this.Renamed3437 = new Renamed3438(param1);
         }
         else
         {
            this.Renamed3437.Renamed3060(param1);
         }
         return this.Renamed3437;
      }
      
      private function Renamed3442(param1:ClientObject) : Renamed59
      {
         return Renamed59(param1.getParams(Renamed59));
      }
      
      private function Renamed3445(param1:ClientObject) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         var _loc3_:Tank = _loc2_.getTankData(param1).tank;
         Renamed921.Renamed1055(_loc3_.Renamed1020(),_loc3_.Renamed1071(),this.Renamed3077);
      }
      
      private function Renamed3446(param1:ClientObject, param2:Vector.<Renamed3105>) : void
      {
         var _loc13_:Tank = null;
         var _loc3_:Renamed3105 = null;
         var _loc4_:Renamed2407 = null;
         var _loc5_:Tank = null;
         var _loc6_:Vector3 = null;
         var _loc7_:Number = NaN;
         var _loc8_:Vector3 = new Vector3();
         var _loc9_:Renamed3046 = new Renamed3046(param1);
         var _loc10_:Number = _loc9_.Renamed3055().Renamed3067();
         var _loc11_:Renamed3044 = _loc9_.Renamed3058();
         _loc4_ = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         var _loc12_:Renamed775;
         if(!(_loc12_ = _loc4_.getTankData(param1)).local)
         {
            _loc13_ = _loc4_.getTank(param1);
            _loc13_.Renamed1029(this.Renamed3077.Renamed689,this.Renamed3077.direction,-_loc9_.Renamed3055().Renamed3068());
         }
         for each(_loc3_ in param2)
         {
            _loc5_ = _loc4_.getTankData(_loc3_.target).tank;
            _loc6_ = Renamed668.Renamed681(_loc3_.Renamed3116);
            Renamed668.localToGlobal(_loc5_.Renamed696(),_loc6_);
            _loc7_ = _loc11_.Renamed3447(_loc6_.distanceTo(this.Renamed3077.Renamed689));
            _loc5_.Renamed1029(_loc6_,Renamed668.Renamed681(_loc3_.direction),_loc10_ * _loc7_ * _loc3_.Renamed3448);
         }
      }
   }
}

