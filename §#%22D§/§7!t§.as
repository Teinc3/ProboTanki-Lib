package §#"D§
{
   import § !g§.§class for case§;
   import §'H§.§const const case§;
   import §'H§.§implements set else§;
   import §9p§.§var const final§;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class §7!t§
   {
      [Inject]
      public static var §class package if§:ColorTransformService;
      
      [Inject]
      public static var §@#R§:TextureMaterialRegistry;
      
      [Inject]
      public static var §get const true§:ILightingEffectsService;
      
      public static const §use for in§:Number = 1000;
      
      public static const §class package get§:Number = 350;
      
      private static const MAX_PROGRESS:Number = 100;
      
      private static const §2#,§:Number = 1.5;
      
      private var §true catch finally§:BSP;
      
      private var §finally const return§:TextureMaterial;
      
      private var §5N§:TextureMaterial;
      
      private var §6!5§:TextureMaterial;
      
      private var §[#t§:TextureMaterial;
      
      private var §for package try§:§var catch dynamic§;
      
      private var lightSource:OmniLight;
      
      private var §native for switch§:§const const case§;
      
      private var §const for break§:§const const case§;
      
      private var §const package try§:§const const case§;
      
      public function §7!t§(param1:String, param2:§[!r§, param3:§var const final§)
      {
         super();
         this.§true catch finally§ = §@#g§(param3.§true catch finally§);
         this.§6!5§ = §@#R§.getMaterial(param3.§`!>§.data);
         this.§5N§ = §@#R§.getMaterial(param3.§5I§.data);
         this.§[#t§ = §@#R§.getMaterial(param3.§>#l§.data);
         var _loc4_:§implements set else§ = §get const true§.§try const include§(§final package import§.CP);
         this.§native for switch§ = _loc4_.§ #i§(§class for case§.RED);
         this.§const for break§ = _loc4_.§ #i§(§class for case§.BLUE);
         this.§const package try§ = _loc4_.§ #i§(§class for case§.NONE);
         this.§##g§(param1,param3);
         this.§class const true§(_loc4_);
         param2.§const var extends§(this.§for package try§);
         param2.§const var extends§(this.§true catch finally§);
      }
      
      private static function §@#g§(param1:Tanks3DSResource) : BSP
      {
         var _loc2_:Mesh = Mesh(param1.objects[0]);
         var _loc3_:BSP = new BSP();
         _loc3_.createTree(_loc2_);
         return _loc3_;
      }
      
      private static function §!<§(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = §@#R§.getMaterial(param1,false);
         _loc2_.resolution = §use for in§ / param1.width;
         return _loc2_;
      }
      
      private static function §super var§(param1:BitmapData, param2:BitmapData, param3:int) : Matrix
      {
         var _loc4_:int = param2.height;
         var _loc5_:Matrix;
         (_loc5_ = new Matrix()).tx = (param1.height - _loc4_) / 2 - _loc4_ * param3;
         _loc5_.ty = (param1.height - _loc4_) / 2;
         return _loc5_;
      }
      
      private static function § !L§(param1:BitmapData, param2:BitmapData) : Rectangle
      {
         var _loc3_:int = param2.height;
         var _loc4_:Number = (param1.height - _loc3_) / 2;
         return new Rectangle(_loc4_,_loc4_,_loc3_,_loc3_);
      }
      
      private static function §&b§(param1:BitmapData, param2:BitmapData) : BitmapData
      {
         var _loc3_:BitmapData = param1.clone();
         _loc3_.copyChannel(param2,param2.rect,new Point(),BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
         return _loc3_;
      }
      
      private static function §continue for finally§(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + (param2 - param1) * param3;
      }
      
      private static function §?u§(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:Number = (param1 >> 16 & 0xFF) / 255;
         var _loc5_:Number = (param1 >> 8 & 0xFF) / 255;
         var _loc6_:Number = (param1 & 0xFF) / 255;
         var _loc7_:Number = (param2 >> 16 & 0xFF) / 255;
         var _loc8_:Number = (param2 >> 8 & 0xFF) / 255;
         var _loc9_:Number = (param2 & 0xFF) / 255;
         var _loc10_:int = §continue for finally§(_loc4_,_loc7_,param3) * 255;
         var _loc11_:int = §continue for finally§(_loc5_,_loc8_,param3) * 255;
         var _loc12_:int = §continue for finally§(_loc6_,_loc9_,param3) * 255;
         return _loc10_ << 16 | _loc11_ << 8 | _loc12_;
      }
      
      private function §class const true§(param1:§implements set else§) : void
      {
         this.lightSource = new OmniLight(0,param1.§super const native§(),param1.§with set true§());
         this.§set set throw§(this.§const package try§);
      }
      
      private function §##g§(param1:String, param2:§var const final§) : void
      {
         var _loc3_:BitmapData = param2.§break for const§.data.clone();
         var _loc4_:BitmapData = param2.§8!1§.data.clone();
         var _loc5_:BitmapData = param2.§use set set§.data.clone();
         var _loc6_:BitmapData = param2.§set var import§.data;
         var _loc7_:int = param1.charCodeAt(0) - "A".charCodeAt(0);
         var _loc8_:Rectangle = § !L§(_loc3_,_loc6_);
         var _loc9_:Matrix = §super var§(_loc3_,_loc6_,_loc7_);
         _loc3_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         _loc4_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         _loc5_.draw(_loc6_,_loc9_,null,BlendMode.NORMAL,_loc8_,true);
         var _loc10_:BitmapData = §&b§(_loc4_,_loc3_);
         var _loc11_:BitmapData = §&b§(_loc5_,_loc3_);
         var _loc12_:TextureMaterial = §!<§(_loc3_);
         var _loc13_:TextureMaterial = §!<§(_loc4_);
         var _loc14_:TextureMaterial = §!<§(_loc10_);
         var _loc15_:TextureMaterial = §!<§(_loc5_);
         var _loc16_:TextureMaterial = §!<§(_loc11_);
         this.§for package try§ = new §var catch dynamic§(§use for in§,§use for in§,_loc12_,_loc14_,_loc13_,_loc16_,_loc15_);
      }
      
      public function update(param1:Number, param2:Camera3D) : void
      {
         this.§for package try§.setProgress(param1);
         this.§for package try§.§switch const dynamic§(param2);
         this.§true for return§(param1 / MAX_PROGRESS);
      }
      
      public function addToScene(param1:§[!r§, param2:Vector3) : void
      {
         this.§true catch finally§.x = param2.x;
         this.§true catch finally§.y = param2.y;
         this.§true catch finally§.z = param2.z;
         param1.§with catch with§(this.§true catch finally§);
         this.§for package try§.x = param2.x;
         this.§for package try§.y = param2.y;
         this.§for package try§.z = param2.z + §class package get§;
         param1.§with catch with§(this.§for package try§);
         this.lightSource.x = param2.x;
         this.lightSource.y = param2.y;
         this.lightSource.z = param2.z + §class package get§;
         param1.§with catch with§(this.lightSource);
      }
      
      public function §-"Q§() : void
      {
         this.§while set try§(this.§5N§);
         this.§set set throw§(this.§native for switch§);
      }
      
      public function §7]§() : void
      {
         this.§while set try§(this.§6!5§);
         this.§set set throw§(this.§const for break§);
      }
      
      public function §;"E§() : void
      {
         this.§while set try§(this.§[#t§);
         this.§set set throw§(this.§const package try§);
      }
      
      private function §while set try§(param1:TextureMaterial) : void
      {
         if(this.§finally const return§ != param1)
         {
            this.§finally const return§ = param1;
            this.§true catch finally§.setMaterialToAllFaces(param1);
         }
      }
      
      private function §set set throw§(param1:§const const case§) : void
      {
         this.lightSource.color = param1.§#!@§();
         this.lightSource.intensity = param1.§"#`§();
      }
      
      private function §true for return§(param1:Number) : void
      {
         var _loc2_:uint = param1 < 0 ? uint(this.§native for switch§.§#!@§()) : uint(this.§const for break§.§#!@§());
         var _loc3_:Number = param1 < 0 ? Number(this.§native for switch§.§"#`§()) : Number(this.§const for break§.§"#`§());
         this.lightSource.color = §?u§(this.§const package try§.§#!@§(),_loc2_,Math.pow(Math.abs(param1),§2#,§));
         this.lightSource.intensity = §continue for finally§(this.§const package try§.§"#`§(),_loc3_,Math.pow(Math.abs(param1),§2#,§));
      }
   }
}

