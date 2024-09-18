package §3"q§
{
   import alternativa.engine3d.core.Vertex;
   import flash.geom.Point;
   
   public class §8"<§ extends §throw set super§
   {
      private var §"#P§:Number;
      
      private var §3$"§:Number;
      
      public function §8"<§(param1:Number, param2:Number)
      {
         super();
         this.§"#P§ = param1;
         this.§3$"§ = param2;
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
            _loc3_ = §class package native§[_loc8_];
            _loc4_ = _loc3_.x - this.§"#P§;
            _loc5_ = _loc3_.y - this.§3$"§;
            _loc2_.u = _loc4_ * _loc6_ + _loc5_ * _loc7_ + this.§"#P§;
            _loc2_.v = _loc4_ * _loc7_ - _loc5_ * _loc6_ + this.§3$"§;
            _loc8_++;
         }
      }
   }
}

