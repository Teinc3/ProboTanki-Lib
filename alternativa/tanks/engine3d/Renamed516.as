package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   public class Renamed516 extends Renamed1656
   {
      private var Renamed1684:Renamed1681;
      
      public function Renamed516(param1:Renamed1635, param2:Renamed1681)
      {
         super(param1);
         this.Renamed1684 = param2;
         param2.Renamed1642(this.Renamed1639);
      }
      
      private function Renamed1639() : void
      {
         Renamed1675(this.Renamed1685);
      }
      
      private function Renamed1685(param1:TextureMaterial) : void
      {
         var _loc2_:Renamed1664 = Renamed1680(param1);
         param1.texture = this.Renamed1684.getTexture(_loc2_.texture);
      }
      
      override protected function getTexture(param1:BitmapData, param2:Boolean) : BitmapData
      {
         return this.Renamed1684.getTexture(param1,param2);
      }
   }
}

