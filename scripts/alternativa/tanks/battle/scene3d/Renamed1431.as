package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   
   public class Renamed1363
   {
      public var color:int;
      
      public var alpha:Number;
      
      public var Renamed1429:Number;
      
      public var Renamed1430:Number;
      
      private var camera:Camera3D;
      
      public function Renamed1363(param1:Camera3D)
      {
         super();
         this.camera = param1;
      }
      
      public function enable() : void
      {
         if(this.color != 0)
         {
            this.camera.fogNear = this.Renamed1429;
            this.camera.fogFar = this.Renamed1430;
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
         this.Renamed1429 = param3;
         this.Renamed1430 = param4;
      }
   }
}

