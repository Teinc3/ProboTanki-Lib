package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.camera.Renamed842;
   
   public class Renamed3232 extends Renamed832 implements Renamed768
   {
      private static const Renamed3233:Number = 5 * 0.001;
      
      private static const ALPHA_SPEED:Number = 5 * 0.001;
      
      private static const Renamed3234:Number = Math.PI / 2;
      
      private var camera:Renamed842;
      
      private var skin:Renamed917;
      
      private var Renamed3235:Number;
      
      public function Renamed3232(param1:Renamed842)
      {
         super();
         this.camera = param1;
         this.Renamed3235 = Renamed3234;
      }
      
      public function setSkin(param1:Renamed917) : void
      {
         this.skin = param1;
      }
      
      public function Renamed3236(param1:Number) : void
      {
         this.Renamed3235 = param1;
      }
      
      public function start() : void
      {
         Renamed619().Renamed815(this);
      }
      
      public function stop() : void
      {
         Renamed619().Renamed816(this);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.camera.fov += Renamed3233 * param2;
         if(this.camera.fov > this.Renamed3235)
         {
            this.camera.fov = this.Renamed3235;
         }
         var _loc3_:Number = this.skin.Renamed1267();
         _loc3_ += ALPHA_SPEED * param2;
         if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         this.skin.setAlpha(_loc3_);
         if(this.camera.fov == this.Renamed3235 && _loc3_ == 1)
         {
            this.stop();
         }
      }
   }
}

