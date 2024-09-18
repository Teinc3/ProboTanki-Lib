package Renamed279
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import controls.Label;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import filters.Filters;
   import flash.display.BitmapData;
   
   public class Renamed4609 extends Renamed1444 implements Renamed609
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed7145:Number = 100;
      
      private static const Renamed7146:Number = 250;
      
      private static const Renamed7147:Number = 300;
      
      private static const Renamed7148:Number = 1000;
      
      private static const Renamed7149:Number = 100;
      
      private static var label:Label = new Label();
      
      private var sprite:Sprite3D;
      
      private var time:int;
      
      private var z:Number;
      
      private var origin:Vector3;
      
      private var container:Renamed908;
      
      private var Renamed7150:Number;
      
      private var Renamed7151:Number;
      
      public function Renamed4609(param1:Renamed1443)
      {
         this.origin = new Vector3();
         super(param1);
         this.sprite = new Sprite3D(0,0);
         this.sprite.perspectiveScale = false;
         this.sprite.material = new TextureMaterial(null,false,false);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
         this.sprite.depthTest = false;
         label.size = 16;
         label.filters = Filters.SHADOW_FILTERS;
      }
      
      public static function start(param1:Vector3, param2:uint, param3:int) : void
      {
         var _loc4_:Renamed4609 = Renamed4609(battleService.Renamed618().getObject(Renamed4609));
         _loc4_.init(param1,param2,param3);
         battleService.Renamed621().Renamed636(_loc4_);
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = battleService.Renamed621().Renamed1381();
         this.container.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         this.sprite.x = this.origin.x + this.z * this.Renamed7150;
         this.sprite.y = this.origin.y + this.z * this.Renamed7151;
         this.sprite.z = this.origin.z + this.z;
         this.time += param1;
         var _loc3_:Number = this.z < Renamed7145 ? Number(Renamed7148) : Number(Renamed7149);
         this.z += _loc3_ * param1 * 0.001;
         if(this.z < Renamed7146)
         {
            this.sprite.alpha = 1;
         }
         else
         {
            this.sprite.alpha = (Renamed7147 - this.z) / (Renamed7147 - Renamed7146);
            if(this.sprite.alpha < 0)
            {
               this.sprite.alpha = 0;
               return false;
            }
         }
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.sprite);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.sprite.alpha = 0;
      }
      
      private function init(param1:Vector3, param2:uint, param3:int) : void
      {
         this.origin.copy(param1);
         this.time = 0;
         this.z = 0;
         this.Renamed7150 = Math.random() - 0.5;
         this.Renamed7151 = Math.random() - 0.5;
         label.text = param3.toString();
         label.color = param2;
         var _loc4_:BitmapData = new BitmapData(60,20,true,0);
         _loc4_.draw(label);
         TextureMaterial(this.sprite.material).texture = _loc4_;
         this.sprite.width = _loc4_.width;
         this.sprite.height = _loc4_.height;
         this.sprite.calculateBounds();
      }
   }
}

