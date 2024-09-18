package Renamed342
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class Renamed7951 implements Renamed7939
   {
      private var meshes:Vector.<Mesh>;
      
      private var Renamed7967:PropMesh;
      
      private var textureName:String;
      
      private var Renamed8012:String;
      
      public function Renamed7951(param1:PropMesh, param2:String)
      {
         this.meshes = new Vector.<Mesh>();
         super();
         this.Renamed7967 = param1;
         this.textureName = param2;
      }
      
      public function add(param1:Mesh, param2:String = null) : void
      {
         this.Renamed8012 = param2;
         this.meshes.push(param1);
      }
      
      public function Renamed7940() : TextureByteData
      {
         return this.Renamed7967.textures.getValue(this.textureName);
      }
      
      public function Renamed1179(param1:TextureMaterial) : void
      {
         var _loc2_:Mesh = null;
         var _loc3_:Face = null;
         for each(_loc2_ in this.meshes)
         {
            for each(_loc3_ in _loc2_.faces)
            {
               if(Boolean(this.Renamed8012) && _loc3_.material.name != this.Renamed8012)
               {
                  _loc3_.material = param1;
               }
            }
            _loc2_.removeVertex(_loc2_.addVertex(0,0,0));
         }
      }
   }
}

