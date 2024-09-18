package Renamed50
{
   import Renamed602.Renamed603;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import Renamed349.Renamed3105;
   import flash.utils.Dictionary;
   import scpacker.tanks.WeaponsManager;
   import Renamed82.Renamed774;
   import Renamed82.Renamed83;
   import Renamed82.Renamed84;
   import Renamed82.Renamed8544;
   
   public class Renamed51 extends Renamed9818 implements Renamed83, Renamed511, Renamed43, Renamed4657
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed669:Vector3;
      
      private var Renamed3116:Renamed603;
      
      private var Renamed2546:Dictionary;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed51()
      {
         this.Renamed669 = new Vector3();
         this.Renamed3116 = new Renamed603();
         this.Renamed2546 = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed905();
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed9752
      {
         var _loc2_:Renamed9750 = WeaponsManager.getIsidaSFX(param1);
         return _loc2_.Renamed9751(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed84 = getInitParam();
         _loc2_.radius = Renamed668.Renamed674(_loc2_.radius);
         param1.putParams(Renamed84,_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed1554(param1:ClientObject, param2:Renamed8544, param3:Renamed3105) : void
      {
         this.Renamed9819(param1,param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed8551(param1:ClientObject) : void
      {
         var _loc2_:Renamed9820 = this.Renamed9821(param1);
         if(_loc2_ != null)
         {
            _loc2_.stop();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7205(param1:ClientObject) : void
      {
         var _loc2_:Renamed9820 = this.Renamed9821(param1);
         _loc2_.Renamed7205();
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed9752 = Renamed3159(param1);
         return new Renamed9794(param1,_loc2_.turret.getParams(Renamed84) as Renamed84,new Renamed3150(),_loc3_,this);
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed990 = new Renamed9820(Renamed3159(param1));
         param1.putParams(Renamed9820,_loc2_);
         return _loc2_;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed9804(param1:int, param2:RayHit) : void
      {
         var _loc3_:Body = null;
         var _loc4_:Tank = null;
         if(param2 != null)
         {
            _loc3_ = param2.shape.body;
            _loc4_ = _loc3_.tank;
            _loc4_.Renamed1031(param2.position);
            server.Renamed1554(param1,_loc4_.Renamed695(),_loc4_.incarnation,this.Renamed9822(param2));
         }
         else
         {
            server.Renamed7205(param1);
         }
      }
      
      public function stop(param1:int) : void
      {
         server.Renamed9823(param1);
      }
      
      public function onTick(param1:int, param2:RayHit) : void
      {
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         var _loc3_:Body = param2.shape.body;
         var _loc4_:Tank = _loc3_.tank;
         server.Renamed9824(param1,_loc4_.incarnation,Renamed668.Renamed677(_loc3_.state.position),this.Renamed9822(param2));
      }
      
      private function Renamed9819(param1:ClientObject, param2:Renamed8544, param3:Renamed3105) : void
      {
         var _loc4_:Tank = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Renamed603 = null;
         var _loc7_:Renamed9820 = this.Renamed9821(param1);
         if(_loc7_ != null)
         {
            if(param2 != Renamed8544.IDLE)
            {
               if(param3 != null && param3.target != null)
               {
                  _loc4_ = this.Renamed2546[param3.target.id];
               }
            }
            if(param2 == Renamed8544.IDLE || _loc4_ != null)
            {
               _loc5_ = this.Renamed669;
               _loc6_ = param3.Renamed3116;
               _loc5_.reset(_loc6_.x,_loc6_.y,_loc6_.z);
               _loc7_.Renamed9825(param2,_loc4_,_loc5_);
            }
            else
            {
               _loc7_.stop();
            }
         }
      }
      
      private function Renamed9822(param1:RayHit) : Renamed603
      {
         var _loc2_:Body = param1.shape.body;
         var _loc3_:Vector3 = Renamed668.Renamed669;
         _loc3_.copy(param1.position);
         Renamed668.globalToLocal(_loc2_,_loc3_);
         Renamed668.Renamed679(_loc3_,this.Renamed3116);
         return this.Renamed3116;
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         this.Renamed2546[param1.tank.Renamed695().id] = param1.tank;
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         delete this.Renamed2546[param1.tank.Renamed695().id];
      }
      
      private function Renamed9821(param1:ClientObject) : Renamed9820
      {
         return Renamed9820(param1.getParams(Renamed9820));
      }
   }
}

