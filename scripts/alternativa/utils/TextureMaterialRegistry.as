package alternativa.utils
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1168;
   import alternativa.tanks.materials.AnimatedPaintMaterial;
   import alternativa.tanks.materials.PaintMaterial;
   import flash.display.BitmapData;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public interface TextureMaterialRegistry
   {
      function getAnimatedPaint(param1:MultiframeImageResource, param2:Renamed1168) : AnimatedPaintMaterial;
      
      function getPaint(param1:ImageResource, param2:Renamed1168) : PaintMaterial;
      
      function getMaterial(param1:BitmapData, param2:Boolean = true) : TextureMaterial;
      
      function addMaterial(param1:TextureMaterial) : void;
      
      function releaseMaterial(param1:TextureMaterial) : void;
      
      function setMipMapping(param1:Boolean) : void;
      
      function clear() : void;
   }
}

