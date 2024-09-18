package alternativa.tanks.controllers.battlecreate
{
   import flash.events.Event;
   import projects.tanks.client.battleservice.Renamed1579;
   
   public class CreateBattleEvent extends Event
   {
      public static const CREATE_BATTLE:String = "CreateBattleEvent.CREATE_BATTLE";
      
      public var battleCreateParams:Renamed1579;
      
      public function CreateBattleEvent(param1:String, param2:Renamed1579, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.battleCreateParams = param2;
      }
   }
}

