package §if set import§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.§class package try§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.shared.§ "4§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import flash.utils.getTimer;
   
   public class §"K§ extends §else package false§ implements §4"3§, §;!t§, §class package try§
   {
      private static const §else const if§:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const §9!2§:Number = 0.3;
      
      private static const §=#W§:§ !8§ = new § !8§();
      
      private static const §in set catch§:Vector.<Body> = new Vector.<Body>();
      
      private static const §use package§:Vector.<Number> = new Vector.<Number>();
      
      private static const targetHitPoints:Vector.<Vector3> = new Vector.<Vector3>();
      
      private var energyCapacity:EncryptedNumber;
      
      private var §]#J§:EncryptedNumber;
      
      private var energyRechargeSpeed:EncryptedNumber;
      
      private var tickInterval:EncryptedInt;
      
      private var §in set implements§:§ "4§;
      
      private var controller:§6#L§;
      
      private var callback:§static set case§;
      
      private var effects:§3"3§;
      
      private var §try do§:§1"o§;
      
      private var §if set implements§:EncryptedInt;
      
      private var enabled:Boolean;
      
      private var §,#P§:Boolean;
      
      private var §finally catch var§:Boolean;
      
      private var §null catch use§:EncryptedInt;
      
      private var §get catch true§:EncryptedInt;
      
      public function §"K§(param1:Number, param2:Number, param3:Number, param4:int, param5:§ "4§, param6:§6#L§, param7:§static set case§, param8:§3"3§)
      {
         this.energyCapacity = new EncryptedNumberImpl();
         this.§]#J§ = new EncryptedNumberImpl();
         this.energyRechargeSpeed = new EncryptedNumberImpl();
         this.tickInterval = new EncryptedIntImpl();
         this.§if set implements§ = new EncryptedIntImpl();
         this.§null catch use§ = new EncryptedIntImpl();
         this.§get catch true§ = new EncryptedIntImpl();
         super();
         this.energyCapacity.setNumber(param1);
         this.§]#J§.setNumber(param2);
         this.energyRechargeSpeed.setNumber(param3);
         this.tickInterval.setInt(param4);
         this.§in set implements§ = param5;
         this.controller = param6;
         this.callback = param7;
         this.effects = param8;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.controller.init();
         this.controller.setWeapon(this);
      }
      
      public function destroy() : void
      {
         this.§in set implements§ = null;
         this.effects = null;
         this.callback = null;
         this.controller.destroy();
         this.controller = null;
         this.§try do§ = null;
      }
      
      public function activate() : void
      {
         §'x§().§%#9§(this);
      }
      
      public function deactivate() : void
      {
         this.disable(false);
         §'x§().§%"7§(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.§,#P§ = this.controller.§override for var§();
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.stop(§'x§().§]"d§(),param1);
         }
      }
      
      public function reset() : void
      {
         this.§finally catch var§ = false;
         this.§,#P§ = false;
         this.§null catch use§.setInt(0);
         this.§if set implements§.setInt(0);
         this.§get catch true§.setInt(0);
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = NaN;
         if(this.§,#P§)
         {
            _loc1_ = this.§31§(getTimer());
         }
         else
         {
            _loc1_ = this.§import for true§(getTimer());
         }
         return _loc1_ / this.energyCapacity.getNumber();
      }
      
      public function §;>§() : void
      {
         if(this.enabled)
         {
            this.§,#P§ = true;
         }
      }
      
      public function §#w§() : void
      {
         this.§,#P§ = false;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(this.enabled)
         {
            if(this.§finally catch var§)
            {
               this.§continue set do§(param1);
            }
            else
            {
               this.§switch catch false§(param1);
            }
         }
      }
      
      private function §continue set do§(param1:int) : void
      {
         if(this.§,#P§)
         {
            this.§for package default§(param1);
            this.§const for implements§(param1);
         }
         else
         {
            this.stop(param1,true);
         }
      }
      
      private function §for package default§(param1:int) : void
      {
         if(this.§get catch true§.getInt() > 0)
         {
            if(this.§if set implements§.getInt() <= param1)
            {
               this.tick(param1);
               this.§get catch true§.setInt(this.§get catch true§.getInt() - 1);
            }
         }
      }
      
      private function §const for implements§(param1:int) : void
      {
         if(this.§get catch true§.getInt() == 0)
         {
            if(this.§31§(param1) <= 0)
            {
               this.stop(param1,true);
            }
         }
      }
      
      private function §switch catch false§(param1:int) : void
      {
         if(this.§,#P§)
         {
            this.start(param1);
         }
      }
      
      private function start(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(!this.§finally catch var§)
         {
            this.§finally catch var§ = true;
            _loc2_ = this.§import for true§(param1);
            this.§null catch use§.setInt(this.§final set function§(param1,_loc2_));
            this.§set const continue§(_loc2_);
            this.§if set implements§.setInt(param1 + this.tickInterval.getInt());
            this.effects.§else package while§(this.§try do§.§0"t§(),this.§try do§.§else catch true§(),this.§try do§.§2"F§());
            this.callback.start(param1);
         }
      }
      
      private function §set const continue§(param1:Number) : void
      {
         this.§get catch true§.setInt(§else const if§.getInt() * param1 / (this.§]#J§.getNumber() * this.tickInterval.getInt()));
      }
      
      private function stop(param1:int, param2:Boolean) : void
      {
         if(this.§finally catch var§)
         {
            this.§,#P§ = false;
            this.§finally catch var§ = false;
            this.§null catch use§.setInt(param1 - this.§31§(param1) / this.energyRechargeSpeed.getNumber() * §else const if§.getInt());
            this.§get catch true§.setInt(0);
            this.effects.§while set use§();
            if(param2)
            {
               this.callback.stop(param1);
            }
         }
      }
      
      private function tick(param1:int) : void
      {
         var _loc2_:Body = null;
         this.§if set implements§.setInt(param1 + this.tickInterval.getInt());
         var _loc3_:Vector3 = this.§try do§.§else catch true§();
         this.§try do§.§get var switch§(§=#W§);
         var _loc4_:Number = _loc3_.y;
         §in set catch§.length = 0;
         §use package§.length = 0;
         targetHitPoints.length = 0;
         this.§in set implements§.§else const implements§(this.§try do§.§0"t§(),_loc4_,§9!2§,§=#W§.§if package var§,§=#W§.direction,§=#W§.§false var try§,§in set catch§,§use package§,targetHitPoints);
         var _loc5_:int = int(§in set catch§.length);
         if(_loc5_ > 0)
         {
            this.callback.onTick(this,§in set catch§,§use package§,targetHitPoints,param1);
         }
         var _loc6_:int = 0;
         while(_loc6_ < §in set catch§.length)
         {
            _loc2_ = §in set catch§[_loc6_];
            _loc2_.tank.§final set const§(targetHitPoints[_loc6_]);
            _loc6_++;
         }
         §in set catch§.length = 0;
         §use package§.length = 0;
         targetHitPoints.length = 0;
      }
      
      private function §import for true§(param1:int) : Number
      {
         var _loc2_:Number = this.energyCapacity.getNumber();
         var _loc3_:Number = this.energyRechargeSpeed.getNumber() * (param1 - this.§null catch use§.getInt()) / §else const if§.getInt();
         return _loc3_ > _loc2_ ? Number(_loc2_) : Number(_loc3_);
      }
      
      private function §31§(param1:int) : Number
      {
         var _loc2_:Number = this.energyCapacity.getNumber() - this.§]#J§.getNumber() * (param1 - this.§null catch use§.getInt()) / §else const if§.getInt();
         return _loc2_ < 0 ? Number(0) : Number(_loc2_);
      }
      
      private function §final set function§(param1:int, param2:Number) : int
      {
         return param1 - (this.energyCapacity.getNumber() - param2) / this.§]#J§.getNumber() * §else const if§.getInt();
      }
   }
}

