package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.models.weapon.shared.§+"-§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import §switch var return§.§%]§;
   
   public class §<S§ extends §["D§ implements §super const class§
   {
      private var §,!+§:§%]§;
      
      private var §case set super§:§8#n§;
      
      private var §=#+§:Array;
      
      private var §false const native§:Array;
      
      public function §<S§(param1:§1Q§)
      {
         this.§=#+§ = [0.1,0.3,0.5,0.8,0.9,1];
         this.§false const native§ = [0.5,0.8,1,0.5,0.3,0.05];
         super(param1);
      }
      
      public function init(param1:§%]§, param2:§8#n§) : void
      {
         this.§,!+§ = param1;
         this.§case set super§ = param2;
      }
      
      public function §do package use§(param1:Object3D) : void
      {
         var _loc2_:Vector.<§+"-§> = null;
         var _loc3_:int = 0;
         var _loc4_:§+"-§ = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         if(this.§,!+§.§6"B§ == 0)
         {
            this.§case set super§.§do package use§(param1);
         }
         else
         {
            _loc2_ = this.§,!+§.§try catch null§;
            _loc3_ = 0;
            while(_loc3_ < this.§,!+§.§6"B§)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = _loc4_.§static set native§ / this.§,!+§.range;
               _loc6_ = this.§catch set catch§(_loc5_);
               _loc10_ += _loc6_;
               _loc7_ += _loc4_.x * _loc6_;
               _loc8_ += _loc4_.y * _loc6_;
               _loc9_ += _loc4_.z * _loc6_;
               _loc3_++;
            }
            _loc7_ /= _loc10_;
            _loc8_ /= _loc10_;
            _loc9_ /= _loc10_;
            param1.x = _loc7_;
            param1.y = _loc8_;
            param1.z = _loc9_;
         }
      }
      
      private function §catch set catch§(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         while(_loc3_ < this.§=#+§.length)
         {
            _loc2_ = Number(this.§=#+§[_loc3_]);
            if(_loc2_ >= param1)
            {
               return this.§false const native§[_loc3_];
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         this.§do package use§(param1);
      }
      
      public function destroy() : void
      {
         this.§,!+§ = null;
         this.§case set super§ = null;
      }
   }
}

