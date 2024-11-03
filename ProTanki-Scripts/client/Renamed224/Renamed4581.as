package Renamed224
{
   import Renamed136.Renamed663;
   import Renamed142.Renamed1626;
   import Renamed142.Renamed2740;
   import Renamed142.Renamed2741;
   import Renamed4553.Renamed4554;
   import Renamed17.Renamed5410;
   import Renamed17.MessageColor;
   import Renamed17.Renamed5425;
   import Renamed17.Renamed5427;
   import Renamed17.Renamed5510;
   import Renamed199.Renamed3823;
   import Renamed199.Renamed3820;
   import Renamed29.Renamed5432;
   import Renamed4594.Renamed6339;
   import Renamed4594.Renamed6340;
   import Renamed4594.Renamed6341;
   import Renamed4594.Renamed6342;
   import Renamed4594.Renamed4595;
   import Renamed4594.Renamed6343;
   import Renamed602.3DPositionVector;
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
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed659;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.Renamed885;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed901;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.engine3d.Renamed843;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import alternativa.tanks.models.battle.battlefield.Renamed2524;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.KeyCodes;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed329.Renamed2761;
   import Renamed63.Renamed617;
   import Renamed63.Renamed5437;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.KeyboardEvent;
   import flash.geom.Matrix;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import Renamed373.Renamed665;
   import Renamed399.Renamed4700;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import Renamed87.Renamed4711;
   
   public class Renamed4581 extends Renamed6341 implements Renamed4595, ObjectLoadPostListener, ObjectUnloadListener, Renamed511, Renamed2524, Renamed4580
   {
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed1368:TextureMaterialRegistry;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var Renamed2384:BattleInputService;
      
      [Inject]
      public static var Renamed4730:ILightingEffectsService;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      private static const Renamed6344:Class = Renamed6329;
      
      private static const Renamed6345:BitmapData = Bitmap(new Renamed6344()).bitmapData;
      
      public static const Renamed5438:Number = 80;
      
      private static const Renamed5439:int = 128;
      
      private static const Renamed5440:int = 256;
      
      private static const Renamed5441:uint = KeyCodes.F;
      
      private static const Renamed5442:int = 5000;
      
      private static const Renamed5443:String = "taken";
      
      private static const Renamed5444:String = "lost";
      
      private static const Renamed5445:String = "returned";
      
      private static const Renamed5446:String = "captured";
      
      private var Renamed5447:Boolean;
      
      private var Renamed5448:Renamed2553;
      
      private var Renamed114:Renamed4711;
      
      private var Renamed2798:Renamed2741;
      
      private var flags:Vector.<Renamed4578>;
      
      private var Renamed6346:Object;
      
      private var Renamed6347:Object;
      
      private var Renamed6348:Object;
      
      private var Renamed6349:Renamed5425;
      
      private var Renamed5456:Sound;
      
      private var Renamed5457:Sound;
      
      private var Renamed5458:Sound;
      
      private var Renamed5459:Sound;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed5460:Dictionary;
      
      private var Renamed3014:Tank;
      
      private var Renamed5461:Vector.<Renamed6330>;
      
      private var Renamed6350:Vector.<Renamed4700>;
      
      private var Renamed5462:Vector.<Renamed659>;
      
      public function Renamed4581()
      {
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed894,this.Renamed2830);
         this.Renamed2432.Renamed904(Renamed901,this.Renamed2831);
         this.Renamed2432.Renamed904(Renamed889,this.Renamed5463);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed885,this.Renamed5464);
         this.Renamed2432.Renamed904(Renamed2761,this.Renamed5465);
      }
      
      private static function Renamed5105(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = Renamed1368.getMaterial(param1,false);
         _loc2_.resolution = 1000 / param1.width;
         return _loc2_;
      }
      
      private static function Renamed5098(param1:Tanks3DSResource) : Object3D
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
         (_loc5_ = Renamed1368.getMaterial(_loc4_)).resolution = 1;
         _loc3_.setMaterialToAllFaces(_loc5_);
         return _loc3_;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5478(param1:int, param2:String) : void
      {
         var _loc3_:Renamed4578 = this.flags[param1];
         var _loc4_:Tank = this.Renamed5460[param2];
         if(this.Renamed3014 != null && this.Renamed3014 == _loc4_)
         {
            this.Renamed5480(_loc3_,param2,_loc4_);
         }
         else
         {
            this.Renamed5481(_loc3_,param2,_loc4_);
         }
         if(this.Renamed3014 != null || battleInfoService.isSpectatorMode())
         {
            this.Renamed5482(_loc3_);
            this.Renamed6351(Renamed5443,_loc4_.Renamed695().id);
            battleService.Renamed633.Renamed2316(this.Renamed5458);
         }
         this.Renamed5448.Renamed2559();
      }
      
      private function Renamed5480(param1:Renamed4578, param2:String, param3:Tank) : void
      {
         param1.Renamed5419(param2,param3);
         this.Renamed5509(param1,param3);
      }
      
      private function Renamed5481(param1:Renamed4578, param2:String, param3:Tank) : void
      {
         param1.Renamed5421(param2,param3);
         this.Renamed5509(param1,param3);
      }
      
      private function Renamed5509(param1:Renamed4578, param2:Tank) : void
      {
         if(param2 != null && this.Renamed3014 != null && !this.Renamed6352())
         {
            this.Renamed5495(param2.Renamed696());
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5492(param1:int, param2:3DPositionVector) : void
      {
         var _loc3_:Renamed4578 = this.flags[param1];
         this.Renamed6353(_loc3_);
         this.Renamed5448.Renamed2560();
         this.Renamed5494(_loc3_);
         _loc3_.Renamed5423(new Vector3(param2.x,param2.y,param2.z));
      }
      
      private function Renamed6353(param1:Renamed4578) : void
      {
         if(param1.Renamed5417 == null)
         {
            return;
         }
         this.Renamed6351(Renamed5444,param1.Renamed5417.Renamed695().id);
         battleService.Renamed633.Renamed2316(this.Renamed5456);
      }
      
      private function Renamed5494(param1:Renamed4578) : void
      {
         if(this.Renamed3014 == null || param1.Renamed5417 == null)
         {
            return;
         }
         if(!this.Renamed6352())
         {
            this.Renamed5495(null);
         }
         if(param1.Renamed5417 == this.Renamed3014)
         {
            if(this.Renamed5447)
            {
               this.Renamed5447 = false;
               battleService.Renamed619().Renamed815(new Renamed4577(param1.getId(),this,getTimer() + Renamed5442));
            }
         }
         else
         {
            this.Renamed5483(param1);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5488(param1:int, param2:String) : void
      {
         this.Renamed5489(this.flags[param1]);
         this.Renamed5491(param2);
         battleService.Renamed633.Renamed2316(this.Renamed5457);
      }
      
      private function Renamed5489(param1:Renamed4578) : void
      {
         this.Renamed5447 = false;
         param1.Renamed5422();
         if(Boolean(this.Renamed3014) && Boolean(this.Renamed3014.teamType))
         {
            if(this.Renamed3014.Renamed1017(Renamed663.BLUE))
            {
               this.Renamed5495(null);
            }
            else
            {
               this.Renamed5483(param1);
            }
         }
         this.Renamed5448.Renamed2558();
      }
      
      private function Renamed5491(param1:String) : void
      {
         if(param1)
         {
            this.Renamed6351(Renamed5445,param1);
         }
         else
         {
            this.Renamed5448.Renamed2561(this.Renamed6349.color,this.Renamed6349.text);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5498(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:Tank = null;
         var _loc5_:Renamed4578 = this.flags[param1];
         this.Renamed5489(_loc5_);
         if(this.Renamed3014 != null || battleInfoService.isSpectatorMode())
         {
            _loc4_ = this.Renamed5460[param3];
            if(_loc4_ != null)
            {
               this.Renamed6351(Renamed5446,_loc4_.Renamed695().id);
               battleService.Renamed633.Renamed2316(this.Renamed5459);
            }
         }
      }
      
      private function Renamed2830(param1:Object) : void
      {
         var _loc2_:Renamed4578 = null;
         this.Renamed5447 = false;
         for each(_loc2_ in this.flags)
         {
            this.Renamed5482(_loc2_);
         }
      }
      
      private function Renamed2831(param1:Object) : void
      {
         var _loc2_:Renamed4578 = null;
         var _loc3_:Renamed6330 = null;
         for each(_loc2_ in this.flags)
         {
            this.Renamed5489(_loc2_);
         }
         for each(_loc3_ in this.Renamed5461)
         {
            _loc3_.reset();
         }
      }
      
      private function Renamed5495(param1:Body) : void
      {
         var _loc2_:Renamed659 = null;
         for each(_loc2_ in this.Renamed5462)
         {
            _loc2_.Renamed661(param1);
         }
      }
      
      private function Renamed5463(param1:Renamed889) : void
      {
         var _loc2_:Renamed4700 = null;
         this.Renamed5460[param1.tank.Renamed695().id] = param1.tank;
         if(param1.isLocal)
         {
            for each(_loc2_ in this.Renamed6350)
            {
               _loc2_.show();
            }
            this.Renamed3014 = param1.tank;
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         var _loc2_:Renamed4578 = null;
         var _loc3_:Body = null;
         var _loc4_:BodyState = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Tank = param1.tank;
         for each(_loc2_ in this.flags)
         {
            if(_loc2_.Renamed5417 == _loc6_)
            {
               _loc3_ = _loc6_.Renamed696();
               _loc4_ = _loc3_.state;
               _loc5_ = _loc4_.position;
               this.Renamed5492(_loc2_.getId(),Renamed668.Renamed677(_loc5_));
            }
         }
         delete this.Renamed5460[_loc6_.Renamed695().id];
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         var _loc2_:Renamed4578 = null;
         for each(_loc2_ in this.flags)
         {
            if(_loc2_.state == Renamed5410.CARRIED && _loc2_.Renamed5418 == param1.tank.Renamed695().id)
            {
               this.Renamed5481(_loc2_,_loc2_.Renamed5418,param1.tank);
               this.Renamed5482(_loc2_);
            }
         }
      }
      
      private function Renamed5464(param1:Object) : void
      {
         var _loc2_:Renamed659 = null;
         var _loc3_:Renamed4578 = null;
         if(this.Renamed6352())
         {
            for each(_loc3_ in this.flags)
            {
               if(_loc3_.state != Renamed5410.CARRIED)
               {
                  this.Renamed5483(_loc3_);
               }
            }
         }
         for each(_loc2_ in this.Renamed5462)
         {
            _loc2_.Renamed833(this.Renamed3014.teamType);
         }
      }
      
      private function Renamed5465(param1:Renamed2761) : void
      {
         var _loc2_:Renamed4578 = null;
         if(this.Renamed3014 != null && this.Renamed3014 == param1.Renamed5508)
         {
            for each(_loc2_ in this.flags)
            {
               this.Renamed5482(_loc2_);
            }
         }
      }
      
      private function Renamed6351(param1:String, param2:String) : void
      {
         var _loc3_:Renamed5425 = this.Renamed6354(param1);
         this.Renamed5487(_loc3_,param2);
         this.Renamed5448.Renamed2554(param2,_loc3_.text,null);
      }
      
      private function Renamed6354(param1:String) : Renamed5425
      {
         if(battleInfoService.isSpectatorMode())
         {
            return this.Renamed6348[param1];
         }
         return this.Renamed3014.teamType == Renamed663.BLUE ? this.Renamed6347[param1] : this.Renamed6346[param1];
      }
      
      private function Renamed5487(param1:Renamed5425, param2:String) : void
      {
         var _loc3_:String = param2 != null ? param2 : null;
         if(_loc3_)
         {
            this.Renamed5448.Renamed2561(param1.color,_loc3_ + " " + param1.text);
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _loc1_:Renamed6343 = getInitParam().Renamed974;
         this.Renamed5456 = _loc1_.Renamed5456.sound;
         this.Renamed5457 = _loc1_.Renamed5457.sound;
         this.Renamed5458 = _loc1_.Renamed5458.sound;
         this.Renamed5459 = _loc1_.Renamed5459.sound;
         this.Renamed5460 = new Dictionary();
         this.Renamed5461 = new Vector.<Renamed6330>();
         this.Renamed5468();
         this.Renamed2798 = Renamed2741(modelRegistry.getModelsByInterface(Renamed2741)[0]);
         this.Renamed5448 = Renamed2553(modelRegistry.getModelsByInterface(Renamed2553)[0]);
         this.Renamed114 = Renamed4711(modelRegistry.getModelsByInterface(Renamed4711)[0]);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.Renamed2432.Renamed905();
         this.Renamed5469();
         this.Renamed6355();
         this.Renamed5470();
      }
      
      private function Renamed6355() : void
      {
         var _loc1_:Renamed6340 = null;
         this.Renamed6350 = new Vector.<Renamed4700>(getInitParam().Renamed6356.length);
         for each(_loc1_ in getInitParam().Renamed6356)
         {
            this.Renamed6350[_loc1_.id] = new Renamed4700(battleService.Renamed621().Renamed739(),new Vector3(_loc1_.position.x,_loc1_.position.y,_loc1_.position.z));
            battleService.Renamed621().Renamed1287(this.Renamed6350[_loc1_.id],0);
            if(battleInfoService.isSpectatorMode())
            {
               this.Renamed6350[_loc1_.id].show();
            }
         }
      }
      
      private function Renamed5468() : void
      {
         this.Renamed6357();
         this.Renamed5466();
         this.Renamed6349 = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_RED_FLAG_RETURNED),MessageColor.YELLOW);
      }
      
      private function Renamed6357() : void
      {
         this.Renamed6346 = {};
         this.Renamed6347 = {};
         this.Renamed5504(Renamed5443,TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL,true);
         this.Renamed5504(Renamed5444,TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL,false);
         this.Renamed5504(Renamed5445,TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL,false);
         this.Renamed5504(Renamed5446,TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL,true);
      }
      
      private function Renamed5504(param1:String, param2:String, param3:Boolean) : void
      {
         this.Renamed6346[param1] = new Renamed5425(localeService.getText(param2),param3 ? uint(MessageColor.Renamed5388) : uint(MessageColor.Renamed5389));
         this.Renamed6347[param1] = new Renamed5425(localeService.getText(param2),!param3 ? uint(MessageColor.Renamed5388) : uint(MessageColor.Renamed5389));
      }
      
      private function Renamed5466() : void
      {
         this.Renamed6348 = {};
         this.Renamed6348[Renamed5443] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL),MessageColor.RED);
         this.Renamed6348[Renamed5444] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL),MessageColor.RED);
         this.Renamed6348[Renamed5445] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL),MessageColor.BLUE);
         this.Renamed6348[Renamed5446] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL),MessageColor.RED);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Renamed717 = Renamed719.Renamed729(param1.keyCode);
         switch(_loc2_)
         {
            case Renamed717.DROP_FLAG:
               this.Renamed5506();
         }
      }
      
      private function Renamed5506() : void
      {
         var _loc1_:Renamed4578 = null;
         if(battleService.Renamed646() && !Renamed2384.Renamed728() && this.Renamed3014 != null && !this.Renamed5447)
         {
            for each(_loc1_ in this.flags)
            {
               if(_loc1_.Renamed5417 == this.Renamed3014)
               {
                  this.Renamed5447 = true;
                  this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
                  server.Renamed5507();
               }
            }
         }
      }
      
      private function Renamed5469() : void
      {
         this.Renamed5462 = new Vector.<Renamed659>();
         var _loc1_:Renamed5427 = new Renamed5427();
         battleService.Renamed625(_loc1_);
         this.Renamed5462.push(_loc1_);
         var _loc2_:Renamed5432 = new Renamed5432();
         battleService.Renamed628(_loc2_);
         this.Renamed5462.push(_loc2_);
         var _loc3_:Renamed5510 = new Renamed5510();
         battleService.Renamed630(_loc3_);
         this.Renamed5462.push(_loc3_);
         var _loc4_:Renamed5437 = new Renamed5437();
         battleService.Renamed650(_loc4_);
         this.Renamed5462.push(_loc4_);
      }
      
      private function Renamed5470() : void
      {
         var _loc1_:Renamed6342 = null;
         var _loc2_:Renamed6340 = null;
         var _loc3_:Renamed6339 = getInitParam();
         this.flags = new Vector.<Renamed4578>(_loc3_.Renamed6358.length);
         for each(_loc1_ in _loc3_.Renamed6358)
         {
            this.Renamed5471(Renamed663.BLUE,_loc1_,_loc3_.Renamed6359.data,_loc3_.Renamed6360);
         }
         for each(_loc2_ in _loc3_.Renamed6356)
         {
            this.Renamed5501(_loc3_.Renamed6361,_loc2_.position);
            this.Renamed6362(_loc2_.position);
         }
      }
      
      private function Renamed6362(param1:3DPositionVector) : void
      {
         var _loc2_:BitmapData = getInitParam().Renamed6363.data.clone();
         var _loc3_:Matrix = new Matrix();
         _loc3_.tx = (_loc2_.height - Renamed6345.height) / 2;
         _loc3_.ty = (_loc2_.height - Renamed6345.height) / 2;
         _loc2_.draw(Renamed6345,_loc3_);
         var _loc4_:TextureMaterial = Renamed5105(_loc2_);
         var _loc5_:Renamed6338 = new Renamed6338(_loc4_,battleService);
         battleService.Renamed621().Renamed1287(_loc5_,0);
         _loc5_.x = param1.x;
         _loc5_.y = param1.y;
         _loc5_.z = param1.z + Renamed4554.Renamed5086;
         battleService.Renamed621().addObjToAbsPacket(_loc5_);
         this.initLight(param1);
      }
      
      private function initLight(param1:3DPositionVector) : void
      {
         var _loc2_:Renamed3820 = Renamed4730.Renamed3822(Renamed1587.CP);
         var _loc3_:Renamed3823 = _loc2_.Renamed5102(Renamed663.BLUE);
         var _loc4_:OmniLight;
         (_loc4_ = new OmniLight(0,_loc2_.Renamed5111(),_loc2_.Renamed5112())).color = _loc3_.Renamed772();
         _loc4_.intensity = _loc3_.Renamed5124();
         _loc4_.x = param1.x;
         _loc4_.y = param1.y;
         _loc4_.z = param1.z + Renamed4554.Renamed5086;
         battleService.Renamed621().addObjToAbsPacket(_loc4_);
      }
      
      private function Renamed5471(param1:Renamed663, param2:Renamed6342, param3:BitmapData, param4:Tanks3DSResource) : void
      {
         var _loc5_:Vector3 = null;
         if(param3 == null)
         {
            param3 = new BitmapData(Renamed5439,Renamed5440,false,param1 == Renamed663.RED ? uint(11141120) : uint(170));
         }
         var _loc6_:Renamed843 = GraphicsUtils.getTextureAnimation(Renamed1368,param3,Renamed5439,param3.height,0,false);
         var _loc7_:Vector3 = new Vector3(param2.Renamed5499.x,param2.Renamed5499.y,param2.Renamed5499.z);
         var _loc8_:Renamed610 = battleService.Renamed621();
         var _loc9_:Renamed4578 = new Renamed4578(param2.id,param1,_loc7_,Renamed5439,Renamed5440,_loc6_,battleService.Renamed619().Renamed692(),this);
         _loc9_.addToScene();
         if(param2.Renamed5500 != null)
         {
            this.Renamed5481(_loc9_,param2.Renamed5500,this.Renamed5460[param2.Renamed5500]);
            this.Renamed5448.Renamed2559();
         }
         else if(param2.Renamed5406 != null)
         {
            (_loc5_ = new Vector3()).x = param2.Renamed5406.x;
            _loc5_.y = param2.Renamed5406.y;
            _loc5_.z = param2.Renamed5406.z;
            _loc9_.Renamed5423(_loc5_);
            this.Renamed5448.Renamed2558();
         }
         _loc8_.Renamed1287(_loc9_,1);
         _loc8_.Renamed1377.add(_loc9_);
         this.Renamed5501(param4,param2.Renamed5499);
         this.flags[_loc9_.getId()] = _loc9_;
      }
      
      private function Renamed5501(param1:Tanks3DSResource, param2:3DPositionVector) : void
      {
         var _loc3_:Object3D = Renamed5098(param1);
         var _loc4_:Vector3 = Renamed668.Renamed681(param2);
         _loc4_.z -= Renamed5438;
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.z = _loc4_.z;
         battleService.Renamed621().addObjToAbsPacket(_loc3_);
         var _loc5_:Renamed665 = battleService.Renamed619().Renamed692();
         var _loc6_:Renamed6330 = new Renamed6330(_loc4_,this.Renamed114.Renamed5502(),400,this,_loc5_);
         this.Renamed5461.push(_loc6_);
         battleService.Renamed619().Renamed803(_loc6_);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         var _loc1_:Renamed4578 = null;
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         for each(_loc1_ in this.flags)
         {
            _loc1_.dispose();
         }
         this.flags = null;
         this.Renamed5448 = null;
         this.Renamed3014 = null;
         this.Renamed5460 = null;
         this.Renamed5461 = null;
         this.Renamed2432.Renamed906();
         this.Renamed5462 = null;
         battleService.Renamed625(null);
         battleService.Renamed628(null);
         battleService.Renamed630(null);
         battleService.Renamed650(null);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed649() : Renamed617
      {
         var _loc1_:Renamed5437 = new Renamed5437();
         this.Renamed5462.push(_loc1_);
         return _loc1_;
      }
      
      private function Renamed5482(param1:Renamed4578) : void
      {
         battleService.Renamed619().Renamed805(param1);
      }
      
      private function Renamed5483(param1:Renamed4578) : void
      {
         if(this.Renamed3014 != null && this.Renamed3014.state == Renamed841.Renamed854 && battleService.Renamed646())
         {
            battleService.Renamed619().Renamed803(param1);
         }
      }
      
      private function Renamed6352() : Boolean
      {
         return this.Renamed3014.teamType == Renamed663.RED;
      }
      
      public function Renamed6326() : void
      {
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
      }
      
      public function Renamed6327() : void
      {
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
      }
      
      public function Renamed5393() : void
      {
         this.Renamed2798.Renamed2941(Renamed1626.MINE,Renamed2740.Renamed2942,true);
      }
      
      public function Renamed5394() : void
      {
         this.Renamed2798.Renamed2941(Renamed1626.MINE,Renamed2740.Renamed2942,false);
      }
      
      public function Renamed5395(param1:int) : void
      {
         this.Renamed5482(this.flags[param1]);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
      }
      
      public function Renamed5396(param1:int) : void
      {
         var _loc2_:Renamed4578 = this.flags[param1];
         if(_loc2_.state != Renamed5410.CARRIED)
         {
            this.Renamed5483(_loc2_);
         }
      }
      
      public function Renamed2525() : Renamed2395
      {
         return Renamed2395.AS;
      }
   }
}

