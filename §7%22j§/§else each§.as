package §7"j§
{
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   
   public class §else each§ extends §;#w§
   {
      private static const §3z§:Number = 3000;
      
      private static const §+$"§:Number = 1 / 5000;
      
      private static const v:Vector3 = new Vector3();
      
      public function §else each§(param1:§1Q§)
      {
         super(param1);
      }
      
      override public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Boolean = super.play(param1,param2);
         if(_loc4_)
         {
            v.reset(§for package try§.x,§for package try§.y,§for package try§.z);
            _loc3_ = param2.position.distanceTo(v);
            if(_loc3_ > §3z§)
            {
               scale += _loc3_ * §+$"§;
            }
            return true;
         }
         return false;
      }
   }
}

