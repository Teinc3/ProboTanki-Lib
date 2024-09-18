package Renamed321
{
   import alternativa.types.Long;
   import Renamed319.Renamed4833;
   import Renamed346.Renamed7710;
   import Renamed385.Renamed4886;
   
   public class Renamed7711 extends Renamed4886
   {
      private var Renamed7712:Renamed4833;
      
      public var modelId:int;
      
      public function Renamed7711()
      {
         super();
         this.modelId = 5;
         this.Renamed7712 = Renamed4833(modelRegistry.getModel(Long.getLong(0,300020016)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7713.Renamed7714:
               this.Renamed7715(param1);
               break;
            case Renamed7713.Renamed7716:
               this.Renamed3577(param1);
               break;
            case Renamed7713.Renamed7717:
               this.Renamed7701();
               break;
            case Renamed7713.Renamed7718:
               this.Renamed3575();
         }
      }
      
      private function Renamed7715(param1:Object) : void
      {
         this.Renamed7712.putInitParams(new Renamed7710(param1.inviteEnabled));
         this.Renamed7712.objectLoaded();
      }
      
      private function Renamed3575() : void
      {
         this.Renamed7712.Renamed3575();
      }
      
      private function Renamed7701() : void
      {
         this.Renamed7712.Renamed7701();
      }
      
      private function Renamed3577(param1:Object) : void
      {
         this.Renamed7712.Renamed3577(param1.nickname);
      }
   }
}

