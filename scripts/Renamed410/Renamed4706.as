package Renamed410
{
   import Renamed137.Renamed2400;
   import Renamed602.3DPositionVector;
   import Renamed292.Renamed7401;
   import Renamed292.Renamed4613;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.Renamed2311;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.bonus.battle.Renamed7400;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed4706 extends Renamed7401 implements Renamed4613, Renamed511, Renamed2311
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var bonuses:Dictionary;
      
      private var Renamed7419:int;
      
      public function Renamed4706()
      {
         this.bonuses = new Dictionary();
         super();
         battleEventDispatcher.Renamed539(Renamed894,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed8639();
      }
      
      private function Renamed8639() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.bonuses)
         {
            this.Renamed2485(_loc1_);
         }
      }
      
      private function CodecRegisterer3(param1:IGameObject, param2:String, param3:3DPositionVector, param4:int) : void
      {
         var _loc5_:Renamed2400 = null;
         var _loc6_:Bonus = null;
         if(param1 != null)
         {
            _loc5_ = Renamed2400(modelRegistry.getModelsByInterface(Renamed2400)[0]);
            _loc6_.spawn(new Vector3(param3.x,param3.y,param3.z),param4,getInitParam().Renamed7419,getFunctionWrapper(this.Renamed8640));
            this.bonuses[_loc6_.bonusId] = _loc6_;
         }
      }
      
      private function Renamed8640(param1:Bonus) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         server.Renamed2487(param1.bonusId);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed7414(param1:Vector.<Renamed4159>) : void
      {
         var _loc2_:Renamed4159 = null;
         if(param1 != null)
         {
            for each(_loc2_ in param1)
            {
               this.CodecRegisterer3(_loc2_.Renamed4163,_loc2_.bonusId,_loc2_.Renamed4165,0);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed8641(param1:Vector.<String>) : void
      {
         var _loc2_:String = null;
         if(param1 != null)
         {
            for each(_loc2_ in param1)
            {
               this.Renamed2485(_loc2_);
            }
         }
      }
      
      private function Renamed2485(param1:String) : void
      {
         var _loc2_:Bonus = this.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.bonuses[param1];
            _loc2_.remove();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2486(param1:String) : void
      {
         var _loc2_:Bonus = this.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.bonuses[param1];
            _loc2_.pickup();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed8642(param1:String) : void
      {
         var _loc2_:Bonus = this.bonuses[param1];
         if(_loc2_ != null)
         {
            _loc2_.enableTrigger();
         }
      }
      
      public function Renamed2312() : void
      {
         this.Renamed8643();
      }
      
      private function Renamed8643() : void
      {
         var _loc1_:Renamed4159 = null;
         for each(_loc1_ in getInitParam().bonuses)
         {
            this.CodecRegisterer3(_loc1_.Renamed4163,_loc1_.bonusId,_loc1_.Renamed4165,_loc1_.Renamed4164);
         }
         this.Renamed7419 = getInitParam().Renamed7419;
         getInitParam().bonuses = null;
      }
   }
}

