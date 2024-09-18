package Renamed1
{
   import Renamed4622.Renamed5636;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   
   public final class Renamed3193
   {
      private var Renamed1652:int;
      
      private var time:Vector.<uint>;
      
      private var intensity:Vector.<Number>;
      
      private var color:Vector.<uint>;
      
      private var attenuationBegin:Vector.<Number>;
      
      private var attenuationEnd:Vector.<Number>;
      
      public function Renamed3193(param1:Vector.<Renamed5636>)
      {
         var _loc2_:Renamed5636 = null;
         super();
         this.Renamed1652 = param1.length;
         this.intensity = new Vector.<Number>(this.Renamed1652,true);
         this.color = new Vector.<uint>(this.Renamed1652,true);
         this.attenuationBegin = new Vector.<Number>(this.Renamed1652,true);
         this.attenuationEnd = new Vector.<Number>(this.Renamed1652,true);
         this.time = new Vector.<uint>(this.Renamed1652,true);
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed1652)
         {
            _loc2_ = param1[_loc3_];
            this.intensity[_loc3_] = Number(_loc2_.intensity);
            this.color[_loc3_] = uint(_loc2_.color);
            this.attenuationBegin[_loc3_] = Number(_loc2_.attenuationBegin);
            this.attenuationEnd[_loc3_] = Number(_loc2_.attenuationEnd);
            this.time[_loc3_] = uint(_loc2_.time);
            _loc3_++;
         }
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
      
      private function Renamed7042(param1:Number) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = 0;
         if(param1 < this.time[this.Renamed1652 - 1])
         {
            _loc2_ = 0;
            while(_loc2_ < this.Renamed1652 - 1)
            {
               _loc3_ = this.time[_loc2_];
               _loc4_ = this.time[_loc2_ + 1];
               if(param1 >= _loc3_ && param1 < _loc4_)
               {
                  _loc5_ = (param1 - _loc3_) / (_loc4_ - _loc3_);
                  _loc6_ = _loc2_ + _loc5_;
                  break;
               }
               _loc2_++;
            }
         }
         else
         {
            _loc6_ = this.Renamed1652 - 1;
         }
         return _loc6_;
      }
      
      public function Renamed7043() : int
      {
         return this.Renamed1652;
      }
      
      private function Renamed7044(param1:int) : int
      {
         return param1 < this.Renamed1652 ? int(param1) : int(this.Renamed1652 - 1);
      }
      
      private function Renamed7045(param1:Number, param2:SpotLight) : void
      {
         var _loc3_:int = this.Renamed7044(Math.floor(param1));
         var _loc4_:int = this.Renamed7044(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = Renamed5109(_loc6_,_loc7_,_loc5_);
         param2.color = Renamed5110(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = Renamed5109(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = Renamed5109(_loc12_,_loc13_,_loc5_);
      }
      
      private function Renamed7046(param1:Number, param2:OmniLight) : void
      {
         var _loc3_:int = this.Renamed7044(Math.floor(param1));
         var _loc4_:int = this.Renamed7044(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = Renamed5109(_loc6_,_loc7_,_loc5_);
         param2.color = Renamed5110(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = Renamed5109(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = Renamed5109(_loc12_,_loc13_,_loc5_);
      }
      
      private function Renamed7047(param1:Number, param2:TubeLight) : void
      {
         var _loc3_:int = this.Renamed7044(Math.floor(param1));
         var _loc4_:int = this.Renamed7044(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = Renamed5109(_loc6_,_loc7_,_loc5_);
         param2.color = Renamed5110(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = Renamed5109(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = Renamed5109(_loc12_,_loc13_,_loc5_);
      }
      
      public function Renamed6913(param1:Light3D, param2:int, param3:int = -1) : void
      {
         var _loc4_:Number = 1;
         if(param3 > 0 && this.Renamed1652 > 0)
         {
            _loc4_ = this.time[this.Renamed1652 - 1] / param3;
         }
         var _loc5_:Number = this.Renamed7042(param2 * _loc4_);
         this.Renamed7048(param1,_loc5_);
      }
      
      private function Renamed7048(param1:Light3D, param2:Number) : void
      {
         if(param1 is OmniLight)
         {
            this.Renamed7046(param2,OmniLight(param1));
         }
         else if(param1 is SpotLight)
         {
            this.Renamed7045(param2,SpotLight(param1));
         }
         else if(param1 is TubeLight)
         {
            this.Renamed7047(param2,TubeLight(param1));
         }
         param1.calculateBounds();
      }
      
      public function Renamed6912() : int
      {
         return this.time[this.Renamed1652 - 1];
      }
   }
}

