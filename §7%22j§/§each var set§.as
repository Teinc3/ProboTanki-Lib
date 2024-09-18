package §7"j§
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.engine3d.§try set break§;
   
   public class §each var set§ extends Mesh
   {
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var §static const break§:Vector.<§try set break§>;
      
      private var numFrames:int;
      
      private var §override var const§:Number = 0;
      
      public function §each var set§(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0, param5:Number = 10)
      {
         super();
         this.§ "-§(param1,param2,param3,param4,param5);
         sorting = Sorting.DYNAMIC_BSP;
         calculateBounds();
         calculateFacesNormals();
         this.§continue package null§();
         this.softAttenuation = 130;
         this.shadowMapAlphaThreshold = 2;
         this.depthMapAlphaThreshold = 2;
      }
      
      private function § "-§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = param1 / 2;
         var _loc7_:Number = param2 / 2;
         var _loc8_:Vector.<Number> = Vector.<Number>([param3 - _loc6_,param4 + _loc7_,param5,param3 - _loc6_,param4 - _loc7_,param5,param3 + _loc6_,param4 - _loc7_,param5,param3 + _loc6_,param4 + _loc7_,param5]);
         var _loc9_:Vector.<Number> = Vector.<Number>([0,0,0,1,1,1,1,0]);
         var _loc10_:Vector.<int> = Vector.<int>([4,0,1,2,3,4,0,3,2,1]);
         addVerticesAndFaces(_loc8_,_loc9_,_loc10_,true);
      }
      
      private function §continue package null§() : void
      {
         var _loc1_:Vector.<Vertex> = this.vertices;
         this.a = _loc1_[0];
         this.b = _loc1_[1];
         this.c = _loc1_[2];
         this.d = _loc1_[3];
      }
      
      public function init(param1:§throw const switch§, param2:Number) : void
      {
         setMaterialToAllFaces(param1.material);
         this.§static const break§ = param1.§catch catch catch§;
         this.numFrames = this.§static const break§.length;
         this.§override var const§ = param2;
      }
      
      public function setTime(param1:Number) : void
      {
         var _loc2_:int = param1 * this.§override var const§;
         if(_loc2_ >= this.numFrames)
         {
            _loc2_ = this.numFrames - 1;
         }
         this.§;!4§(this.§static const break§[_loc2_]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.§static const break§ = null;
         this.numFrames = 0;
      }
      
      public function §8a§() : Number
      {
         return this.numFrames / this.§override var const§;
      }
      
      private function §;!4§(param1:§try set break§) : void
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

