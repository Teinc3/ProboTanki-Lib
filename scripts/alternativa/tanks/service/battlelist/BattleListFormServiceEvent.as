package alternativa.tanks.service.battlelist
{
   import flash.events.Event;
   
   public class BattleListFormServiceEvent extends Event
   {
      public static const BATTLE_SELECTED:String = "BattleListFormServiceEvent.BATTLE_SELECTED";
      
      public var selectedItem:String;
      
      public function BattleListFormServiceEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.selectedItem = param2;
      }
   }
}

