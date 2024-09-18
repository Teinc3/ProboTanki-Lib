package Renamed323
{
   import alternativa.tanks.model.friends.battleinvite.BattleInviteModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7733 extends Renamed4886
   {
      private var Renamed7734:BattleInviteModel;
      
      public var modelId:int;
      
      public function Renamed7733()
      {
         super();
         this.modelId = 15;
         this.Renamed7734 = BattleInviteModel(modelRegistry.getModel(Long.getLong(0,300050004)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7735.Renamed7736:
               this.accepted(param1);
               break;
            case Renamed7735.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed7735.Renamed7737:
               this.notify(param1);
               break;
            case Renamed7735.Renamed7738:
               this.rejectedInvitationToBattleDisabled(param1);
               break;
            case Renamed7735.Renamed7739:
               this.rejectedUserAlreadyInBattle(param1);
               break;
            case Renamed7735.Renamed7740:
               this.rejected(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed7734.putInitParams(param1.initParams);
         this.Renamed7734.objectLoaded();
      }
      
      private function accepted(param1:Object) : void
      {
         this.Renamed7734.accepted(param1.senderId);
      }
      
      private function rejected(param1:Object) : void
      {
         this.Renamed7734.rejected(param1.senderId);
      }
      
      private function notify(param1:Object) : void
      {
         this.Renamed7734.notify(param1.user,param1.data);
      }
      
      private function rejectedInvitationToBattleDisabled(param1:Object) : void
      {
         this.Renamed7734.rejectedInvitationToBattleDisabled(param1.user);
      }
      
      private function rejectedUserAlreadyInBattle(param1:Object) : void
      {
         this.Renamed7734.rejectedUserAlreadyInBattle(param1.user);
      }
   }
}

