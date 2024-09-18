package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   
   public class §^"s§
   {
      public var color:int;
      
      public var alpha:Number;
      
      public var §!r§:Number;
      
      public var §5#G§:Number;
      
      private var camera:Camera3D;
      
      public function §^"s§(param1:Camera3D)
      {
         super();
         this.camera = param1;
      }
      
      public function enable() : void
      {
         if(this.color != 0)
         {
            this.camera.fogNear = this.§!r§;
            this.camera.fogFar = this.§5#G§;
            this.camera.fogAlpha = this.alpha;
            this.camera.fogColor = this.color;
         }
      }
      
      public function disable() : void
      {
         this.camera.fogNear = 0;
         this.camera.fogFar = 1000000;
         this.camera.fogAlpha = 0;
      }
      
      public function setup(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         this.color = param1;
         this.alpha = param2;
         this.§!r§ = param3;
         this.§5#G§ = param4;
      }
   }
}

