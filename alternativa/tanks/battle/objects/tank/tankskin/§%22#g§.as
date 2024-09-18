package alternativa.tanks.battle.objects.tank.tankskin
{
   import §3"q§.§0<§;
   import §3"q§.§8"<§;
   import §3"q§.§^!`§;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   public class §"#g§
   {
      private static const §0§:String = "barrel";
      
      private static const §in const throw§:String = "muzzle";
      
      private static const §@"p§:String = "band";
      
      private static const §`"z§:String = "band_m";
      
      private var §!1§:§0<§;
      
      private var §override const true§:§0<§;
      
      private var §finally const implements§:§0<§;
      
      private var §4#@§:§0<§;
      
      private var §do var class§:Vector.<§0<§>;
      
      public function §"#g§(param1:Mesh)
      {
         super();
         this.init(param1);
      }
      
      private function init(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         for each(_loc2_ in param1.faces)
         {
            if(_loc2_.material.name == §0§)
            {
               this.§#!Y§();
               this.§!1§.addFace(_loc2_);
            }
            else if(_loc2_.material.name == §in const throw§)
            {
               this.§#!Y§();
               this.§override const true§.addFace(_loc2_);
            }
            else if(_loc2_.material.name == §@"p§)
            {
               this.§#!Y§();
               this.§finally const implements§.addFace(_loc2_);
            }
            else if(_loc2_.material.name == §`"z§)
            {
               this.§#!Y§();
               this.§4#@§.addFace(_loc2_);
            }
         }
         if(this.§do var class§ != null)
         {
            this.§!1§.init();
            this.§override const true§.init();
            this.§finally const implements§.init();
            this.§4#@§.init();
         }
      }
      
      private function §#!Y§() : void
      {
         if(this.§do var class§ == null)
         {
            this.§do var class§ = new Vector.<§0<§>();
            this.§!1§ = new §^!`§(17 / 256);
            this.§override const true§ = new §8"<§(137.5 / 256,188 / 256);
            this.§finally const implements§ = new §^!`§(9 / 256);
            this.§4#@§ = new §8"<§(17 / 256,104 / 256);
            this.§do var class§.push(this.§!1§);
            this.§do var class§.push(this.§override const true§);
            this.§do var class§.push(this.§finally const implements§);
            this.§do var class§.push(this.§4#@§);
         }
      }
      
      public function §28§(param1:TextureMaterial) : void
      {
         var _loc2_:§0<§ = null;
         if(this.§try package include§())
         {
            for each(_loc2_ in this.§do var class§)
            {
               _loc2_.§28§(param1);
            }
         }
      }
      
      private function §try package include§() : Boolean
      {
         return this.§do var class§ != null;
      }
      
      public function get §finally override§() : §0<§
      {
         return this.§!1§;
      }
      
      public function get §,#t§() : §0<§
      {
         return this.§override const true§;
      }
      
      public function get §^!;§() : §0<§
      {
         return this.§finally const implements§;
      }
      
      public function get §-#q§() : §0<§
      {
         return this.§4#@§;
      }
      
      public function destroy() : void
      {
         this.§do var class§ = null;
         this.§!1§ = null;
         this.§override const true§ = null;
         this.§finally const implements§ = null;
         this.§4#@§ = null;
      }
   }
}

