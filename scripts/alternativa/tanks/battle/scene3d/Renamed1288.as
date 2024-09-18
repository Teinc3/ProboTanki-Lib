package alternativa.tanks.battle.scene3d
{
   import alternativa.tanks.battle.Renamed754;
   
   public class Renamed1288 implements Renamed754
   {
      private var Renamed1310:Renamed1284;
      
      private var renderer:Renamed919;
      
      public function Renamed1288(param1:Renamed1284, param2:Renamed919)
      {
         super();
         this.Renamed1310 = param1;
         this.renderer = param2;
      }
      
      public function execute() : void
      {
         this.Renamed1310.Renamed1287(this.renderer);
      }
   }
}

