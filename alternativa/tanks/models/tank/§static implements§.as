package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§case for null§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.battle.§throw package class§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §static implements§ implements §throw package class§, AutoClosable, §throw package continue§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §return var implements§:EncryptedNumber = new EncryptedNumberImpl(7000);
      
      private static const §]5§:EncryptedNumber = new EncryptedNumberImpl(7050);
      
      private var §@_§:Tank;
      
      private var §"&§:§var use§;
      
      public function §static implements§(param1:Tank, param2:Dictionary)
      {
         this.§switch else§ = new Dictionary();
         super();
         this.§@_§ = param1;
         this.§"!8§(param2);
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
         this.§"&§.§throw var set§();
      }
      
      private function §"!8§(param1:Dictionary) : void
      {
         var _loc2_:Tank = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ != this.§@_§)
            {
               this.§switch else§[_loc2_] = true;
            }
         }
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         if(param1.tank != this.§@_§)
         {
            this.§switch else§[param1.tank] = true;
         }
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         if(param1.tank != this.§@_§)
         {
            delete this.§switch else§[param1.tank];
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §<z§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:§[!r§ = battleService.§3l§();
         var _loc3_:§3!0§ = _loc2_.§super package§();
         var _loc4_:Vector3 = _loc3_.position;
         for(_loc1_ in this.§switch else§)
         {
            this.§>0§(_loc1_,_loc4_);
         }
      }
      
      private function §>0§(param1:Tank, param2:Vector3) : void
      {
         if(param1.tankData.health > 0)
         {
            if(this.§@_§.§="%§(param1.teamType))
            {
               param1.§class package case§();
            }
            else
            {
               this.§include package false§(param1,param2);
            }
         }
         else
         {
            param1.§implements catch finally§();
         }
      }
      
      private function §include package false§(param1:Tank, param2:Vector3) : void
      {
         var _loc3_:Body = param1.§0"t§();
         var _loc4_:BodyState = _loc3_.state;
         var _loc5_:Vector3;
         var _loc6_:Number = (_loc5_ = _loc4_.position).x - param2.x;
         var _loc7_:Number = _loc5_.y - param2.y;
         var _loc8_:Number = _loc5_.z - param2.z;
         var _loc9_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_);
         if(_loc9_ >= §]5§.getNumber() || param1.§ #E§(param2))
         {
            param1.§implements catch finally§();
         }
         else if(_loc9_ < §return var implements§.getNumber())
         {
            param1.§class package case§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§"&§.§#!V§();
         this.§"&§ = null;
         this.§@_§ = null;
         clearDictionary(this.§switch else§);
      }
   }
}

