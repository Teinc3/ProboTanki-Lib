package §`"Q§
{
   import § !g§.§class for case§;
   import §9p§.§var const final§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.utils.TextureMaterialRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class §?"E§
   {
      private static const §1"4§:ConsoleVarFloat = new ConsoleVarFloat("beam_width",100,0,1000);
      
      private static const §1!8§:ConsoleVarFloat = new ConsoleVarFloat("beam_ulength",500,0,10000);
      
      private static const §0'§:ConsoleVarFloat = new ConsoleVarFloat("beam_anim_speed",-0.6,-1000,1000);
      
      private static const §try set include§:ConsoleVarFloat = new ConsoleVarFloat("beam_urange",0.6,0.1,1);
      
      private static const §extends set return§:ConsoleVarFloat = new ConsoleVarFloat("beam_alpha",1,0,1);
      
      private var §each var null§:§function set package§;
      
      private var §+Z§:§function set package§;
      
      public function §?"E§(param1:TextureMaterialRegistry, param2:§var const final§)
      {
         super();
         this.§each var null§ = §catch var for§(param1,param2.§if catch finally§,param2.§use set else§,50,100,1,1,1);
         this.§+Z§ = §catch var for§(param1,param2.§implements var false§,param2.§final var class§,50,100,1,1,1);
      }
      
      private static function §catch var for§(param1:TextureMaterialRegistry, param2:ImageResource, param3:ImageResource, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : §function set package§
      {
         var _loc9_:TextureMaterial = null;
         (_loc9_ = param1.getMaterial(param2.data)).repeat = true;
         var _loc10_:TextureMaterial = param1.getMaterial(param3.data);
         return new §function set package§(_loc9_,_loc10_,param4,param5,param6,param7,param8);
      }
      
      private static function §%"1§(param1:§function set package§) : §function set package§
      {
         return new §function set package§(param1.§include do§,param1.§["#§,§1"4§.value,§1!8§.value,§0'§.value,§try set include§.value,§extends set return§.value);
      }
      
      private function §;Y§() : §function set package§
      {
         return §%"1§(this.§each var null§);
      }
      
      private function §include var var§() : §function set package§
      {
         return §%"1§(this.§+Z§);
      }
      
      public function §override with§(param1:§class for case§) : §function set package§
      {
         return param1 == §class for case§.BLUE ? this.§;Y§() : this.§include var var§();
      }
   }
}

