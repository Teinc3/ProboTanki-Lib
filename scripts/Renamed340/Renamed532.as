package Renamed340
{
   import alternativa.tanks.services.colortransform.Renamed1682;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.colortransform.Renamed1637;
   import flash.geom.ColorTransform;
   
   public class Renamed532 implements ColorTransformService
   {
      private var colorTransform:ColorTransform;
      
      private var Renamed7935:ColorTransform;
      
      private var Renamed7936:ColorTransform;
      
      public function Renamed532()
      {
         this.Renamed7937 = new Vector.<Renamed1682>();
         super();
      }
      
      public function Renamed538(param1:Renamed1682) : void
      {
         this.Renamed7937.push(param1);
         param1.setColorTransform(this.colorTransform);
      }
      
      public function setColorTransform(param1:ColorTransform) : void
      {
         var _loc2_:Renamed1682 = null;
         if(!Renamed1637.Renamed1644(this.colorTransform,param1))
         {
            this.colorTransform = Renamed1637.clone(param1);
            for each(_loc2_ in this.Renamed7937)
            {
               _loc2_.setColorTransform(this.colorTransform);
            }
         }
      }
      
      public function Renamed3813() : ColorTransform
      {
         return Renamed1637.clone(this.colorTransform);
      }
      
      public function Renamed3814(param1:ColorTransform, param2:ColorTransform, param3:ColorTransform, param4:ColorTransform) : void
      {
         this.Renamed7935 = param1;
         this.Renamed7936 = param2;
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

