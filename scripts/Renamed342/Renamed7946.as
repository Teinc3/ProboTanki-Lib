package Renamed342
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class Renamed7946 implements Renamed7939
   {
      private var Renamed7967:PropMesh;
      
      private var textureName:String;
      
      private var Renamed7968:Vector.<BSP>;
      
      public function Renamed7946(param1:PropMesh, param2:String)
      {
         this.Renamed7968 = new Vector.<BSP>();
         super();
         this.Renamed7967 = param1;
         this.textureName = param2;
      }
      
      public function Renamed7948(param1:BSP) : void
      {
         this.Renamed7968.push(param1);
      }
      
      public function Renamed1179(param1:TextureMaterial) : void
      {
         var _loc2_:BSP = null;
         for each(_loc2_ in this.Renamed7968)
         {
            _loc2_.setMaterialToAllFaces(param1);
         }
      }
      
      public function Renamed7940() : TextureByteData
      {
         return this.Renamed7967.textures.getValue(this.textureName);
      }
   }
}

