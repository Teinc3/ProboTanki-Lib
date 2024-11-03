package Renamed462
{
   import Renamed1.Renamed6378;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import Renamed356.Renamed1443;
   
   public class Renamed9209 extends Renamed9195
   {
      private var Renamed5072:Sprite3D;
      
      private var _direction:Vector3;
      
      private var Renamed5641:Number = 0;
      
      public function Renamed9209(param1:Renamed1443)
      {
         this.Renamed5072 = new Sprite3D(1,1);
         this._direction = new Vector3();
         super(param1);
         Renamed6378.Renamed7054(this.Renamed5072);
      }
      
      public function init(param1:Number, param2:Vector3, param3:Vector3, param4:TextureMaterial) : void
      {
         this.Renamed5641 = 0;
         this._direction.copy(param3);
         this.Renamed5072.width = param1;
         this.Renamed5072.height = param1;
         this.Renamed5072.x = param2.x;
         this.Renamed5072.y = param2.y;
         this.Renamed5072.z = param2.z;
         this.Renamed5072.material = param4;
      }
      
      public function get sprite() : Sprite3D
      {
         return this.Renamed5072;
      }
      
      public function get direction() : Vector3
      {
         return this._direction;
      }
      
      public function get time() : Number
      {
         return this.Renamed5641;
      }
      
      public function set time(param1:Number) : void
      {
         this.Renamed5641 = param1;
      }
   }
}

