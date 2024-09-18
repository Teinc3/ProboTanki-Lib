package Renamed226
{
   import Renamed3253.Renamed3254;
   import Renamed259.Renamed3255;
   import Renamed285.Renamed6374;
   import Renamed285.Renamed6375;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed921;
   import alternativa.tanks.models.weapon.shotgun.Renamed3438;
   import Renamed349.Renamed3105;
   import Renamed74.Renamed3436;
   
   public class Renamed4583 extends Renamed6375 implements Renamed6374, Renamed3432, Renamed3436
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed3077:Renamed664;
      
      private var Renamed3437:Renamed3438;
      
      public function Renamed4583()
      {
         this.Renamed3077 = new Renamed664();
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:Renamed3255 = Renamed3255(object.adapt(Renamed3255));
         var _loc3_:Renamed4585 = new Renamed4585(getInitParam(),_loc2_.Renamed3262("shot"),Renamed3254(object.adapt(Renamed3254)));
         param1.putParams(Renamed4585,_loc3_);
         var _loc4_:Renamed3433 = new Renamed3433(_loc3_);
         param1.putParams(Renamed3433,_loc4_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         Renamed3433(param1.removeParams(Renamed3433)).close();
         Renamed4585(param1.removeParams(Renamed4585)).close();
      }
      
      public function Renamed3444(param1:ClientObject, param2:Vector3, param3:Vector.<Renamed3105>) : void
      {
         this.Renamed3166(param1,param2);
      }
      
      private function Renamed3166(param1:ClientObject, param2:Vector3) : void
      {
         var _loc3_:Tank = null;
         var _loc4_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         var _loc5_:Renamed775;
         if(!(_loc5_ = _loc4_.getTankData(param1)).local)
         {
            this.Renamed3445(param1);
            _loc3_ = _loc5_.tank;
            this.Renamed3159(param1).Renamed3348(this.Renamed3441(param1),this.Renamed3077,_loc3_,param2);
         }
      }
      
      private function Renamed3445(param1:ClientObject) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         var _loc3_:Tank = _loc2_.getTankData(param1).tank;
         Renamed921.Renamed1055(_loc3_.Renamed1020(),_loc3_.Renamed1071(),this.Renamed3077);
      }
      
      public function Renamed3159(param1:ClientObject) : Renamed3433
      {
         return Renamed3433(param1.getParams(Renamed3433));
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
   }
}

