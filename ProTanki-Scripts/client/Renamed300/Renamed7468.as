package Renamed300
{
   import alternativa.types.Long;
   import Renamed362.Renamed4838;
   import Renamed385.Renamed4886;
   
   public class Renamed7459 extends Renamed4886
   {
      private static var Renamed7460:Renamed4838;
      
      public var modelId:int;
      
      public function Renamed7459()
      {
         super();
         this.modelId = 9;
         Renamed7460 = Renamed4838(modelRegistry.getModel(Long.getLong(0,300020022)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7461.Renamed7462:
               this.Renamed7463();
               break;
            case Renamed7461.Renamed7464:
               this.Renamed3579();
               break;
            case Renamed7461.Renamed7465:
               this.Renamed6221(param1);
               break;
            case Renamed7461.Renamed7466:
               this.Renamed3582(param1);
         }
      }
      
      private function Renamed7463() : void
      {
         Renamed7460.Renamed7467();
      }
      
      private function Renamed3579() : void
      {
         Renamed7460.Renamed3579();
      }
      
      private function Renamed6221(param1:Object) : void
      {
         Renamed7460.Renamed6221(param1.currentEmail);
      }
      
      private function Renamed3582(param1:Object) : void
      {
         Renamed7460.Renamed3582(param1.success,param1.error);
      }
   }
}

