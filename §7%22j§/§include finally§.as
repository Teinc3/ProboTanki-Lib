package §7"j§
{
   import §>u§.§override var var§;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   
   public final class §include finally§
   {
      private var §catch catch catch§:int;
      
      private var time:Vector.<uint>;
      
      private var intensity:Vector.<Number>;
      
      private var color:Vector.<uint>;
      
      private var attenuationBegin:Vector.<Number>;
      
      private var attenuationEnd:Vector.<Number>;
      
      public function §include finally§(param1:Vector.<§override var var§>)
      {
         var _loc2_:§override var var§ = null;
         super();
         this.§catch catch catch§ = param1.length;
         this.intensity = new Vector.<Number>(this.§catch catch catch§,true);
         this.color = new Vector.<uint>(this.§catch catch catch§,true);
         this.attenuationBegin = new Vector.<Number>(this.§catch catch catch§,true);
         this.attenuationEnd = new Vector.<Number>(this.§catch catch catch§,true);
         this.time = new Vector.<uint>(this.§catch catch catch§,true);
         var _loc3_:int = 0;
         while(_loc3_ < this.§catch catch catch§)
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
      
      private function §"#4§(param1:Number) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = 0;
         if(param1 < this.time[this.§catch catch catch§ - 1])
         {
            _loc2_ = 0;
            while(_loc2_ < this.§catch catch catch§ - 1)
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
            _loc6_ = this.§catch catch catch§ - 1;
         }
         return _loc6_;
      }
      
      public function §3!G§() : int
      {
         return this.§catch catch catch§;
      }
      
      private function §class catch else§(param1:int) : int
      {
         return param1 < this.§catch catch catch§ ? int(param1) : int(this.§catch catch catch§ - 1);
      }
      
      private function §[#[§(param1:Number, param2:SpotLight) : void
      {
         var _loc3_:int = this.§class catch else§(Math.floor(param1));
         var _loc4_:int = this.§class catch else§(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = §continue for finally§(_loc6_,_loc7_,_loc5_);
         param2.color = §?u§(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = §continue for finally§(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = §continue for finally§(_loc12_,_loc13_,_loc5_);
      }
      
      private function §else package super§(param1:Number, param2:OmniLight) : void
      {
         var _loc3_:int = this.§class catch else§(Math.floor(param1));
         var _loc4_:int = this.§class catch else§(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = §continue for finally§(_loc6_,_loc7_,_loc5_);
         param2.color = §?u§(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = §continue for finally§(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = §continue for finally§(_loc12_,_loc13_,_loc5_);
      }
      
      private function §'v§(param1:Number, param2:TubeLight) : void
      {
         var _loc3_:int = this.§class catch else§(Math.floor(param1));
         var _loc4_:int = this.§class catch else§(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = §continue for finally§(_loc6_,_loc7_,_loc5_);
         param2.color = §?u§(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = §continue for finally§(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = §continue for finally§(_loc12_,_loc13_,_loc5_);
      }
      
      public function § !Z§(param1:Light3D, param2:int, param3:int = -1) : void
      {
         var _loc4_:Number = 1;
         if(param3 > 0 && this.§catch catch catch§ > 0)
         {
            _loc4_ = this.time[this.§catch catch catch§ - 1] / param3;
         }
         var _loc5_:Number = this.§"#4§(param2 * _loc4_);
         this.§implements package use§(param1,_loc5_);
      }
      
      private function §implements package use§(param1:Light3D, param2:Number) : void
      {
         if(param1 is OmniLight)
         {
            this.§else package super§(param2,OmniLight(param1));
         }
         else if(param1 is SpotLight)
         {
            this.§[#[§(param2,SpotLight(param1));
         }
         else if(param1 is TubeLight)
         {
            this.§'v§(param2,TubeLight(param1));
         }
         param1.calculateBounds();
      }
      
      public function §dynamic var function§() : int
      {
         return this.time[this.§catch catch catch§ - 1];
      }
   }
}

