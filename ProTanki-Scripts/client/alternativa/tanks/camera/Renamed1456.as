package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   
   public class Renamed1453
   {
      [Inject]
      public static var battleService:BattleService;
      
      public var position:Vector3;
      
      public var Renamed1454:Vector3;
      
      public function Renamed1453()
      {
         this.position = new Vector3();
         this.Renamed1454 = new Vector3();
         super();
      }
      
      public function Renamed1455() : void
      {
         var _loc1_:Renamed842 = battleService.Renamed621().Renamed739();
         this.position.x = _loc1_.x;
         this.position.y = _loc1_.y;
         this.position.z = _loc1_.z;
         this.Renamed1454.x = _loc1_.rotationX;
         this.Renamed1454.y = _loc1_.rotationY;
         this.Renamed1454.z = _loc1_.rotationZ;
      }
   }
}

