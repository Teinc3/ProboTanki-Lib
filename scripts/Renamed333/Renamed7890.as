package Renamed333
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.camera.Renamed842;
   
   public class Renamed7890 implements Renamed7835
   {
      private static const direction:Vector3 = new Vector3();
      
      private static const localDirection:Vector3 = new Vector3();
      
      private var Renamed7836:ConsoleVarFloat;
      
      private var Renamed7837:ConsoleVarFloat;
      
      public function Renamed7890(param1:ConsoleVarFloat, param2:ConsoleVarFloat)
      {
         super();
         this.Renamed7836 = param1;
         this.Renamed7837 = param2;
      }
      
      public function Renamed7838(param1:Renamed7839, param2:Renamed842, param3:Number) : Vector3
      {
         localDirection.x = param1.Renamed7841();
         localDirection.y = -param1.Renamed7842();
         localDirection.z = param1.Renamed7840();
         param2.Renamed1479(localDirection,direction);
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

