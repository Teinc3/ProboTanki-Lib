package Renamed8372
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.uid.UidNotifierData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.OnlineNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.rank.RankNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.uid.UidNotifierModel;
   
   public class Renamed9511 extends Renamed4886
   {
      private var Renamed9512:UserNotifierModel;
      
      private var Renamed9513:RankNotifierModel;
      
      private var Renamed9514:UidNotifierModel;
      
      private var Renamed9515:OnlineNotifierModel;
      
      private var Renamed9516:BattleNotifierModel;
      
      private var Renamed6274:PremiumNotifierModel;
      
      public var modelId:int;
      
      public function Renamed9511()
      {
         super();
         this.modelId = 18;
         this.Renamed9512 = UserNotifierModel(modelRegistry.getModel(Long.getLong(0,300150005)));
         this.Renamed9512.objectLoaded();
         this.Renamed9513 = RankNotifierModel(modelRegistry.getModel(Long.getLong(60229216,350352129)));
         this.Renamed9514 = UidNotifierModel(modelRegistry.getModel(Long.getLong(990863444,376077627)));
         this.Renamed9515 = OnlineNotifierModel(modelRegistry.getModel(Long.getLong(467887314,-1426971041)));
         this.Renamed6274 = PremiumNotifierModel(modelRegistry.getModel(Long.getLong(302389563,-1379937773)));
         this.Renamed9516 = BattleNotifierModel(modelRegistry.getModel(Long.getLong(904565121,-177943041)));
         this.Renamed9516.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9517.Renamed9518:
               this.setRank(param1);
               break;
            case Renamed9517.Renamed9519:
               this.setOnline(param1);
               break;
            case Renamed9517.Renamed9520:
               this.setUid(param1);
               break;
            case Renamed9517.Renamed9521:
               this.setPremiumTimeLeft(param1);
               break;
            case Renamed9517.Renamed9522:
               this.setBattle(param1);
               break;
            case Renamed9517.Renamed9523:
               this.leaveBattle(param1);
         }
      }
      
      private function setRank(param1:Object) : void
      {
         this.Renamed9513.setRank(Vector.<RankNotifierData>([param1.user]));
      }
      
      private function setOnline(param1:Object) : void
      {
         this.Renamed9515.setOnline(Vector.<OnlineNotifierData>([param1.user]));
      }
      
      private function setUid(param1:Object) : void
      {
         this.Renamed9514.setUid(Vector.<UidNotifierData>([param1.user]));
      }
      
      private function setPremiumTimeLeft(param1:Object) : void
      {
         this.Renamed6274.setPremiumTimeLeft(Vector.<PremiumNotifierData>([param1.user]));
      }
      
      private function setBattle(param1:Object) : void
      {
         this.Renamed9516.setBattle(Vector.<BattleNotifierData>([param1.user]));
      }
      
      private function leaveBattle(param1:Object) : void
      {
         this.Renamed9516.leaveBattle(param1.userId);
      }
   }
}

