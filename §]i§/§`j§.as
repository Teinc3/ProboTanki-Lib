package §]i§
{
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class §`j§ extends Sprite
   {
      private static var §-!H§:Vector.<Point>;
      
      private static const ANGLE_45:Number = 0.25 * Math.PI;
      
      private static const ANGLE_135:Number = 0.75 * Math.PI;
      
      private static const ANGLE_225:Number = 1.25 * Math.PI;
      
      private static const ANGLE_315:Number = 1.75 * Math.PI;
      
      private var size:Number;
      
      private var overlay:Shape;
      
      public function §`j§(param1:int, param2:int)
      {
         super();
         if(§-!H§ == null)
         {
            this.§2w§();
         }
         this.size = param1;
         graphics.beginFill(0,0.7);
         graphics.drawRoundRect(0,0,param1,param1,param2);
         graphics.endFill();
         addChild(this.overlay = new Shape());
      }
      
      public function draw(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Number = 2 * Math.PI * param1;
         if(_loc2_ < ANGLE_45)
         {
            _loc5_ = 0;
            _loc3_ = 0.5 * this.size * (1 + Math.tan(_loc2_));
            _loc4_ = 0;
         }
         else if(_loc2_ < ANGLE_135)
         {
            _loc5_ = 1;
            _loc3_ = this.size;
            _loc4_ = 0.5 * this.size * (1 - 1 / Math.tan(_loc2_));
         }
         else if(_loc2_ < ANGLE_225)
         {
            _loc5_ = 2;
            _loc3_ = 0.5 * this.size * (1 - Math.tan(_loc2_));
            _loc4_ = this.size;
         }
         else if(_loc2_ < ANGLE_315)
         {
            _loc5_ = 3;
            _loc3_ = 0;
            _loc4_ = 0.5 * this.size * (1 + 1 / Math.tan(_loc2_));
         }
         else
         {
            _loc5_ = 4;
            _loc3_ = 0.5 * this.size * (1 + Math.tan(_loc2_));
            _loc4_ = 0;
         }
         var _loc6_:Graphics = this.overlay.graphics;
         _loc6_.clear();
         var _loc7_:Point = §-!H§[5];
         _loc6_.beginFill(16711680);
         _loc6_.moveTo(_loc3_,_loc4_);
         while(_loc5_ < 6)
         {
            _loc7_ = §-!H§[_loc5_];
            _loc6_.lineTo(this.size * _loc7_.x,this.size * _loc7_.y);
            _loc5_++;
         }
         _loc6_.lineTo(_loc3_,_loc4_);
         _loc6_.endFill();
         mask = this.overlay;
      }
      
      private function §2w§() : void
      {
         §-!H§ = new Vector.<Point>(6);
         §-!H§[0] = new Point(1,0);
         §-!H§[1] = new Point(1,1);
         §-!H§[2] = new Point(0,1);
         §-!H§[3] = new Point(0,0);
         §-!H§[4] = new Point(0.5,0);
         §-!H§[5] = new Point(0.5,0.5);
      }
   }
}

