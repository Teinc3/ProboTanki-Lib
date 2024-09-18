package §8h§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.§3!0§;
   import controls.Label;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import filters.Filters;
   import flash.display.BitmapData;
   
   public class §extends set package§ extends §["D§ implements §finally const package§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §finally use§:Number = 100;
      
      private static const §const const default§:Number = 250;
      
      private static const §,"4§:Number = 300;
      
      private static const §7"f§:Number = 1000;
      
      private static const §dynamic set function§:Number = 100;
      
      private static var label:Label = new Label();
      
      private var sprite:Sprite3D;
      
      private var time:int;
      
      private var z:Number;
      
      private var origin:Vector3;
      
      private var container:§6!<§;
      
      private var §;#c§:Number;
      
      private var §while const each§:Number;
      
      public function §extends set package§(param1:§1Q§)
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
         var _loc4_:§extends set package§ = §extends set package§(battleService.§class while§().getObject(§extends set package§));
         _loc4_.init(param1,param2,param3);
         battleService.§3l§().§7"0§(_loc4_);
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = battleService.§3l§().§]!4§();
         this.container.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         this.sprite.x = this.origin.x + this.z * this.§;#c§;
         this.sprite.y = this.origin.y + this.z * this.§while const each§;
         this.sprite.z = this.origin.z + this.z;
         this.time += param1;
         var _loc3_:Number = this.z < §finally use§ ? Number(§7"f§) : Number(§dynamic set function§);
         this.z += _loc3_ * param1 * 0.001;
         if(this.z < §const const default§)
         {
            this.sprite.alpha = 1;
         }
         else
         {
            this.sprite.alpha = (§,"4§ - this.z) / (§,"4§ - §const const default§);
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
         this.§;#c§ = Math.random() - 0.5;
         this.§while const each§ = Math.random() - 0.5;
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

