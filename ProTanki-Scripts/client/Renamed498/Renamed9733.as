package Renamed4643
{
   import Renamed136.Renamed663;
   import Renamed289.Renamed5084;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.utils.TextureMaterialRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Renamed9364
   {
      private static const Renamed9719:ConsoleVarFloat = new ConsoleVarFloat("beam_width",100,0,1000);
      
      private static const Renamed9720:ConsoleVarFloat = new ConsoleVarFloat("beam_ulength",500,0,10000);
      
      private static const Renamed9721:ConsoleVarFloat = new ConsoleVarFloat("beam_anim_speed",-0.6,-1000,1000);
      
      private static const Renamed9722:ConsoleVarFloat = new ConsoleVarFloat("beam_urange",0.6,0.1,1);
      
      private static const Renamed9723:ConsoleVarFloat = new ConsoleVarFloat("beam_alpha",1,0,1);
      
      private var Renamed9724:Renamed9725;
      
      private var Renamed9726:Renamed9725;
      
      public function Renamed9364(param1:TextureMaterialRegistry, param2:Renamed5084)
      {
         super();
         this.Renamed9724 = Renamed9727(param1,param2.Renamed7375,param2.Renamed7376,50,100,1,1,1);
         this.Renamed9726 = Renamed9727(param1,param2.Renamed7377,param2.Renamed7378,50,100,1,1,1);
      }
      
      private static function Renamed9727(param1:TextureMaterialRegistry, param2:ImageResource, param3:ImageResource, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Renamed9725
      {
         var _loc9_:TextureMaterial = null;
         (_loc9_ = param1.getMaterial(param2.data)).repeat = true;
         var _loc10_:TextureMaterial = param1.getMaterial(param3.data);
         return new Renamed9725(_loc9_,_loc10_,param4,param5,param6,param7,param8);
      }
      
      private static function Renamed9728(param1:Renamed9725) : Renamed9725
      {
         return new Renamed9725(param1.Renamed9729,param1.Renamed9730,Renamed9719.value,Renamed9720.value,Renamed9721.value,Renamed9722.value,Renamed9723.value);
      }
      
      private function Renamed9731() : Renamed9725
      {
         return Renamed9728(this.Renamed9724);
      }
      
      private function Renamed9732() : Renamed9725
      {
         return Renamed9728(this.Renamed9726);
      }
      
      public function Renamed9382(param1:Renamed663) : Renamed9725
      {
         return param1 == Renamed663.BLUE ? this.Renamed9731() : this.Renamed9732();
      }
   }
}

