package §false const case§
{
   import §4z§.§'"3§;
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.getTimer;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   import §use var final§.§implements each§;
   
   public class §,y§ extends §else package false§ implements §4"3§, §;!t§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static var shotId:int;
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private static const §package const throw§:§ !8§ = new § !8§();
      
      private var §in const case§:Number;
      
      private var §>";§:Number;
      
      private var §;!E§:int;
      
      private var §>#e§:int;
      
      private var §try do§:§1"o§;
      
      private var controller:§6#L§;
      
      private var §in set implements§:§3"8§;
      
      private var §native const for§:int;
      
      private var effects:§catch const null§;
      
      private var §-D§:§null catch const§;
      
      private var callback:§throw native§;
      
      private var enabled:Boolean;
      
      private var §5#b§:§implements each§;
      
      public function §,y§(param1:ClientObject, param2:§implements each§, param3:§ #K§, param4:§throw native§)
      {
         this.controller = new §6#L§();
         super();
         var _loc5_:§ #K§ = param3;
         var _loc6_:§extends for final§ = new §extends for final§(param1);
         var _loc7_:§throw native§ = param4;
         this.§5#b§ = param2;
         this.§in const case§ = _loc6_.§extends catch with§().§get package set§();
         this.§>";§ = param2.energyRechargeSpeed / 1000;
         var _loc8_:§return for while§ = WeaponsManager.shotDatas[_loc6_.§get package break§().turret.id];
         this.§in set implements§ = §while switch§(_loc8_,param2,_loc6_);
         this.§native const for§ = _loc6_.§package var false§();
         this.effects = _loc5_.§function package extends§(param1);
         this.§-D§ = new §null catch const§(_loc6_,param2,_loc5_.§if var set§(param1),_loc7_);
         this.callback = _loc7_;
      }
      
      private static function §while switch§(param1:§return for while§, param2:§implements each§, param3:§extends for final§) : §3"8§
      {
         var _loc4_:§catch do§ = param3.§use package dynamic§();
         var _loc5_:Number = param1.§2!H§();
         var _loc6_:int = Math.ceil(_loc5_ * §'"3§.§7A§(_loc4_.§package finally§()));
         var _loc7_:Number = param1.§static var return§();
         var _loc8_:int = Math.ceil(_loc7_ * §'"3§.§7A§(_loc4_.§package finally§()));
         var _loc9_:Number = param2.shotDistance;
         var _loc10_:§!"N§ = battleService.§'x§().§const const true§();
         return new §3"8§(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,battleService.§,#&§(),param2.maxRicochetCount);
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.§5#b§ = null;
         this.effects = null;
         this.callback = null;
         this.§in set implements§ = null;
         this.controller.destroy();
      }
      
      public function activate() : void
      {
         §'x§().§%#9§(this);
      }
      
      public function deactivate() : void
      {
         §'x§().§%"7§(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.controller.§with const function§();
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.§>#e§ = 0;
         this.§;!E§ = 0;
         this.controller.§with const function§();
      }
      
      public function getStatus() : Number
      {
         return this.§6#r§(getTimer()) / this.§5#b§.energyCapacity;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(this.enabled)
         {
            if(this.controller.§-"'§() && param1 >= this.§;!E§)
            {
               _loc3_ = this.§6#r§(param1);
               if(_loc3_ >= this.§5#b§.energyPerShot)
               {
                  this.§'!V§(param1,_loc3_);
               }
            }
         }
         this.controller.§with const function§();
      }
      
      private function §'!V§(param1:int, param2:Number) : void
      {
         this.§;!E§ = param1 + this.§native const for§;
         this.§break const finally§(param1,param2 - this.§5#b§.energyPerShot);
         this.§try do§.§get var switch§(§package const throw§);
         this.§try do§.§6v§();
         this.§-^§(§package const throw§.§6u§,§package const throw§.direction,-this.§in const case§);
         this.effects.§ #'§(this.§try do§.§2"F§(),this.§try do§.§else catch true§(),§package const throw§.§6u§);
         this.effects.§class set each§(this.§try do§.§2"F§(),this.§try do§.§else catch true§());
         if(§+$%§.§override var include§(this.§try do§.§0"t§(),§package const throw§))
         {
            this.§while var dynamic§(param1,§package const throw§);
         }
         else
         {
            this.§ "q§(param1);
         }
      }
      
      private function §-^§(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.§try do§.§0"t§().addWorldForceScaled(param1,param2,param3);
      }
      
      private function §while var dynamic§(param1:int, param2:§ !8§) : void
      {
         if(this.§0c§(param2.§if package var§,param2.direction,this.§try do§.§do const false§()))
         {
            shotDirection.copy(param2.direction);
         }
         else
         {
            this.§in set implements§.§continue var break§(param2.§6u§,param2.direction,param2.§false var try§,this.§try do§.§0"t§(),shotDirection);
         }
         this.§8!u§(param1,param2,shotDirection);
      }
      
      private function § "q§(param1:int) : void
      {
         this.callback.§`#Q§(param1);
      }
      
      private function §0c§(param1:Vector3, param2:Vector3, param3:Number) : Boolean
      {
         return §'x§().§const const true§().raycastStatic(param1,param2,§super const continue§.§finally catch while§,param3,null,§extends const default§);
      }
      
      private function §6#r§(param1:int) : Number
      {
         return MathUtils.clamp(this.§>";§ * (param1 - this.§>#e§),0,this.§5#b§.energyCapacity);
      }
      
      private function §break const finally§(param1:int, param2:Number) : void
      {
         this.§>#e§ = param1 - param2 / this.§>";§;
      }
      
      private function §8!u§(param1:int, param2:§ !8§, param3:Vector3) : void
      {
         var _loc4_:§&!_§ = this.§-D§.§import catch do§();
         _loc4_.§const const while§(param2,param3,this.§try do§.§0"t§(),++shotId);
         this.callback.§-!<§(param1,_loc4_.§function final§(),param3);
      }
   }
}

