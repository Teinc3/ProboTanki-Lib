package alternativa.tanks.models.weapon.smoky
{
   import Renamed21.Renamed3488;
   import Renamed21.Renamed22;
   import Renamed250.Renamed3489;
   import Renamed602.3DPositionVector;
   import Renamed301.Renamed3043;
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed883;
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
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.Renamed3065;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3119;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import flash.utils.Dictionary;
   import Renamed381.Renamed3045;
   import Renamed381.Renamed2768;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed47 extends Renamed3488 implements Renamed22, Renamed43, Renamed3480, Renamed511
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const Renamed3490:Number = 1000000;
      
      private var Renamed2432:Renamed902;
      
      private var weapons:Dictionary;
      
      private var Renamed2546:Dictionary;
      
      private var Renamed3491:Renamed3483;
      
      public function Renamed47()
      {
         this.weapons = new Dictionary();
         this.Renamed2546 = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed905();
      }
      
      private static function Renamed3492(param1:ClientObject) : Renamed3045
      {
         var _loc2_:Renamed2768 = Renamed2768(OSGi.getInstance().getService(Renamed2768));
         return _loc2_.Renamed3057(param1);
      }
      
      private static function Renamed3158(param1:ClientObject) : Renamed3044
      {
         var _loc2_:Renamed3043 = Renamed3043(modelRegistry.getModelsByInterface(Renamed3043)[0]);
         return _loc2_.Renamed3059(param1);
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed3471
      {
         var _loc2_:Renamed3489 = WeaponsManager.getSmokySFX(param1);
         return _loc2_.Renamed3159(param1);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3454(param1:ClientObject) : void
      {
         var _loc2_:Renamed3476 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed3477();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3493(param1:ClientObject, param2:3DPositionVector) : void
      {
         var _loc3_:Renamed3476 = this.weapons[param1];
         if(_loc3_ != null)
         {
            _loc3_.Renamed3478(Renamed668.Renamed681(param2));
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3494(param1:ClientObject, param2:ClientObject, param3:3DPositionVector, param4:Number, param5:Boolean) : void
      {
         var _loc6_:Tank = null;
         var _loc7_:Vector3 = null;
         var _loc8_:Renamed3476 = this.weapons[param1];
         if(_loc8_ != null)
         {
            _loc6_ = this.Renamed2546[param2];
            if(_loc6_ != null)
            {
               _loc7_ = Renamed668.Renamed681(param3);
               Renamed668.localToGlobal(_loc6_.Renamed696(),_loc7_);
               _loc8_.Renamed3479(_loc6_,_loc7_,param4,param5);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3495(param1:ClientObject) : void
      {
         var _loc2_:Tank = this.Renamed2546[param1];
         this.Renamed3491.Renamed3487(_loc2_.Renamed696().state.position);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed3046 = new Renamed3046(param1);
         var _loc3_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc4_:Renamed86 = WeaponsManager.shotDatas[_loc3_.turret.id];
         var _loc5_:Renamed3071 = new Renamed3119(param1,_loc2_,Renamed3490);
         var _loc6_:Renamed3045 = Renamed3492(_loc3_.turret);
         var _loc7_:Renamed3065 = new Renamed3065(_loc6_.Renamed3067(),_loc6_.Renamed3068());
         this.Renamed3491 = new Renamed3483(_loc4_.Renamed3050.getInt(),_loc7_,_loc5_,Renamed3158(_loc3_.turret),Renamed3159(param1),this,new Renamed3150());
         this.weapons[param1] = this.Renamed3491;
         return this.Renamed3491;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed3045 = Renamed3492(_loc2_.turret);
         var _loc4_:Renamed3065 = new Renamed3065(_loc3_.Renamed3067(),_loc3_.Renamed3068());
         var _loc5_:Renamed990 = new Renamed3476(_loc4_,Renamed3159(param1));
         this.weapons[param1] = _loc5_;
         return _loc5_;
      }
      
      public function Renamed3444(param1:int) : void
      {
         server.Renamed3496(param1);
      }
      
      public function Renamed3481(param1:int, param2:Vector3) : void
      {
         server.Renamed3497(param1,Renamed668.Renamed677(param2));
      }
      
      public function Renamed3482(param1:int, param2:Vector3, param3:Body) : void
      {
         var _loc4_:Tank = param3.tank;
         var _loc5_:Vector3 = param2.clone();
         Renamed668.globalToLocal(param3,_loc5_);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3498(param1,_loc4_.Renamed695(),_loc4_.incarnation,Renamed668.Renamed677(param3.state.position),Renamed668.Renamed677(_loc5_),Renamed668.Renamed677(param2));
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         this.Renamed2546[param1.tank.tankData.user] = param1.tank;
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         delete this.Renamed2546[param1.tank.tankData.user];
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         var _loc2_:Renamed990 = this.weapons[param1.tank.tankData.user];
         if(_loc2_ == this.Renamed3491)
         {
            this.Renamed3491 = null;
         }
         delete this.weapons[param1.tank.tankData.user];
      }
   }
}

