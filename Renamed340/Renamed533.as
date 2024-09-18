package Renamed340
{
   import alternativa.tanks.services.colortransform.Renamed1682;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import flash.geom.ColorTransform;
   
   public class Renamed533 implements ColorTransformService
   {
      private var Renamed7935:ColorTransform;
      
      private var Renamed7936:ColorTransform;
      
      public function Renamed533()
      {
         super();
      }
      
      public function setColorTransform(param1:ColorTransform) : void
      {
      }
      
      public function Renamed3813() : ColorTransform
      {
         return null;
      }
      
      public function Renamed538(param1:Renamed1682) : void
      {
      }
      
      public function Renamed3814(param1:ColorTransform, param2:ColorTransform, param3:ColorTransform, param4:ColorTransform) : void
      {
         this.Renamed7935 = param3;
         this.Renamed7936 = param4;
      }
      
      public function Renamed3815() : ColorTransform
      {
         return this.Renamed7935;
      }
      
      public function Renamed3816() : ColorTransform
      {
         return this.Renamed7936;
      }
   }
}

