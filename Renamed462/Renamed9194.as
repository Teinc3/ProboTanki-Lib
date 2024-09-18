package Renamed462
{
   import Renamed1.Renamed6378;
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.engine3d.Renamed843;
   import Renamed356.Renamed1443;
   
   public class Renamed9194 extends Renamed9195
   {
      private var Renamed9196:Number;
      
      private var Renamed9197:Number;
      
      private var Renamed5072:Renamed1647;
      
      public function Renamed9194(param1:Renamed1443)
      {
         this.Renamed5072 = new Renamed1647(1,1);
         super(param1);
         Renamed6378.Renamed7054(this.Renamed5072);
      }
      
      public function init(param1:Number, param2:Vector3, param3:Number, param4:Renamed843) : void
      {
         this.Renamed5072.width = param1;
         this.Renamed5072.height = param1;
         this.Renamed5072.Renamed1651(param4);
         this.Renamed5072.x = param2.x;
         this.Renamed5072.y = param2.y;
         this.Renamed5072.z = param2.z;
         this.Renamed5072.rotation = param3;
         this.Renamed9196 = param3;
         this.Renamed9197 = param2.z;
      }
      
      public function get sprite() : Renamed1647
      {
         return this.Renamed5072;
      }
      
      public function get rotation() : Number
      {
         return this.Renamed9196;
      }
      
      public function get Renamed9198() : Number
      {
         return this.Renamed9197;
      }
   }
}

