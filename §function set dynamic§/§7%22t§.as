package §function set dynamic§
{
   import §>#m§.§5!"§;
   import projects.tanks.client.panel.model.dailyquest.§35§;
   import projects.tanks.client.panel.model.dailyquest.§super package throw§;
   
   public class §7"t§ extends §super package throw§ implements §35§, §""'§
   {
      public function §7"t§()
      {
         super();
      }
      
      public function skipDailyQuest(param1:§5!"§) : void
      {
         if(param1.§6#J§)
         {
            server.§dynamic const switch§(param1.questId);
         }
         else
         {
            server.§["Z§(param1.questId,param1.§6#6§);
         }
      }
      
      public function takePrize(param1:§5!"§) : void
      {
         server.takePrize(param1.questId);
      }
   }
}

