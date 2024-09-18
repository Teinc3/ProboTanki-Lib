package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.types.Long;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class §function else§
   {
      private static const §?#n§:String = "details.png";
      
      private static const § J§:String = "lightmap.jpg";
      
      private static const §continue class§:Object = {};
      
      public var §2!W§:Long;
      
      public var details:BitmapData;
      
      public var lightmap:BitmapData;
      
      public function §function else§(param1:Tanks3DSResource)
      {
         super();
         this.§2!W§ = param1.id;
         this.details = param1.textures[§?#n§] || this.§4# §(§?#n§,65280);
         this.lightmap = param1.textures[§ J§] || this.§4# §(§ J§,8355711);
      }
      
      private function §4# §(param1:String, param2:uint) : BitmapData
      {
         var _loc3_:BitmapData = §continue class§[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new StubBitmapData(param2);
            §continue class§[param1] = _loc3_;
         }
         return _loc3_;
      }
      
      public function createTexture(param1:BitmapData) : BitmapData
      {
         var _loc2_:BitmapData = new BitmapData(this.lightmap.width,this.lightmap.height,false,0);
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginBitmapFill(param1);
         _loc3_.graphics.drawRect(0,0,this.lightmap.width,this.lightmap.height);
         _loc2_.draw(_loc3_);
         _loc2_.draw(this.lightmap,null,null,BlendMode.HARDLIGHT);
         _loc2_.draw(this.details);
         _loc3_ = null;
         return _loc2_;
      }
      
      protected function initMesh(param1:Mesh) : Mesh
      {
         if(param1.sorting != Sorting.DYNAMIC_BSP)
         {
            param1.sorting = Sorting.DYNAMIC_BSP;
            param1.calculateFacesNormals(true);
            param1.optimizeForDynamicBSP();
            param1.threshold = 0.01;
         }
         return param1;
      }
   }
}

