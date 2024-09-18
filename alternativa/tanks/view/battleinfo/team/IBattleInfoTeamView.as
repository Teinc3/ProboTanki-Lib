package alternativa.tanks.view.battleinfo.team
{
   import § !g§.§class for case§;
   import alternativa.tanks.view.battleinfo.IBattleInfoView;
   
   public interface IBattleInfoTeamView extends IBattleInfoView
   {
      function updateInitParams(param1:BattleInfoTeamParams) : void;
      
      function updateScore(param1:§class for case§, param2:int) : void;
      
      function removeUser(param1:String) : void;
      
      function updatePlayer(param1:Boolean, param2:Object = null, param3:int = 0, param4:Boolean = false) : void;
      
      function clearUsersInfo() : void;
      
      function disableEnterInBattleRed() : void;
      
      function enableEnterInBattleRed() : void;
      
      function disableEnterInBattleBlue() : void;
      
      function enableEnterInBattleBlue() : void;
   }
}

