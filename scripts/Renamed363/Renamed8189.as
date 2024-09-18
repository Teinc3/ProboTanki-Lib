package Renamed363
{
   import Renamed291.Renamed4807;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8189 extends Renamed4886
   {
      private var Renamed8190:Renamed4807;
      
      public var modelId:int;
      
      public function Renamed8189()
      {
         super();
         this.modelId = 76;
         this.Renamed8190 = Renamed4807(modelRegistry.getModel(Long.getLong(0,300050053)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8191.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed8191.Renamed8192:
               this.Renamed7390();
               break;
            case Renamed8191.Renamed8193:
               this.Renamed7391(param1);
               break;
            case Renamed8191.Renamed8194:
               this.Renamed7398(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed8190.putInitParams(param1.initParams);
         this.Renamed8190.objectLoadedPost();
      }
      
      private function Renamed7390() : void
      {
         this.Renamed8190.Renamed7390();
      }
      
      private function Renamed7391(param1:Object) : void
      {
         this.Renamed8190.Renamed7391(param1.data,param1.inviteLink,param1.banner,param1.inviteMessage);
      }
      
      private function Renamed7398(param1:Object) : void
      {
         this.Renamed8190.Renamed7398(param1.errorMessage);
      }
   }
}

