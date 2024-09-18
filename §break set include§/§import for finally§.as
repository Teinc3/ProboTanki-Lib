package §break set include§
{
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §import for finally§ extends §return package if§
   {
      private var §?#X§:UserPropertiesModel;
      
      public var modelId:int;
      
      public function §import for finally§()
      {
         super();
         this.modelId = 29;
         this.§?#X§ = UserPropertiesModel(modelRegistry.getModel(Long.getLong(0,300050083)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §set var for§.§include set catch§:
               this.changeCrystal(param1);
               break;
            case §set var for§.§@!J§:
               this.updateRank(param1);
               break;
            case §set var for§.§var catch super§:
               this.updateRatingAndPlace(param1);
               break;
            case §set var for§.§@!C§:
               this.updateScore(param1);
         }
      }
      
      private function changeCrystal(param1:Object) : void
      {
         this.§?#X§.changeCrystal(param1.changeBy);
      }
      
      private function updateRank(param1:Object) : void
      {
         this.§?#X§.updateRank(param1.rank,param1.score,param1.currentRankScore,param1.nextRankScore,param1.bonusCrystals);
      }
      
      private function updateRatingAndPlace(param1:Object) : void
      {
         this.§?#X§.updateRatingAndPlace(param1.rating,param1.place);
      }
      
      private function updateScore(param1:Object) : void
      {
         this.§?#X§.updateScore(param1.score);
      }
      
      private function updateUid(param1:Object) : void
      {
         this.§?#X§.updateUid(param1.uid);
      }
   }
}

