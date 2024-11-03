package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1168;
   import alternativa.tanks.materials.AnimatedPaintMaterial;
   import alternativa.tanks.materials.PaintMaterial;
   import alternativa.utils.TextureMaterialRegistry;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed1656 implements TextureMaterialRegistry
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed1657:Renamed1658;
      
      private var Renamed1659:Renamed1635;
      
      private var Renamed1660:Boolean;
      
      public function Renamed1656(param1:Renamed1635)
      {
         this.materials = new Vector.<TextureMaterial>();
         this.Renamed1661 = new Dictionary();
         this.Renamed1662 = new Dictionary();
         this.Renamed1657 = new Renamed1658();
         super();
         this.Renamed1659 = param1;
      }
      
      public function Renamed1663() : Renamed1658
      {
         return this.Renamed1657;
      }
      
      public function getAnimatedPaint(param1:MultiframeImageResource, param2:Renamed1168) : AnimatedPaintMaterial
      {
         var _loc3_:Renamed1664 = null;
         ++this.Renamed1657.Renamed1665;
         var _loc4_:String = param1.id + " " + param2.Renamed1174;
         if(_loc4_ in this.Renamed1661)
         {
            _loc3_ = this.Renamed1661[_loc4_];
            ++_loc3_.Renamed1173;
            return _loc3_.material as AnimatedPaintMaterial;
         }
         var _loc5_:int = param1.data.width / param1.frameWidth;
         var _loc6_:int = param1.data.height / param1.frameHeight;
         var _loc7_:AnimatedPaintMaterial = new AnimatedPaintMaterial(param1.data,param2.lightmap,param2.details,_loc5_,_loc6_,param1.fps,param1.numFrames,this.Renamed1660 ? int(MipMapping.PER_PIXEL) : int(0));
         _loc3_ = this.Renamed1666(_loc4_,_loc7_);
         ++_loc3_.Renamed1173;
         this.materials.push(_loc7_);
         ++this.Renamed1657.Renamed1667;
         return _loc7_;
      }
      
      public function getPaint(param1:ImageResource, param2:Renamed1168) : PaintMaterial
      {
         var _loc3_:Renamed1664 = null;
         ++this.Renamed1657.Renamed1665;
         var _loc4_:String = param1.id + " " + param2.Renamed1174;
         if(_loc4_ in this.Renamed1661)
         {
            _loc3_ = this.Renamed1661[_loc4_];
            ++_loc3_.Renamed1173;
            return _loc3_.material as PaintMaterial;
         }
         var _loc5_:PaintMaterial = new PaintMaterial(param1.data,param2.lightmap,param2.details,this.Renamed1660 ? int(MipMapping.PER_PIXEL) : int(0));
         _loc3_ = this.Renamed1666(_loc4_,_loc5_);
         ++_loc3_.Renamed1173;
         this.materials.push(_loc5_);
         ++this.Renamed1657.Renamed1667;
         return _loc5_;
      }
      
      public function getMaterial(param1:BitmapData, param2:Boolean = true) : TextureMaterial
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         ++this.Renamed1657.Renamed1665;
         var _loc3_:Renamed1664 = this.Renamed1668(param1,param2);
         ++_loc3_.Renamed1173;
         return _loc3_.material;
      }
      
      private function Renamed1668(param1:BitmapData, param2:Boolean) : Renamed1664
      {
         var _loc3_:TextureMaterial = null;
         var _loc4_:Renamed1664 = this.Renamed1661[param1];
         if(_loc4_ == null)
         {
            _loc3_ = this.Renamed1669(param1,param2);
            _loc4_ = this.Renamed1670(param1,_loc3_);
         }
         return _loc4_;
      }
      
      private function Renamed1669(param1:BitmapData, param2:Boolean) : TextureMaterial
      {
         var _loc3_:BitmapData = this.getTexture(param1,param2);
         var _loc4_:TextureMaterial = this.Renamed1659.Renamed1636(_loc3_,this.Renamed1660);
         this.materials.push(_loc4_);
         ++this.Renamed1657.Renamed1667;
         return _loc4_;
      }
      
      protected function getTexture(param1:BitmapData, param2:Boolean) : BitmapData
      {
         throw new Error("Not implemented");
      }
      
      private function Renamed1666(param1:String, param2:TextureMaterial) : Renamed1664
      {
         var _loc3_:Renamed1664 = new Renamed1664(param1,param2);
         this.Renamed1661[param1] = _loc3_;
         this.Renamed1662[param2] = _loc3_;
         return _loc3_;
      }
      
      private function Renamed1670(param1:BitmapData, param2:TextureMaterial) : Renamed1664
      {
         var _loc3_:Renamed1664 = new Renamed1664(param1,param2);
         this.Renamed1661[param1] = _loc3_;
         this.Renamed1662[param2] = _loc3_;
         return _loc3_;
      }
      
      public function addMaterial(param1:TextureMaterial) : void
      {
         var _loc2_:Renamed1664 = this.Renamed1670(null,param1);
         ++_loc2_.Renamed1173;
         this.Renamed1662[param1] = _loc2_;
         this.materials.push(param1);
      }
      
      public function releaseMaterial(param1:TextureMaterial) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Renamed1664 = this.Renamed1662[param1];
         if(_loc2_ != null)
         {
            ++this.Renamed1657.Renamed1671;
            --_loc2_.Renamed1173;
            if(_loc2_.Renamed1173 == 0)
            {
               this.Renamed1672(_loc2_);
            }
         }
      }
      
      private function Renamed1672(param1:Renamed1664) : void
      {
         ++this.Renamed1657.Renamed1673;
         var _loc2_:TextureMaterial = param1.material;
         if(param1.Renamed1674 in this.Renamed1661)
         {
            delete this.Renamed1661[param1.Renamed1674];
         }
         delete this.Renamed1662[_loc2_];
         param1.material = null;
         var _loc3_:int = int(this.materials.indexOf(_loc2_));
         this.materials.splice(_loc3_,1);
         _loc2_.dispose();
      }
      
      protected function Renamed1675(param1:Function) : void
      {
         var _loc2_:TextureMaterial = null;
         for each(_loc2_ in this.materials)
         {
            param1(_loc2_);
         }
      }
      
      public function setMipMapping(param1:Boolean) : void
      {
         if(this.Renamed1660 != param1)
         {
            if(param1)
            {
               this.enableMipMapping();
            }
            else
            {
               this.Renamed1676();
            }
         }
      }
      
      private function enableMipMapping() : void
      {
         if(!this.Renamed1660)
         {
            this.Renamed1660 = true;
            this.Renamed1675(this.disposeResource);
            this.Renamed1675(this.Renamed1677);
         }
      }
      
      private function Renamed1677(param1:TextureMaterial) : void
      {
         param1.mipMapping = MipMapping.PER_PIXEL;
      }
      
      private function Renamed1676() : void
      {
         if(this.Renamed1660)
         {
            this.Renamed1660 = false;
            this.Renamed1675(this.disposeResource);
            this.Renamed1675(this.Renamed1678);
         }
      }
      
      private function disposeResource(param1:TextureMaterial) : void
      {
         param1.disposeResource();
      }
      
      private function Renamed1678(param1:TextureMaterial) : void
      {
         param1.mipMapping = MipMapping.NONE;
      }
      
      public function clear() : void
      {
         this.Renamed1675(this.Renamed1679);
         this.materials.length = 0;
         clearDictionary(this.Renamed1661);
         clearDictionary(this.Renamed1662);
         this.Renamed1657.clear();
      }
      
      private function Renamed1679(param1:TextureMaterial) : void
      {
         param1.texture = null;
      }
      
      protected function Renamed1680(param1:TextureMaterial) : Renamed1664
      {
         return this.Renamed1662[param1];
      }
   }
}

