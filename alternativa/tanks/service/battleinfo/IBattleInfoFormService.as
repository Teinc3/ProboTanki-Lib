package alternativa.tanks.service.battleinfo
{
   import § !g§.§class for case§;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import flash.events.IEventDispatcher;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public interface IBattleInfoFormService extends IEventDispatcher
   {
      function §set package default§(param1:BattleInfoDmParams) : void;
      
      function §implements var function§(param1:BattleInfoTeamParams) : void;
      
      function §+!x§() : void;
      
      function destroy() : void;
      
      function updateName(param1:String) : void;
      
      function updateTeamScore(param1:§class for case§, param2:int) : void;
      
      function addUserTeam(param1:BattleInfoUser, param2:§class for case§) : void;
      
      function §1#F§(param1:BattleInfoUser) : void;
      
      function removeUser(param1:String) : void;
      
      function updateUserScore(param1:String, param2:int) : void;
      
      function updateUserSuspiciousState(param1:String, param2:Boolean) : void;
      
      function swapTeams() : void;
      
      function §+#E§() : void;
      
      function roundStart() : void;
      
      function roundFinish() : void;
      
      function battleStop() : void;
      
      function §3o§() : void;
      
      function removeFormFromStage() : void;
      
      function getBattleItemId() : String;
      
      function §package for set§() : void;
   }
}

