package alternativa.tanks.controllers.battlelist
{
   import projects.tanks.client.battleservice.Renamed1587;
   
   public interface IBattleListViewControllerCallBack
   {
      function onShowCreateBattleFormButtonClick() : void;
      
      function onBattleListItemClick(param1:String) : void;
      
      function onBattleListItemChange(param1:String) : void;
      
      function onBattleModeChange(param1:Renamed1587, param2:Boolean) : void;
   }
}

