package Renamed63
{
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
   import flash.utils.Dictionary;
   import scpacker.tanks.WeaponsManager;
   import Renamed91.Renamed10170;
   import Renamed91.Renamed92;
   import Renamed91.Renamed93;
   
   public class Renamed64 extends Renamed10170 implements Renamed93, Renamed43, Renamed4671, Renamed511
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private var Renamed2432:Renamed902;
      
      private var weapons:Dictionary;
      
      public function Renamed64()
      {
         this.weapons = new Dictionary();
         super();
         this.Renamed8980();
      }
      
      private static function Renamed10171(param1:Number) : Number
      {
         return param1 * 32767;
      }
      
      private static function Renamed10172(param1:Number) : Number
      {
         return param1 / 32767;
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed10137
      {
         return WeaponsManager.getRicochetSFXModel(param1);
      }
      
      private function Renamed8980() : void
      {
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed905();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Renamed10173 = this.weapons[param1];
         if(_loc5_ != null)
         {
            shotDirection.reset(Renamed10172(param2),Renamed10172(param3),Renamed10172(param4)).normalize();
            _loc5_.Renamed3454(shotDirection);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4934(param1:ClientObject) : void
      {
         var _loc2_:Renamed10173 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed10174();
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed92 = getInitParam();
         _loc2_.shellRadius = Renamed668.Renamed674(_loc2_.shellRadius);
         _loc2_.shellSpeed = Renamed668.Renamed674(_loc2_.shellSpeed);
         _loc2_.shotDistance = Renamed668.Renamed674(_loc2_.shotDistance);
         param1.putParams(Renamed92,_loc2_);
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed990 = new Renamed4668(param1,_loc2_.turret.getParams(Renamed92) as Renamed92,Renamed3159(param1),this);
         this.weapons[param1] = _loc3_;
         return _loc3_;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed990 = new Renamed10173(param1,_loc2_.turret.getParams(Renamed92) as Renamed92,Renamed3159(param1));
         this.weapons[param1] = _loc3_;
         return _loc3_;
      }
      
      public function Renamed3444(param1:int, param2:int, param3:Vector3) : void
      {
         if(battleService.Renamed646())
         {
            this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
            server.Renamed3496(param1,param2,Renamed10171(param3.x),Renamed10171(param3.y),Renamed10171(param3.z));
         }
      }
      
      public function Renamed10175(param1:int) : void
      {
         if(battleService.Renamed646())
         {
            this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
            server.Renamed4919(param1);
         }
      }
      
      public function Renamed10166(param1:int, param2:Body, param3:Vector.<Vector3>) : void
      {
         var _loc4_:Tank = null;
         if(battleService.Renamed646())
         {
            _loc4_ = param2.tank;
            server.Renamed10176(battleService.Renamed653(),_loc4_.Renamed695(),param1,Renamed668.Renamed677(param2.state.position),Renamed668.Renamed701(param3));
         }
      }
      
      public function Renamed10162(param1:int, param2:Vector.<Vector3>) : void
      {
         if(battleService.Renamed646())
         {
            server.Renamed10177(battleService.Renamed653(),param1,Renamed668.Renamed701(param2));
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         delete this.weapons[param1.tank.Renamed695()];
      }
   }
}

