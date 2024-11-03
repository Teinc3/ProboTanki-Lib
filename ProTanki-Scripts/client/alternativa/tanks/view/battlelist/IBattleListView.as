package alternativa.tanks.view.battlelist
{
   import alternativa.tanks.controllers.battlelist.BattleListItemParams;
   import alternativa.tanks.controllers.battlelist.IBattleListViewControllerCallBack;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public interface IBattleListView
   {
      function show(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void;
      
      function hide() : void;
      
      function destroy() : void;
      
      function setCallBack(param1:IBattleListViewControllerCallBack) : void;
      
      function resetSelectedItem() : void;
      
      function createItem(param1:BattleListItemParams, param2:Boolean) : void;
      
      function removeItem(param1:String) : void;
      
      function setSelect(param1:String) : void;
      
      function updateName(param1:String, param2:String) : void;
      
      function updateSuspicious(param1:String, param2:Renamed1620) : void;
      
      function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:uint) : void;
      
      function updateUsersCountDm(param1:String, param2:int, param3:int) : void;
      
      function swapTeams(param1:String, param2:int, param3:int, param4:int, param5:int) : void;
      
      function updateAvailableItems(param1:int) : void;
      
      function resize(param1:Boolean = true) : void;
      
      function sortBattleList() : void;
      
      function getItemIndex(param1:String) : int;
      
      function lockFilter(param1:Renamed1587) : void;
      
      function unLockFilter(param1:Renamed1587) : void;
   }
}

