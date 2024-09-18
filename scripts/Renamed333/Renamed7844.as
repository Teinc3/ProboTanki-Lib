package Renamed333
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.camera.Renamed842;
   
   public class Renamed7834 implements Renamed7835
   {
      private static const direction:Vector3 = new Vector3();
      
      private static const localDirection:Vector3 = new Vector3();
      
      private var Renamed7836:ConsoleVarFloat;
      
      private var Renamed7837:ConsoleVarFloat;
      
      public function Renamed7834(param1:ConsoleVarFloat, param2:ConsoleVarFloat)
      {
         super();
         this.Renamed7836 = param1;
         this.Renamed7837 = param2;
      }
      
      public function Renamed7838(param1:Renamed7839, param2:Renamed842, param3:Number) : Vector3
      {
         localDirection.y = param1.Renamed7840();
         localDirection.x = param1.Renamed7841();
         var _loc4_:Number = Math.cos(param2.rotationZ);
         var _loc5_:Number = Math.sin(param2.rotationZ);
         direction.x = localDirection.x * _loc4_ - localDirection.y * _loc5_;
         direction.y = localDirection.x * _loc5_ + localDirection.y * _loc4_;
         direction.z = param1.Renamed7842();
         if(direction.lengthSqr() > 0)
         {
            direction.normalize();
         }
         if(param1.Renamed7843())
         {
            direction.scale(this.Renamed7836.value * this.Renamed7837.value * param3);
         }
         else
         {
            direction.scale(this.Renamed7836.value * param3);
         }
         return direction;
      }
   }
}

