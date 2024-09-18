package Renamed376
{
   import Renamed4808.Renamed5536;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4820 implements Renamed4817
   {
      private var object:IGameObject;
      
      private var impl:Renamed4817;
      
      public function Renamed4820(param1:IGameObject, param2:Renamed4817)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function skipDailyQuest(param1:Renamed5536) : void
      {
         var dailyQuestInfo:Renamed5536 = param1;
         try
         {
            Model.object = this.object;
            this.impl.skipDailyQuest(dailyQuestInfo);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function takePrize(param1:Renamed5536) : void
      {
         var dailyQuestInfo:Renamed5536 = param1;
         try
         {
            Model.object = this.object;
            this.impl.takePrize(dailyQuestInfo);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

