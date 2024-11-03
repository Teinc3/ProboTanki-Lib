package Renamed89
{
   internal class Renamed10432 extends Renamed6978
   {
      private var Renamed1649:Vector.<Renamed1650>;
      
      private var numFrames:int;
      
      private var Renamed3392:Number;
      
      public function Renamed10432()
      {
         super(1,1,0.5,0);
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(param1:Renamed843) : void
      {
         setMaterialToAllFaces(param1.material);
         this.Renamed1649 = param1.Renamed1652;
         this.numFrames = this.Renamed1649.length;
         this.Renamed3392 = 0;
         this.Renamed1655(this.Renamed1649[0]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.Renamed1649 = null;
         this.numFrames = 0;
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         this.Renamed3392 += param1 * param2;
         if(this.Renamed3392 >= this.numFrames)
         {
            this.Renamed3392 = 0;
         }
         this.Renamed1655(this.Renamed1649[int(this.Renamed3392)]);
      }
      
      private function Renamed1655(param1:Renamed1650) : void
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

