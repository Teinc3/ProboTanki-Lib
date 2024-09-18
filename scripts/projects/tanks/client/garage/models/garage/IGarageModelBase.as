package projects.tanks.client.garage.models.garage
{
   import platform.client.fp10.core.type.IGameObject;
   
   public interface IGarageModelBase
   {
      function initDepot(param1:Vector.<IGameObject>) : void;
      
      function initMarket(param1:Vector.<IGameObject>) : void;
      
      function initMounted(param1:Vector.<IGameObject>) : void;
      
      function reloadGarage(param1:String, param2:int) : void;
      
      function select(param1:IGameObject) : void;
      
      function selectFirstItemInDepot() : void;
   }
}

