package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Sprite3D;
   
   public class Renamed1647 extends Sprite3D
   {
      public var Renamed1648:Boolean;
      
      private var Renamed1649:Vector.<Renamed1650>;
      
      private var numFrames:int;
      
      private var fps:Number;
      
      private var currentFrame:Number = 0;
      
      public function Renamed1647(param1:Number, param2:Number, param3:Material = null)
      {
         super(param1,param2,param3);
         useShadowMap = false;
         useLight = false;
      }
      
      public function Renamed1651(param1:Renamed843) : void
      {
         material = param1.material;
         this.Renamed1649 = param1.Renamed1652;
         this.fps = param1.fps;
         this.numFrames = this.Renamed1649.length;
         this.currentFrame = 0;
         this.Renamed1653(this.currentFrame);
      }
      
      public function Renamed1654() : Number
      {
         return this.fps;
      }
      
      public function getNumFrames() : int
      {
         return this.numFrames;
      }
      
      public function clear() : void
      {
         this.Renamed1649 = null;
         material = null;
         this.numFrames = 0;
      }
      
      public function Renamed1653(param1:int) : void
      {
         var _loc2_:int = param1 % this.numFrames;
         this.Renamed1655(this.Renamed1649[_loc2_]);
      }
      
      private function Renamed1655(param1:Renamed1650) : void
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
            if(this.Renamed1648)
            {
               this.currentFrame %= this.numFrames;
            }
            else
            {
               this.currentFrame = this.numFrames - 1;
            }
         }
         this.Renamed1655(this.Renamed1649[int(this.currentFrame)]);
      }
   }
}

