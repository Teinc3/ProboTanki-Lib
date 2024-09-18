package Renamed284
{
   import alternativa.tanks.service.dailyquest.Renamed3660;
   import alternativa.types.Long;
   import Renamed376.Renamed4821;
   import Renamed385.Renamed4886;
   
   public class Renamed7235 extends Renamed4886
   {
      private var Renamed7236:Renamed4821;
      
      private var Renamed7237:Renamed3660;
      
      public var modelId:int;
      
      public function Renamed7235()
      {
         super();
         this.modelId = 19;
         this.Renamed7236 = Renamed4821(modelRegistry.getModel(Long.getLong(1726782619,1524609945)));
         this.Renamed7237 = Renamed3660(modelRegistry.getModel(Long.getLong(1044301282,-2025301046)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7220.Renamed7221:
               this.Renamed5535(param1);
               break;
            case Renamed7220.Renamed7231:
               this.Renamed5537(param1);
               break;
            case Renamed7220.Renamed7230:
               this.skipDailyQuest(param1);
               break;
            case Renamed7220.Renamed7227:
               this.Renamed5538(param1);
               break;
            case Renamed7220.Renamed7226:
               this.Renamed3662();
               break;
            case Renamed7220.Renamed7222:
               this.Renamed3665();
         }
      }
      
      private function Renamed5535(param1:Object) : void
      {
         this.Renamed7236.Renamed5535(param1.quests,param1.weeklyQuestDescription);
      }
      
      private function skipDailyQuest(param1:Object) : void
      {
         this.Renamed7236.skipDailyQuest(Long.getLong(0,param1.questId),param1.newQuest);
      }
      
      private function Renamed5537(param1:Object) : void
      {
         this.Renamed7236.Renamed5537(param1.weeklyQuestDescription);
      }
      
      private function Renamed5538(param1:Object) : void
      {
         this.Renamed7236.Renamed5538(Long.getLong(0,param1.questId));
      }
      
      private function Renamed3662() : void
      {
         this.Renamed7237.Renamed3662();
      }
      
      private function Renamed3665() : void
      {
         this.Renamed7237.Renamed3665();
      }
   }
}

