package alternativa.tanks.services.lightingeffects
{
   import Renamed199.Renamed3823;
   import Renamed199.Renamed3820;
   import flash.geom.ColorTransform;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Renamed526 implements ILightingEffectsService
   {
      private var Renamed3824:Vector.<Renamed3820>;
      
      private var bonusLightIntensity:Number;
      
      private var bonusColorAdjust:ColorTransform;
      
      public function Renamed526()
      {
         this.Renamed3824 = new Vector.<Renamed3820>(Renamed1587.values.length,true);
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed3824.length)
         {
            this.Renamed3824[_loc1_] = new Renamed3820(new Renamed3823(0,0),new Renamed3823(0,0),new Renamed3823(0,0),0,0);
            _loc1_++;
         }
      }
      
      public function Renamed3821(param1:Renamed1587, param2:Renamed3820) : void
      {
         this.Renamed3824[param1.value] = param2;
      }
      
      public function Renamed3822(param1:Renamed1587) : Renamed3820
      {
         return this.Renamed3824[param1.value];
      }
      
      public function Renamed2480(param1:Number, param2:ColorTransform, param3:ColorTransform) : void
      {
         this.bonusLightIntensity = param1;
         if(GPUCapabilities.gpuEnabled)
         {
            this.bonusColorAdjust = param2;
         }
         else
         {
            this.bonusColorAdjust = param3;
         }
      }
      
      public function Renamed1446() : Number
      {
         return this.bonusLightIntensity;
      }
      
      public function Renamed1447() : ColorTransform
      {
         return this.bonusColorAdjust;
      }
   }
}

