package Renamed56
{
   import Renamed9.Renamed4921;
   import Renamed9.Renamed10;
   import Renamed9.Renamed11;
   import Renamed602.3DPositionVector;
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
   import alternativa.tanks.models.weapon.Renamed3065;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3151;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.utils.Dictionary;
   import Renamed381.Renamed3045;
   import Renamed381.Renamed2768;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed57 extends Renamed4921 implements Renamed11, Renamed43, Renamed511, Renamed4660
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      private var weapons:Dictionary;
      
      private var Renamed3155:Dictionary;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed57()
      {
         this.weapons = new Dictionary();
         this.Renamed3155 = new Dictionary();
         super();
         this.Renamed8980();
      }
      
      private static function Renamed3492(param1:ClientObject) : Renamed3045
      {
         var _loc2_:Renamed2768 = Renamed2768(OSGi.getInstance().getService(Renamed2768));
         return _loc2_.Renamed3057(param1);
      }
      
      private static function Renamed3159(param1:ClientObject) : Renamed10078
      {
         var _loc2_:Renamed10062 = WeaponsManager.getRailgunSFX(param1);
         return _loc2_.Renamed3159(param1);
      }
      
      private static function Renamed10107(param1:Vector.<3DPositionVector>) : Vector.<Vector3>
      {
         var _loc2_:Vector.<Vector3> = null;
         var _loc3_:int = 0;
         var _loc4_:3DPositionVector = null;
         if(param1 != null)
         {
            _loc2_ = new Vector.<Vector3>(param1.length);
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc4_ = param1[_loc3_];
               if(!Renamed668.Renamed676(_loc4_))
               {
                  return null;
               }
               _loc2_[_loc3_] = Renamed668.Renamed681(_loc4_);
               _loc3_++;
            }
            return _loc2_;
         }
         return null;
      }
      
      private static function Renamed10108(param1:Vector.<String>, param2:Dictionary) : Vector.<Body>
      {
         var _loc3_:Vector.<Body> = null;
         var _loc4_:int = 0;
         var _loc5_:Tank = null;
         if(param1 != null)
         {
            _loc3_ = new Vector.<Body>(param1.length);
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = param2[Renamed2775.Renamed695(param1[_loc4_])];
               if(_loc5_ == null)
               {
                  _loc3_[_loc4_] = null;
               }
               else
               {
                  _loc3_[_loc4_] = _loc5_.Renamed696();
               }
               _loc4_++;
            }
            return _loc3_;
         }
         return null;
      }
      
      private function Renamed8980() : void
      {
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed905();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed10 = getInitParam();
         param1.putParams(Renamed10079,new Renamed10079(_loc2_.chargingTimeMsec,_loc2_.weakeningCoeff));
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4935(param1:ClientObject) : void
      {
         var _loc2_:Renamed10088 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed4935();
         }
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:3DPositionVector, param3:Vector.<String>, param4:Vector.<3DPositionVector>) : void
      {
         var _loc5_:Vector.<Vector3> = null;
         var _loc6_:Vector.<Body> = null;
         var _loc7_:int = 0;
         var _loc8_:Body = null;
         var _loc9_:Renamed10088 = this.weapons[param1];
         if(_loc9_ != null)
         {
            _loc5_ = Renamed10107(param4);
            if(_loc5_ != null)
            {
               _loc6_ = Renamed10108(param3,this.Renamed3155);
               if(param3 != null)
               {
                  if(param3.length == _loc5_.length)
                  {
                     _loc7_ = 0;
                     while(_loc7_ < param3.length)
                     {
                        _loc8_ = _loc6_[_loc7_];
                        if(_loc8_ != null && _loc8_.tank != null)
                        {
                           Renamed668.localToGlobal(_loc8_,_loc5_[_loc7_]);
                        }
                        _loc7_++;
                     }
                  }
                  else
                  {
                     param3 = null;
                     _loc5_ = null;
                  }
               }
            }
            _loc9_.fire(Renamed668.Renamed682(param2),_loc6_,_loc5_);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4934(param1:ClientObject) : void
      {
         var _loc2_:Renamed10088 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed4934();
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed86 = WeaponsManager.shotDatas[_loc2_.turret.id];
         var _loc4_:Renamed3045 = Renamed3492(_loc2_.turret);
         var _loc5_:Renamed10079 = Renamed10079(_loc2_.turret.getParams(Renamed10079));
         var _loc6_:Renamed10078 = Renamed3159(param1);
         var _loc7_:Renamed3071 = new Renamed3151(param1,_loc2_.turret.id,_loc5_.Renamed10082());
         var _loc8_:Renamed3065 = new Renamed3065(_loc4_.Renamed3067(),_loc4_.Renamed3068());
         var _loc9_:Renamed990 = new Renamed10094(_loc7_,new Renamed3150(),_loc3_.Renamed3050.getInt(),_loc8_,_loc5_.Renamed10082(),_loc5_.Renamed10081(),_loc6_,this);
         this.weapons[param1] = _loc9_;
         return _loc9_;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed3045 = Renamed3492(_loc2_.turret);
         var _loc4_:Renamed10079 = Renamed10079(_loc2_.turret.getParams(Renamed10079));
         var _loc5_:Renamed10078 = Renamed3159(param1);
         var _loc6_:Renamed3065 = new Renamed3065(_loc3_.Renamed3067(),_loc3_.Renamed3068());
         var _loc7_:Renamed990 = new Renamed10088(_loc6_,_loc4_,_loc5_);
         this.weapons[param1] = _loc7_;
         return _loc7_;
      }
      
      public function Renamed10097(param1:int) : void
      {
         server.Renamed4920(param1);
      }
      
      public function Renamed3444(param1:int, param2:Vector3, param3:Vector.<Body>, param4:Vector.<Vector3>) : void
      {
         var _loc5_:Vector.<String> = null;
         var _loc6_:Vector.<3DPositionVector> = null;
         var _loc7_:Vector.<int> = null;
         var _loc8_:Vector.<3DPositionVector> = null;
         var _loc9_:Vector.<3DPositionVector> = null;
         var _loc10_:int = 0;
         var _loc11_:Body = null;
         var _loc12_:Vector3 = null;
         var _loc13_:Vector3 = null;
         var _loc14_:Tank = null;
         var _loc15_:int = int(param3.length);
         if(_loc15_ > 0)
         {
            _loc5_ = new Vector.<String>(_loc15_);
            _loc6_ = new Vector.<3DPositionVector>(_loc15_);
            _loc7_ = new Vector.<int>(_loc15_);
            _loc8_ = new Vector.<3DPositionVector>(_loc15_);
            _loc9_ = new Vector.<3DPositionVector>(_loc15_);
            _loc10_ = 0;
            while(_loc10_ < _loc15_)
            {
               _loc11_ = param3[_loc10_];
               _loc12_ = param4[_loc10_];
               _loc13_ = new Vector3();
               _loc13_.copy(_loc12_);
               Renamed668.globalToLocal(_loc11_,_loc12_);
               _loc14_ = _loc11_.tank;
               _loc7_[_loc10_] = _loc14_.incarnation;
               _loc5_[_loc10_] = _loc14_.Renamed695().id;
               _loc6_[_loc10_] = Renamed668.Renamed677(_loc12_);
               _loc8_[_loc10_] = Renamed668.Renamed677(_loc11_.state.position);
               _loc9_[_loc10_] = Renamed668.Renamed677(_loc13_);
               _loc10_++;
            }
         }
         var _loc16_:3DPositionVector = Renamed668.Renamed678(param2);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3496(param1,_loc16_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function Renamed10099(param1:int) : void
      {
         server.Renamed4919(param1);
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         this.Renamed3155[param1.tank.Renamed695()] = param1.tank;
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         delete this.Renamed3155[param1.tank.Renamed695()];
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         delete this.Renamed3155[param1.tank.Renamed695()];
      }
   }
}

