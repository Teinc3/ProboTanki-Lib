package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle
{
   import flash.events.EventDispatcher;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   
   public class Renamed588 extends EventDispatcher implements IBattleNotifierService
   {
      public function Renamed588()
      {
         super();
      }
      
      public function setBattle(param1:Vector.<BattleLinkData>) : void
      {
         dispatchEvent(new SetBattleNotifierServiceEvent(SetBattleNotifierServiceEvent.SET_BATTLE,param1));
      }
      
      public function leaveBattle(param1:String) : void
      {
         dispatchEvent(new LeaveBattleNotifierServiceEvent(LeaveBattleNotifierServiceEvent.LEAVE,param1));
      }
   }
}

