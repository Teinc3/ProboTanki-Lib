package §%3§
{
   import § !g§.§class for case§;
   import §!!v§.§,Q§;
   import §!!v§.§get for null§;
   import §!!v§.§use catch true§;
   import §3^§.§import var false§;
   import §9"a§.§each var for§;
   import §9"a§.§extends catch else§;
   import §9"a§.§extends package continue§;
   import §9"a§.§null var package§;
   import §9"a§.§override const implements§;
   import §;"?§.§#">§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§<E§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.§7o§;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw each§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.§for catch while§;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.KeyCodes;
   import alternativa.utils.TextureMaterialRegistry;
   import §class catch import§.§use var var§;
   import §false const case§.§##Z§;
   import §false const case§.§implements for implements§;
   import flash.display.BitmapData;
   import flash.events.KeyboardEvent;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import §for set super§.§!"N§;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import §switch package return§.§else for override§;
   
   public class §super var default§ extends §extends catch else§ implements §null var package§, §?"p§, ObjectLoadPostListener, ObjectUnloadListener, §throw package continue§
   {
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §@#R§:TextureMaterialRegistry;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var §const catch get§:BattleInputService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      public static const §7!D§:Number = 80;
      
      private static const §<n§:int = 128;
      
      private static const §5"t§:int = 256;
      
      private static const §%!n§:uint = KeyCodes.F;
      
      private static const §native for set§:int = 5000;
      
      private static const §`"R§:String = "taken";
      
      private static const §<#R§:String = "lost";
      
      private static const §1"p§:String = "returned";
      
      private static const §5"n§:String = "captured";
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private var §each set break§:Boolean;
      
      private var §switch package true§:§&"4§;
      
      private var §%9§:§else for override§;
      
      private var §5!-§:§use catch true§;
      
      private var flags:Dictionary;
      
      private var §with set break§:Object;
      
      private var §4"a§:Object;
      
      private var §!#?§:Object;
      
      private var §override const do§:String;
      
      private var §in const false§:String;
      
      private var §=#j§:§class const return§;
      
      private var §false var continue§:§class const return§;
      
      private var §8,§:Sound;
      
      private var §do for try§:Sound;
      
      private var §final var get§:Sound;
      
      private var §return set while§:Sound;
      
      private var §"&§:§var use§;
      
      private var §implements var§:Dictionary;
      
      private var §@_§:Tank;
      
      private var §try var each§:Vector.<§0#t§>;
      
      private var §do var else§:Vector.<§<E§>;
      
      public function §super var default§()
      {
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§const var finally§,this.§get const case§);
         this.§"&§.§#"<§(§throw each§,this.§do const switch§);
         this.§"&§.§#"<§(§;!?§,this.§#!H§);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§7o§,this.§use package final§);
         this.§"&§.§#"<§(§use var var§,this.§>!o§);
      }
      
      private static function §@#g§(param1:Tanks3DSResource) : Object3D
      {
         var _loc2_:Mesh = Mesh(param1.objects[0]);
         var _loc3_:BSP = new BSP();
         _loc3_.createTree(_loc2_);
         var _loc4_:BitmapData = param1.getTextureForObject(0);
         if(_loc4_ == null)
         {
            _loc4_ = new StubBitmapData(16776960);
         }
         var _loc5_:TextureMaterial;
         (_loc5_ = §@#R§.getMaterial(_loc4_)).resolution = 1;
         _loc3_.setMaterialToAllFaces(_loc5_);
         return _loc3_;
      }
      
      private static function §get for return§(param1:Object, param2:uint) : void
      {
         param1[§`"R§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL),param2);
         param1[§<#R§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL),param2);
         param1[§1"p§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL),param2);
         param1[§5"n§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL),param2);
      }
      
      private static function §""0§(param1:§class for case§) : §class for case§
      {
         return param1 == §class for case§.BLUE ? §class for case§.RED : §class for case§.BLUE;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §const set break§() : §for catch while§
      {
         return §for catch while§.CTF;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _loc1_:§each var for§ = getInitParam().§3!P§;
         this.§8,§ = _loc1_.§8,§.sound;
         this.§do for try§ = _loc1_.§do for try§.sound;
         this.§final var get§ = _loc1_.§final var get§.sound;
         this.§return set while§ = _loc1_.§return set while§.sound;
         this.§implements var§ = new Dictionary();
         this.§try var each§ = new Vector.<§0#t§>();
         this.§try static§();
         this.§5!-§ = §use catch true§(modelRegistry.getModelsByInterface(§use catch true§)[0]);
         this.§switch package true§ = §&"4§(OSGi.getInstance().getService(§&"4§));
         this.§%9§ = §else for override§(modelRegistry.getModelsByInterface(§else for override§)[0]);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.§"&§.§throw var set§();
         this.§super package try§();
         this.§%#6§();
      }
      
      private function §%#6§() : void
      {
         this.flags = new Dictionary();
         var _loc1_:§extends package continue§ = getInitParam();
         this.§var set do§(§class for case§.RED,_loc1_.§04§,_loc1_.§final set implements§.data,_loc1_.§import for set§);
         this.§var set do§(§class for case§.BLUE,_loc1_.§null const null§,_loc1_.§const var with§.data,_loc1_.§2"D§);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         var _loc1_:§2!$§ = null;
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         for each(_loc1_ in this.flags)
         {
            _loc1_.dispose();
         }
         this.flags = null;
         this.§switch package true§ = null;
         this.§@_§ = null;
         this.§implements var§ = null;
         this.§try var each§ = null;
         this.§"&§.§#!V§();
         this.§do var else§ = null;
         battleService.§set package dynamic§(null);
         battleService.§get package each§(null);
         battleService.§@"§(null);
         battleService.§switch set throw§(null);
      }
      
      [Obfuscation(rename="false")]
      public function §`!9§(param1:String, param2:§class for case§) : void
      {
         var _loc3_:§2!$§ = null;
         var _loc4_:§2!$§ = this.§'"S§(param2);
         var _loc5_:Tank = this.§implements var§[param1];
         if(this.§@_§ != null && this.§@_§ == _loc5_)
         {
            this.§]">§(_loc4_,param1,_loc5_);
         }
         else
         {
            this.§9!o§(_loc4_,param1,_loc5_);
         }
         if(this.§@_§ != null || battleInfoService.isSpectatorMode())
         {
            this.§^#^§(_loc4_);
            if(_loc5_ == this.§@_§ && this.§@_§ != null)
            {
               _loc3_ = this.§'"S§(this.§@_§.teamType);
               if(_loc3_.§in null§ == null)
               {
                  this.§set for include§(_loc3_);
               }
            }
            this.§break const each§(param1,param2);
            battleService.§&S§.§finally package get§(this.§final var get§);
         }
         this.§switch package true§.§while catch class§(param2);
      }
      
      private function §break const each§(param1:String, param2:§class for case§) : void
      {
         var _loc3_:§class const return§ = null;
         var _loc4_:* = false;
         if(battleInfoService.isSpectatorMode())
         {
            _loc3_ = this.§static set§(§`"R§,§""0§(param2));
         }
         else if(this.§@_§.teamType != null)
         {
            _loc4_ = this.§@_§.teamType != param2;
            _loc3_ = this.§each package native§(§`"R§,_loc4_);
         }
         if(_loc3_ != null)
         {
            this.§-!§(_loc3_,param1);
            this.§switch package true§.§catch catch if§(param1,_loc3_.text,null);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §try const do§(param1:§class for case§, param2:String) : void
      {
         this.§7"m§(param1);
         if(battleInfoService.isSpectatorMode())
         {
            this.§'8§(param1,param2);
         }
         else if(Boolean(this.§@_§) && Boolean(this.§@_§.teamType))
         {
            this.§;"z§(param1,param2);
         }
         battleService.§&S§.§finally package get§(this.§do for try§);
      }
      
      private function §'8§(param1:§class for case§, param2:String) : void
      {
         var _loc3_:§class const return§ = null;
         var _loc4_:§class const return§ = null;
         if(param2)
         {
            _loc3_ = this.§static set§(§1"p§,param1);
            this.§-!§(_loc3_,param2);
            this.§switch package true§.§catch catch if§(param2,_loc3_.text,null);
         }
         else
         {
            _loc4_ = param1 == §class for case§.BLUE ? this.§=#j§ : this.§false var continue§;
            this.§switch package true§.§@e§(_loc4_.color,_loc4_.text);
         }
      }
      
      private function §;"z§(param1:§class for case§, param2:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:* = this.§@_§.teamType == param1;
         var _loc5_:§class const return§ = this.§each package native§(§1"p§,_loc4_);
         if(param2)
         {
            this.§-!§(_loc5_,param2);
            this.§switch package true§.§catch catch if§(param2,_loc5_.text,null);
         }
         else
         {
            _loc3_ = _loc4_ ? this.§override const do§ : this.§in const false§;
            this.§switch package true§.§@e§(_loc5_.color,_loc3_);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §static catch var§(param1:§#">§, param2:§class for case§) : void
      {
         var _loc3_:§2!$§ = this.§'"S§(param2);
         this.§+"x§(_loc3_);
         this.§switch package true§.§var const get§(_loc3_.teamType);
         this.§if in§(_loc3_);
         _loc3_.§false set import§(new Vector3(param1.x,param1.y,param1.z));
      }
      
      private function §if in§(param1:§2!$§) : void
      {
         var _loc2_:§2!$§ = null;
         if(this.§@_§ == null)
         {
            return;
         }
         if(param1.§in null§ == null)
         {
            return;
         }
         if(this.§@_§.§="%§(param1.teamType))
         {
            this.§8L§(null);
         }
         if(param1.§in null§ == this.§@_§)
         {
            if(this.§each set break§)
            {
               this.§each set break§ = false;
               battleService.§'x§().§%#9§(new §get set const§(this,getTimer() + §native for set§));
            }
            _loc2_ = this.§%!A§(param1.teamType);
            if(_loc2_.state == §=x§.AT_BASE)
            {
               this.§^#^§(_loc2_);
            }
         }
         else
         {
            this.§set for include§(param1);
         }
      }
      
      private function §+"x§(param1:§2!$§) : void
      {
         if(param1.§in null§ == null)
         {
            return;
         }
         var _loc2_:§class const return§ = this.§each for implements§(param1.teamType);
         if(_loc2_ != null)
         {
            this.§-!§(_loc2_,param1.§in null§.tankData.userName);
            this.§switch package true§.§catch catch if§(param1.§in null§.tankData.userName,_loc2_.text,null);
            battleService.§&S§.§finally package get§(this.§8,§);
         }
      }
      
      private function §each for implements§(param1:§class for case§) : §class const return§
      {
         var _loc2_:Boolean = false;
         if(battleInfoService.isSpectatorMode())
         {
            return this.§static set§(§<#R§,§""0§(param1));
         }
         if(Boolean(this.§@_§) && Boolean(this.§@_§.teamType))
         {
            _loc2_ = this.§@_§.§="%§(param1);
            return this.§each package native§(§<#R§,_loc2_);
         }
         return null;
      }
      
      [Obfuscation(rename="false")]
      public function §!"f§(param1:§class for case§, param2:String) : void
      {
         var _loc3_:Tank = null;
         var _loc4_:§class const return§ = null;
         this.§7"m§(§+$%§.§var for static§(param1));
         if(this.§@_§ != null || battleInfoService.isSpectatorMode())
         {
            _loc3_ = this.§implements var§[param2];
            if(_loc3_ != null)
            {
               if(battleInfoService.isSpectatorMode())
               {
                  _loc4_ = this.§static set§(§5"n§,param1);
               }
               else
               {
                  _loc4_ = this.§each package native§(§5"n§,this.§@_§.teamType == param1);
               }
               this.§-!§(_loc4_,param2);
               this.§switch package true§.§catch catch if§(param2,_loc4_.text,null);
               battleService.§&S§.§finally package get§(this.§return set while§);
            }
         }
      }
      
      public function §?$#§() : void
      {
         this.§5!-§.§6#C§(§,Q§.MINE,§get for null§.§super const var§,true);
      }
      
      public function §case package native§() : void
      {
         this.§5!-§.§6#C§(§,Q§.MINE,§get for null§.§super const var§,false);
      }
      
      public function §const set native§(param1:§2!$§) : void
      {
         this.§^#^§(param1);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
      }
      
      public function §override package super§() : void
      {
         var _loc1_:§2!$§ = this.§%!A§(this.§@_§.teamType);
         if(_loc1_.state != §=x§.CARRIED)
         {
            this.§set for include§(_loc1_);
         }
      }
      
      private function §var set do§(param1:§class for case§, param2:§override const implements§, param3:BitmapData, param4:Tanks3DSResource) : void
      {
         var _loc5_:§2!$§ = null;
         var _loc6_:Vector3 = null;
         if(param3 == null)
         {
            param3 = new BitmapData(§<n§,§5"t§,false,param1 == §class for case§.RED ? uint(11141120) : uint(170));
         }
         var _loc7_:§throw const switch§ = GraphicsUtils.getTextureAnimation(§@#R§,param3,§<n§,param3.height,0,false);
         var _loc8_:Vector3 = new Vector3(param2.§do const do§.x,param2.§do const do§.y,param2.§do const do§.z);
         var _loc9_:§[!r§ = battleService.§3l§();
         _loc5_ = new §2!$§(param1,_loc8_,§<n§,§5"t§,_loc7_,battleService.§'x§().§const const true§(),this);
         this.flags[param1] = _loc5_;
         _loc5_.addToScene();
         if(param2.§=!u§ != null)
         {
            this.§9!o§(_loc5_,param2.§=!u§,this.§implements var§[param2.§=!u§]);
            this.§switch package true§.§while catch class§(param1);
         }
         else if(param2.§final for each§ != null)
         {
            (_loc6_ = new Vector3()).x = param2.§final for each§.x;
            _loc6_.y = param2.§final for each§.y;
            _loc6_.z = param2.§final for each§.z;
            _loc5_.§false set import§(_loc6_);
            this.§switch package true§.§var const get§(param1);
         }
         _loc9_.§9"N§(_loc5_,1);
         _loc9_.§,_§.add(_loc5_);
         this.§function const§(param4,param2);
      }
      
      private function §function const§(param1:Tanks3DSResource, param2:§override const implements§) : void
      {
         var _loc3_:Object3D = §@#g§(param1);
         var _loc4_:Vector3 = §+$%§.§?#T§(param2.§do const do§);
         _loc4_.z -= §7!D§;
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.z = _loc4_.z;
         battleService.§3l§().§with catch with§(_loc3_);
         var _loc5_:§!"N§ = battleService.§'x§().§const const true§();
         var _loc6_:§0#t§ = new §0#t§(_loc4_,this.§%9§.§^J§(),this,_loc5_);
         this.§try var each§.push(_loc6_);
         battleService.§'x§().§;!+§(_loc6_);
      }
      
      private function §7"m§(param1:§class for case§) : void
      {
         var _loc2_:§2!$§ = null;
         this.§each set break§ = false;
         var _loc3_:§2!$§ = this.§'"S§(param1);
         _loc3_.§'#I§();
         if(Boolean(this.§@_§) && Boolean(this.§@_§.teamType))
         {
            if(this.§@_§.§="%§(param1))
            {
               this.§8L§(null);
               _loc2_ = this.§%!A§(param1);
               if(_loc2_.§in null§ == this.§@_§)
               {
                  this.§set for include§(_loc3_);
               }
               else
               {
                  this.§^#^§(_loc3_);
               }
            }
            else
            {
               this.§set for include§(_loc3_);
            }
         }
         this.§switch package true§.§"!#§(param1);
      }
      
      private function §try static§() : void
      {
         this.§with set break§ = {};
         this.§!#?§ = {};
         this.§4"a§ = {};
         this.§3"B§();
         §get for return§(this.§!#?§,MessageColor.BLUE);
         §get for return§(this.§4"a§,MessageColor.RED);
         this.§override const do§ = localeService.getText(TanksLocale.TEXT_CTF_OUR_FLAG_RETURNED);
         this.§in const false§ = localeService.getText(TanksLocale.TEXT_CTF_ENEMY_FLAG_RETURNED);
         this.§=#j§ = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_BLUE_FLAG_RETURNED),MessageColor.BLUE);
         this.§false var continue§ = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_RED_FLAG_RETURNED),MessageColor.RED);
      }
      
      private function §3"B§() : void
      {
         this.§while set get§(§`"R§,TanksLocale.TEXT_CTF_GOT_ENEMY_FLAG,MessageColor.§finally package for§,TanksLocale.TEXT_CTF_GOT_OUR_FLAG,MessageColor.§else catch else§);
         this.§while set get§(§<#R§,TanksLocale.TEXT_CTF_LOST_OUR_FLAG,MessageColor.§finally package for§,TanksLocale.TEXT_CTF_LOST_ENEMY_FLAG,MessageColor.§else catch else§);
         this.§while set get§(§1"p§,TanksLocale.TEXT_CTF_RETURNED_OUR_FLAG,MessageColor.§finally package for§,TanksLocale.TEXT_CTF_RETURNED_ENEMY_FLAG,MessageColor.§else catch else§);
         this.§while set get§(§5"n§,TanksLocale.TEXT_CTF_CAPTURED_ENEMY_FLAG,MessageColor.§finally package for§,TanksLocale.TEXT_CTF_CAPTURED_OUR_FLAG,MessageColor.§else catch else§);
      }
      
      private function §while set get§(param1:String, param2:String, param3:uint, param4:String, param5:uint) : void
      {
         var _loc6_:§class const return§ = new §class const return§(localeService.getText(param2),param3);
         var _loc7_:§class const return§ = new §class const return§(localeService.getText(param4),param5);
         this.§with set break§[param1] = new §while for continue§(_loc6_,_loc7_);
      }
      
      private function §each package native§(param1:String, param2:Boolean) : §class const return§
      {
         var _loc3_:§while for continue§ = this.§with set break§[param1];
         return param2 ? _loc3_.positive : _loc3_.negative;
      }
      
      private function §static set§(param1:String, param2:§class for case§) : §class const return§
      {
         var _loc3_:Object = param2 == §class for case§.BLUE ? this.§!#?§ : this.§4"a§;
         return _loc3_[param1];
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:§&7§ = §5!$§.§&!<§(param1.keyCode);
         switch(_loc2_)
         {
            case §&7§.DROP_FLAG:
               this.§6#5§();
         }
      }
      
      private function §6#5§() : void
      {
         var _loc1_:§2!$§ = null;
         if(battleService.§each set use§() && !§const catch get§.§false set true§() && this.§@_§ != null && !this.§each set break§)
         {
            _loc1_ = this.§%!A§(this.§@_§.teamType);
            if(_loc1_.§in null§ == this.§@_§)
            {
               this.§each set break§ = true;
               this.§"&§.dispatchEvent(§##a§.§const for use§);
               server.§&"H§(this.§@_§);
            }
         }
      }
      
      private function §-!§(param1:§class const return§, param2:String) : void
      {
         var _loc3_:String = param2 != null ? userInfoService.§include for package§(param2) : null;
         if(_loc3_)
         {
            this.§switch package true§.§@e§(param1.color,_loc3_ + " " + param1.text);
         }
      }
      
      private function §#!H§(param1:§;!?§) : void
      {
         this.§implements var§[param1.tank.tankData.userName] = param1.tank;
         if(param1.isLocal)
         {
            this.§@_§ = param1.tank;
         }
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         var _loc2_:Body = null;
         var _loc3_:BodyState = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Tank = param1.tank;
         var _loc6_:§2!$§ = this.§%!A§(_loc5_.teamType);
         if(_loc6_.§in null§ == _loc5_)
         {
            _loc2_ = _loc5_.§0"t§();
            _loc3_ = _loc2_.state;
            _loc4_ = _loc3_.position;
            this.§static catch var§(§+$%§.§,i§(_loc4_),_loc6_.teamType);
         }
         delete this.§implements var§[_loc5_.tankData.userName];
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         var _loc2_:§2!$§ = null;
         for each(_loc2_ in this.flags)
         {
            if(_loc2_.state == §=x§.CARRIED && _loc2_.§<#K§ == param1.tank.tankData.userName)
            {
               this.§9!o§(_loc2_,_loc2_.§<#K§,param1.tank);
               this.§^#^§(_loc2_);
               break;
            }
         }
      }
      
      private function §use package final§(param1:Object) : void
      {
         var _loc2_:§<E§ = null;
         var _loc3_:§2!$§ = this.§'"S§(this.§@_§.teamType);
         if(_loc3_.state == §=x§.DROPPED)
         {
            this.§set for include§(_loc3_);
         }
         var _loc4_:§2!$§ = this.§%!A§(this.§@_§.teamType);
         if(_loc4_.state != §=x§.CARRIED)
         {
            this.§set for include§(_loc4_);
         }
         for each(_loc2_ in this.§do var else§)
         {
            _loc2_.§function set in§(this.§@_§.teamType);
         }
      }
      
      private function §>!o§(param1:§use var var§) : void
      {
         var _loc2_:§2!$§ = null;
         if(this.§@_§ != null && this.§@_§ == param1.§%#w§)
         {
            for each(_loc2_ in this.flags)
            {
               this.§^#^§(_loc2_);
            }
         }
      }
      
      private function §do const switch§(param1:Object) : void
      {
         var _loc2_:§0#t§ = null;
         this.§7"m§(§class for case§.BLUE);
         this.§7"m§(§class for case§.RED);
         for each(_loc2_ in this.§try var each§)
         {
            _loc2_.reset();
         }
      }
      
      private function §get const case§(param1:Object) : void
      {
         var _loc2_:§2!$§ = null;
         this.§each set break§ = false;
         for each(_loc2_ in this.flags)
         {
            this.§^#^§(_loc2_);
         }
      }
      
      private function §set for include§(param1:§2!$§) : void
      {
         if(this.§@_§ != null && this.§@_§.state == §continue var case§.§?!S§ && battleService.§each set use§())
         {
            battleService.§'x§().§;!+§(param1);
         }
      }
      
      private function §^#^§(param1:§2!$§) : void
      {
         battleService.§'x§().§final const in§(param1);
      }
      
      private function §]">§(param1:§2!$§, param2:String, param3:Tank) : void
      {
         param1.§continue package else§(param2,param3);
         this.§with package in§(param1,param3);
      }
      
      private function §9!o§(param1:§2!$§, param2:String, param3:Tank) : void
      {
         param1.§final set finally§(param2,param3);
         this.§with package in§(param1,param3);
      }
      
      private function §with package in§(param1:§2!$§, param2:Tank) : void
      {
         if(param2 != null && this.§@_§ != null && this.§@_§.§="%§(param1.teamType))
         {
            this.§8L§(param2.§0"t§());
         }
      }
      
      private function §super package try§() : void
      {
         this.§do var else§ = new Vector.<§<E§>();
         var _loc1_:§null package super§ = new §null package super§();
         battleService.§set package dynamic§(_loc1_);
         this.§do var else§.push(_loc1_);
         var _loc2_:§import var false§ = new §import var false§();
         battleService.§get package each§(_loc2_);
         this.§do var else§.push(_loc2_);
         var _loc3_:§switch set for§ = new §switch set for§();
         battleService.§@"§(_loc3_);
         this.§do var else§.push(_loc3_);
         var _loc4_:§implements for implements§ = new §implements for implements§();
         battleService.§switch set throw§(_loc4_);
         this.§do var else§.push(_loc4_);
      }
      
      private function §8L§(param1:Body) : void
      {
         var _loc2_:§<E§ = null;
         for each(_loc2_ in this.§do var else§)
         {
            _loc2_.§%"W§(param1);
         }
      }
      
      private function §'"S§(param1:§class for case§) : §2!$§
      {
         return this.flags[param1];
      }
      
      private function §%!A§(param1:§class for case§) : §2!$§
      {
         return this.flags[§+$%§.§var for static§(param1)];
      }
      
      public function §,#&§() : §##Z§
      {
         var _loc1_:§implements for implements§ = new §implements for implements§();
         this.§do var else§.push(_loc1_);
         return _loc1_;
      }
   }
}

