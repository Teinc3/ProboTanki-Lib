package Renamed4553
{
   import Renamed136.Renamed663;
   import Renamed199.Renamed3823;
   import Renamed199.Renamed3820;
   import Renamed289.Renamed5084;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed4554
   {
      [Inject]
      public static var Renamed2421:ColorTransformService;
      
      [Inject]
      public static var Renamed1368:TextureMaterialRegistry;
      
      [Inject]
      public static var Renamed4730:ILightingEffectsService;
      
      public static const Renamed5085:Number = 1000;
      
      public static const Renamed5086:Number = 350;
      
      private static const MAX_PROGRESS:Number = 100;
      
      private static const Renamed5087:Number = 1.5;
      
      private var Renamed5088:BSP;
      
      private var Renamed5089:TextureMaterial;
      
      private var Renamed5090:TextureMaterial;
      
      private var Renamed5091:TextureMaterial;
      
      private var Renamed5092:TextureMaterial;
      
      private var Renamed5093:Renamed5094;
      
      private var lightSource:OmniLight;
      
      private var Renamed5095:Renamed3823;
      
      private var Renamed5096:Renamed3823;
      
      private var Renamed5097:Renamed3823;
      
      public function Renamed4554(param1:String, param2:Renamed610, param3:Renamed5084)
      {
         super();
         this.Renamed5088 = Renamed5098(param3.Renamed5088);
         this.Renamed5091 = Renamed1368.getMaterial(param3.Renamed5099.data);
         this.Renamed5090 = Renamed1368.getMaterial(param3.Renamed5100.data);
         this.Renamed5092 = Renamed1368.getMaterial(param3.Renamed5101.data);
         var _loc4_:Renamed3820 = Renamed4730.Renamed3822(Renamed1587.CP);
         this.Renamed5095 = _loc4_.Renamed5102(Renamed663.RED);
         this.Renamed5096 = _loc4_.Renamed5102(Renamed663.BLUE);
         this.Renamed5097 = _loc4_.Renamed5102(Renamed663.NONE);
         this.Renamed5103(param1,param3);
         this.Renamed5104(_loc4_);
         param2.Renamed1402(this.Renamed5093);
         param2.Renamed1402(this.Renamed5088);
      }
      
      private static function Renamed5098(param1:Tanks3DSResource) : BSP
      {
         var _loc2_:Mesh = Mesh(param1.objects[0]);
         var _loc3_:BSP = new BSP();
         _loc3_.createTree(_loc2_);
         return _loc3_;
      }
      
      private static function Renamed5105(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = Renamed1368.getMaterial(param1,false);
         _loc2_.resolution = Renamed5085 / param1.width;
         return _loc2_;
      }
      
      private static function Renamed5106(param1:BitmapData, param2:BitmapData, param3:int) : Matrix
      {
         var _loc4_:int = param2.height;
         var _loc5_:Matrix;
         (_loc5_ = new Matrix()).tx = (param1.height - _loc4_) / 2 - _loc4_ * param3;
         _loc5_.ty = (param1.height - _loc4_) / 2;
         return _loc5_;
      }
      
      private static function Renamed5107(param1:BitmapData, param2:BitmapData) : Rectangle
      {
         var _loc3_:int = param2.height;
         var _loc4_:Number = (param1.height - _loc3_) / 2;
         return new Rectangle(_loc4_,_loc4_,_loc3_,_loc3_);
      }
      
      private static function Renamed5108(param1:BitmapData, param2:BitmapData) : BitmapData
      {
         var _loc3_:BitmapData = param1.clone();
         _loc3_.copyChannel(param2,param2.rect,new Point(),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
         return _loc3_;
      }
      
      private static function Renamed5109(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + (param2 - param1) * param3;
      }
      
      private static function Renamed5110(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:Number = (param1 >> 16 & 0xFF) / 255;
         var _loc5_:Number = (param1 >> 8 & 0xFF) / 255;
         var _loc6_:Number = (param1 & 0xFF) / 255;
         var _loc7_:Number = (param2 >> 16 & 0xFF) / 255;
         var _loc8_:Number = (param2 >> 8 & 0xFF) / 255;
         var _loc9_:Number = (param2 & 0xFF) / 255;
         var _loc10_:int = Renamed5109(_loc4_,_loc7_,param3) * 255;
         var _loc11_:int = Renamed5109(_loc5_,_loc8_,param3) * 255;
         var _loc12_:int = Renamed5109(_loc6_,_loc9_,param3) * 255;
         return _loc10_ << 16 | _loc11_ << 8 | _loc12_;
      }
      
      private function Renamed5104(param1:Renamed3820) : void
      {
         this.lightSource = new OmniLight(0,param1.Renamed5111(),param1.Renamed5112());
         this.Renamed5113(this.Renamed5097);
      }
      
      private function Renamed5103(param1:String, param2:Renamed5084) : void
      {
         var _loc3_:BitmapData = param2.Renamed5114.data.clone();
         var _loc4_:BitmapData = param2.Renamed5115.data.clone();
         var _loc5_:BitmapData = param2.Renamed5116.data.clone();
         var _loc6_:BitmapData = param2.Renamed5117.data;
         var _loc7_:int = param1.charCodeAt(0) - "A".charCodeAt(0);
         var _loc8_:Rectangle = Renamed5107(_loc3_,_loc6_);
         var _loc9_:Matrix = Renamed5106(_loc3_,_loc6_,_loc7_);
         _loc3_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         _loc4_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         _loc5_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         var _loc10_:BitmapData = Renamed5108(_loc4_,_loc3_);
         var _loc11_:BitmapData = Renamed5108(_loc5_,_loc3_);
         var _loc12_:TextureMaterial = Renamed5105(_loc3_);
         var _loc13_:TextureMaterial = Renamed5105(_loc4_);
         var _loc14_:TextureMaterial = Renamed5105(_loc10_);
         var _loc15_:TextureMaterial = Renamed5105(_loc5_);
         var _loc16_:TextureMaterial = Renamed5105(_loc11_);
         this.Renamed5093 = new Renamed5094(Renamed5085,Renamed5085,_loc12_,_loc14_,_loc13_,_loc16_,_loc15_);
      }
      
      public function update(param1:Number, param2:Camera3D) : void
      {
         this.Renamed5093.setProgress(param1);
         this.Renamed5093.Renamed5118(param2);
         this.Renamed5119(param1 / MAX_PROGRESS);
      }
      
      public function addToScene(param1:Renamed610, param2:Vector3) : void
      {
         this.Renamed5088.x = param2.x;
         this.Renamed5088.y = param2.y;
         this.Renamed5088.z = param2.z;
         param1.Renamed1258(this.Renamed5088);
         this.Renamed5093.x = param2.x;
         this.Renamed5093.y = param2.y;
         this.Renamed5093.z = param2.z + Renamed5086;
         param1.Renamed1258(this.Renamed5093);
         this.lightSource.x = param2.x;
         this.lightSource.y = param2.y;
         this.lightSource.z = param2.z + Renamed5086;
         param1.Renamed1258(this.lightSource);
      }
      
      public function Renamed5120() : void
      {
         this.Renamed5121(this.Renamed5090);
         this.Renamed5113(this.Renamed5095);
      }
      
      public function Renamed5122() : void
      {
         this.Renamed5121(this.Renamed5091);
         this.Renamed5113(this.Renamed5096);
      }
      
      public function Renamed5123() : void
      {
         this.Renamed5121(this.Renamed5092);
         this.Renamed5113(this.Renamed5097);
      }
      
      private function Renamed5121(param1:TextureMaterial) : void
      {
         if(this.Renamed5089 != param1)
         {
            this.Renamed5089 = param1;
            this.Renamed5088.setMaterialToAllFaces(param1);
         }
      }
      
      private function Renamed5113(param1:Renamed3823) : void
      {
         this.lightSource.color = param1.Renamed772();
         this.lightSource.intensity = param1.Renamed5124();
      }
      
      private function Renamed5119(param1:Number) : void
      {
         var _loc2_:uint = param1 < 0 ? uint(this.Renamed5095.Renamed772()) : uint(this.Renamed5096.Renamed772());
         var _loc3_:Number = param1 < 0 ? Number(this.Renamed5095.Renamed5124()) : Number(this.Renamed5096.Renamed5124());
         this.lightSource.color = Renamed5110(this.Renamed5097.Renamed772(),_loc2_,Math.pow(Math.abs(param1),Renamed5087));
         this.lightSource.intensity = Renamed5109(this.Renamed5097.Renamed5124(),_loc3_,Math.pow(Math.abs(param1),Renamed5087));
      }
   }
}

