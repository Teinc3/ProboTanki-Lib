package §with for class§
{
   import §1#c§.§-"c§;
   import §3"q§.§0<§;
   import §7"j§.§3!n§;
   import §7"j§.§extends super§;
   import §7"j§.set;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.tankskin.§"#g§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import §extends for const§.§import use§;
   import §in set else§.§switch get§;
   
   public class §native var else§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §native for var§:Number = 0.1;
      
      private static const §="A§:Number = 50;
      
      private static const §&!"§:Number = 0.001;
      
      private static const §@"&§:Number = 15;
      
      private static const §,>§:Number = 0.59;
      
      private static const §>"S§:Number = 0.1;
      
      private static const POW:Number = 3;
      
      private var §finally override§:§0<§;
      
      private var §,#t§:§0<§;
      
      private var §^!;§:§0<§;
      
      private var §-#q§:§0<§;
      
      private var spinUpTime:Number;
      
      private var spinDownTime:Number;
      
      private var sfxData:§null var§;
      
      private var turret:Object3D;
      
      private var §2x§:Vector3;
      
      private var § #9§:§"!Y§;
      
      private var §continue var in§:§3!n§;
      
      private var §&S§:§switch get§;
      
      private var §throw use§:Boolean = false;
      
      private var §default catch return§:Boolean;
      
      private var §@!6§:Number;
      
      private var §do package break§:Number = 0;
      
      private var §else set get§:Boolean = false;
      
      public function §native var else§(param1:§1"o§, param2:§-"c§, param3:§null var§)
      {
         this.§&#9§ = new Vector3();
         super();
         var _loc4_:§false catch set§ = param1.§in package default§();
         var _loc5_:§"#g§ = _loc4_.§do catch else§();
         this.turret = _loc4_.§2"F§();
         this.spinUpTime = param2.spinUpTime;
         this.spinDownTime = param2.spinDownTime;
         this.§2x§ = param1.§else catch true§();
         this.sfxData = param3;
         this.§finally override§ = _loc5_.§finally override§;
         this.§,#t§ = _loc5_.§,#t§;
         this.§^!;§ = _loc5_.§^!;§;
         this.§-#q§ = _loc5_.§-#q§;
         this.§&S§ = new §switch get§(this.turret,param3,this.spinUpTime);
         this.§@!6§ = 0;
      }
      
      public function §get catch switch§(param1:Vector3, param2:Boolean) : void
      {
         this.§throw use§ = true;
         this.§default catch return§ = param2;
         this.§&#9§.copy(param1);
         this.§&S§.§9h§(param1,param2);
         if(this.§ #9§ != null)
         {
            this.§ #9§.§get catch switch§(param1,param2);
         }
      }
      
      public function §return const switch§(param1:Boolean) : void
      {
         this.§throw use§ = false;
         this.§&S§.§false final§();
         if(this.§ #9§ != null)
         {
            this.§ #9§.§return const switch§(param1);
         }
      }
      
      public function update(param1:int, param2:Number, param3:Boolean) : void
      {
         this.§finally package get§(param2,param3);
         var _loc4_:* = param2 == 1;
         var _loc5_:Number = param1 / 1000;
         this.§@!6§ += _loc5_;
         if(_loc4_)
         {
            this.§var include§(_loc5_);
         }
         else
         {
            this.§3!=§();
         }
         this.§<#;§(_loc5_,param2);
      }
      
      public function destroy() : void
      {
         this.§throw set default§();
         this.§`"A§();
         this.§&S§.destroy();
         this.§&S§ = null;
         this.§2x§ = null;
         this.turret = null;
         this.sfxData = null;
         this.§finally override§ = null;
         this.§,#t§ = null;
         this.§^!;§ = null;
         this.§-#q§ = null;
      }
      
      private function §finally package get§(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            if(param1 == 1)
            {
               this.§&S§.§7!-§();
               this.§else set get§ = true;
            }
            else
            {
               this.§&S§.§native set null§(this.spinUpTime * param1);
            }
         }
         else if(param1 == 0)
         {
            this.§else set get§ = false;
            this.§&S§.§set const var§();
         }
         else if(this.§else set get§)
         {
            this.§&S§.§include var override§();
         }
         else
         {
            this.§&S§.§true package package§(param1 * this.spinDownTime);
         }
      }
      
      private function §var include§(param1:Number) : void
      {
         this.§1@§();
         this.§const catch return§();
         if(this.§throw use§ && this.§@!6§ >= §native for var§)
         {
            this.§@!6§ = 0;
            this.§implements catch package§();
         }
         this.§do package break§ += param1;
         var _loc2_:Number = this.§do package break§ % §>"S§;
         var _loc3_:int = this.§do package break§ / §>"S§;
         var _loc4_:Number = _loc3_ * §,>§ + §,>§ * this.ease(_loc2_ / §>"S§,POW);
         this.§^!;§.reset();
         this.§-#q§.reset();
         this.§^!;§.rotate(_loc4_ % §,>§);
         this.§-#q§.rotate(-_loc4_ * 0.7);
      }
      
      private function §1@§() : void
      {
         if(this.§ #9§ == null)
         {
            this.§ #9§ = §"!Y§(battleService.§class while§().getObject(§"!Y§));
            this.§ #9§.init(this.turret,this.§2x§,this.sfxData);
            battleService.§7"0§(this.§ #9§);
         }
      }
      
      private function §const catch return§() : void
      {
         var _loc1_:§import use§ = null;
         var _loc2_:§extends super§ = null;
         if(this.§continue var in§ == null)
         {
            _loc1_ = battleService.§class while§();
            this.§continue var in§ = §3!n§(_loc1_.getObject(§3!n§));
            _loc2_ = §extends super§(_loc1_.getObject(§extends super§));
            _loc2_.init(this.turret,this.§2x§);
            this.§continue var in§.init(_loc2_,this.sfxData.§%!u§,this.sfxData.§import for with§);
            battleService.§7"0§(this.§continue var in§);
         }
      }
      
      private function §implements catch package§() : void
      {
         var _loc1_:set = null;
         var _loc2_:§final const else§ = null;
         if(!this.§default catch return§)
         {
            _loc1_ = set(battleService.§class while§().getObject(set));
            _loc1_.init(this.§&#9§,§="A§);
            _loc2_ = §final const else§(battleService.§class while§().getObject(§final const else§));
            _loc2_.init(_loc1_,this.sfxData);
            battleService.§7"0§(_loc2_);
         }
      }
      
      private function ease(param1:Number, param2:Number) : Number
      {
         if(param1 < 0.5)
         {
            param1 *= 2;
            param1 = Math.pow(param1,param2);
            return param1 / 2;
         }
         param1 = 1 - (param1 - 0.5) * 2;
         param1 = Math.pow(param1,param2);
         return (1 - param1) / 2 + 0.5;
      }
      
      private function §3!=§() : void
      {
         this.§return const switch§(false);
         this.§throw set default§();
         this.§`"A§();
         this.§do package break§ = 0;
      }
      
      private function §throw set default§() : void
      {
         if(this.§ #9§ != null)
         {
            this.§ #9§.stop();
            this.§ #9§ = null;
         }
      }
      
      private function §`"A§() : void
      {
         if(this.§continue var in§ != null)
         {
            this.§continue var in§.stop();
            this.§continue var in§ = null;
         }
      }
      
      private function §<#;§(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = §@"&§ * param2;
         if(_loc3_ > §&!"§)
         {
            this.§finally override§.rotate(_loc3_ * param1);
            this.§,#t§.rotate(_loc3_ * param1);
         }
      }
   }
}

