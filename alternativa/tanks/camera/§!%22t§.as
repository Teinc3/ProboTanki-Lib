package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   
   public class §!"t§
   {
      [Inject]
      public static var battleService:BattleService;
      
      public var position:Vector3;
      
      public var §finally for finally§:Vector3;
      
      public function §!"t§()
      {
         this.position = new Vector3();
         this.§finally for finally§ = new Vector3();
         super();
      }
      
      public function §,"l§() : void
      {
         var _loc1_:§3!0§ = battleService.§3l§().§super package§();
         this.position.x = _loc1_.x;
         this.position.y = _loc1_.y;
         this.position.z = _loc1_.z;
         this.§finally for finally§.x = _loc1_.rotationX;
         this.§finally for finally§.y = _loc1_.rotationY;
         this.§finally for finally§.z = _loc1_.rotationZ;
      }
   }
}

