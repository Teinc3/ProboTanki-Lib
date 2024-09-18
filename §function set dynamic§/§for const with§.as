package §function set dynamic§
{
   import §>#m§.§5!"§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §for const with§ implements §""'§
   {
      private var object:IGameObject;
      
      private var impl:§""'§;
      
      public function §for const with§(param1:IGameObject, param2:§""'§)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function skipDailyQuest(param1:§5!"§) : void
      {
         var dailyQuestInfo:§5!"§ = param1;
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
      
      public function takePrize(param1:§5!"§) : void
      {
         var dailyQuestInfo:§5!"§ = param1;
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

