package Renamed19
{
   import Renamed602.Renamed603;
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
   import alternativa.tanks.battle.events.BattleEventDispatcher;
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
   import alternativa.tanks.models.weapons.targeting.Renamed3119;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import Renamed52.Renamed53;
   import Renamed52.Renamed5873;
   import Renamed54.Renamed55;
   import flash.utils.Dictionary;
   import Renamed381.Renamed3045;
   import Renamed381.Renamed2768;
   import Renamed388.Renamed4685;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed20 extends Renamed5873 implements Renamed53, Renamed43, Renamed511, Renamed4570
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const Renamed2948:Number = 1000000;
      
      private var weapons:Dictionary;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed20()
      {
         this.weapons = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed905();
      }
      
      private static function Renamed3057(param1:ClientObject) : Renamed3045
      {
         var _loc2_:Renamed2768 = Renamed2768(OSGi.getInstance().getService(Renamed2768));
         return _loc2_.Renamed3057(param1);
      }
      
      private static function Renamed3158(param1:ClientObject) : Renamed3044
      {
         var _loc2_:Renamed3043 = Renamed3043(modelRegistry.getModelsByInterface(Renamed3043)[0]);
         return _loc2_.Renamed3059(param1);
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed5823
      {
         var _loc2_:Renamed5833 = WeaponsManager.getThunderSFX(param1);
         return _loc2_.Renamed3159(param1);
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
         var _loc5_:Renamed3045 = Renamed3057(_loc3_.turret);
         var _loc6_:Renamed3044 = Renamed3158(_loc3_.turret);
         var _loc7_:Renamed4685 = new Renamed4685();
         _loc7_.putInitParams(Renamed55(_loc3_.turret.getParams(Renamed55)));
         _loc7_.objectLoaded(_loc3_.turret);
         var _loc8_:Renamed5823 = Renamed3159(param1);
         var _loc9_:Renamed3071 = new Renamed3119(param1,_loc2_,Renamed2948);
         var _loc10_:Renamed3065 = new Renamed3065(_loc5_.Renamed3067(),_loc5_.Renamed3068());
         var _loc11_:Renamed990 = new Renamed5835(_loc4_.Renamed3050.getInt(),_loc10_,_loc6_,_loc9_,_loc7_,_loc8_,this);
         this.weapons[param1] = _loc11_;
         return _loc11_;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed3045 = Renamed3057(_loc2_.turret);
         var _loc4_:Renamed3044 = Renamed3158(_loc2_.turret);
         var _loc5_:Renamed5823 = Renamed3159(param1);
         var _loc6_:Renamed4685 = new Renamed4685();
         _loc6_.putInitParams(Renamed55(_loc2_.turret.getParams(Renamed55)));
         _loc6_.objectLoaded(_loc2_.turret);
         var _loc7_:Renamed3065 = new Renamed3065(_loc3_.Renamed3067(),_loc3_.Renamed3068());
         var _loc8_:Renamed990 = new Renamed5874(_loc7_,_loc4_,_loc6_,_loc5_);
         this.weapons[param1] = _loc8_;
         return _loc8_;
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         delete this.weapons[param1.tank.Renamed695()];
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3454(param1:ClientObject) : void
      {
         var _loc2_:Renamed5874 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed3454();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3493(param1:ClientObject, param2:Renamed603) : void
      {
         var _loc3_:Renamed5874 = this.weapons[param1];
         if(_loc3_ != null)
         {
            _loc3_.Renamed3493(Renamed668.Renamed681(param2));
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3494(param1:ClientObject, param2:ClientObject, param3:Renamed603) : void
      {
         var _loc4_:Renamed2408 = null;
         var _loc5_:Tank = null;
         var _loc6_:Vector3 = null;
         var _loc7_:Renamed5874 = this.weapons[param1];
         if(_loc7_ != null)
         {
            _loc4_ = Renamed2407(OSGi.getInstance().getService(Renamed2408));
            if((_loc5_ = _loc4_.getTankData(param2).tank).Renamed696() != null)
            {
               _loc6_ = Renamed668.Renamed681(param3);
               Renamed668.localToGlobal(_loc5_.Renamed696(),_loc6_);
               _loc7_.Renamed3494(_loc5_,_loc6_);
            }
         }
      }
      
      public function Renamed3444(param1:int) : void
      {
         server.Renamed5875(param1);
      }
      
      public function Renamed3481(param1:int, param2:Vector3) : void
      {
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         server.Renamed5876(param1,Renamed668.Renamed677(param2));
      }
      
      public function Renamed3482(param1:int, param2:Vector3, param3:Body) : void
      {
         var _loc4_:Vector3 = param2.clone();
         Renamed668.globalToLocal(param3,_loc4_);
         var _loc5_:Renamed603 = Renamed668.Renamed677(_loc4_);
         var _loc6_:Tank = param3.tank;
         var _loc7_:int = _loc6_.incarnation;
         var _loc8_:Renamed603 = Renamed668.Renamed677(param3.state.position);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         server.Renamed5877(param1,_loc5_,_loc6_.Renamed695(),_loc7_,_loc8_,Renamed668.Renamed677(param2));
      }
   }
}

