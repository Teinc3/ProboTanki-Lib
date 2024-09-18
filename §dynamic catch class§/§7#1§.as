package §dynamic catch class§
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class §7#1§ implements §#!5§
   {
      private var §implements var return§:PropMesh;
      
      private var textureName:String;
      
      private var § !@§:Vector.<BSP>;
      
      public function §7#1§(param1:PropMesh, param2:String)
      {
         this.§ !@§ = new Vector.<BSP>();
         super();
         this.§implements var return§ = param1;
         this.textureName = param2;
      }
      
      public function §while package catch§(param1:BSP) : void
      {
         this.§ !@§.push(param1);
      }
      
      public function §28§(param1:TextureMaterial) : void
      {
         var _loc2_:BSP = null;
         for each(_loc2_ in this.§ !@§)
         {
            _loc2_.setMaterialToAllFaces(param1);
         }
      }
      
      public function §;"'§() : TextureByteData
      {
         return this.§implements var return§.textures.getValue(this.textureName);
      }
   }
}

