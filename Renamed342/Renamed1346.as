package Renamed342
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   
   public class Renamed1346
   {
      [Inject]
      public static var Renamed1233:TextureMaterialRegistry;
      
      private static const Renamed7959:String = "display";
      
      private var Renamed1367:Vector.<Mesh>;
      
      private var faces:Vector.<Face>;
      
      private var material:TextureMaterial;
      
      private var Renamed7960:BitmapData;
      
      public function Renamed1346()
      {
         this.Renamed1367 = new Vector.<Mesh>();
         this.faces = new Vector.<Face>();
         super();
      }
      
      public function add(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         this.Renamed1367.push(param1);
         for each(_loc2_ in param1.faces)
         {
            this.faces.push(_loc2_);
            if(this.material == null)
            {
               this.material = TextureMaterial(_loc2_.material);
               this.Renamed7961();
            }
         }
      }
      
      public function setImage(param1:BitmapData) : void
      {
         this.Renamed7960 = param1;
         this.Renamed7961();
      }
      
      private function Renamed7961() : void
      {
         if(this.material != null && this.Renamed7960 != null)
         {
            this.material.texture = this.Renamed7960;
            this.Renamed7962();
         }
      }
      
      private function Renamed7962() : void
      {
         if(this.Renamed1367.length > 0)
         {
            this.material.resolution = 1;
         }
      }
   }
}

