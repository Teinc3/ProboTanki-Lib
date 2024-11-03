package Renamed1
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.engine3d.Renamed1650;
   
   public class Renamed6377 extends Mesh
   {
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var Renamed1649:Vector.<Renamed1650>;
      
      private var numFrames:int;
      
      private var Renamed7020:Number = 0;
      
      public function Renamed6377(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0, param5:Number = 10)
      {
         super();
         this.Renamed7021(param1,param2,param3,param4,param5);
         sorting = Sorting.DYNAMIC_BSP;
         calculateBounds();
         calculateFacesNormals();
         this.Renamed6979();
         this.softAttenuation = 130;
         this.shadowMapAlphaThreshold = 2;
         this.depthMapAlphaThreshold = 2;
      }
      
      private function Renamed7021(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = param1 / 2;
         var _loc7_:Number = param2 / 2;
         var _loc8_:Vector.<Number> = Vector.<Number>([param3 - _loc6_,param4 + _loc7_,param5,param3 - _loc6_,param4 - _loc7_,param5,param3 + _loc6_,param4 - _loc7_,param5,param3 + _loc6_,param4 + _loc7_,param5]);
         var _loc9_:Vector.<Number> = Vector.<Number>([0,0,0,1,1,1,1,0]);
         var _loc10_:Vector.<int> = Vector.<int>([4,0,1,2,3,4,0,3,2,1]);
         addVerticesAndFaces(_loc8_,_loc9_,_loc10_,true);
      }
      
      private function Renamed6979() : void
      {
         var _loc1_:Vector.<Vertex> = this.vertices;
         this.a = _loc1_[0];
         this.b = _loc1_[1];
         this.c = _loc1_[2];
         this.d = _loc1_[3];
      }
      
      public function init(param1:Renamed843, param2:Number) : void
      {
         setMaterialToAllFaces(param1.material);
         this.Renamed1649 = param1.Renamed1652;
         this.numFrames = this.Renamed1649.length;
         this.Renamed7020 = param2;
      }
      
      public function setTime(param1:Number) : void
      {
         var _loc2_:int = param1 * this.Renamed7020;
         if(_loc2_ >= this.numFrames)
         {
            _loc2_ = this.numFrames - 1;
         }
         this.Renamed1655(this.Renamed1649[_loc2_]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.Renamed1649 = null;
         this.numFrames = 0;
      }
      
      public function Renamed6419() : Number
      {
         return this.numFrames / this.Renamed7020;
      }
      
      private function Renamed1655(param1:Renamed1650) : void
      {
         this.a.u = param1.topLeftU;
         this.a.v = param1.topLeftV;
         this.b.u = param1.topLeftU;
         this.b.v = param1.bottomRightV;
         this.c.u = param1.bottomRightU;
         this.c.v = param1.bottomRightV;
         this.d.u = param1.bottomRightU;
         this.d.v = param1.topLeftV;
      }
   }
}

