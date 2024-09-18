package §dynamic catch class§
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class §finally catch const§ implements §#!5§
   {
      private var meshes:Vector.<Mesh>;
      
      private var §implements var return§:PropMesh;
      
      private var textureName:String;
      
      private var §override catch switch§:String;
      
      public function §finally catch const§(param1:PropMesh, param2:String)
      {
         this.meshes = new Vector.<Mesh>();
         super();
         this.§implements var return§ = param1;
         this.textureName = param2;
      }
      
      public function add(param1:Mesh, param2:String = null) : void
      {
         this.§override catch switch§ = param2;
         this.meshes.push(param1);
      }
      
      public function §;"'§() : TextureByteData
      {
         return this.§implements var return§.textures.getValue(this.textureName);
      }
      
      public function §28§(param1:TextureMaterial) : void
      {
         var _loc2_:Mesh = null;
         var _loc3_:Face = null;
         for each(_loc2_ in this.meshes)
         {
            for each(_loc3_ in _loc2_.faces)
            {
               if(Boolean(this.§override catch switch§) && _loc3_.material.name != this.§override catch switch§)
               {
                  _loc3_.material = param1;
               }
            }
            _loc2_.removeVertex(_loc2_.addVertex(0,0,0));
         }
      }
   }
}

