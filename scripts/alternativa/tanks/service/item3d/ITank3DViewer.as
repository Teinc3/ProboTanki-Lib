package alternativa.tanks.service.item3d
{
   import alternativa.tanks.gui.tankpreview.TankPreviewWindow;
   import flash.display.BitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public interface ITank3DViewer
   {
      function setView(param1:TankPreviewWindow) : void;
      
      function resetView() : void;
      
      function setArmor(param1:Tanks3DSResource) : void;
      
      function setWeapon(param1:Tanks3DSResource) : void;
      
      function setColor(param1:BitmapData) : void;
      
      function Renamed2110(param1:BitmapData) : void;
      
      function Renamed1762() : void;
   }
}

