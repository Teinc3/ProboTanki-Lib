package alternativa.tanks.controllers.battlecreate
{
   import projects.tanks.client.battleservice.Renamed1587;
   
   public interface ICreateBattleFormControllerCallBack
   {
      function onCreateBattle() : void;
      
      function onBattleNameChange() : void;
      
      function onMapChange() : void;
      
      function onThemeChange() : void;
      
      function onPlayersNumberChange() : void;
      
      function onTimeLimitChange() : void;
      
      function onScoreLimitChange() : void;
      
      function onBattleNameInFocus() : void;
      
      function onBattleNameOutFocus() : void;
      
      function onSelected(param1:Renamed1587) : void;
      
      function Renamed1608() : void;
      
      function Renamed1610() : void;
   }
}

