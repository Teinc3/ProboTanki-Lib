package Renamed503
{
   import alternativa.tanks.model.news.NewsShowingModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9874 extends Renamed4886
   {
      private var Renamed9875:NewsShowingModel;
      
      public var modelId:int;
      
      public function Renamed9874()
      {
         super();
         this.modelId = 68;
         this.Renamed9875 = NewsShowingModel(modelRegistry.getModel(Long.getLong(0,300050034)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9876.Renamed5161:
               this.Renamed5162(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed9875.putInitParams(param1.initParams);
         this.Renamed9875.objectLoaded();
      }
   }
}

