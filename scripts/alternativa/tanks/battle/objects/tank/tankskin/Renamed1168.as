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
   
   public class Renamed1168
   {
      private static const Renamed1280:String = "details.png";
      
      private static const Renamed1281:String = "lightmap.jpg";
      
      private static const Renamed1282:Object = {};
      
      public var Renamed1174:Long;
      
      public var details:BitmapData;
      
      public var lightmap:BitmapData;
      
      public function Renamed1168(param1:Tanks3DSResource)
      {
         super();
         this.Renamed1174 = param1.id;
         this.details = param1.textures[Renamed1280] || this.Renamed1283(Renamed1280,65280);
         this.lightmap = param1.textures[Renamed1281] || this.Renamed1283(Renamed1281,8355711);
      }
      
      private function Renamed1283(param1:String, param2:uint) : BitmapData
      {
         var _loc3_:BitmapData = Renamed1282[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new StubBitmapData(param2);
            Renamed1282[param1] = _loc3_;
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

