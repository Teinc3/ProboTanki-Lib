package Renamed70
{
   import Renamed602.Renamed603;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed43;
   import Renamed65.Renamed66;
   import Renamed65.Renamed67;
   import Renamed65.Renamed10211;
   import flash.utils.Dictionary;
   import scpacker.tanks.WeaponsManager;
   
   public class Renamed71 extends Renamed10211 implements Renamed67, Renamed43, Renamed4688, Renamed511
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var weapons:Dictionary;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed71()
      {
         this.weapons = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed905();
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed10242
      {
         return WeaponsManager.getTwinsSFX(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed66 = getInitParam();
         _loc2_.distance = Renamed668.Renamed674(_loc2_.distance);
         _loc2_.speed = Renamed668.Renamed674(_loc2_.speed);
         _loc2_.shellRadius = Renamed668.Renamed674(_loc2_.shellRadius);
         param1.putParams(Renamed66,_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:int, param3:int, param4:Renamed603) : void
      {
         var _loc5_:Renamed10243 = null;
         if(battleService.Renamed646())
         {
            _loc5_ = this.weapons[param1];
            if(_loc5_ != null)
            {
               _loc5_.fire(param2,param3,Renamed668.Renamed681(param4));
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4934(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed10243 = null;
         if(battleService.Renamed646())
         {
            _loc3_ = this.weapons[param1];
            if(_loc3_ != null)
            {
               _loc3_.Renamed4934(param2);
            }
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed990 = new Renamed10244(param1,_loc2_.turret,_loc2_.turret.getParams(Renamed66) as Renamed66,Renamed3159(param1),this);
         this.weapons[param1] = _loc3_;
         return _loc3_;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed990 = new Renamed10243(param1,_loc2_.turret.getParams(Renamed66) as Renamed66,Renamed3159(param1));
         this.weapons[param1] = _loc3_;
         return _loc3_;
      }
      
      public function Renamed3444(param1:int, param2:int, param3:int, param4:Vector3) : void
      {
         if(battleService.Renamed646())
         {
            this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
            server.Renamed3496(param1,param3,param2,Renamed668.Renamed677(param4));
         }
      }
      
      public function Renamed10175(param1:int, param2:int) : void
      {
         if(battleService.Renamed646())
         {
            this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
            server.Renamed4919(param1,param2);
         }
      }
      
      public function Renamed10166(param1:int, param2:Body, param3:Vector3) : void
      {
         var _loc4_:Tank = null;
         var _loc5_:ClientObject = null;
         var _loc6_:Renamed603 = null;
         if(battleService.Renamed646())
         {
            _loc4_ = param2.tank;
            _loc5_ = _loc4_.Renamed695();
            _loc6_ = Renamed668.Renamed677(param2.state.position);
            server.Renamed10176(battleService.Renamed653(),param1,_loc5_,_loc6_,Renamed668.Renamed677(param3));
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         delete this.weapons[param1.tank.Renamed695()];
      }
      
      public function Renamed10162(param1:int, param2:Vector3) : void
      {
         if(battleService.Renamed646())
         {
            server.Renamed10177(battleService.Renamed653(),param1,Renamed668.Renamed677(param2));
         }
      }
   }
}

