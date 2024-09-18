package Renamed264
{
   import Renamed200.Renamed4565;
   import Renamed220.Renamed4575;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed1140;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed3010;
   import alternativa.tanks.models.tank.Renamed2408;
   import Renamed428.Renamed6828;
   import Renamed428.Renamed4708;
   
   public class Renamed509 extends Renamed6828 implements Renamed4708, Renamed508, Renamed4575
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed6829:Renamed3010;
      
      private var Renamed6830:Renamed4565;
      
      public function Renamed509()
      {
         this.Renamed6829 = new Renamed3010();
         super();
      }
      
      public function localTankLoaded() : void
      {
         var _loc1_:Boolean = battleService.Renamed657();
         this.Renamed6830 = new Renamed4565(Renamed775.Renamed824.tank,this.Renamed6829,_loc1_);
      }
      
      public function Renamed5996() : void
      {
         battleService.Renamed658(true);
         var _loc1_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc1_.Renamed2886(Renamed775.Renamed824.user,Renamed1140.PAUSE);
         _loc1_.Renamed2898(Renamed775.Renamed824.user).Renamed2713(Renamed1140.PAUSE,true);
      }
      
      public function Renamed5995() : void
      {
         battleService.Renamed658(false);
         var _loc1_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc1_.Renamed2887(Renamed775.Renamed824.user,Renamed1140.PAUSE);
         _loc1_.Renamed2898(Renamed775.Renamed824.user).Renamed2714(Renamed1140.PAUSE);
         this.Renamed2843();
         server.Renamed5995();
      }
      
      public function Renamed2843() : void
      {
         this.Renamed6829.reset(battleService.Renamed631());
      }
      
      public function getPauseSupport() : Renamed4565
      {
         return this.Renamed6830;
      }
   }
}

