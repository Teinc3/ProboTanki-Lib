package alternativa.tanks.view.battleinfo.dm
{
   import alternativa.tanks.view.battleinfo.IBattleInfoView;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public interface IBattleInfoDmView extends IBattleInfoView
   {
      function updateInitParams(param1:BattleInfoDmParams) : void;
      
      function addUser(param1:BattleInfoUser) : void;
      
      function removeUser(param1:String) : void;
      
      function updatePlayer(param1:String = null, param2:int = 0, param3:Boolean = false) : void;
      
      function disableEnterInBattle() : void;
      
      function enableEnterInBattle() : void;
   }
}

