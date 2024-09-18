package Renamed1181
{
   import alternativa.engine3d.core.Vertex;
   import flash.geom.Point;
   
   public class Renamed1183 extends Renamed6613
   {
      private var Renamed6614:Number;
      
      private var Renamed6615:Number;
      
      public function Renamed1183(param1:Number, param2:Number)
      {
         super();
         this.Renamed6614 = param1;
         this.Renamed6615 = param2;
      }
      
      override public function rotate(param1:Number) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         super.rotate(param1);
         var _loc6_:Number = Math.cos(rotation);
         var _loc7_:Number = -Math.sin(rotation);
         var _loc8_:int = 0;
         while(_loc8_ < vertices.length)
         {
            _loc2_ = vertices[_loc8_];
            _loc3_ = Renamed6616[_loc8_];
            _loc4_ = _loc3_.x - this.Renamed6614;
            _loc5_ = _loc3_.y - this.Renamed6615;
            _loc2_.u = _loc4_ * _loc6_ + _loc5_ * _loc7_ + this.Renamed6614;
            _loc2_.v = _loc4_ * _loc7_ - _loc5_ * _loc6_ + this.Renamed6615;
            _loc8_++;
         }
      }
   }
}

