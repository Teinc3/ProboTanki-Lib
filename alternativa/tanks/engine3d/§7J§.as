package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Sprite3D;
   
   public class §7J§ extends Sprite3D
   {
      public var §#![§:Boolean;
      
      private var §static const break§:Vector.<§try set break§>;
      
      private var numFrames:int;
      
      private var fps:Number;
      
      private var currentFrame:Number = 0;
      
      public function §7J§(param1:Number, param2:Number, param3:Material = null)
      {
         super(param1,param2,param3);
         useShadowMap = false;
         useLight = false;
      }
      
      public function §do var super§(param1:§throw const switch§) : void
      {
         material = param1.material;
         this.§static const break§ = param1.§catch catch catch§;
         this.fps = param1.fps;
         this.numFrames = this.§static const break§.length;
         this.currentFrame = 0;
         this.§true const switch§(this.currentFrame);
      }
      
      public function §,"Q§() : Number
      {
         return this.fps;
      }
      
      public function getNumFrames() : int
      {
         return this.numFrames;
      }
      
      public function clear() : void
      {
         this.§static const break§ = null;
         material = null;
         this.numFrames = 0;
      }
      
      public function §true const switch§(param1:int) : void
      {
         var _loc2_:int = param1 % this.numFrames;
         this.§;!4§(this.§static const break§[_loc2_]);
      }
      
      private function §;!4§(param1:§try set break§) : void
      {
         topLeftU = param1.topLeftU;
         topLeftV = param1.topLeftV;
         bottomRightU = param1.bottomRightU;
         bottomRightV = param1.bottomRightV;
      }
      
      public function update(param1:Number) : void
      {
         this.currentFrame += this.fps * param1;
         if(this.currentFrame >= this.numFrames)
         {
            if(this.§#![§)
            {
               this.currentFrame %= this.numFrames;
            }
            else
            {
               this.currentFrame = this.numFrames - 1;
            }
         }
         this.§;!4§(this.§static const break§[int(this.currentFrame)]);
      }
   }
}

