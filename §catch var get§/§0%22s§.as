package §catch var get§
{
   import alternativa.engine3d.primitives.Box;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.§ !8§;
   
   public class §0"s§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static var §static extends§:ConsoleVarInt = new ConsoleVarInt("targeting_debug",0,0,1);
      
      private var §>!`§:Vector.<Box>;
      
      private var §null for in§:Vector3;
      
      private var §?R§:Vector3;
      
      private var §get catch break§:Matrix3;
      
      public function §0"s§()
      {
         this.§>!`§ = new Vector.<Box>();
         this.§null for in§ = new Vector3();
         this.§?R§ = new Vector3();
         this.§get catch break§ = new Matrix3();
         super();
      }
      
      public function reset() : void
      {
      }
      
      public function §override const in§(param1:§ !8§, param2:Vector3, param3:Number, param4:Vector3 = null) : void
      {
      }
      
      private function §3!s§(param1:Number, param2:Number, param3:Number, param4:uint = 65535) : Box
      {
         return null;
      }
   }
}

