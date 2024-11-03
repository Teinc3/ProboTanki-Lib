package alternativa.tanks.battle.objects.tank.tankskin
{
   import Renamed1181.Renamed1182;
   import Renamed1181.Renamed1183;
   import Renamed1181.Renamed1184;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   
   public class Renamed1185
   {
      private static const Renamed1186:String = "barrel";
      
      private static const Renamed1187:String = "muzzle";
      
      private static const Renamed1188:String = "band";
      
      private static const Renamed1189:String = "band_m";
      
      private var Renamed1190:Renamed1182;
      
      private var Renamed1191:Renamed1182;
      
      private var Renamed1192:Renamed1182;
      
      private var Renamed1193:Renamed1182;
      
      private var Renamed1194:Vector.<Renamed1182>;
      
      public function Renamed1185(param1:Mesh)
      {
         super();
         this.init(param1);
      }
      
      private function init(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         for each(_loc2_ in param1.faces)
         {
            if(_loc2_.material.name == Renamed1186)
            {
               this.Renamed1195();
               this.Renamed1190.addFace(_loc2_);
            }
            else if(_loc2_.material.name == Renamed1187)
            {
               this.Renamed1195();
               this.Renamed1191.addFace(_loc2_);
            }
            else if(_loc2_.material.name == Renamed1188)
            {
               this.Renamed1195();
               this.Renamed1192.addFace(_loc2_);
            }
            else if(_loc2_.material.name == Renamed1189)
            {
               this.Renamed1195();
               this.Renamed1193.addFace(_loc2_);
            }
         }
         if(this.Renamed1194 != null)
         {
            this.Renamed1190.init();
            this.Renamed1191.init();
            this.Renamed1192.init();
            this.Renamed1193.init();
         }
      }
      
      private function Renamed1195() : void
      {
         if(this.Renamed1194 == null)
         {
            this.Renamed1194 = new Vector.<Renamed1182>();
            this.Renamed1190 = new Renamed1184(17 / 256);
            this.Renamed1191 = new Renamed1183(137.5 / 256,188 / 256);
            this.Renamed1192 = new Renamed1184(9 / 256);
            this.Renamed1193 = new Renamed1183(17 / 256,104 / 256);
            this.Renamed1194.push(this.Renamed1190);
            this.Renamed1194.push(this.Renamed1191);
            this.Renamed1194.push(this.Renamed1192);
            this.Renamed1194.push(this.Renamed1193);
         }
      }
      
      public function Renamed1179(param1:TextureMaterial) : void
      {
         var _loc2_:Renamed1182 = null;
         if(this.Renamed1196())
         {
            for each(_loc2_ in this.Renamed1194)
            {
               _loc2_.Renamed1179(param1);
            }
         }
      }
      
      private function Renamed1196() : Boolean
      {
         return this.Renamed1194 != null;
      }
      
      public function get Renamed1197() : Renamed1182
      {
         return this.Renamed1190;
      }
      
      public function get Renamed1198() : Renamed1182
      {
         return this.Renamed1191;
      }
      
      public function get Renamed1199() : Renamed1182
      {
         return this.Renamed1192;
      }
      
      public function get Renamed1200() : Renamed1182
      {
         return this.Renamed1193;
      }
      
      public function destroy() : void
      {
         this.Renamed1194 = null;
         this.Renamed1190 = null;
         this.Renamed1191 = null;
         this.Renamed1192 = null;
         this.Renamed1193 = null;
      }
   }
}

