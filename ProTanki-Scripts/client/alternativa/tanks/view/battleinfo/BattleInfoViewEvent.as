package alternativa.tanks.view.battleinfo
{
   import Renamed136.Renamed663;
   import flash.events.Event;
   
   public class BattleInfoViewEvent extends Event
   {
      public static const ENTER_DM:String = "BattleInfoViewEvent.ENTER_DM";
      
      public static const ENTER_SPECTATOR:String = "BattleInfoViewEvent.ENTER_SPECTATOR";
      
      public static const ENTER_TEAM:String = "BattleInfoViewEvent.ENTER_TEAM";
      
      public static const EXIT_FROM_BATTLE:String = "BattleInfoViewEvent.EXIT_FROM_BATTLE";
      
      public static const RETURN_TO_BATTLE:String = "BattleInfoViewEvent.RETURN_TO_BATTLE";
      
      public var team:Renamed663;
      
      public function BattleInfoViewEvent(param1:String, param2:Renamed663 = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.team = param2;
      }
      
      override public function clone() : Event
      {
         return new BattleInfoViewEvent(type,this.team,bubbles,cancelable);
      }
   }
}

