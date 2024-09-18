package §switch package return§
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.§-"X§;
   import alternativa.tanks.camera.§false package dynamic§;
   
   public class §try package static§ implements §-"X§
   {
      private static var §class var get§:ConsoleVarFloat;
      
      private static var §continue catch final§:ConsoleVarFloat;
      
      private static var §import package use§:ConsoleVarFloat;
      
      private static var duration:ConsoleVarInt;
      
      private static var m1:Matrix3 = new Matrix3();
      
      private static var §+E§:Matrix3 = new Matrix3();
      
      private static var axis:Vector3 = new Vector3();
      
      private var sign:int;
      
      private var time:int;
      
      private var tank:Tank;
      
      public function §try package static§()
      {
         super();
      }
      
      public static function § !v§() : void
      {
         §class var get§ = new ConsoleVarFloat("minecam_ampl",0,-10000,10000);
         §continue catch final§ = new ConsoleVarFloat("minecam_yaw",-0.02,-10,10);
         §import package use§ = new ConsoleVarFloat("minecam_roll",0.03,-10,10);
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
      
      public function §,q§(param1:§false package dynamic§) : void
      {
      }
      
      public function destroy() : void
      {
      }
   }
}

