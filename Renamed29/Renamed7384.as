package Renamed29
{
   import Renamed136.Renamed663;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed660;
   import alternativa.tanks.battle.events.Renamed885;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import alternativa.tanks.models.battle.battlefield.Renamed2524;
   import Renamed332.Renamed4661;
   import Renamed332.Renamed7381;
   import Renamed63.Renamed617;
   import Renamed63.Renamed7382;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   
   public class Renamed30 extends Renamed7381 implements Renamed4661, ObjectLoadPostListener, ObjectUnloadListener, Renamed511, Renamed2524
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed5462:Vector.<Renamed660>;
      
      public function Renamed30()
      {
         super();
      }
      
      public function Renamed2525() : Renamed2395
      {
         return Renamed2395.TDM;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.Renamed5462 = new Vector.<Renamed660>();
         var _loc1_:Renamed7383 = new Renamed7383();
         battleService.Renamed625(_loc1_);
         this.Renamed5462.push(_loc1_);
         var _loc2_:Renamed5432 = new Renamed5432();
         battleService.Renamed628(_loc2_);
         this.Renamed5462.push(_loc2_);
         var _loc3_:Renamed7379 = new Renamed7379();
         battleService.Renamed630(_loc3_);
         this.Renamed5462.push(_loc3_);
         var _loc4_:Renamed7382 = new Renamed7382();
         battleService.Renamed650(_loc4_);
         this.Renamed5462.push(_loc4_);
         battleEventDispatcher.Renamed539(Renamed885,this);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.Renamed5462 = null;
         battleService.Renamed625(null);
         battleService.Renamed628(null);
         battleService.Renamed630(null);
         battleService.Renamed650(null);
         battleEventDispatcher.Renamed866(Renamed885,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed660 = null;
         var _loc3_:Renamed663 = Renamed885(param1).tank.teamType;
         for each(_loc2_ in this.Renamed5462)
         {
            _loc2_.Renamed833(_loc3_);
         }
      }
      
      public function Renamed649() : Renamed617
      {
         var _loc1_:Renamed7382 = new Renamed7382();
         this.Renamed5462.push(_loc1_);
         return _loc1_;
      }
   }
}

