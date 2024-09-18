package §]"^§
{
   import alternativa.types.Long;
   import §if try§.§return package if§;
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
   
   public class §&%§ extends §return package if§
   {
      private var §if set§:UserNotifierModel;
      
      private var §,"P§:RankNotifierModel;
      
      private var §6!M§:UidNotifierModel;
      
      private var §for for set§:OnlineNotifierModel;
      
      private var §true set extends§:BattleNotifierModel;
      
      private var §!"4§:PremiumNotifierModel;
      
      public var modelId:int;
      
      public function §&%§()
      {
         super();
         this.modelId = 18;
         this.§if set§ = UserNotifierModel(modelRegistry.getModel(Long.getLong(0,300150005)));
         this.§if set§.objectLoaded();
         this.§,"P§ = RankNotifierModel(modelRegistry.getModel(Long.getLong(60229216,350352129)));
         this.§6!M§ = UidNotifierModel(modelRegistry.getModel(Long.getLong(990863444,376077627)));
         this.§for for set§ = OnlineNotifierModel(modelRegistry.getModel(Long.getLong(467887314,-1426971041)));
         this.§!"4§ = PremiumNotifierModel(modelRegistry.getModel(Long.getLong(302389563,-1379937773)));
         this.§true set extends§ = BattleNotifierModel(modelRegistry.getModel(Long.getLong(904565121,-177943041)));
         this.§true set extends§.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §`!d§.§true for case§:
               this.setRank(param1);
               break;
            case §`!d§.§get const implements§:
               this.setOnline(param1);
               break;
            case §`!d§.§+!q§:
               this.setUid(param1);
               break;
            case §`!d§.§default var catch§:
               this.setPremiumTimeLeft(param1);
               break;
            case §`!d§.§super const static§:
               this.setBattle(param1);
               break;
            case §`!d§.§`!I§:
               this.leaveBattle(param1);
         }
      }
      
      private function setRank(param1:Object) : void
      {
         this.§,"P§.setRank(Vector.<RankNotifierData>([param1.user]));
      }
      
      private function setOnline(param1:Object) : void
      {
         this.§for for set§.setOnline(Vector.<OnlineNotifierData>([param1.user]));
      }
      
      private function setUid(param1:Object) : void
      {
         this.§6!M§.setUid(Vector.<UidNotifierData>([param1.user]));
      }
      
      private function setPremiumTimeLeft(param1:Object) : void
      {
         this.§!"4§.setPremiumTimeLeft(Vector.<PremiumNotifierData>([param1.user]));
      }
      
      private function setBattle(param1:Object) : void
      {
         this.§true set extends§.setBattle(Vector.<BattleNotifierData>([param1.user]));
      }
      
      private function leaveBattle(param1:Object) : void
      {
         this.§true set extends§.leaveBattle(param1.userId);
      }
   }
}

