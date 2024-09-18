package §class var for§
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.camera.§3!0§;
   
   public class §?!L§ implements §implements catch null§
   {
      private static const direction:Vector3 = new Vector3();
      
      private static const localDirection:Vector3 = new Vector3();
      
      private var §0"n§:ConsoleVarFloat;
      
      private var §0" §:ConsoleVarFloat;
      
      public function §?!L§(param1:ConsoleVarFloat, param2:ConsoleVarFloat)
      {
         super();
         this.§0"n§ = param1;
         this.§0" § = param2;
      }
      
      public function §switch for native§(param1:§&",§, param2:§3!0§, param3:Number) : Vector3
      {
         localDirection.y = param1.§7,§();
         localDirection.x = param1.§return for true§();
         var _loc4_:Number = Math.cos(param2.rotationZ);
         var _loc5_:Number = Math.sin(param2.rotationZ);
         direction.x = localDirection.x * _loc4_ - localDirection.y * _loc5_;
         direction.y = localDirection.x * _loc5_ + localDirection.y * _loc4_;
         direction.z = param1.§use package while§();
         if(direction.lengthSqr() > 0)
         {
            direction.normalize();
         }
         if(param1.§var set with§())
         {
            direction.scale(this.§0"n§.value * this.§0" §.value * param3);
         }
         else
         {
            direction.scale(this.§0"n§.value * param3);
         }
         return direction;
      }
   }
}

