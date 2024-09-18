package Renamed396
{
   import Renamed1.Renamed6441;
   import Renamed1.Renamed3263;
   import Renamed1.Renamed608;
   import Renamed1.Renamed1442;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import flash.media.Sound;
   import Renamed462.Renamed3075;
   
   public class Renamed4693 implements Renamed6441
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed8473:int = 0;
      
      private static const Renamed8474:int = 1;
      
      private static const Renamed8475:int = 2;
      
      private static const Renamed8476:int = 3;
      
      private static const Renamed8477:int = 4;
      
      private static const Renamed8478:Number = 0.7;
      
      private static const Renamed8479:int = 115;
      
      private static const Renamed8480:int = 3520;
      
      private static const Renamed8481:int = 80;
      
      private static const Renamed8482:int = 100;
      
      private static const Renamed8483:int = 27;
      
      private var _currentState:int = 0;
      
      private var _turret:Object3D;
      
      private var Renamed8484:Sound;
      
      private var Renamed8485:Sound;
      
      private var Renamed8486:Sound;
      
      private var Renamed8487:Sound;
      
      private var Renamed8488:Sound;
      
      private var Renamed8489:Renamed1442;
      
      private var Renamed8490:Renamed1442;
      
      private var Renamed8491:Renamed3263;
      
      private var Renamed8492:Renamed8467;
      
      private var Renamed8493:Number;
      
      private var Renamed8494:int;
      
      public function Renamed4693(param1:Object3D, param2:Renamed3075, param3:Number)
      {
         super();
         this._turret = param1;
         this.Renamed8484 = param2.chainStartSound;
         this.Renamed8485 = param2.turbineStartSound;
         this.Renamed8486 = param2.shootSound;
         this.Renamed8487 = param2.shootEndSound;
         this.Renamed8488 = param2.longFailSound;
         this.Renamed8489 = this.Renamed8495(param2.hitSound);
         this.Renamed8490 = this.Renamed8495(param2.tankHitSound);
         this.Renamed8493 = param3;
      }
      
      public function Renamed8496(param1:int) : void
      {
         var _loc2_:Renamed3263 = null;
         var _loc3_:Renamed1442 = null;
         if(this._currentState != Renamed8474)
         {
            this._currentState = Renamed8474;
            this.Renamed5252(this.Renamed8485,Renamed8480 - this.Renamed8493);
            _loc2_ = Renamed3263(battleService.Renamed618().getObject(Renamed3263));
            _loc3_ = Renamed1442.create(this.Renamed8484,Renamed8478);
            _loc2_.init(_loc3_,this._turret,0,0,Renamed8479);
            battleService.Renamed637(_loc2_);
         }
         this.Renamed8494 = param1;
      }
      
      public function Renamed8497() : void
      {
         if(this._currentState != Renamed8475)
         {
            this._currentState = Renamed8475;
            this.Renamed5252(this.Renamed8486,Renamed8481,1000000);
         }
      }
      
      public function Renamed8498() : void
      {
         if(this._currentState != Renamed8476)
         {
            this._currentState = Renamed8476;
            this.Renamed5252(this.Renamed8487,Renamed8482);
         }
      }
      
      public function Renamed8499(param1:int) : void
      {
         if(this._currentState != Renamed8477)
         {
            this._currentState = Renamed8477;
            this.Renamed5252(this.Renamed8488,this.Renamed8493 - this.Renamed8494 + Renamed8483,0,param1);
         }
      }
      
      public function Renamed2317() : void
      {
         if(this._currentState != Renamed8473)
         {
            this._currentState = Renamed8473;
            this.Renamed8500();
         }
      }
      
      private function Renamed5252(param1:Sound, param2:int, param3:int = 0, param4:int = 0) : void
      {
         this.Renamed8500();
         this.Renamed8491 = Renamed3263(battleService.Renamed618().getObject(Renamed3263));
         var _loc5_:Renamed1442 = this.Renamed8495(param1);
         this.Renamed8491.init(_loc5_,this._turret,0,param3,param2,this);
         battleService.Renamed637(this.Renamed8491);
         if(param4 > 0)
         {
            this.Renamed8491.Renamed3279(param4);
         }
      }
      
      public function Renamed8501(param1:Vector3, param2:Boolean) : void
      {
         if(this.Renamed8492 == null)
         {
            this.Renamed8492 = Renamed8467(battleService.Renamed618().getObject(Renamed8467));
            this.Renamed8492.init(this.Renamed8489,this.Renamed8490);
            battleService.Renamed637(this.Renamed8492);
         }
         this.Renamed8492.Renamed1554(param1,param2);
      }
      
      public function destroy() : void
      {
         this.Renamed8500();
         this.Renamed8502();
         this.Renamed8484 = null;
         this.Renamed8485 = null;
         this.Renamed8486 = null;
         this.Renamed8487 = null;
         this.Renamed8488 = null;
         this._turret = null;
      }
      
      private function Renamed8502() : void
      {
         this.Renamed8503();
         Renamed1442.destroy(this.Renamed8489);
         Renamed1442.destroy(this.Renamed8490);
         this.Renamed8489 = null;
         this.Renamed8490 = null;
      }
      
      public function Renamed8503() : void
      {
         if(this.Renamed8492 != null)
         {
            this.Renamed8492.kill();
            this.Renamed8492 = null;
         }
      }
      
      public function Renamed6447(param1:Renamed608) : void
      {
         if(this.Renamed8491 == param1)
         {
            this.Renamed8491 = null;
         }
      }
      
      private function Renamed8495(param1:Sound) : Renamed1442
      {
         return Renamed1442.create(param1,Renamed8478);
      }
      
      private function Renamed8500() : void
      {
         if(this.Renamed8491 != null)
         {
            this.Renamed8491.kill();
            this.Renamed8491 = null;
         }
      }
   }
}

