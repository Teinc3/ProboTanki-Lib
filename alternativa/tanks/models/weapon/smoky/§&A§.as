package alternativa.tanks.models.weapon.smoky
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   
   public class §&A§ implements §4"3§
   {
      private static const §=#0§:§ !8§ = new § !8§();
      
      private var §7$$§:§override var dynamic§;
      
      private var effects:§<"=§;
      
      private var §try do§:§1"o§;
      
      public function §&A§(param1:§override var dynamic§, param2:§<"=§)
      {
         super();
         this.§7$$§ = param1;
         this.effects = param2;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
      }
      
      public function destroy() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function §native const while§() : void
      {
         this.§try do§.§get var switch§(§=#0§);
         this.§ #'§(§=#0§);
      }
      
      public function §true const final§(param1:Vector3) : void
      {
         this.§try do§.§get var switch§(§=#0§);
         this.§ #'§(§=#0§);
         this.effects.§!"F§(§=#0§.§if package var§,param1);
         this.effects.§throw catch use§(param1);
      }
      
      public function §'W§(param1:Tank, param2:Vector3, param3:Number, param4:Boolean) : void
      {
         this.§try do§.§get var switch§(§=#0§);
         this.§ #'§(§=#0§);
         var _loc5_:Vector3 = param2.clone().subtract(§=#0§.§6u§).normalize();
         param1.§case extends§(param2,_loc5_,param3 * this.§7$$§.§include package finally§());
         this.effects.§throw catch use§(param2);
         if(param4)
         {
            this.effects.§get for get§(param1.§0"t§().state.position);
         }
      }
      
      private function § #'§(param1:§ !8§) : void
      {
         this.§try do§.§0"t§().addWorldForceScaled(param1.§6u§,param1.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
         this.effects.§ #'§(this.§try do§.§else catch true§(),this.§try do§.§2"F§());
      }
   }
}

