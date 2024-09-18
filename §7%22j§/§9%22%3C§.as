package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §9"<§ extends §["D§ implements §finally const package§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var §package catch finally§:Decal;
      
      private var position:Vector3;
      
      private var §import var in§:Vector3;
      
      private var material:TextureMaterial;
      
      private var radius:Number;
      
      private var §function catch import§:int;
      
      private var fadeTime:int;
      
      private var §const for§:int;
      
      public function §9"<§(param1:§1Q§)
      {
         this.position = new Vector3();
         this.§import var in§ = new Vector3();
         super(param1);
      }
      
      public function init(param1:Vector3, param2:TextureMaterial, param3:Vector3, param4:Number, param5:int, param6:int) : void
      {
         this.position.copy(param1);
         this.§import var in§.copy(param3);
         this.radius = param4;
         this.material = param2;
         this.§function catch import§ = param5;
         this.fadeTime = param6;
         this.§const for§ = param6;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.§package catch finally§ = battleService.§3l§().§do package super§(this.position,this.§import var in§,this.radius,this.material);
         if(this.§package catch finally§ == null)
         {
            this.kill();
         }
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§const for§ > 0)
         {
            if(this.§function catch import§ > 0)
            {
               this.§function catch import§ -= param1;
            }
            else
            {
               this.§const for§ -= param1;
               if(this.§package catch finally§ != null)
               {
                  this.§package catch finally§.alpha = this.§const for§ / this.fadeTime;
               }
            }
            return true;
         }
         return false;
      }
      
      public function destroy() : void
      {
         if(this.§package catch finally§ != null)
         {
            battleService.§3l§().§do for default§(this.§package catch finally§);
            this.§package catch finally§ = null;
         }
         this.material = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.§const for§ = 0;
      }
   }
}

