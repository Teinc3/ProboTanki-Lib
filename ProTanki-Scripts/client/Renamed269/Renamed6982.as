package Renamed1
{
   import alternativa.engine3d.lights.OmniLight;
   import Renamed356.Renamed1443;
   
   public final class Renamed6982 extends Renamed6983
   {
      public function Renamed6982(param1:Renamed1443)
      {
         super(param1,new OmniLight(0,0,0));
      }
      
      public function init(param1:Renamed6901, param2:Renamed3193, param3:Renamed3193) : void
      {
         this.Renamed6909 = param1;
         this.startTime = param2.Renamed6912();
         this.Renamed6984 = param3.Renamed6912();
         this.Renamed6985 = param2;
         this.Renamed6986 = param3;
         this.random = Renamed6984 / 4;
         Renamed3675 = true;
         currentTime = 0;
         alive = true;
         Renamed6972 = false;
         fadeTime = 0;
      }
   }
}

