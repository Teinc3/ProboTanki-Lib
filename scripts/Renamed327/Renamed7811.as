package Renamed327
{
   import alternativa.engine3d.primitives.Box;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.Renamed664;
   
   public class Renamed3516
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static var Renamed7807:ConsoleVarInt = new ConsoleVarInt("targeting_debug",0,0,1);
      
      private var Renamed7808:Vector.<Box>;
      
      private var Renamed594:Vector3;
      
      private var Renamed596:Vector3;
      
      private var Renamed1511:Matrix3;
      
      public function Renamed3516()
      {
         this.Renamed7808 = new Vector.<Box>();
         this.Renamed594 = new Vector3();
         this.Renamed596 = new Vector3();
         this.Renamed1511 = new Matrix3();
         super();
      }
      
      public function reset() : void
      {
      }
      
      public function Renamed7809(param1:Renamed664, param2:Vector3, param3:Number, param4:Vector3 = null) : void
      {
      }
      
      private function Renamed7810(param1:Number, param2:Number, param3:Number, param4:uint = 65535) : Box
      {
         return null;
      }
   }
}

