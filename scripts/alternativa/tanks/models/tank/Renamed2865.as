package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.battle.Renamed864;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2865 implements Renamed864, AutoClosable, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed3012:EncryptedNumber = new EncryptedNumberImpl(7000);
      
      private static const Renamed3013:EncryptedNumber = new EncryptedNumberImpl(7050);
      
      private var Renamed3014:Tank;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed2865(param1:Tank, param2:Dictionary)
      {
         this.Renamed3015 = new Dictionary();
         super();
         this.Renamed3014 = param1;
         this.Renamed3016(param2);
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed905();
      }
      
      private function Renamed3016(param1:Dictionary) : void
      {
         var _loc2_:Tank = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_ != this.Renamed3014)
            {
               this.Renamed3015[_loc2_] = true;
            }
         }
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         if(param1.tank != this.Renamed3014)
         {
            this.Renamed3015[param1.tank] = true;
         }
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         if(param1.tank != this.Renamed3014)
         {
            delete this.Renamed3015[param1.tank];
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed865() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Renamed610 = battleService.Renamed621();
         var _loc3_:Renamed842 = _loc2_.Renamed739();
         var _loc4_:Vector3 = _loc3_.position;
         for(_loc1_ in this.Renamed3015)
         {
            this.Renamed2549(_loc1_,_loc4_);
         }
      }
      
      private function Renamed2549(param1:Tank, param2:Vector3) : void
      {
         if(param1.tankData.health > 0)
         {
            if(this.Renamed3014.Renamed1017(param1.teamType))
            {
               param1.Renamed1076();
            }
            else
            {
               this.Renamed3017(param1,param2);
            }
         }
         else
         {
            param1.Renamed1077();
         }
      }
      
      private function Renamed3017(param1:Tank, param2:Vector3) : void
      {
         var _loc3_:Body = param1.Renamed696();
         var _loc4_:BodyState = _loc3_.state;
         var _loc5_:Vector3;
         var _loc6_:Number = (_loc5_ = _loc4_.position).x - param2.x;
         var _loc7_:Number = _loc5_.y - param2.y;
         var _loc8_:Number = _loc5_.z - param2.z;
         var _loc9_:Number = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_);
         if(_loc9_ >= Renamed3013.getNumber() || param1.Renamed1004(param2))
         {
            param1.Renamed1077();
         }
         else if(_loc9_ < Renamed3012.getNumber())
         {
            param1.Renamed1076();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed2432.Renamed906();
         this.Renamed2432 = null;
         this.Renamed3014 = null;
         clearDictionary(this.Renamed3015);
      }
   }
}

