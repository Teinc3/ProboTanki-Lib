package Renamed87
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.Renamed1475;
   import alternativa.tanks.camera.Renamed1477;
   
   public class Renamed10383 implements Renamed1475
   {
      private static var Renamed10419:ConsoleVarFloat;
      
      private static var Renamed10420:ConsoleVarFloat;
      
      private static var Renamed10421:ConsoleVarFloat;
      
      private static var duration:ConsoleVarInt;
      
      private static var m1:Matrix3 = new Matrix3();
      
      private static var Renamed10422:Matrix3 = new Matrix3();
      
      private static var axis:Vector3 = new Vector3();
      
      private var sign:int;
      
      private var time:int;
      
      private var tank:Tank;
      
      public function Renamed10383()
      {
         super();
      }
      
      public static function Renamed10384() : void
      {
         Renamed10419 = new ConsoleVarFloat("minecam_ampl",0,-10000,10000);
         Renamed10420 = new ConsoleVarFloat("minecam_yaw",-0.02,-10,10);
         Renamed10421 = new ConsoleVarFloat("minecam_roll",0.03,-10,10);
         duration = new ConsoleVarInt("minecam_time",800,0,10000);
      }
      
      public function update(param1:int, param2:int, param3:Vector3, param4:Vector3) : Boolean
      {
         if(param1 - this.time > duration.value)
         {
            return false;
         }
         return true;
      }
      
      public function Renamed1476(param1:Renamed1477) : void
      {
      }
      
      public function destroy() : void
      {
      }
   }
}

