package Renamed448
{
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8991 extends Renamed4886
   {
      private var Renamed8945:ChatModel;
      
      public var modelId:int;
      
      public function Renamed8991()
      {
         super();
         this.modelId = 61;
         this.Renamed8945 = ChatModel(modelRegistry.getModel(Long.getLong(1896886505,1439133662)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8984.Renamed8985:
               this.addMessage(param1);
               break;
            case Renamed8984.Renamed8986:
               this.Renamed2579(param1);
               break;
            case Renamed8984.Renamed8989:
               this.Renamed2580(param1);
               break;
            case Renamed8984.Renamed8987:
               this.Renamed2577(param1);
               break;
            case Renamed8984.Renamed5161:
               this.Renamed5162();
               break;
            case Renamed8984.Renamed8988:
               this.Renamed2584(param1);
         }
      }
      
      private function addMessage(param1:Object) : void
      {
         this.Renamed8945.addMessage(param1.userId,param1.message,param1.team);
      }
      
      private function Renamed2579(param1:Object) : void
      {
         this.Renamed8945.Renamed2579(param1.uid,param1.message);
      }
      
      private function Renamed2580(param1:Object) : void
      {
         this.Renamed8945.Renamed2580(param1.message);
      }
      
      private function Renamed2577(param1:Object) : void
      {
         this.Renamed8945.Renamed2577(param1.userId,param1.message,param1.team);
      }
      
      private function Renamed5162() : void
      {
         this.Renamed8945.objectLoaded();
      }
      
      private function Renamed2584(param1:Object) : void
      {
         this.Renamed8945.Renamed2584(param1.header);
      }
   }
}

