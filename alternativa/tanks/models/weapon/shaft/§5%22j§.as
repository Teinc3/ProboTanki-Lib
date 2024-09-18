package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.camera.§3!0§;
   
   public class §5"j§ extends §else package false§ implements §;!t§
   {
      private static const §,!n§:Number = 5 * 0.001;
      
      private static const ALPHA_SPEED:Number = 5 * 0.001;
      
      private static const §while const implements§:Number = Math.PI / 2;
      
      private var camera:§3!0§;
      
      private var skin:§false catch set§;
      
      private var §each var super§:Number;
      
      public function §5"j§(param1:§3!0§)
      {
         super();
         this.camera = param1;
         this.§each var super§ = §while const implements§;
      }
      
      public function setSkin(param1:§false catch set§) : void
      {
         this.skin = param1;
      }
      
      public function §!!]§(param1:Number) : void
      {
         this.§each var super§ = param1;
      }
      
      public function start() : void
      {
         §'x§().§%#9§(this);
      }
      
      public function stop() : void
      {
         §'x§().§%"7§(this);
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         this.camera.fov += §,!n§ * param2;
         if(this.camera.fov > this.§each var super§)
         {
            this.camera.fov = this.§each var super§;
         }
         var _loc3_:Number = this.skin.§catch in§();
         _loc3_ += ALPHA_SPEED * param2;
         if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         this.skin.setAlpha(_loc3_);
         if(this.camera.fov == this.§each var super§ && _loc3_ == 1)
         {
            this.stop();
         }
      }
   }
}

