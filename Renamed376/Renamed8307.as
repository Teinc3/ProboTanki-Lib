package Renamed376
{
   import Renamed4808.Renamed5536;
   import projects.tanks.client.panel.model.dailyquest.Renamed4351;
   import projects.tanks.client.panel.model.dailyquest.Renamed4366;
   
   public class Renamed4819 extends Renamed4366 implements Renamed4351, Renamed4817
   {
      public function Renamed4819()
      {
         super();
      }
      
      public function skipDailyQuest(param1:Renamed5536) : void
      {
         if(param1.Renamed5544)
         {
            server.Renamed4364(param1.questId);
         }
         else
         {
            server.Renamed4363(param1.questId,param1.Renamed5547);
         }
      }
      
      public function takePrize(param1:Renamed5536) : void
      {
         server.takePrize(param1.questId);
      }
   }
}

