package §in const true§
{
   import §%!5§.§>"Q§;
   import §%!5§.§try set finally§;
   import §+"f§.§^!8§;
   import §7"j§.§9"<§;
   import §7"j§.§<"z§;
   import §7"j§.§for var throw§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.utils.MathUtils;
   import §extends for const§.§1Q§;
   import §final var static§.§"#;§;
   import §import catch function§.§package const override§;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class §?!j§ extends §^!8§
   {
      private var §5"2§:§catch do§;
      
      private var sfxData:§implements package in§;
      
      private var callback:§continue package break§;
      
      private var §do const return§:§"#;§;
      
      private var impactForce:Number;
      
      private var sprite:§7J§;
      
      private var §&#s§:§while var if§;
      
      private var §50§:§for var throw§;
      
      private var §=!x§:§package const override§;
      
      public function §?!j§(param1:§1Q§)
      {
         super(param1);
         this.sprite = new §7J§(§try import§.§;H§,§try import§.§;H§);
         this.sprite.§#![§ = true;
      }
      
      override protected function §"$ §() : §try set finally§
      {
         return §>"Q§.INSTANCE;
      }
      
      public function init(param1:Number, param2:§"#;§, param3:§implements package in§, param4:§catch do§, param5:§continue package break§, param6:§package const override§) : void
      {
         this.impactForce = param1;
         this.§do const return§ = param2;
         this.§5"2§ = param4;
         this.sfxData = param3;
         this.callback = param5;
         this.§=!x§ = param6;
         this.sprite.§do var super§(param3.§case package finally§);
         this.sprite.§true const switch§(this.sprite.getNumFrames() * Math.random());
         this.sprite.alpha = 1;
         this.sprite.rotation = MathUtils.PI2 * Math.random();
         this.§&#s§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         this.§50§ = §for var throw§(battleService.§class while§().getObject(§for var throw§));
         this.§&#s§.init(this.§50§,param3.§override for while§,§while var if§.§?D§,true);
      }
      
      override public function §const const while§(param1:§ !8§, param2:Vector3, param3:Body, param4:int = -1) : void
      {
         super.§const const while§(param1,param2,param3,param4);
         battleService.§3l§().§with catch with§(this.sprite);
         battleService.§7"0§(this.§&#s§);
      }
      
      override protected function §9Z§() : Number
      {
         return this.§do const return§.speed;
      }
      
      override protected function §import var for§() : Number
      {
         return this.§5"2§.§6T§();
      }
      
      override protected function §&-§(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:int) : void
      {
         var _loc6_:Tank = null;
         super.§&-§(param1,param2,param3,param4,param5);
         var _loc7_:Number = this.§5"2§.§1"g§(param4);
         this.§"#s§(param2,_loc7_);
         var _loc8_:Boolean = true;
         if(§+$%§.§ #T§(param1))
         {
            _loc6_ = param1.tank;
            _loc6_.§case extends§(param2,param3,this.impactForce * _loc7_);
            if(this.callback)
            {
               this.callback.§=#e§(§function final§(),param1,param2);
            }
         }
         else
         {
            if(Boolean(this.callback) && _loc8_)
            {
               this.callback.§dynamic var const§(§function final§(),param2);
            }
            this.§-!c§(param2);
         }
         this.destroy();
      }
      
      override public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = param2 / thousandth.getInt();
         this.sprite.update(_loc3_);
         this.sprite.x = §include for var§.x;
         this.sprite.y = §include for var§.y;
         this.sprite.z = §include for var§.z;
         this.sprite.rotation -= 3 * _loc3_;
         var _loc4_:Number = this.§do const return§.distance - §function catch with§;
         if(_loc4_ < §try import§.§`"j§)
         {
            this.sprite.alpha = _loc4_ / §try import§.§`"j§;
         }
         this.§50§.setPosition(§include for var§);
      }
      
      override protected function destroy() : void
      {
         super.destroy();
         battleService.§3l§().removeObject(this.sprite);
         this.§do const return§ = null;
         this.callback = null;
         §8#?§ = null;
         this.§5"2§ = null;
         this.sfxData = null;
         this.sprite.material = null;
         this.sprite.colorTransform = null;
         this.§&#s§.kill();
         this.§&#s§ = null;
         this.§50§ = null;
      }
      
      override protected function §3"C§() : Number
      {
         return this.§do const return§.shellRadius;
      }
      
      private function §"#s§(param1:Vector3, param2:Number) : void
      {
         var _loc3_:set = set(battleService.§class while§().getObject(set));
         _loc3_.init(param1,§try import§.§!%§);
         var _loc4_:Number = §try import§.§3"Z§ * (1 + param2) / 2;
         var _loc5_:§<"z§ = §<"z§(battleService.§class while§().getObject(§<"z§));
         _loc5_.init(_loc4_,_loc4_,this.sfxData.§get catch dynamic§,MathUtils.PI2 * Math.random(),_loc3_,0.5,0.5);
         battleService.§7"0§(_loc5_);
         this.§package set else§(param1);
      }
      
      private function §package set else§(param1:Vector3) : void
      {
         var _loc2_:§while var if§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         var _loc3_:set = set(battleService.§class while§().getObject(set));
         _loc3_.init(param1,§try import§.§!%§);
         _loc2_.init(_loc3_,this.sfxData.§import var else§);
         battleService.§7"0§(_loc2_);
      }
      
      private function §-!c§(param1:Vector3) : void
      {
         var _loc2_:§9"<§ = null;
         if(GPUCapabilities.gpuEnabled)
         {
            _loc2_ = §9"<§(battleService.§class while§().getObject(§9"<§));
            _loc2_.init(param1,this.sfxData.§5#W§,§if package var§,§try import§.§case set null§,§try import§.§>!5§,§try import§.§each var native§);
            battleService.§7"0§(_loc2_);
         }
      }
   }
}

