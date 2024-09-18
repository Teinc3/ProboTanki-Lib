package alternativa.tanks.service.garage
{
   import alternativa.tanks.gui.GarageWindow;
   
   public class Renamed561 implements GarageService
   {
      private var view:GarageWindow;
      
      public function Renamed561()
      {
         super();
      }
      
      public function Renamed1933() : GarageWindow
      {
         return this.view;
      }
      
      public function Renamed2096(param1:GarageWindow) : void
      {
         this.view = param1;
      }
      
      public function Renamed2098() : void
      {
         this.view = null;
      }
   }
}

