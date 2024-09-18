package Renamed442
{
   import alternativa.tanks.model.ChatModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8944 extends Renamed4886
   {
      private var Renamed8945:ChatModel;
      
      public var modelId:int;
      
      public function Renamed8944()
      {
         super();
         this.modelId = 28;
         this.Renamed8945 = ChatModel(modelRegistry.getModel(Long.getLong(1413646454,-1397687631)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8936.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed8936.Renamed8940:
               this.updateTypingSpeedAntifloodParams(param1);
               break;
            case Renamed8936.Renamed8941:
               this.showMessages(param1);
               break;
            case Renamed8936.Renamed8939:
               this.cleanUsersMessages(param1);
               break;
            case Renamed8936.Renamed8937:
               this.Renamed8946();
               break;
            case Renamed8936.CodecRegisterer4:
               this.CodecRegisterer5(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed8945.putInitParams(param1.initParams);
         this.Renamed8945.objectLoaded();
      }
      
      private function updateTypingSpeedAntifloodParams(param1:Object) : void
      {
         this.Renamed8945.updateTypingSpeedAntifloodParams(param1.symbolCost,param1.enterCost);
      }
      
      private function showMessages(param1:Object) : void
      {
         this.Renamed8945.showMessages(param1.messages);
      }
      
      private function cleanUsersMessages(param1:Object) : void
      {
         this.Renamed8945.cleanUsersMessages(param1.uid);
      }
      
      private function Renamed8946() : void
      {
         this.Renamed8945.clearAllMessages();
      }
      
      private function CodecRegisterer5(param1:Object) : void
      {
         this.Renamed8945.objectUnloaded();
      }
   }
}

