package Renamed72
{
   import Renamed31.Renamed6812;
   import Renamed31.Renamed32;
   import Renamed31.Renamed33;
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
   import alternativa.tanks.models.weapon.Renamed3040;
   import alternativa.tanks.models.weapon.shared.Renamed3367;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import flash.utils.Dictionary;
   import Renamed373.Renamed665;
   import Renamed384.Renamed8348;
   import Renamed384.Renamed8354;
   import Renamed384.Renamed4684;
   import scpacker.tanks.WeaponsManager;
   import Renamed89.Renamed9496;
   import Renamed89.Renamed90;
   
   public class Renamed73 extends Renamed6812 implements Renamed32, Renamed43, Renamed4684, Renamed511
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed2369:ClientObject;
      
      private var weapons:Dictionary;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed73()
      {
         this.targets = new Vector.<String>();
         this.Renamed6865 = new Vector.<int>();
         this.weapons = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed905();
      }
      
      private static function Renamed9497(param1:ClientObject) : Renamed90
      {
         return Renamed90(param1.getParams(Renamed90));
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed33 = getInitParam();
         var _loc3_:Renamed3040 = new Renamed3040(_loc2_.coneAngle,Renamed668.Renamed674(_loc2_.range));
         param1.putParams(Renamed3040,_loc3_);
      }
      
      [Obfuscation(rename="false")]
      public function startFire(param1:ClientObject) : void
      {
         var _loc2_:Renamed9495 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.startFire();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4862(param1:ClientObject) : void
      {
         var _loc2_:Renamed9495 = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.Renamed4862();
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         var _loc2_:ClientObject = param1.tank.Renamed695();
         if(this.Renamed2369 == _loc2_)
         {
            this.Renamed2369 = null;
         }
         delete this.weapons[_loc2_];
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         this.Renamed2369 = param1;
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed665 = battleService.Renamed619().Renamed692();
         var _loc4_:Renamed3040 = Renamed3040(_loc2_.turret.getParams(Renamed3040));
         var _loc5_:Renamed3367 = new Renamed3367(_loc4_.Renamed3042(),_loc4_.Renamed3041(),Renamed9496.Renamed9498,Renamed9496.Renamed9499,_loc3_,battleService.Renamed626());
         var _loc6_:Renamed3150 = new Renamed3150();
         var _loc7_:Renamed90 = Renamed9497(_loc2_.turret);
         var _loc8_:Number = _loc7_.Renamed9500();
         var _loc9_:Number = _loc7_.Renamed9501();
         var _loc10_:Number = _loc7_.Renamed9502();
         var _loc11_:Renamed990 = new Renamed8348(_loc8_,_loc9_,_loc10_,_loc7_.Renamed9503(),_loc5_,_loc6_,this,this.Renamed3159(param1));
         this.weapons[param1] = _loc11_;
         return _loc11_;
      }
      
      private function Renamed3159(param1:ClientObject) : Renamed8354
      {
         var _loc2_:Renamed775 = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(param1);
         var _loc3_:Renamed3040 = Renamed3040(_loc2_.turret.getParams(Renamed3040));
         var _loc4_:Renamed10255 = WeaponsManager.getFlamethrowerSFX(param1);
         return _loc4_.Renamed10256(_loc3_.Renamed3042(),_loc3_.Renamed3041(),param1);
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed990 = new Renamed9495(this.Renamed3159(param1));
         this.weapons[param1] = _loc2_;
         return _loc2_;
      }
      
      public function start(param1:int) : void
      {
         server.Renamed4860(param1);
      }
      
      public function stop(param1:int) : void
      {
         server.Renamed4861(param1);
      }
      
      public function onTick(param1:Renamed990, param2:Vector.<Body>, param3:Vector.<Number>, param4:Vector.<Vector3>, param5:int) : void
      {
         var _loc6_:Vector.<Renamed603> = null;
         var _loc7_:Vector.<Renamed603> = null;
         var _loc8_:int = 0;
         var _loc9_:Body = null;
         if(param1 == this.weapons[this.Renamed2369])
         {
            this.Renamed9504(param2);
            _loc6_ = new Vector.<Renamed603>(param2.length);
            _loc7_ = new Vector.<Renamed603>(param2.length);
            _loc8_ = 0;
            while(_loc8_ < param2.length)
            {
               _loc9_ = param2[_loc8_];
               _loc6_[_loc8_] = Renamed668.Renamed677(_loc9_.state.position);
               _loc7_[_loc8_] = Renamed668.Renamed677(param4[_loc8_]);
               _loc8_++;
            }
            this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
            server.Renamed4859(param5,this.targets,this.Renamed6865,_loc6_,_loc7_);
            this.targets.length = 0;
            this.Renamed6865.length = 0;
         }
      }
      
      private function Renamed9504(param1:Vector.<Body>) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Tank = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = Body(param1[_loc4_]);
            _loc3_ = _loc2_.tank;
            this.targets[_loc4_] = _loc3_.Renamed695().id;
            this.Renamed6865[_loc4_] = _loc3_.incarnation;
            _loc4_++;
         }
         this.targets.length = param1.length;
         this.Renamed6865.length = param1.length;
      }
   }
}

