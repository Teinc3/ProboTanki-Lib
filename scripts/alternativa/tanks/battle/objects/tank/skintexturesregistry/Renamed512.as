package alternativa.tanks.battle.objects.tank.skintexturesregistry
{
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1168;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class Renamed512 implements TankSkinTextureRegistry
   {
      private var textures:Dictionary;
      
      public function Renamed512()
      {
         this.textures = new Dictionary();
         super();
      }
      
      public function clear() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:Renamed1170 = null;
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
      
      public function getTexture(param1:Renamed1168, param2:BitmapData) : BitmapData
      {
         var _loc3_:Dictionary = this.Renamed1171(param1);
         var _loc4_:Renamed1170 = this.Renamed1172(param1,param2,_loc3_);
         ++_loc4_.Renamed1173;
         return _loc4_.texture;
      }
      
      private function Renamed1171(param1:Renamed1168) : Dictionary
      {
         var _loc2_:Dictionary = this.textures[param1.Renamed1174];
         if(_loc2_ == null)
         {
            _loc2_ = new Dictionary();
            this.textures[param1.Renamed1174] = _loc2_;
         }
         return _loc2_;
      }
      
      private function Renamed1172(param1:Renamed1168, param2:BitmapData, param3:Dictionary) : Renamed1170
      {
         var _loc4_:Renamed1170 = param3[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new Renamed1170(param1.createTexture(param2));
            param3[param2] = _loc4_;
         }
         return _loc4_;
      }
      
      public function Renamed1169(param1:Renamed1168, param2:BitmapData) : void
      {
         var _loc3_:Dictionary = this.textures[param1.Renamed1174];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Renamed1170 = _loc3_[param2];
         if(_loc4_ == null)
         {
            return;
         }
         --_loc4_.Renamed1173;
         if(_loc4_.Renamed1173 == 0)
         {
            _loc4_.texture.dispose();
            delete _loc3_[param2];
         }
      }
   }
}

