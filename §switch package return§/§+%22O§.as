package §switch package return§
{
   import § !g§.§class for case§;
   import §7"j§.§!"_§;
   import §7"j§.§<"z§;
   import §7"j§.§do set case§;
   import §7"j§.§implements for break§;
   import §7"j§.§include finally§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import §;"?§.§#">§;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.models.weapon.§%"J§;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.utils.TextureMaterialRegistry;
   import §catch set default§.§"#,§;
   import §catch set default§.§%2§;
   import §catch set default§.§[w§;
   import §extends for const§.§import use§;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import §for set super§.§super const continue§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class §+"O§ extends §[w§ implements §"#,§, ObjectLoadListener, ObjectUnloadListener, IDumper, §throw package continue§, §2##§, §else for override§
   {
      [Inject]
      public static var §false for package§:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §"#-§:IDumpService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const §8!H§:Number = 0.5;
      
      private static const §get each§:Number = 0.772;
      
      private static const §else set use§:Number = 0.5;
      
      private static const §`W§:Number = 0.9;
      
      private static const §for set implements§:Number = 3;
      
      private static const §2#z§:Number = 3;
      
      private static const §5#g§:Number = 0.3;
      
      private static const §case package switch§:Number = 200;
      
      private static const §import var in§:Vector3 = new Vector3();
      
      private var §in set§:§package var break§;
      
      private var §native package false§:Dictionary;
      
      private var §9"C§:Dictionary;
      
      private var §override const break§:Number;
      
      private var §9Y§:Vector.<§%2§>;
      
      private var §switch package finally§:TextureMaterial;
      
      private var §return native§:TextureMaterial;
      
      private var §#!G§:TextureMaterial;
      
      private var §class package set§:TextureMaterial;
      
      private var §3#Q§:Mesh;
      
      private var §]#%§:§throw const switch§;
      
      private var § !A§:§8#b§;
      
      private var §?#M§:§throw const switch§;
      
      private var §[e§:§8#b§;
      
      private var §4!8§:TextureMaterial;
      
      private var §>!Q§:Sound;
      
      private var explosionSound:Sound;
      
      private var §static catch if§:Sound;
      
      private var impactForce:Number;
      
      private var §const extends§:IGameObject;
      
      private var §"&§:§var use§;
      
      private var §implements var§:Dictionary;
      
      private var §@_§:Tank;
      
      private var §7"7§:Number;
      
      private var §+#Q§:§include finally§;
      
      public function §+"O§()
      {
         this.§in set§ = new §package var break§();
         this.§native package false§ = new Dictionary();
         this.§9"C§ = new Dictionary();
         this.§ !A§ = new §8#b§();
         this.§[e§ = new §8#b§();
         this.§implements var§ = new Dictionary();
         super();
         §try package static§.§ !v§();
         this.§use package const§();
      }
      
      private static function §extends set set§(param1:Vector3, param2:§throw const switch§, param3:§8#b§, param4:Number, param5:Number) : void
      {
         var _loc6_:int = 50;
         var _loc7_:§import use§ = battleService.§class while§();
         var _loc8_:set = set(_loc7_.getObject(set));
         _loc8_.init(param1,_loc6_);
         var _loc9_:§<"z§ = §<"z§(_loc7_.getObject(§<"z§));
         _loc9_.init(param3.width,param3.height,param2,0,_loc8_,param4,param5);
         battleService.§3l§().§7"0§(_loc9_);
      }
      
      private static function §"#D§(param1:Sound, param2:Vector3, param3:Number) : void
      {
         var _loc4_:§implements for break§ = null;
         if(param1 != null)
         {
            _loc4_ = §implements for break§.create(param1,param3);
            battleService.§'x§().§'M§().§each set set§(§do set case§.create(param2,_loc4_,0));
         }
      }
      
      private static function §false set while§(param1:MultiframeImageResource, param2:int, param3:§8#b§) : §throw const switch§
      {
         var _loc4_:§throw const switch§ = GraphicsUtils.getTextureAnimationFromResource(§false for package§,param1);
         _loc4_.material.resolution = param2;
         param3.height = param1.frameHeight * param2;
         param3.width = param1.frameWidth * param2;
         return _loc4_;
      }
      
      private static function §^#q§(param1:ImageResource) : TextureMaterial
      {
         return §false for package§.getMaterial(param1.data);
      }
      
      private function §use package const§() : void
      {
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§const var finally§,this.§get const case§);
         this.§"&§.§#"<§(§;!?§,this.§#!H§);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§throw var set§();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §^J§() : Number
      {
         return this.§7"7§;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.§const extends§ = object;
         §"#-§.registerDumper(this);
         this.§in set§.§+#?§ = 100;
         this.§in set§.§""%§ = 300;
         this.§in set§.§each override§ = 204;
         this.§in set§.§4@§ = §+$%§.§use final§(getInitParam().§1!Y§);
         this.§in set§.§?"A§ = §+$%§.§use final§(getInitParam().§try var try§);
         this.§override const break§ = §+$%§.§use final§(getInitParam().radius);
         this.impactForce = getInitParam().impactForce;
         this.§>!Q§ = getInitParam().§1R§.sound;
         this.explosionSound = getInitParam().explosionSound.sound;
         this.§static catch if§ = getInitParam().§implements for function§.sound;
         this.§7"7§ = §+$%§.§use final§(getInitParam().§7"7§);
         this.§-J§(Tanks3DSResource(getInitParam().§`"&§));
         this.§]#%§ = §false set while§(getInitParam().§,!u§,§for set implements§,this.§ !A§);
         this.§?#M§ = §false set while§(getInitParam().§8!q§,§2#z§,this.§[e§);
         this.§4!8§ = §^#q§(getInitParam().explosionMarkTexture);
         this.§switch package finally§ = §^#q§(getInitParam().§const set use§);
         this.§return native§ = §^#q§(getInitParam().§continue const include§);
         this.§#!G§ = §^#q§(getInitParam().§break var var§);
         this.§class package set§ = §^#q§(getInitParam().§get for for§);
         this.§+#Q§ = §!"_§.§var var use§;
         this.§]"=§(getInitParam().§4"[§);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         §"#-§.unregisterDumper(this.dumperName);
         this.§const for continue§();
         this.§>!Q§ = null;
         this.§]#%§ = null;
         this.§?#M§ = null;
         this.§switch package finally§ = null;
         this.§return native§ = null;
         this.§#!G§ = null;
         this.§class package set§ = null;
         this.§const extends§ = null;
         this.§@_§ = null;
         this.§4!8§ = null;
         this.§implements var§ = new Dictionary();
      }
      
      private function §]"=§(param1:Vector.<§%2§>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.length != 0)
         {
            if(this.§9Y§ == null)
            {
               this.§9Y§ = new Vector.<§%2§>();
            }
            _loc2_ = int(param1.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.§9Y§.push(param1[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §=8§(param1:String, param2:Number, param3:Number, param4:Number, param5:String) : void
      {
         var _loc6_:Tank = this.§implements var§[param5];
         if(_loc6_ == null)
         {
            if(this.§9Y§ == null)
            {
               this.§9Y§ = new Vector.<§%2§>();
            }
            this.§9Y§.push(new §%2§(false,param1,param5,new §#">§(param2,param3,param4)));
         }
         else
         {
            this.§^"U§(param1,this.§override const break§,new Vector3(param2,param3,param4),param5,_loc6_.teamType,this.§-!g§(_loc6_),false);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §in import§(param1:String) : void
      {
         var _loc2_:§%2§ = null;
         var _loc3_:§super catch use§ = this.§9"C§[param1];
         if(_loc3_ != null)
         {
            _loc3_.§return set if§();
            §"#D§(this.§>!Q§,_loc3_.position,§5#g§);
         }
         else
         {
            for each(_loc2_ in this.§9Y§)
            {
               if(_loc2_.mineId == param1)
               {
                  _loc2_.activated = true;
                  return;
               }
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §static set package§(param1:String) : void
      {
         var _loc2_:§super catch use§ = null;
         var _loc3_:§super catch use§ = null;
         var _loc4_:§>!K§ = this.§native package false§[param1];
         if(_loc4_ != null)
         {
            _loc2_ = _loc4_.head;
            while(_loc2_ != null)
            {
               _loc3_ = _loc2_;
               _loc2_ = _loc2_.next;
               §extends set set§(_loc3_.position,this.§?#M§,this.§[e§,§else set use§,§`W§);
               §"#D§(this.§static catch if§,_loc3_.position,0.1);
               this.§default package use§(_loc3_,_loc4_);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §9!M§(param1:String, param2:String) : void
      {
         var _loc3_:§>!K§ = null;
         var _loc4_:Tank = null;
         var _loc5_:§super catch use§ = this.§9"C§[param1];
         if(_loc5_ != null)
         {
            _loc3_ = this.§native package false§[_loc5_.ownerId];
            if(_loc3_ != null)
            {
               §extends set set§(_loc5_.position,this.§]#%§,this.§ !A§,§8!H§,§get each§);
               this.§do var dynamic§(_loc5_.position,this.§+#Q§);
               this.§function set static§(_loc5_);
               §"#D§(this.explosionSound,_loc5_.position,0.5);
               _loc4_ = this.§implements var§[param2];
               if(_loc4_ != null)
               {
                  _loc4_.§case extends§(_loc5_.position,_loc5_.§var var§,§%"J§.§^"j§.getNumber() * this.impactForce);
               }
               this.§default package use§(_loc5_,_loc3_);
            }
         }
      }
      
      private function §do var dynamic§(param1:Vector3, param2:§include finally§) : void
      {
         var _loc3_:set = set(battleService.§class while§().getObject(set));
         var _loc4_:§while var if§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         _loc3_.init(param1,50);
         _loc4_.init(_loc3_,param2);
         battleService.§7"0§(_loc4_);
      }
      
      private function §function set static§(param1:§super catch use§) : void
      {
         §import var in§.copy(param1.position);
         §import var in§.addScaled(100,param1.§var var§);
         battleService.§3l§().addDecal(param1.position,§import var in§,§case package switch§,this.§4!8§);
      }
      
      [Obfuscation(rename="false")]
      public function dump(param1:Array) : String
      {
         var _loc2_:§super catch use§ = null;
         var _loc3_:* = "=== Mines ===\n";
         if(this.§9Y§ != null)
         {
            _loc3_ += "Deferred:\n" + this.§9Y§.join("\n") + "\n";
         }
         _loc3_ += "On field:\n";
         for each(_loc2_ in this.§9"C§)
         {
            _loc3_ += _loc2_ + "\n";
         }
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function get dumperName() : String
      {
         return "mines";
      }
      
      public function §try const throw§(param1:§super catch use§) : void
      {
         battleEventDispatcher.dispatchEvent(§##a§.§const for use§);
      }
      
      private function §^"U§(param1:String, param2:Number, param3:Vector3, param4:String, param5:§class for case§, param6:Material, param7:Boolean) : void
      {
         var _loc8_:§>!K§ = null;
         var _loc9_:§super catch use§ = null;
         var _loc10_:RayHit = new RayHit();
         if(battleService.§'x§().§const const true§().raycastStatic(param3,Vector3.DOWN,§super const continue§.§finally catch while§,10000000000,null,_loc10_))
         {
            _loc8_ = this.§native package false§[param4];
            if(_loc8_ == null)
            {
               _loc8_ = new §>!K§();
               this.§native package false§[param4] = _loc8_;
            }
            _loc9_ = §super catch use§.create(param1,param4,param2,this.§3#Q§,param6,param5,this.§in set§,this);
            _loc9_.setPosition(_loc10_.position,_loc10_.normal);
            if(param7)
            {
               _loc9_.§return set if§();
            }
            _loc8_.§^"U§(_loc9_);
            this.§9"C§[param1] = _loc9_;
            _loc9_.§const const while§();
         }
      }
      
      private function §const for continue§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:§super catch use§ = null;
         var _loc3_:§>!K§ = null;
         for(_loc1_ in this.§9"C§)
         {
            _loc2_ = this.§9"C§[_loc1_];
            _loc2_.§+c§();
            delete this.§9"C§[_loc1_];
         }
         for(_loc1_ in this.§native package false§)
         {
            _loc3_ = this.§native package false§[_loc1_];
            _loc3_.§do var throw§();
            delete this.§native package false§[_loc1_];
         }
         this.§9Y§ = null;
      }
      
      private function §-J§(param1:Tanks3DSResource) : void
      {
         this.§3#Q§ = Mesh(param1.objects[0]);
         if(this.§3#Q§.sorting != Sorting.AVERAGE_Z)
         {
            this.§3#Q§.sorting = Sorting.AVERAGE_Z;
            this.§3#Q§.calculateFacesNormals(true);
         }
      }
      
      private function §default package use§(param1:§super catch use§, param2:§>!K§) : void
      {
         delete this.§9"C§[param1.id];
         param1.§+c§();
         param2.§default package use§(param1);
      }
      
      private function §-!g§(param1:Tank) : Material
      {
         switch(param1.teamType)
         {
            case §class for case§.NONE:
               return param1 == this.§@_§ ? this.§#!G§ : this.§class package set§;
            case §class for case§.BLUE:
               return this.§return native§;
            case §class for case§.RED:
               return this.§switch package finally§;
            default:
               return this.§class package set§;
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
         delete this.§implements var§[param1.tank.tankData.userName];
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         if(param1.tank == this.§@_§)
         {
            this.§0#p§();
         }
         else
         {
            this.§use set in§(param1.tank);
         }
      }
      
      private function §0#p§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:§%2§ = null;
         var _loc3_:Tank = null;
         var _loc4_:Vector3 = null;
         if(this.§9Y§ != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.§9Y§.length)
            {
               _loc2_ = this.§9Y§[_loc1_];
               _loc3_ = this.§implements var§[_loc2_.ownerId];
               if(_loc3_ != null)
               {
                  this.§9Y§.splice(_loc1_,1);
                  _loc1_--;
                  _loc4_ = §+$%§.§?#T§(_loc2_.position);
                  this.§^"U§(_loc2_.mineId,this.§override const break§,_loc4_,_loc2_.ownerId,_loc3_.teamType,this.§-!g§(_loc3_),_loc2_.activated);
               }
               _loc1_++;
            }
         }
      }
      
      private function §use set in§(param1:Tank) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§%2§ = null;
         var _loc4_:Vector3 = null;
         if(this.§9Y§ != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.§9Y§.length)
            {
               _loc3_ = this.§9Y§[_loc2_];
               if(_loc3_.ownerId == param1.tankData.userName)
               {
                  this.§9Y§.splice(_loc2_,1);
                  _loc2_--;
                  _loc4_ = §+$%§.§?#T§(_loc3_.position);
                  this.§^"U§(_loc3_.mineId,this.§override const break§,_loc4_,_loc3_.ownerId,param1.teamType,this.§-!g§(param1),_loc3_.activated);
               }
               _loc2_++;
            }
         }
      }
      
      [Obfuscation(rename="false")]
      private function §get const case§(param1:§const var finally§) : void
      {
         this.§const for continue§();
      }
   }
}

