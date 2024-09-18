package Renamed457
{
   import alternativa.tanks.servermodels.blockvalidator.BlockValidatorModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9123 extends Renamed4886
   {
      private var Renamed9124:BlockValidatorModel;
      
      public var modelId:int;
      
      public function Renamed9123()
      {
         super();
         this.modelId = 7;
         this.Renamed9124 = BlockValidatorModel(modelRegistry.getModel(Long.getLong(0,300020004)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9120.Renamed9122:
               this.youAreBlocked(param1);
               break;
            case Renamed9120.Renamed9121:
               this.youWereKicked(param1);
         }
      }
      
      public function youAreBlocked(param1:Object) : void
      {
         this.Renamed9124.youAreBlocked(param1.reasonForUser);
      }
      
      public function youWereKicked(param1:Object) : void
      {
         this.Renamed9124.youWereKicked(param1.reasonForUser,param1.minutes,param1.hours,param1.days);
      }
   }
}

