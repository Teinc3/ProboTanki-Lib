package Renamed314
{
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7657 extends Renamed4886
   {
      private var Renamed7658:UserPropertiesModel;
      
      public var modelId:int;
      
      public function Renamed7657()
      {
         super();
         this.modelId = 29;
         this.Renamed7658 = UserPropertiesModel(modelRegistry.getModel(Long.getLong(0,300050083)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7659.Renamed7660:
               this.changeCrystal(param1);
               break;
            case Renamed7659.Renamed7661:
               this.updateRank(param1);
               break;
            case Renamed7659.Renamed7662:
               this.updateRatingAndPlace(param1);
               break;
            case Renamed7659.Renamed7663:
               this.updateScore(param1);
         }
      }
      
      private function changeCrystal(param1:Object) : void
      {
         this.Renamed7658.changeCrystal(param1.changeBy);
      }
      
      private function updateRank(param1:Object) : void
      {
         this.Renamed7658.updateRank(param1.rank,param1.score,param1.currentRankScore,param1.nextRankScore,param1.bonusCrystals);
      }
      
      private function updateRatingAndPlace(param1:Object) : void
      {
         this.Renamed7658.updateRatingAndPlace(param1.rating,param1.place);
      }
      
      private function updateScore(param1:Object) : void
      {
         this.Renamed7658.updateScore(param1.score);
      }
      
      private function updateUid(param1:Object) : void
      {
         this.Renamed7658.updateUid(param1.uid);
      }
   }
}

