package alternativa.tanks.service.battleinfo
{
   import Renamed136.Renamed663;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import flash.events.IEventDispatcher;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public interface IBattleInfoFormService extends IEventDispatcher
   {
      function Renamed3626(param1:BattleInfoDmParams) : void;
      
      function Renamed3627(param1:BattleInfoTeamParams) : void;
      
      function Renamed2121() : void;
      
      function destroy() : void;
      
      function updateName(param1:String) : void;
      
      function updateTeamScore(param1:Renamed663, param2:int) : void;
      
      function addUserTeam(param1:BattleInfoUser, param2:Renamed663) : void;
      
      function Renamed3628(param1:BattleInfoUser) : void;
      
      function removeUser(param1:String) : void;
      
      function updateUserScore(param1:String, param2:int) : void;
      
      function updateUserSuspiciousState(param1:String, param2:Boolean) : void;
      
      function swapTeams() : void;
      
      function Renamed3629() : void;
      
      function roundStart() : void;
      
      function roundFinish() : void;
      
      function battleStop() : void;
      
      function Renamed1622() : void;
      
      function removeFormFromStage() : void;
      
      function getBattleItemId() : String;
      
      function Renamed3630() : void;
   }
}

