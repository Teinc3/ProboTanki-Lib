package §default set implements§
{
   import alternativa.tanks.services.colortransform.§4$"§;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.colortransform.§]#y§;
   import flash.geom.ColorTransform;
   
   public class §!s§ implements ColorTransformService
   {
      private var colorTransform:ColorTransform;
      
      private var §else package in§:ColorTransform;
      
      private var §default var each§:ColorTransform;
      
      public function §!s§()
      {
         this.§7L§ = new Vector.<§4$"§>();
         super();
      }
      
      public function §!# §(param1:§4$"§) : void
      {
         this.§7L§.push(param1);
         param1.setColorTransform(this.colorTransform);
      }
      
      public function setColorTransform(param1:ColorTransform) : void
      {
         var _loc2_:§4$"§ = null;
         if(!§]#y§.§0"]§(this.colorTransform,param1))
         {
            this.colorTransform = §]#y§.clone(param1);
            for each(_loc2_ in this.§7L§)
            {
               _loc2_.setColorTransform(this.colorTransform);
            }
         }
      }
      
      public function §,#3§() : ColorTransform
      {
         return §]#y§.clone(this.colorTransform);
      }
      
      public function §,"q§(param1:ColorTransform, param2:ColorTransform, param3:ColorTransform, param4:ColorTransform) : void
      {
         this.§else package in§ = param1;
         this.§default var each§ = param2;
      }
      
      public function §each for package§() : ColorTransform
      {
         return this.§else package in§;
      }
      
      public function §8"g§() : ColorTransform
      {
         return this.§default var each§;
      }
   }
}

