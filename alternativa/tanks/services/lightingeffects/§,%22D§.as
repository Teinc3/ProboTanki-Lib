package alternativa.tanks.services.lightingeffects
{
   import §'H§.§const const case§;
   import §'H§.§implements set else§;
   import flash.geom.ColorTransform;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class §,"D§ implements ILightingEffectsService
   {
      private var §0#d§:Vector.<§implements set else§>;
      
      private var bonusLightIntensity:Number;
      
      private var bonusColorAdjust:ColorTransform;
      
      public function §,"D§()
      {
         this.§0#d§ = new Vector.<§implements set else§>(§final package import§.values.length,true);
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.§0#d§.length)
         {
            this.§0#d§[_loc1_] = new §implements set else§(new §const const case§(0,0),new §const const case§(0,0),new §const const case§(0,0),0,0);
            _loc1_++;
         }
      }
      
      public function §@!z§(param1:§final package import§, param2:§implements set else§) : void
      {
         this.§0#d§[param1.value] = param2;
      }
      
      public function §try const include§(param1:§final package import§) : §implements set else§
      {
         return this.§0#d§[param1.value];
      }
      
      public function §2#[§(param1:Number, param2:ColorTransform, param3:ColorTransform) : void
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
      
      public function §set package include§() : Number
      {
         return this.bonusLightIntensity;
      }
      
      public function §if switch§() : ColorTransform
      {
         return this.bonusColorAdjust;
      }
   }
}

