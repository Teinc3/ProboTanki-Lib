package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.tankskin.§function else§;
   import alternativa.tanks.materials.AnimatedPaintMaterial;
   import alternativa.tanks.materials.PaintMaterial;
   import alternativa.utils.TextureMaterialRegistry;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §continue package dynamic§ implements TextureMaterialRegistry
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var §try catch else§:§null const class§;
      
      private var §8#K§:§##A§;
      
      private var §for var include§:Boolean;
      
      public function §continue package dynamic§(param1:§##A§)
      {
         this.materials = new Vector.<TextureMaterial>();
         this.§null set case§ = new Dictionary();
         this.§0!m§ = new Dictionary();
         this.§try catch else§ = new §null const class§();
         super();
         this.§8#K§ = param1;
      }
      
      public function §static package function§() : §null const class§
      {
         return this.§try catch else§;
      }
      
      public function getAnimatedPaint(param1:MultiframeImageResource, param2:§function else§) : AnimatedPaintMaterial
      {
         var _loc3_:§while null§ = null;
         ++this.§try catch else§.§package const true§;
         var _loc4_:String = param1.id + " " + param2.§2!W§;
         if(_loc4_ in this.§null set case§)
         {
            _loc3_ = this.§null set case§[_loc4_];
            ++_loc3_.§@#;§;
            return _loc3_.material as AnimatedPaintMaterial;
         }
         var _loc5_:int = param1.data.width / param1.frameWidth;
         var _loc6_:int = param1.data.height / param1.frameHeight;
         var _loc7_:AnimatedPaintMaterial = new AnimatedPaintMaterial(param1.data,param2.lightmap,param2.details,_loc5_,_loc6_,param1.fps,param1.numFrames,this.§for var include§ ? int(MipMapping.PER_PIXEL) : int(0));
         _loc3_ = this.§with for var§(_loc4_,_loc7_);
         ++_loc3_.§@#;§;
         this.materials.push(_loc7_);
         ++this.§try catch else§.§6"e§;
         return _loc7_;
      }
      
      public function getPaint(param1:ImageResource, param2:§function else§) : PaintMaterial
      {
         var _loc3_:§while null§ = null;
         ++this.§try catch else§.§package const true§;
         var _loc4_:String = param1.id + " " + param2.§2!W§;
         if(_loc4_ in this.§null set case§)
         {
            _loc3_ = this.§null set case§[_loc4_];
            ++_loc3_.§@#;§;
            return _loc3_.material as PaintMaterial;
         }
         var _loc5_:PaintMaterial = new PaintMaterial(param1.data,param2.lightmap,param2.details,this.§for var include§ ? int(MipMapping.PER_PIXEL) : int(0));
         _loc3_ = this.§with for var§(_loc4_,_loc5_);
         ++_loc3_.§@#;§;
         this.materials.push(_loc5_);
         ++this.§try catch else§.§6"e§;
         return _loc5_;
      }
      
      public function getMaterial(param1:BitmapData, param2:Boolean = true) : TextureMaterial
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         ++this.§try catch else§.§package const true§;
         var _loc3_:§while null§ = this.§;"6§(param1,param2);
         ++_loc3_.§@#;§;
         return _loc3_.material;
      }
      
      private function §;"6§(param1:BitmapData, param2:Boolean) : §while null§
      {
         var _loc3_:TextureMaterial = null;
         var _loc4_:§while null§ = this.§null set case§[param1];
         if(_loc4_ == null)
         {
            _loc3_ = this.§>#W§(param1,param2);
            _loc4_ = this.§2X§(param1,_loc3_);
         }
         return _loc4_;
      }
      
      private function §>#W§(param1:BitmapData, param2:Boolean) : TextureMaterial
      {
         var _loc3_:BitmapData = this.getTexture(param1,param2);
         var _loc4_:TextureMaterial = this.§8#K§.§>j§(_loc3_,this.§for var include§);
         this.materials.push(_loc4_);
         ++this.§try catch else§.§6"e§;
         return _loc4_;
      }
      
      protected function getTexture(param1:BitmapData, param2:Boolean) : BitmapData
      {
         throw new Error("Not implemented");
      }
      
      private function §with for var§(param1:String, param2:TextureMaterial) : §while null§
      {
         var _loc3_:§while null§ = new §while null§(param1,param2);
         this.§null set case§[param1] = _loc3_;
         this.§0!m§[param2] = _loc3_;
         return _loc3_;
      }
      
      private function §2X§(param1:BitmapData, param2:TextureMaterial) : §while null§
      {
         var _loc3_:§while null§ = new §while null§(param1,param2);
         this.§null set case§[param1] = _loc3_;
         this.§0!m§[param2] = _loc3_;
         return _loc3_;
      }
      
      public function addMaterial(param1:TextureMaterial) : void
      {
         var _loc2_:§while null§ = this.§2X§(null,param1);
         ++_loc2_.§@#;§;
         this.§0!m§[param1] = _loc2_;
         this.materials.push(param1);
      }
      
      public function releaseMaterial(param1:TextureMaterial) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:§while null§ = this.§0!m§[param1];
         if(_loc2_ != null)
         {
            ++this.§try catch else§.§?4§;
            --_loc2_.§@#;§;
            if(_loc2_.§@#;§ == 0)
            {
               this.§while const in§(_loc2_);
            }
         }
      }
      
      private function §while const in§(param1:§while null§) : void
      {
         ++this.§try catch else§.§var var do§;
         var _loc2_:TextureMaterial = param1.material;
         if(param1.§const for case§ in this.§null set case§)
         {
            delete this.§null set case§[param1.§const for case§];
         }
         delete this.§0!m§[_loc2_];
         param1.material = null;
         var _loc3_:int = int(this.materials.indexOf(_loc2_));
         this.materials.splice(_loc3_,1);
         _loc2_.dispose();
      }
      
      protected function §try package super§(param1:Function) : void
      {
         var _loc2_:TextureMaterial = null;
         for each(_loc2_ in this.materials)
         {
            param1(_loc2_);
         }
      }
      
      public function setMipMapping(param1:Boolean) : void
      {
         if(this.§for var include§ != param1)
         {
            if(param1)
            {
               this.enableMipMapping();
            }
            else
            {
               this.§`#-§();
            }
         }
      }
      
      private function enableMipMapping() : void
      {
         if(!this.§for var include§)
         {
            this.§for var include§ = true;
            this.§try package super§(this.disposeResource);
            this.§try package super§(this.§with set with§);
         }
      }
      
      private function §with set with§(param1:TextureMaterial) : void
      {
         param1.mipMapping = MipMapping.PER_PIXEL;
      }
      
      private function §`#-§() : void
      {
         if(this.§for var include§)
         {
            this.§for var include§ = false;
            this.§try package super§(this.disposeResource);
            this.§try package super§(this.§in for package§);
         }
      }
      
      private function disposeResource(param1:TextureMaterial) : void
      {
         param1.disposeResource();
      }
      
      private function §in for package§(param1:TextureMaterial) : void
      {
         param1.mipMapping = MipMapping.NONE;
      }
      
      public function clear() : void
      {
         this.§try package super§(this.§<!c§);
         this.materials.length = 0;
         clearDictionary(this.§null set case§);
         clearDictionary(this.§0!m§);
         this.§try catch else§.clear();
      }
      
      private function §<!c§(param1:TextureMaterial) : void
      {
         param1.texture = null;
      }
      
      protected function §return const in§(param1:TextureMaterial) : §while null§
      {
         return this.§0!m§[param1];
      }
   }
}

