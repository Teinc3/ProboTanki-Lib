package alternativa.tanks.service.battlelist
{
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   
   public interface IBattleListFormService extends IEventDispatcher
   {
      function Renamed2078() : void;
      
      function Renamed2079() : void;
      
      function battleItemRecord(param1:IGameObject) : void;
      
      function Renamed2130(param1:String) : void;
      
      function selectBattleItemFromServer(param1:String) : void;
      
      function updateName(param1:String, param2:String) : void;
      
      function madePrivate(param1:String, param2:String) : void;
      
      function updateSuspicious(param1:String, param2:Renamed1620) : void;
      
      function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:int) : void;
      
      function updateUsersCountDm(param1:String, param2:int, param3:int) : void;
      
      function swapTeams(param1:String) : void;
      
      function battleItemsPacketJoinSuccess() : void;
   }
}

