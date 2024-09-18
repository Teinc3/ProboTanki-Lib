package §dynamic catch class§
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   
   public class §-2§
   {
      [Inject]
      public static var §false for package§:TextureMaterialRegistry;
      
      private static const §include set override§:String = "display";
      
      private var §function var in§:Vector.<Mesh>;
      
      private var faces:Vector.<Face>;
      
      private var material:TextureMaterial;
      
      private var §true set override§:BitmapData;
      
      public function §-2§()
      {
         this.§function var in§ = new Vector.<Mesh>();
         this.faces = new Vector.<Face>();
         super();
      }
      
      public function add(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         this.§function var in§.push(param1);
         for each(_loc2_ in param1.faces)
         {
            this.faces.push(_loc2_);
            if(this.material == null)
            {
               this.material = TextureMaterial(_loc2_.material);
               this.§9"3§();
            }
         }
      }
      
      public function setImage(param1:BitmapData) : void
      {
         this.§true set override§ = param1;
         this.§9"3§();
      }
      
      private function §9"3§() : void
      {
         if(this.material != null && this.§true set override§ != null)
         {
            this.material.texture = this.§true set override§;
            this.§native catch if§();
         }
      }
      
      private function §native catch if§() : void
      {
         if(this.§function var in§.length > 0)
         {
            this.material.resolution = 1;
         }
      }
   }
}

