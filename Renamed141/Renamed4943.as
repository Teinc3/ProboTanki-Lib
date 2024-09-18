package Renamed141
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   public class Renamed4943 extends Mesh
   {
      public function Renamed4943(param1:Number)
      {
         super();
         var _loc2_:Number = param1 / 2;
         var _loc3_:Number = 0;
         var _loc4_:Vertex = addVertex(-_loc2_,0,param1 + _loc3_,0,0);
         var _loc5_:Vertex = addVertex(-_loc2_,0,0 + _loc3_,0,1);
         var _loc6_:Vertex = addVertex(_loc2_,0,0 + _loc3_,1,1);
         var _loc7_:Vertex = addVertex(_loc2_,0,param1 + _loc3_,1,0);
         addQuadFace(_loc4_,_loc5_,_loc6_,_loc7_);
         sorting = Sorting.DYNAMIC_BSP;
         calculateBounds();
         calculateFacesNormals();
      }
      
      public function init(param1:TextureMaterial) : void
      {
         setMaterialToAllFaces(param1);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
      }
   }
}

