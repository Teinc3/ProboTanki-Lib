package alternativa.tanks.service.garage
{
   import alternativa.tanks.gui.GarageWindow;
   
   public class §8!n§ implements GarageService
   {
      private var view:GarageWindow;
      
      public function §8!n§()
      {
         super();
      }
      
      public function §!E§() : GarageWindow
      {
         return this.view;
      }
      
      public function §8c§(param1:GarageWindow) : void
      {
         this.view = param1;
      }
      
      public function §<#h§() : void
      {
         this.view = null;
      }
   }
}

