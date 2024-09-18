package §switch var return§
{
   internal class §case set implements§ extends §12§
   {
      private var §static const break§:Vector.<§try set break§>;
      
      private var numFrames:int;
      
      private var §2!2§:Number;
      
      public function §case set implements§()
      {
         super(1,1,0.5,0);
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(param1:§throw const switch§) : void
      {
         setMaterialToAllFaces(param1.material);
         this.§static const break§ = param1.§catch catch catch§;
         this.numFrames = this.§static const break§.length;
         this.§2!2§ = 0;
         this.§;!4§(this.§static const break§[0]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.§static const break§ = null;
         this.numFrames = 0;
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         this.§2!2§ += param1 * param2;
         if(this.§2!2§ >= this.numFrames)
         {
            this.§2!2§ = 0;
         }
         this.§;!4§(this.§static const break§[int(this.§2!2§)]);
      }
      
      private function §;!4§(param1:§try set break§) : void
      {
         a.u = param1.topLeftU;
         a.v = param1.topLeftV;
         b.u = param1.topLeftU;
         b.v = param1.bottomRightV;
         c.u = param1.bottomRightU;
         c.v = param1.bottomRightV;
         d.u = param1.bottomRightU;
         d.v = param1.topLeftV;
      }
   }
}

