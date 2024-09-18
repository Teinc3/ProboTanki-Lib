package §0#I§
{
   import § !g§.§class for case§;
   import §!!v§.§,Q§;
   import §!!v§.§get for null§;
   import §!!v§.§use catch true§;
   import §#"D§.§7!t§;
   import §%3§.§=x§;
   import §%3§.MessageColor;
   import §%3§.§class const return§;
   import §%3§.§null package super§;
   import §%3§.§switch set for§;
   import §'H§.§const const case§;
   import §'H§.§implements set else§;
   import §3^§.§import var false§;
   import §5""§.§"#_§;
   import §5""§.§-k§;
   import §5""§.§?#K§;
   import §5""§.§`"'§;
   import §5""§.§return package for§;
   import §5""§.§while const for§;
   import §;"?§.§#">§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
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
   import alternativa.tanks.models.battle.battlefield.§true var else§;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.KeyCodes;
   import alternativa.utils.TextureMaterialRegistry;
   import §class catch import§.§use var var§;
   import §false const case§.§##Z§;
   import §false const case§.§implements for implements§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.KeyboardEvent;
   import flash.geom.Matrix;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import §for set super§.§!"N§;
   import §include package null§.§1!0§;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import §switch package return§.§else for override§;
   
   public class §get for default§ extends §?#K§ implements §return package for§, ObjectLoadPostListener, ObjectUnloadListener, §throw package continue§, §true var else§, §break for catch§
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
      public static var §get const true§:ILightingEffectsService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      private static const §5!O§:Class = §catch for static§;
      
      private static const §=">§:BitmapData = Bitmap(new §5!O§()).bitmapData;
      
      public static const §7!D§:Number = 80;
      
      private static const §<n§:int = 128;
      
      private static const §5"t§:int = 256;
      
      private static const §%!n§:uint = KeyCodes.F;
      
      private static const §native for set§:int = 5000;
      
      private static const §`"R§:String = "taken";
      
      private static const §<#R§:String = "lost";
      
      private static const §1"p§:String = "returned";
      
      private static const §5"n§:String = "captured";
      
      private var §each set break§:Boolean;
      
      private var §switch package true§:§&"4§;
      
      private var §%9§:§else for override§;
      
      private var §5!-§:§use catch true§;
      
      private var flags:Vector.<§-"v§>;
      
      private var §true package extends§:Object;
      
      private var §`" §:Object;
      
      private var §try for else§:Object;
      
      private var §[^§:§class const return§;
      
      private var §8,§:Sound;
      
      private var §do for try§:Sound;
      
      private var §final var get§:Sound;
      
      private var §return set while§:Sound;
      
      private var §"&§:§var use§;
      
      private var §implements var§:Dictionary;
      
      private var §@_§:Tank;
      
      private var §try var each§:Vector.<§else package true§>;
      
      private var §3#h§:Vector.<§1!0§>;
      
      private var §do var else§:Vector.<§<E§>;
      
      public function §get for default§()
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
      
      private static function §!<§(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = §@#R§.getMaterial(param1,false);
         _loc2_.resolution = 1000 / param1.width;
         return _loc2_;
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
      
      [Obfuscation(rename="false")]
      public function §`!9§(param1:int, param2:String) : void
      {
         var _loc3_:§-"v§ = this.flags[param1];
         var _loc4_:Tank = this.§implements var§[param2];
         if(this.§@_§ != null && this.§@_§ == _loc4_)
         {
            this.§]">§(_loc3_,param2,_loc4_);
         }
         else
         {
            this.§9!o§(_loc3_,param2,_loc4_);
         }
         if(this.§@_§ != null || battleInfoService.isSpectatorMode())
         {
            this.§^#^§(_loc3_);
            this.§9$$§(§`"R§,_loc4_.§if for with§().id);
            battleService.§&S§.§finally package get§(this.§final var get§);
         }
         this.§switch package true§.§continue catch import§();
      }
      
      private function §]">§(param1:§-"v§, param2:String, param3:Tank) : void
      {
         param1.§continue package else§(param2,param3);
         this.§with package in§(param1,param3);
      }
      
      private function §9!o§(param1:§-"v§, param2:String, param3:Tank) : void
      {
         param1.§final set finally§(param2,param3);
         this.§with package in§(param1,param3);
      }
      
      private function §with package in§(param1:§-"v§, param2:Tank) : void
      {
         if(param2 != null && this.§@_§ != null && !this.§return do§())
         {
            this.§8L§(param2.§0"t§());
         }
      }
      
      [Obfuscation(rename="false")]
      public function §static catch var§(param1:int, param2:§#">§) : void
      {
         var _loc3_:§-"v§ = this.flags[param1];
         this.§null set do§(_loc3_);
         this.§switch package true§.§5"8§();
         this.§if in§(_loc3_);
         _loc3_.§false set import§(new Vector3(param2.x,param2.y,param2.z));
      }
      
      private function §null set do§(param1:§-"v§) : void
      {
         if(param1.§in null§ == null)
         {
            return;
         }
         this.§9$$§(§<#R§,param1.§in null§.§if for with§().id);
         battleService.§&S§.§finally package get§(this.§8,§);
      }
      
      private function §if in§(param1:§-"v§) : void
      {
         if(this.§@_§ == null || param1.§in null§ == null)
         {
            return;
         }
         if(!this.§return do§())
         {
            this.§8L§(null);
         }
         if(param1.§in null§ == this.§@_§)
         {
            if(this.§each set break§)
            {
               this.§each set break§ = false;
               battleService.§'x§().§%#9§(new §&!K§(param1.getId(),this,getTimer() + §native for set§));
            }
         }
         else
         {
            this.§set for include§(param1);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §try const do§(param1:int, param2:String) : void
      {
         this.§7"m§(this.flags[param1]);
         this.§;"z§(param2);
         battleService.§&S§.§finally package get§(this.§do for try§);
      }
      
      private function §7"m§(param1:§-"v§) : void
      {
         this.§each set break§ = false;
         param1.§'#I§();
         if(Boolean(this.§@_§) && Boolean(this.§@_§.teamType))
         {
            if(this.§@_§.§="%§(§class for case§.BLUE))
            {
               this.§8L§(null);
            }
            else
            {
               this.§set for include§(param1);
            }
         }
         this.§switch package true§.§use for case§();
      }
      
      private function §;"z§(param1:String) : void
      {
         if(param1)
         {
            this.§9$$§(§1"p§,param1);
         }
         else
         {
            this.§switch package true§.§@e§(this.§[^§.color,this.§[^§.text);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §!"f§(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:Tank = null;
         var _loc5_:§-"v§ = this.flags[param1];
         this.§7"m§(_loc5_);
         if(this.§@_§ != null || battleInfoService.isSpectatorMode())
         {
            _loc4_ = this.§implements var§[param3];
            if(_loc4_ != null)
            {
               this.§9$$§(§5"n§,_loc4_.§if for with§().id);
               battleService.§&S§.§finally package get§(this.§return set while§);
            }
         }
      }
      
      private function §get const case§(param1:Object) : void
      {
         var _loc2_:§-"v§ = null;
         this.§each set break§ = false;
         for each(_loc2_ in this.flags)
         {
            this.§^#^§(_loc2_);
         }
      }
      
      private function §do const switch§(param1:Object) : void
      {
         var _loc2_:§-"v§ = null;
         var _loc3_:§else package true§ = null;
         for each(_loc2_ in this.flags)
         {
            this.§7"m§(_loc2_);
         }
         for each(_loc3_ in this.§try var each§)
         {
            _loc3_.reset();
         }
      }
      
      private function §8L§(param1:Body) : void
      {
         var _loc2_:§<E§ = null;
         for each(_loc2_ in this.§do var else§)
         {
            _loc2_.§%"W§(param1);
         }
      }
      
      private function §#!H§(param1:§;!?§) : void
      {
         var _loc2_:§1!0§ = null;
         this.§implements var§[param1.tank.§if for with§().id] = param1.tank;
         if(param1.isLocal)
         {
            for each(_loc2_ in this.§3#h§)
            {
               _loc2_.show();
            }
            this.§@_§ = param1.tank;
         }
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         var _loc2_:§-"v§ = null;
         var _loc3_:Body = null;
         var _loc4_:BodyState = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Tank = param1.tank;
         for each(_loc2_ in this.flags)
         {
            if(_loc2_.§in null§ == _loc6_)
            {
               _loc3_ = _loc6_.§0"t§();
               _loc4_ = _loc3_.state;
               _loc5_ = _loc4_.position;
               this.§static catch var§(_loc2_.getId(),§+$%§.§,i§(_loc5_));
            }
         }
         delete this.§implements var§[_loc6_.§if for with§().id];
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         var _loc2_:§-"v§ = null;
         for each(_loc2_ in this.flags)
         {
            if(_loc2_.state == §=x§.CARRIED && _loc2_.§<#K§ == param1.tank.§if for with§().id)
            {
               this.§9!o§(_loc2_,_loc2_.§<#K§,param1.tank);
               this.§^#^§(_loc2_);
            }
         }
      }
      
      private function §use package final§(param1:Object) : void
      {
         var _loc2_:§<E§ = null;
         var _loc3_:§-"v§ = null;
         if(this.§return do§())
         {
            for each(_loc3_ in this.flags)
            {
               if(_loc3_.state != §=x§.CARRIED)
               {
                  this.§set for include§(_loc3_);
               }
            }
         }
         for each(_loc2_ in this.§do var else§)
         {
            _loc2_.§function set in§(this.§@_§.teamType);
         }
      }
      
      private function §>!o§(param1:§use var var§) : void
      {
         var _loc2_:§-"v§ = null;
         if(this.§@_§ != null && this.§@_§ == param1.§%#w§)
         {
            for each(_loc2_ in this.flags)
            {
               this.§^#^§(_loc2_);
            }
         }
      }
      
      private function §9$$§(param1:String, param2:String) : void
      {
         var _loc3_:§class const return§ = this.§["y§(param1);
         this.§-!§(_loc3_,param2);
         this.§switch package true§.§catch catch if§(param2,_loc3_.text,null);
      }
      
      private function §["y§(param1:String) : §class const return§
      {
         if(battleInfoService.isSpectatorMode())
         {
            return this.§try for else§[param1];
         }
         return this.§@_§.teamType == §class for case§.BLUE ? this.§`" §[param1] : this.§true package extends§[param1];
      }
      
      private function §-!§(param1:§class const return§, param2:String) : void
      {
         var _loc3_:String = param2 != null ? param2 : null;
         if(_loc3_)
         {
            this.§switch package true§.§@e§(param1.color,_loc3_ + " " + param1.text);
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _loc1_:§while const for§ = getInitParam().§3!P§;
         this.§8,§ = _loc1_.§8,§.sound;
         this.§do for try§ = _loc1_.§do for try§.sound;
         this.§final var get§ = _loc1_.§final var get§.sound;
         this.§return set while§ = _loc1_.§return set while§.sound;
         this.§implements var§ = new Dictionary();
         this.§try var each§ = new Vector.<§else package true§>();
         this.§try static§();
         this.§5!-§ = §use catch true§(modelRegistry.getModelsByInterface(§use catch true§)[0]);
         this.§switch package true§ = §&"4§(modelRegistry.getModelsByInterface(§&"4§)[0]);
         this.§%9§ = §else for override§(modelRegistry.getModelsByInterface(§else for override§)[0]);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.§"&§.§throw var set§();
         this.§super package try§();
         this.§throw catch super§();
         this.§%#6§();
      }
      
      private function §throw catch super§() : void
      {
         var _loc1_:§-k§ = null;
         this.§3#h§ = new Vector.<§1!0§>(getInitParam().§const var true§.length);
         for each(_loc1_ in getInitParam().§const var true§)
         {
            this.§3#h§[_loc1_.id] = new §1!0§(battleService.§3l§().§super package§(),new Vector3(_loc1_.position.x,_loc1_.position.y,_loc1_.position.z));
            battleService.§3l§().§9"N§(this.§3#h§[_loc1_.id],0);
            if(battleInfoService.isSpectatorMode())
            {
               this.§3#h§[_loc1_.id].show();
            }
         }
      }
      
      private function §try static§() : void
      {
         this.§;!"§();
         this.§get for return§();
         this.§[^§ = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_RED_FLAG_RETURNED),MessageColor.YELLOW);
      }
      
      private function §;!"§() : void
      {
         this.§true package extends§ = {};
         this.§`" § = {};
         this.§while set get§(§`"R§,TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL,true);
         this.§while set get§(§<#R§,TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL,false);
         this.§while set get§(§1"p§,TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL,false);
         this.§while set get§(§5"n§,TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL,true);
      }
      
      private function §while set get§(param1:String, param2:String, param3:Boolean) : void
      {
         this.§true package extends§[param1] = new §class const return§(localeService.getText(param2),param3 ? uint(MessageColor.§finally package for§) : uint(MessageColor.§else catch else§));
         this.§`" §[param1] = new §class const return§(localeService.getText(param2),!param3 ? uint(MessageColor.§finally package for§) : uint(MessageColor.§else catch else§));
      }
      
      private function §get for return§() : void
      {
         this.§try for else§ = {};
         this.§try for else§[§`"R§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL),MessageColor.RED);
         this.§try for else§[§<#R§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL),MessageColor.RED);
         this.§try for else§[§1"p§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL),MessageColor.BLUE);
         this.§try for else§[§5"n§] = new §class const return§(localeService.getText(TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL),MessageColor.RED);
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
         var _loc1_:§-"v§ = null;
         if(battleService.§each set use§() && !§const catch get§.§false set true§() && this.§@_§ != null && !this.§each set break§)
         {
            for each(_loc1_ in this.flags)
            {
               if(_loc1_.§in null§ == this.§@_§)
               {
                  this.§each set break§ = true;
                  this.§"&§.dispatchEvent(§##a§.§const for use§);
                  server.§&"H§();
               }
            }
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
      
      private function §%#6§() : void
      {
         var _loc1_:§`"'§ = null;
         var _loc2_:§-k§ = null;
         var _loc3_:§"#_§ = getInitParam();
         this.flags = new Vector.<§-"v§>(_loc3_.§catch var null§.length);
         for each(_loc1_ in _loc3_.§catch var null§)
         {
            this.§var set do§(§class for case§.BLUE,_loc1_,_loc3_.§default for dynamic§.data,_loc3_.§final do§);
         }
         for each(_loc2_ in _loc3_.§const var true§)
         {
            this.§function const§(_loc3_.§dynamic var use§,_loc2_.position);
            this.§!"+§(_loc2_.position);
         }
      }
      
      private function §!"+§(param1:§#">§) : void
      {
         var _loc2_:BitmapData = getInitParam().§6#k§.data.clone();
         var _loc3_:Matrix = new Matrix();
         _loc3_.tx = (_loc2_.height - §=">§.height) / 2;
         _loc3_.ty = (_loc2_.height - §=">§.height) / 2;
         _loc2_.draw(§=">§,_loc3_);
         var _loc4_:TextureMaterial = §!<§(_loc2_);
         var _loc5_:§for set function§ = new §for set function§(_loc4_,battleService);
         battleService.§3l§().§9"N§(_loc5_,0);
         _loc5_.x = param1.x;
         _loc5_.y = param1.y;
         _loc5_.z = param1.z + §7!t§.§class package get§;
         battleService.§3l§().§with catch with§(_loc5_);
         this.initLight(param1);
      }
      
      private function initLight(param1:§#">§) : void
      {
         var _loc2_:§implements set else§ = §get const true§.§try const include§(§final package import§.CP);
         var _loc3_:§const const case§ = _loc2_.§ #i§(§class for case§.BLUE);
         var _loc4_:OmniLight;
         (_loc4_ = new OmniLight(0,_loc2_.§super const native§(),_loc2_.§with set true§())).color = _loc3_.§#!@§();
         _loc4_.intensity = _loc3_.§"#`§();
         _loc4_.x = param1.x;
         _loc4_.y = param1.y;
         _loc4_.z = param1.z + §7!t§.§class package get§;
         battleService.§3l§().§with catch with§(_loc4_);
      }
      
      private function §var set do§(param1:§class for case§, param2:§`"'§, param3:BitmapData, param4:Tanks3DSResource) : void
      {
         var _loc5_:Vector3 = null;
         if(param3 == null)
         {
            param3 = new BitmapData(§<n§,§5"t§,false,param1 == §class for case§.RED ? uint(11141120) : uint(170));
         }
         var _loc6_:§throw const switch§ = GraphicsUtils.getTextureAnimation(§@#R§,param3,§<n§,param3.height,0,false);
         var _loc7_:Vector3 = new Vector3(param2.§do const do§.x,param2.§do const do§.y,param2.§do const do§.z);
         var _loc8_:§[!r§ = battleService.§3l§();
         var _loc9_:§-"v§ = new §-"v§(param2.id,param1,_loc7_,§<n§,§5"t§,_loc6_,battleService.§'x§().§const const true§(),this);
         _loc9_.addToScene();
         if(param2.§=!u§ != null)
         {
            this.§9!o§(_loc9_,param2.§=!u§,this.§implements var§[param2.§=!u§]);
            this.§switch package true§.§continue catch import§();
         }
         else if(param2.§final for each§ != null)
         {
            (_loc5_ = new Vector3()).x = param2.§final for each§.x;
            _loc5_.y = param2.§final for each§.y;
            _loc5_.z = param2.§final for each§.z;
            _loc9_.§false set import§(_loc5_);
            this.§switch package true§.§use for case§();
         }
         _loc8_.§9"N§(_loc9_,1);
         _loc8_.§,_§.add(_loc9_);
         this.§function const§(param4,param2.§do const do§);
         this.flags[_loc9_.getId()] = _loc9_;
      }
      
      private function §function const§(param1:Tanks3DSResource, param2:§#">§) : void
      {
         var _loc3_:Object3D = §@#g§(param1);
         var _loc4_:Vector3 = §+$%§.§?#T§(param2);
         _loc4_.z -= §7!D§;
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.z = _loc4_.z;
         battleService.§3l§().§with catch with§(_loc3_);
         var _loc5_:§!"N§ = battleService.§'x§().§const const true§();
         var _loc6_:§else package true§ = new §else package true§(_loc4_,this.§%9§.§^J§(),400,this,_loc5_);
         this.§try var each§.push(_loc6_);
         battleService.§'x§().§;!+§(_loc6_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         var _loc1_:§-"v§ = null;
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
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §,#&§() : §##Z§
      {
         var _loc1_:§implements for implements§ = new §implements for implements§();
         this.§do var else§.push(_loc1_);
         return _loc1_;
      }
      
      private function §^#^§(param1:§-"v§) : void
      {
         battleService.§'x§().§final const in§(param1);
      }
      
      private function §set for include§(param1:§-"v§) : void
      {
         if(this.§@_§ != null && this.§@_§.state == §continue var case§.§?!S§ && battleService.§each set use§())
         {
            battleService.§'x§().§;!+§(param1);
         }
      }
      
      private function §return do§() : Boolean
      {
         return this.§@_§.teamType == §class for case§.RED;
      }
      
      public function §%A§() : void
      {
         this.§"&§.dispatchEvent(§##a§.§const for use§);
      }
      
      public function §<"v§() : void
      {
         this.§"&§.dispatchEvent(§##a§.§const for use§);
      }
      
      public function §?$#§() : void
      {
         this.§5!-§.§6#C§(§,Q§.MINE,§get for null§.§super const var§,true);
      }
      
      public function §case package native§() : void
      {
         this.§5!-§.§6#C§(§,Q§.MINE,§get for null§.§super const var§,false);
      }
      
      public function §const set native§(param1:int) : void
      {
         this.§^#^§(this.flags[param1]);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
      }
      
      public function §override package super§(param1:int) : void
      {
         var _loc2_:§-"v§ = this.flags[param1];
         if(_loc2_.state != §=x§.CARRIED)
         {
            this.§set for include§(_loc2_);
         }
      }
      
      public function §const set break§() : §for catch while§
      {
         return §for catch while§.AS;
      }
   }
}

