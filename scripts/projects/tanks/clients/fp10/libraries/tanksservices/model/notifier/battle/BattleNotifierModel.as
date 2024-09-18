package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle
{
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import projects.tanks.client.tanksservices.model.notifier.battle.Renamed4386;
   import projects.tanks.client.tanksservices.model.notifier.battle.Renamed4388;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   
   public class BattleNotifierModel extends Renamed4386 implements Renamed4388, UserRefresh
   {
      [Inject]
      public static var battleNotifierService:IBattleNotifierService;
      
      private var battleLinkData:Dictionary;
      
      public function BattleNotifierModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this.battleLinkData = new Dictionary();
      }
      
      public function objectUnloaded() : void
      {
         this.battleLinkData = null;
      }
      
      public function setBattle(param1:Vector.<BattleNotifierData>) : void
      {
         var _loc2_:BattleNotifierData = null;
         var _loc3_:Vector.<BattleLinkData> = new Vector.<BattleLinkData>(param1.length);
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = param1[_loc5_];
            _loc3_[_loc5_] = this.setAndUpdateConsumer(_loc2_);
            _loc5_++;
         }
         battleNotifierService.setBattle(_loc3_);
      }
      
      private function setAndUpdateConsumer(param1:BattleNotifierData) : BattleLinkData
      {
         var _loc2_:String = param1.userId;
         var _loc3_:BattleLinkData = new BattleLinkData(_loc2_,param1);
         this.battleLinkData[_loc2_] = _loc3_;
         this.setBattleLinkForConsumer(_loc2_,_loc3_);
         return _loc3_;
      }
      
      private function setBattleLinkForConsumer(param1:String, param2:BattleLinkData) : void
      {
         var _loc3_:UserInfoConsumer = null;
         var _loc4_:UserNotifier = UserNotifier(modelRegistry.getModel(Long.getLong(0,300150005)));
         if(_loc4_.hasDataConsumer(param1))
         {
            _loc3_ = _loc4_.getDataConsumer(param1);
            _loc3_.setBattleUrl(param2);
         }
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         if(param1 in this.battleLinkData)
         {
            param2.setBattleUrl(this.battleLinkData[param1]);
         }
      }
      
      public function remove(param1:String) : void
      {
         delete this.battleLinkData[param1];
         this.setBattleLinkForConsumer(param1,null);
      }
      
      public function leaveBattle(param1:String) : void
      {
         battleNotifierService.leaveBattle(param1);
         this.remove(param1);
      }
   }
}

