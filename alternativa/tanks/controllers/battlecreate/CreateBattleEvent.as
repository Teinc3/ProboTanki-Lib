package alternativa.tanks.controllers.battlecreate
{
   import flash.events.Event;
   import projects.tanks.client.battleservice.§9"B§;
   
   public class CreateBattleEvent extends Event
   {
      public static const CREATE_BATTLE:String = "CreateBattleEvent.CREATE_BATTLE";
      
      public var battleCreateParams:§9"B§;
      
      public function CreateBattleEvent(param1:String, param2:§9"B§, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.battleCreateParams = param2;
      }
   }
}

