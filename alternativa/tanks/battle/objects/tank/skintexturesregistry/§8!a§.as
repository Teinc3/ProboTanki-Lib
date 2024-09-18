package alternativa.tanks.battle.objects.tank.skintexturesregistry
{
   import alternativa.tanks.battle.objects.tank.tankskin.§function else§;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class §8!a§ implements TankSkinTextureRegistry
   {
      private var textures:Dictionary;
      
      public function §8!a§()
      {
         this.textures = new Dictionary();
         super();
      }
      
      public function clear() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:§finally for use§ = null;
         var _loc3_:int = 0;
         for each(_loc1_ in this.textures)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.texture.dispose();
               _loc3_++;
            }
         }
         this.textures = new Dictionary();
      }
      
      public function getTexture(param1:§function else§, param2:BitmapData) : BitmapData
      {
         var _loc3_:Dictionary = this.§dynamic for with§(param1);
         var _loc4_:§finally for use§ = this.§with const true§(param1,param2,_loc3_);
         ++_loc4_.§@#;§;
         return _loc4_.texture;
      }
      
      private function §dynamic for with§(param1:§function else§) : Dictionary
      {
         var _loc2_:Dictionary = this.textures[param1.§2!W§];
         if(_loc2_ == null)
         {
            _loc2_ = new Dictionary();
            this.textures[param1.§2!W§] = _loc2_;
         }
         return _loc2_;
      }
      
      private function §with const true§(param1:§function else§, param2:BitmapData, param3:Dictionary) : §finally for use§
      {
         var _loc4_:§finally for use§ = param3[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new §finally for use§(param1.createTexture(param2));
            param3[param2] = _loc4_;
         }
         return _loc4_;
      }
      
      public function §const for set§(param1:§function else§, param2:BitmapData) : void
      {
         var _loc3_:Dictionary = this.textures[param1.§2!W§];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:§finally for use§ = _loc3_[param2];
         if(_loc4_ == null)
         {
            return;
         }
         --_loc4_.§@#;§;
         if(_loc4_.§@#;§ == 0)
         {
            _loc4_.texture.dispose();
            delete _loc3_[param2];
         }
      }
   }
}

