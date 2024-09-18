package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed1647;
   import alternativa.tanks.engine3d.Renamed843;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.geom.ColorTransform;
   
   public class Renamed3264 extends Renamed1444 implements Renamed609
   {
      private var sprite:Renamed1647;
      
      private var currentFrame:Number;
      
      private var Renamed6931:Number;
      
      private var Renamed6932:int;
      
      private var Renamed6909:Renamed6901;
      
      private var container:Renamed908;
      
      public function Renamed3264(param1:Renamed1443)
      {
         super(param1);
         this.sprite = new Renamed1647(1,1);
      }
      
      public function init(param1:Number, param2:Number, param3:Renamed843, param4:Number, param5:Renamed6901, param6:Number = 0.5, param7:Number = 0.5, param8:ColorTransform = null, param9:Number = 130, param10:String = "normal") : void
      {
         this.Renamed6933(param1,param2,param4,param6,param7,param8,param3,param9,param10);
         param5.Renamed6904(this.sprite);
         this.Renamed6931 = 0.001 * param3.fps;
         this.Renamed6909 = param5;
         this.currentFrame = 0;
         this.Renamed6932 = 1;
      }
      
      public function Renamed6726(param1:Number, param2:Number, param3:Renamed843, param4:Number, param5:Renamed6901, param6:Number = 0.5, param7:Number = 0.5, param8:ColorTransform = null, param9:Number = 130, param10:String = "normal", param11:int = -1) : void
      {
         this.init(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.Renamed6932 = param11;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         this.sprite.Renamed1653(this.currentFrame);
         this.currentFrame += param1 * this.Renamed6931;
         this.Renamed6909.Renamed6905(this.sprite,param2,param1);
         if(this.Renamed6932 > 0 && this.currentFrame >= this.sprite.getNumFrames())
         {
            --this.Renamed6932;
            if(this.Renamed6932 == 0)
            {
               return false;
            }
            this.currentFrame -= this.sprite.getNumFrames();
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         this.container = null;
         this.sprite.clear();
         this.Renamed6909.destroy();
         this.Renamed6909 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.Renamed6932 = 1;
         this.currentFrame = this.sprite.getNumFrames();
      }
      
      private function Renamed6933(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:ColorTransform, param7:Renamed843, param8:Number, param9:String) : void
      {
         this.sprite.width = param1;
         this.sprite.height = param2;
         this.sprite.rotation = param3;
         this.sprite.originX = param4;
         this.sprite.originY = param5;
         this.sprite.blendMode = param9;
         this.sprite.colorTransform = param6;
         this.sprite.softAttenuation = param8;
         this.sprite.Renamed1651(param7);
      }
   }
}

