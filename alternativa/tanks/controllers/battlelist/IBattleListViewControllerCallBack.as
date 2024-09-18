package alternativa.tanks.controllers.battlelist
{
   import projects.tanks.client.battleservice.§final package import§;
   
   public interface IBattleListViewControllerCallBack
   {
      function onShowCreateBattleFormButtonClick() : void;
      
      function onBattleListItemClick(param1:String) : void;
      
      function onBattleListItemChange(param1:String) : void;
      
      function onBattleModeChange(param1:§final package import§, param2:Boolean) : void;
   }
}

