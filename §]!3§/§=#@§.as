package §]!3§
{
   import § !g§.§class for case§;
   import §!!v§.§,Q§;
   import §!!v§.§get for null§;
   import §!!v§.§use catch true§;
   import §#"D§.§7!t§;
   import §#"D§.§case set extends§;
   import §,#a§.§!"3§;
   import §,#a§.§'"P§;
   import §,#a§.§dynamic catch const§;
   import §,#a§.§each package default§;
   import §3^§.§#"T§;
   import §3^§.§^!1§;
   import §3^§.§import var false§;
   import §8"=§.§null var extends§;
   import §8"=§.§switch package final§;
   import §9p§.§break var finally§;
   import §`"Q§.§0"c§;
   import §`"Q§.§8#$§;
   import §`"Q§.§?"E§;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§else set override§;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.§7o§;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§case for null§;
   import alternativa.tanks.battle.events.§throw each§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.models.battle.battlefield.§for catch while§;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.types.Long;
   import §class catch import§.§use var var§;
   import §false const case§.§##Z§;
   import §false const case§.§package var final§;
   import flash.utils.Dictionary;
   import §import for in§.§override package dynamic§;
   import §native package break§.§do const implements§;
   import §native package break§.§false for final§;
   import §override const package§.§!!5§;
   import §override const package§.§'"]§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class §=#@§ extends §dynamic catch const§ implements §!"3§, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, §throw var each§, §throw package continue§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §1#=§:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private var §do var else§:Vector.<§else set override§>;
      
      private var §switch package true§:§&"4§;
      
      private var §5!-§:§use catch true§;
      
      private var §var break§:Dictionary;
      
      private var §try var each§:Vector.<§in package§>;
      
      private var §"&§:§var use§;
      
      private var §3#h§:§'"]§;
      
      private var §;#x§:§override package dynamic§;
      
      private var §@_§:Tank;
      
      private var § "G§:Dictionary;
      
      private var §false use§:IGameObject;
      
      private var §?!"§:§while catch static§;
      
      private var §+#0§:§?"E§;
      
      private var §use var package§:§0"c§;
      
      private var §3!P§:§false for final§;
      
      public function §=#@§()
      {
         this.§var break§ = new Dictionary();
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§throw each§,this.§do const switch§);
         this.§"&§.§#"<§(§7o§,this.§set return§);
         this.§"&§.§#"<§(§;!?§,this.§#!H§);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§#"<§(§use var var§,this.§>!o§);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
      }
      
      private static function §["a§(param1:IGameObject, param2:Long) : IGameObject
      {
         return param1.space.getObject(param2);
      }
      
      private static function §<#@§(param1:§each package default§) : §class for case§
      {
         if(param1 == §each package default§.RED)
         {
            return §class for case§.RED;
         }
         if(param1 == §each package default§.BLUE)
         {
            return §class for case§.BLUE;
         }
         throw new Error();
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         this.§ "G§[param1.tank.tankData.userName] = param1.tank;
         var _loc2_:int = this.§final catch if§().§="u§(param1.tank.tankData.userName);
         if(_loc2_ >= 0)
         {
            this.§8#E§(_loc2_,param1.tank,this.§+#0§);
         }
      }
      
      private function §4#f§(param1:Class) : Object
      {
         Model.object = this.§false use§;
         var _loc2_:Object = getData(param1);
         Model.popObject();
         return _loc2_;
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         var _loc2_:Tank = param1.tank;
         this.§6#8§().§use var super§(_loc2_);
         delete this.§ "G§[_loc2_];
      }
      
      private function §#!H§(param1:§;!?§) : void
      {
         if(param1.isLocal)
         {
            this.§@_§ = param1.tank;
            this.§3#h§.show();
            this.§;#x§.visible = true;
         }
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         if(param1.tank == this.§@_§)
         {
            this.§@_§ = null;
         }
      }
      
      private function §>!o§(param1:§use var var§) : void
      {
         this.§6#8§().§use var super§(param1.§%#w§);
      }
      
      private function §6#8§() : §0"c§
      {
         return this.§use var package§;
      }
      
      private function §set return§(param1:Object) : void
      {
         var _loc2_:§else set override§ = null;
         var _loc3_:§class for case§ = §7o§(param1).tank.teamType;
         for each(_loc2_ in this.§do var else§)
         {
            _loc2_.§function set in§(_loc3_);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.§false use§ = Model.object;
         this.§switch package true§ = §&"4§(OSGi.getInstance().getService(§&"4§));
         this.§5!-§ = §use catch true§(modelRegistry.getModelsByInterface(§use catch true§)[0]);
         this.§try var each§ = new Vector.<§in package§>();
         this.§ "G§ = new Dictionary();
         this.§"&§.§throw var set§();
         this.§?!"§ = new §while catch static§();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.§super package try§();
         this.§import package null§();
         this.§+#0§ = new §?"E§(§1#=§,getInitParam().resources);
         this.§use var package§ = new §0"c§();
         this.§3!P§ = new §false for final§(battleService.§&S§,getInitParam().§3!P§);
      }
      
      private function §super package try§() : void
      {
         this.§do var else§ = new Vector.<§else set override§>();
         var _loc1_:§^!1§ = new §^!1§();
         battleService.§set package dynamic§(_loc1_);
         this.§do var else§.push(_loc1_);
         var _loc2_:§import var false§ = new §import var false§();
         battleService.§get package each§(_loc2_);
         this.§do var else§.push(_loc2_);
         var _loc3_:§#"T§ = new §#"T§();
         battleService.§@"§(_loc3_);
         this.§do var else§.push(_loc3_);
         var _loc4_:§package var final§ = new §package var final§();
         battleService.§switch set throw§(_loc4_);
         this.§do var else§.push(_loc4_);
      }
      
      private function §import package null§() : void
      {
         var _loc1_:§'"P§ = null;
         var _loc2_:§case set extends§ = null;
         var _loc3_:§in package§ = null;
         var _loc4_:§while catch static§ = null;
         var _loc5_:String = null;
         this.§3#h§ = new §'"]§(battleService.§3l§().§super package§());
         battleService.§3l§().§9"N§(this.§3#h§,0);
         var _loc6_:Vector.<§case set extends§> = new Vector.<§case set extends§>();
         for each(_loc1_ in getInitParam().§-!H§)
         {
            _loc2_ = this.§get package class§(_loc1_);
            this.§var break§[_loc1_.id] = _loc2_;
            battleService.§'x§().§%#9§(_loc2_);
            _loc6_.push(_loc2_);
            _loc3_ = new §in package§(_loc2_.getPosition(),§+$%§.§use final§(getInitParam().§'"K§),§+$%§.§use final§(getInitParam().§8!x§),_loc1_.id,this,battleService.§'x§().§const const true§(),getInitParam().§;%§);
            this.§try var each§.push(_loc3_);
            battleService.§'x§().§;!+§(_loc3_);
            this.§3#h§.§finally var function§(new §!!5§(_loc2_));
            _loc4_ = this.§final catch if§();
            for each(_loc5_ in _loc1_.§import case§)
            {
               _loc4_.add(_loc5_,_loc1_.id);
            }
         }
         this.§;#x§ = new §override package dynamic§(_loc6_);
         this.§;#x§.visible = false;
         §]!W§.§break catch true§().addChild(this.§;#x§);
         battleService.§3l§().§9"N§(this.§;#x§,0);
         this.§switch package true§.§get set final§(this.§;#x§);
         if(battleInfoService.isSpectatorMode())
         {
            this.§3#h§.show();
            this.§;#x§.visible = true;
         }
      }
      
      private function §get package class§(param1:§'"P§) : §case set extends§
      {
         var _loc2_:§7!t§ = new §7!t§(param1.name,battleService.§3l§(),getInitParam().resources);
         var _loc3_:Vector3 = §+$%§.§?#T§(param1.position);
         var _loc4_:§break var finally§ = getInitParam().§3!P§;
         var _loc5_:§do const implements§ = new §do const implements§(battleService,_loc4_.§3;§.sound,_loc4_.§class try§.sound);
         var _loc6_:§case set extends§;
         (_loc6_ = new §case set extends§(param1.id,param1.name,_loc3_,battleService,this,_loc5_,_loc2_)).§include package include§ = param1.§import case§.length;
         _loc6_.§^#d§(param1.state);
         _loc6_.§="j§(param1.score,param1.§while import§);
         return _loc6_;
      }
      
      private function §final catch if§() : §while catch static§
      {
         return this.§?!"§;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.§do var else§ = null;
         battleService.§set package dynamic§(null);
         battleService.§get package each§(null);
         battleService.§@"§(null);
         battleService.§switch set throw§(null);
         this.§"&§.§#!V§();
         this.§;#x§.removeFromParent();
         this.§;#x§ = null;
         this.§ "G§ = null;
      }
      
      [Obfuscation(rename="false")]
      public function §5"0§(param1:int, param2:String) : void
      {
         var _loc3_:§case set extends§ = this.§var break§[param1];
         ++_loc3_.§include package include§;
         var _loc4_:Tank = this.§ "G§[param2];
         if(_loc4_ != null)
         {
            this.§8#E§(param1,_loc4_,this.§+#0§);
         }
         else
         {
            this.§final catch if§().add(param2,param1);
         }
      }
      
      private function §8#E§(param1:int, param2:Tank, param3:§?"E§) : void
      {
         var _loc4_:§8#$§ = §8#$§(battleService.§class while§().getObject(§8#$§));
         var _loc5_:§case set extends§ = this.§var break§[param1];
         var _loc6_:Vector3 = new Vector3();
         _loc5_.readPosition(_loc6_);
         _loc4_.init(param2.§in package default§().§&K§(),_loc6_,param3.§override with§(param2.teamType),battleService.§^#6§());
         this.§6#8§().§each set set§(param2,_loc4_);
      }
      
      [Obfuscation(rename="false")]
      public function §import var class§(param1:int, param2:String) : void
      {
         var _loc3_:§case set extends§ = this.§var break§[param1];
         --_loc3_.§include package include§;
         var _loc4_:Tank = this.§ "G§[param2];
         if(_loc4_ != null)
         {
            this.§6#8§().§use var super§(_loc4_);
         }
         else
         {
            this.§final catch if§().remove(param2);
         }
      }
      
      public function §const set break§() : §for catch while§
      {
         return §for catch while§.§static switch§;
      }
      
      public function §,#&§() : §##Z§
      {
         var _loc1_:§package var final§ = new §package var final§();
         this.§do var else§.push(_loc1_);
         return _loc1_;
      }
      
      [Obfuscation(rename="false")]
      public function §<"L§(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:§case set extends§ = this.§var break§[param1];
         _loc4_.§="j§(param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function §return var each§(param1:int, param2:§each package default§) : void
      {
         var _loc3_:§case set extends§ = this.§var break§[param1];
         var _loc4_:§each package default§ = _loc3_.§^!]§();
         _loc3_.§^#d§(param2);
         if(param2 == §each package default§.NEUTRAL)
         {
            this.§extends for package§(_loc3_,_loc4_);
         }
         else
         {
            this.§native throw§(_loc3_);
         }
      }
      
      private function §extends for package§(param1:§case set extends§, param2:§each package default§) : void
      {
         var _loc3_:§class for case§ = §<#@§(param2);
         var _loc4_:§switch package final§ = this.§#"n§(_loc3_);
         var _loc5_:String = _loc4_.getMessage(param1.getName());
         this.§switch package true§.§@e§(_loc4_.color,_loc5_);
         this.§switch package true§.§2#a§(_loc5_);
         this.§'h§().§for const package§(_loc3_);
      }
      
      private function §#"n§(param1:§class for case§) : §switch package final§
      {
         if(this.§@_§ == null)
         {
            return §null var extends§.§while for while§(param1);
         }
         if(param1 == this.§@_§.teamType)
         {
            return §null var extends§.§else catch use§;
         }
         return §null var extends§.§ "`§;
      }
      
      private function §native throw§(param1:§case set extends§) : void
      {
         var _loc2_:§class for case§ = §<#@§(param1.§^!]§());
         var _loc3_:§switch package final§ = this.§0!=§(_loc2_);
         var _loc4_:String = _loc3_.getMessage(param1.getName());
         this.§switch package true§.§@e§(_loc3_.color,_loc4_);
         this.§switch package true§.§2#a§(_loc4_);
         this.§'h§().§while set else§(_loc2_);
      }
      
      private function §0!=§(param1:§class for case§) : §switch package final§
      {
         if(this.§@_§ == null)
         {
            return §null var extends§.§0!=§(param1);
         }
         if(param1 == this.§@_§.teamType)
         {
            return §null var extends§.§include set in§;
         }
         return §null var extends§.§,"`§;
      }
      
      private function §1W§() : void
      {
         var _loc1_:§case set extends§ = null;
         for each(_loc1_ in this.§var break§)
         {
            _loc1_.reset();
         }
      }
      
      [Obfuscation(rename="false")]
      public function §super const implements§(param1:§class for case§) : void
      {
         this.§'h§().§=!i§(param1);
      }
      
      [Obfuscation(rename="false")]
      public function §'#V§(param1:§class for case§) : void
      {
         this.§'h§().§[W§(param1);
      }
      
      private function §'h§() : §false for final§
      {
         return this.§3!P§;
      }
      
      public function §%A§(param1:int) : void
      {
         this.§"&§.dispatchEvent(§##a§.§const for use§);
      }
      
      public function §<"v§(param1:int) : void
      {
         this.§"&§.dispatchEvent(§##a§.§const for use§);
      }
      
      public function §super set import§(param1:int) : void
      {
         this.§5!-§.§6#C§(§,Q§.MINE,§get for null§.§super const var§,true);
      }
      
      public function §dynamic set else§(param1:int) : void
      {
         this.§5!-§.§6#C§(§,Q§.MINE,§get for null§.§super const var§,false);
      }
      
      private function §do const switch§(param1:Object) : void
      {
         this.reset();
      }
      
      private function reset() : void
      {
         this.§1W§();
         this.§default catch super§();
      }
      
      private function §default catch super§() : void
      {
         var _loc1_:§in package§ = null;
         for each(_loc1_ in this.§try var each§)
         {
            _loc1_.reset();
         }
      }
      
      public function §for var final§(param1:int) : void
      {
         var _loc2_:int = param1;
      }
      
      [Obfuscation(rename="false")]
      public function §null var while§() : void
      {
         this.reset();
      }
   }
}

