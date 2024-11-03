package alternativa.tanks.models.weapon.shaft
{
   import Renamed602.3DPositionVector;
   import Renamed301.Renamed3043;
   import Renamed301.Renamed3044;
   import Renamed479.Renamed3148;
   import Renamed479.Renamed3149;
   import Renamed479.Renamed914;
   import Renamed479.Renamed915;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
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
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed3026;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.models.weapon.Renamed3065;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3151;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.utils.Dictionary;
   import Renamed381.Renamed3045;
   import Renamed381.Renamed2768;
   import Renamed79.Renamed80;
   import scpacker.tanks.WeaponsManager;
   import Renamed94.Renamed95;
   import Renamed94.Renamed96;
   import Renamed94.Renamed3152;
   
   public class Renamed45 extends Renamed3152 implements Renamed95, Renamed43, Renamed3153, Renamed511, Renamed3149
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      private static const Renamed2948:Number = 10000000000;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed3154:Dictionary;
      
      private var weapons:Dictionary;
      
      private var Renamed2369:ClientObject;
      
      private var Renamed3155:Dictionary;
      
      public function Renamed45()
      {
         this.Renamed3154 = new Dictionary();
         this.weapons = new Dictionary();
         this.Renamed3155 = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed3156);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed905();
      }
      
      private static function Renamed3158(param1:ClientObject) : Renamed3044
      {
         var _loc2_:Renamed3043 = Renamed3043(modelRegistry.getModelsByInterface(Renamed3043)[0]);
         return _loc2_.Renamed3059(param1);
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed3160
      {
         var _loc2_:Renamed3161 = WeaponsManager.getShaftSFX(param1);
         return _loc2_.Renamed3159(param1);
      }
      
      private static function Renamed3162(param1:Vector3, param2:Vector.<Body>, param3:Vector.<Vector3>) : Renamed3142
      {
         var _loc4_:Vector.<3DPositionVector> = null;
         var _loc5_:Vector.<String> = null;
         var _loc6_:Vector.<int> = null;
         var _loc7_:Vector.<3DPositionVector> = null;
         var _loc8_:Vector.<3DPositionVector> = null;
         var _loc9_:uint = 0;
         var _loc10_:int = 0;
         var _loc11_:Body = null;
         var _loc12_:Tank = null;
         var _loc13_:Vector3 = null;
         if(param2 != null && param2.length > 0)
         {
            _loc9_ = param2.length;
            _loc4_ = new Vector.<3DPositionVector>(_loc9_);
            _loc5_ = new Vector.<String>(_loc9_);
            _loc6_ = new Vector.<int>(_loc9_);
            _loc7_ = new Vector.<3DPositionVector>(_loc9_);
            _loc8_ = new Vector.<3DPositionVector>(_loc9_);
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc11_ = param2[_loc10_];
               _loc12_ = Tank(_loc11_.tank);
               _loc6_[_loc10_] = _loc12_.incarnation;
               _loc5_[_loc10_] = _loc12_.Renamed695().id;
               _loc13_ = param3[_loc10_];
               _loc8_[_loc10_] = Renamed668.Renamed677(_loc13_);
               Renamed668.globalToLocal(_loc11_,_loc13_);
               _loc4_[_loc10_] = Renamed668.Renamed677(_loc13_);
               _loc7_[_loc10_] = Renamed668.Renamed677(_loc11_.state.position);
               _loc10_++;
            }
         }
         return new Renamed3142(Renamed668.Renamed678(param1),_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed96 = getInitParam();
         _loc2_.Renamed133 = Renamed668.Renamed674(_loc2_.Renamed133);
         _loc2_.Renamed132 = Renamed668.Renamed674(_loc2_.Renamed132);
         param1.putParams(Renamed96,_loc2_);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3163(param1:ClientObject) : void
      {
         var _loc2_:Renamed3164 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed3165();
         }
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:3DPositionVector, param3:Vector.<String>, param4:Vector.<3DPositionVector>, param5:Number) : void
      {
         var _loc6_:Vector.<Vector3> = null;
         var _loc7_:Vector.<Body> = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:ClientObject = null;
         var _loc11_:Tank = null;
         var _loc12_:Renamed3164 = this.weapons[param1];
         if(_loc12_ != null)
         {
            _loc12_.Renamed3165();
            if(param3 != null)
            {
               _loc8_ = int(param4.length);
               _loc6_ = new Vector.<Vector3>(_loc8_);
               _loc7_ = new Vector.<Body>(_loc8_);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc10_ = Renamed2775.Renamed695(param3[_loc9_]);
                  _loc11_ = this.Renamed3155[_loc10_];
                  if(_loc11_ == null)
                  {
                     _loc7_[_loc9_] = null;
                  }
                  else
                  {
                     _loc7_[_loc9_] = _loc11_.Renamed696();
                     _loc6_[_loc9_] = Renamed668.Renamed681(param4[_loc9_]);
                     Renamed668.localToGlobal(_loc11_.Renamed696(),_loc6_[_loc9_]);
                  }
                  _loc9_++;
               }
            }
            _loc12_.Renamed3166(Renamed668.Renamed682(param2),_loc7_,_loc6_,param5);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3167(param1:ClientObject) : void
      {
         var _loc2_:Renamed3164 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed3168();
         }
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         this.Renamed2369 = param1;
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed96 = _loc2_.turret.getParams(Renamed96) as Renamed96;
         var _loc4_:Renamed2768 = Renamed2768(OSGi.getInstance().getService(Renamed2768));
         var _loc5_:Renamed3045 = _loc4_.Renamed3057(_loc2_.turret);
         var _loc6_:Renamed3150 = new Renamed3150();
         var _loc7_:Renamed3169 = new Renamed3169(param1);
         var _loc8_:Renamed3071 = new Renamed3151(param1,_loc2_.turret.id,_loc3_.weakeningCoeff);
         var _loc9_:Renamed3065 = new Renamed3065(_loc3_.aimingImpact * Renamed3026.Renamed3028.getNumber(),_loc5_.Renamed3068());
         var _loc10_:Renamed990 = new Renamed3170(_loc7_,battleService,battleEventDispatcher,this,_loc3_,_loc9_,_loc6_,this.Renamed3154,Renamed3148(_loc4_.Renamed1085(_loc2_)),_loc8_,Renamed3158(_loc2_.turret));
         this.weapons[param1] = _loc10_;
         return _loc10_;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed96 = _loc2_.turret.getParams(Renamed96) as Renamed96;
         var _loc4_:Renamed2768 = Renamed2768(OSGi.getInstance().getService(Renamed2768));
         var _loc5_:Renamed3045 = _loc4_.Renamed3057(_loc2_.turret);
         var _loc6_:Renamed3160 = Renamed3159(param1);
         var _loc7_:Renamed915 = param1.getParams(Renamed915) as Renamed915;
         var _loc8_:TankSpecification = _loc2_.Renamed2872;
         var _loc9_:Renamed990 = new Renamed3164(_loc5_.Renamed3067(),_loc3_,_loc6_,_loc7_,_loc8_);
         this.weapons[param1] = _loc9_;
         return _loc9_;
      }
      
      public function Renamed3171(param1:int, param2:Vector3, param3:Vector.<Body>, param4:Vector.<Vector3>) : void
      {
         var _loc5_:Renamed3142 = Renamed3162(param2,param3,param4);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3172(param1,_loc5_.staticHitPoint,_loc5_.tanks,_loc5_.Renamed3143,_loc5_.Renamed3144,_loc5_.Renamed3145,_loc5_.Renamed3146);
      }
      
      public function Renamed3173(param1:int, param2:Vector3, param3:Vector.<Body>, param4:Vector.<Vector3>) : void
      {
         var _loc5_:Renamed3142 = Renamed3162(param2,param3,param4);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3174(param1,_loc5_.staticHitPoint,_loc5_.tanks,_loc5_.Renamed3143,_loc5_.Renamed3144,_loc5_.Renamed3145,_loc5_.Renamed3146);
      }
      
      public function Renamed3175(param1:int) : void
      {
         server.Renamed3176(param1);
      }
      
      public function Renamed3177() : void
      {
         server.Renamed3178();
      }
      
      public function Renamed3179(param1:int) : void
      {
         server.Renamed3180(param1);
      }
      
      private function Renamed3156(param1:Renamed884) : void
      {
         this.Renamed3181(param1.tank);
         this.Renamed3155[param1.tank.Renamed695()] = param1.tank;
      }
      
      private function Renamed3181(param1:Tank) : void
      {
         var _loc2_:Renamed917 = param1.Renamed1075();
         this.Renamed3154[_loc2_.Renamed1023()] = param1;
         this.Renamed3154[_loc2_.Renamed1020()] = param1;
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         var _loc2_:ClientObject = param1.tank.Renamed695();
         if(_loc2_ == this.Renamed2369)
         {
            this.Renamed2369 = null;
         }
         delete this.weapons[_loc2_];
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         delete this.Renamed3155[param1.tank.Renamed695()];
         this.Renamed3182(param1.tank.Renamed1075());
      }
      
      private function Renamed3182(param1:Renamed917) : void
      {
         delete this.Renamed3154[param1.Renamed1023()];
         delete this.Renamed3154[param1.Renamed1020()];
      }
      
      public function Renamed3183() : void
      {
      }
      
      public function createLocalTurretController(param1:Renamed915, param2:Renamed775) : Renamed914
      {
         var _loc3_:Renamed96 = param2.turret.getParams(Renamed96) as Renamed96;
         var _loc4_:uint = Renamed80(modelRegistry.getModelsByInterface(Renamed80)[0]).getLaserPointerRedColor(param2.turret);
         var _loc5_:Renamed3184 = new Renamed3184(_loc3_.Renamed131,_loc4_);
         return new Renamed3148(param1,_loc5_,_loc3_.Renamed134);
      }
   }
}

