package alternativa.tanks.view.battleinfo
{
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public interface IBattleInfoView extends IEventDispatcher
   {
      function show() : void;
      
      function hide() : void;
      
      function destroy() : void;
      
      function lock() : void;
      
      function unlock() : void;
      
      function updateInBattleState() : void;
      
      function setPreview(param1:BitmapData) : void;
      
      function showNoSuppliesAlert() : void;
      
      function hideNoSuppliesAlert() : void;
      
      function setCostProBattle(param1:int) : void;
      
      function setTime(param1:String) : void;
      
      function updateBattleName(param1:String) : void;
   }
}

