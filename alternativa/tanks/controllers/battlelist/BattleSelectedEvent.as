package alternativa.tanks.controllers.battlelist
{
   import flash.events.Event;
   
   public class BattleSelectedEvent extends Event
   {
      public static const BATTLE_SELECTED:String = "BattleListControllerEvent.BATTLE_SELECTED";
      
      public var selectedItem:String;
      
      public function BattleSelectedEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.selectedItem = param2;
      }
   }
}

