package Renamed429
{
   import Renamed475.Renamed4630;
   import Renamed475.Renamed4631;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8851 extends Renamed4886
   {
      private var Renamed5132:Renamed4630;
      
      public var modelId:int;
      
      public function Renamed8851()
      {
         super();
         this.modelId = 60;
         this.Renamed5132 = Renamed4630(modelRegistry.getModel(Long.getLong(375259874,-2064506790)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8837.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed8837.Renamed8845:
               this.Renamed6095(param1);
               break;
            case Renamed8837.Renamed8840:
               this.Renamed6096(param1);
               break;
            case Renamed8837.Renamed8843:
               this.Renamed6097(param1);
               break;
            case Renamed8837.Renamed8842:
               this.Renamed6098(param1);
               break;
            case Renamed8837.Renamed8844:
               this.Renamed6100(param1);
               break;
            case Renamed8837.Renamed8841:
               this.Renamed6101(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         OSGi.getInstance().registerService(Renamed4631,this.Renamed5132);
         this.Renamed5132.putInitParams(param1.initParams);
         this.Renamed5132.objectLoaded();
         this.Renamed5132.objectLoadedPost();
      }
      
      private function Renamed6095(param1:Object) : void
      {
         this.Renamed5132.Renamed6095(param1.team);
      }
      
      private function Renamed6096(param1:Object) : void
      {
         this.Renamed5132.Renamed6096(param1.team);
      }
      
      private function Renamed6097(param1:Object) : void
      {
         this.Renamed5132.Renamed6097(param1.pointId,param1.progress,param1.progressSpeed);
      }
      
      private function Renamed6098(param1:Object) : void
      {
         this.Renamed5132.Renamed6098(param1.pointId,param1.state);
      }
      
      private function Renamed6100(param1:Object) : void
      {
         this.Renamed5132.Renamed6100(param1.pointId,param1.tankId);
      }
      
      private function Renamed6101(param1:Object) : void
      {
         this.Renamed5132.Renamed6101(param1.pointId,param1.tankId);
      }
   }
}

