package alternativa.tanks.controllers.battlelist
{
   import alternativa.types.Long;
   import flash.events.Event;
   
   public class CreateBattleClickEvent extends Event
   {
      public static const CREATE_BATTLE_CLICK:String = "CreateBattleClickEvent.CREATE_BATTLE_CLICK";
      
      public function CreateBattleClickEvent(param1:String, param2:Long, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
      }
   }
}

