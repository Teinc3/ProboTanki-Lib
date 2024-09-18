package §package const false§
{
   import § !V§.§=p§;
   import §;"?§.§#">§;
   import §;#L§.§"!A§;
   import §;#L§.§4#&§;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.§]#P§;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battlefield.models.bonus.battle.§1§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class §##$§ extends §"!A§ implements §4#&§, §throw package continue§, §]#P§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var bonuses:Dictionary;
      
      private var §!2§:int;
      
      public function §##$§()
      {
         this.bonuses = new Dictionary();
         super();
         battleEventDispatcher.§set for each§(§const var finally§,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§77§();
      }
      
      private function §77§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.bonuses)
         {
            this.§1"8§(_loc1_);
         }
      }
      
      private function §%#B§(param1:IGameObject, param2:String, param3:§#">§, param4:int) : void
      {
         var _loc5_:§=p§ = null;
         var _loc6_:Bonus = null;
         if(param1 != null)
         {
            _loc5_ = §=p§(modelRegistry.getModelsByInterface(§=p§)[0]);
            _loc6_.spawn(new Vector3(param3.x,param3.y,param3.z),param4,getInitParam().§!2§,getFunctionWrapper(this.§?#I§));
            this.bonuses[_loc6_.bonusId] = _loc6_;
         }
      }
      
      private function §?#I§(param1:Bonus) : void
      {
         battleEventDispatcher.dispatchEvent(§##a§.§const for use§);
         server.§false const true§(param1.bonusId);
      }
      
      [Obfuscation(rename="false")]
      public function §6"Y§(param1:Vector.<§1#1§>) : void
      {
         var _loc2_:§1#1§ = null;
         if(param1 != null)
         {
            for each(_loc2_ in param1)
            {
               this.§%#B§(_loc2_.§extends catch extends§,_loc2_.bonusId,_loc2_.§ !"§,0);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §+$#§(param1:Vector.<String>) : void
      {
         var _loc2_:String = null;
         if(param1 != null)
         {
            for each(_loc2_ in param1)
            {
               this.§1"8§(_loc2_);
            }
         }
      }
      
      private function §1"8§(param1:String) : void
      {
         var _loc2_:Bonus = this.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.bonuses[param1];
            _loc2_.remove();
         }
      }
      
      [Obfuscation(rename="false")]
      public function §@!`§(param1:String) : void
      {
         var _loc2_:Bonus = this.bonuses[param1];
         if(_loc2_ != null)
         {
            delete this.bonuses[param1];
            _loc2_.pickup();
         }
      }
      
      [Obfuscation(rename="false")]
      public function §?#S§(param1:String) : void
      {
         var _loc2_:Bonus = this.bonuses[param1];
         if(_loc2_ != null)
         {
            _loc2_.enableTrigger();
         }
      }
      
      public function §continue catch var§() : void
      {
         this.§return for extends§();
      }
      
      private function §return for extends§() : void
      {
         var _loc1_:§1#1§ = null;
         for each(_loc1_ in getInitParam().bonuses)
         {
            this.§%#B§(_loc1_.§extends catch extends§,_loc1_.bonusId,_loc1_.§ !"§,_loc1_.§function catch import§);
         }
         this.§!2§ = getInitParam().§!2§;
         getInitParam().bonuses = null;
      }
   }
}

