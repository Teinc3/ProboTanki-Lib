package §while each§
{
   import alternativa.tanks.servermodels.blockvalidator.BlockValidatorModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §get set class§ extends §return package if§
   {
      private var §^"f§:BlockValidatorModel;
      
      public var modelId:int;
      
      public function §get set class§()
      {
         super();
         this.modelId = 7;
         this.§^"f§ = BlockValidatorModel(modelRegistry.getModel(Long.getLong(0,300020004)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §else set default§.§"!s§:
               this.youAreBlocked(param1);
               break;
            case §else set default§.§?!H§:
               this.youWereKicked(param1);
         }
      }
      
      public function youAreBlocked(param1:Object) : void
      {
         this.§^"f§.youAreBlocked(param1.reasonForUser);
      }
      
      public function youWereKicked(param1:Object) : void
      {
         this.§^"f§.youWereKicked(param1.reasonForUser,param1.minutes,param1.hours,param1.days);
      }
   }
}

