package alternativa.tanks.service.battlecreate
{
   import flash.events.Event;
   
   public class BattleCreateFormServiceEvent extends Event
   {
      public static const SHOW_FORM:String = "BattleCreateFormServiceEvent.SHOW_FORM";
      
      public static const HIDE_FORM:String = "BattleCreateFormServiceEvent.HIDE_FORM";
      
      public function BattleCreateFormServiceEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

