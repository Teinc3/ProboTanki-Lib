package Renamed17
{
   import Renamed136.Renamed663;
   import Renamed142.Renamed1626;
   import Renamed142.Renamed2740;
   import Renamed142.Renamed2741;
   import Renamed29.Renamed5432;
   import Renamed4611.Renamed5433;
   import Renamed4611.Renamed5434;
   import Renamed4611.Renamed5435;
   import Renamed4611.Renamed4612;
   import Renamed4611.Renamed5436;
   import Renamed602.Renamed603;
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
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.KeyCodes;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed329.Renamed2761;
   import Renamed63.Renamed617;
   import Renamed63.Renamed5437;
   import flash.display.BitmapData;
   import flash.events.KeyboardEvent;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import Renamed373.Renamed665;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import Renamed87.Renamed4711;
   
   public class Renamed18 extends Renamed5434 implements Renamed4612, Renamed4557, ObjectLoadPostListener, ObjectUnloadListener, Renamed511
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
      public static var Renamed719:KeysBindingService;
      
      public static const Renamed5438:Number = 80;
      
      private static const Renamed5439:int = 128;
      
      private static const Renamed5440:int = 256;
      
      private static const Renamed5441:uint = KeyCodes.F;
      
      private static const Renamed5442:int = 5000;
      
      private static const Renamed5443:String = "taken";
      
      private static const Renamed5444:String = "lost";
      
      private static const Renamed5445:String = "returned";
      
      private static const Renamed5446:String = "captured";
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private var Renamed5447:Boolean;
      
      private var Renamed5448:Renamed2553;
      
      private var Renamed114:Renamed4711;
      
      private var Renamed2798:Renamed2741;
      
      private var flags:Dictionary;
      
      private var Renamed5449:Object;
      
      private var Renamed5450:Object;
      
      private var Renamed5451:Object;
      
      private var Renamed5452:String;
      
      private var Renamed5453:String;
      
      private var Renamed5454:Renamed5425;
      
      private var Renamed5455:Renamed5425;
      
      private var Renamed5456:Sound;
      
      private var Renamed5457:Sound;
      
      private var Renamed5458:Sound;
      
      private var Renamed5459:Sound;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed5460:Dictionary;
      
      private var Renamed3014:Tank;
      
      private var Renamed5461:Vector.<Renamed5398>;
      
      private var Renamed5462:Vector.<Renamed659>;
      
      public function Renamed18()
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
      
      private static function Renamed5466(param1:Object, param2:uint) : void
      {
         param1[Renamed5443] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_GOT_FLAG_NEUTRAL),param2);
         param1[Renamed5444] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_LOST_FLAG_NEUTRAL),param2);
         param1[Renamed5445] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_RETURNED_FLAG_NEUTRAL),param2);
         param1[Renamed5446] = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_CAPTURED_FLAG_NEUTRAL),param2);
      }
      
      private static function Renamed5467(param1:Renamed663) : Renamed663
      {
         return param1 == Renamed663.BLUE ? Renamed663.RED : Renamed663.BLUE;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed2525() : Renamed2395
      {
         return Renamed2395.CTF;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         var _loc1_:Renamed5433 = getInitParam().Renamed974;
         this.Renamed5456 = _loc1_.Renamed5456.sound;
         this.Renamed5457 = _loc1_.Renamed5457.sound;
         this.Renamed5458 = _loc1_.Renamed5458.sound;
         this.Renamed5459 = _loc1_.Renamed5459.sound;
         this.Renamed5460 = new Dictionary();
         this.Renamed5461 = new Vector.<Renamed5398>();
         this.Renamed5468();
         this.Renamed2798 = Renamed2741(modelRegistry.getModelsByInterface(Renamed2741)[0]);
         this.Renamed5448 = Renamed2553(OSGi.getInstance().getService(Renamed2553));
         this.Renamed114 = Renamed4711(modelRegistry.getModelsByInterface(Renamed4711)[0]);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.Renamed2432.Renamed905();
         this.Renamed5469();
         this.Renamed5470();
      }
      
      private function Renamed5470() : void
      {
         this.flags = new Dictionary();
         var _loc1_:Renamed5435 = getInitParam();
         this.Renamed5471(Renamed663.RED,_loc1_.Renamed5472,_loc1_.Renamed5473.data,_loc1_.Renamed5474);
         this.Renamed5471(Renamed663.BLUE,_loc1_.Renamed5475,_loc1_.Renamed5476.data,_loc1_.Renamed5477);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         var _loc1_:Renamed4556 = null;
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
      
      [Obfuscation(rename="false")]
      public function Renamed5478(param1:String, param2:Renamed663) : void
      {
         var _loc3_:Renamed4556 = null;
         var _loc4_:Renamed4556 = this.Renamed5479(param2);
         var _loc5_:Tank = this.Renamed5460[param1];
         if(this.Renamed3014 != null && this.Renamed3014 == _loc5_)
         {
            this.Renamed5480(_loc4_,param1,_loc5_);
         }
         else
         {
            this.Renamed5481(_loc4_,param1,_loc5_);
         }
         if(this.Renamed3014 != null || battleInfoService.isSpectatorMode())
         {
            this.Renamed5482(_loc4_);
            if(_loc5_ == this.Renamed3014 && this.Renamed3014 != null)
            {
               _loc3_ = this.Renamed5479(this.Renamed3014.teamType);
               if(_loc3_.Renamed5417 == null)
               {
                  this.Renamed5483(_loc3_);
               }
            }
            this.Renamed5484(param1,param2);
            battleService.Renamed633.Renamed2316(this.Renamed5458);
         }
         this.Renamed5448.Renamed2556(param2);
      }
      
      private function Renamed5484(param1:String, param2:Renamed663) : void
      {
         var _loc3_:Renamed5425 = null;
         var _loc4_:* = false;
         if(battleInfoService.isSpectatorMode())
         {
            _loc3_ = this.Renamed5485(Renamed5443,Renamed5467(param2));
         }
         else if(this.Renamed3014.teamType != null)
         {
            _loc4_ = this.Renamed3014.teamType != param2;
            _loc3_ = this.Renamed5486(Renamed5443,_loc4_);
         }
         if(_loc3_ != null)
         {
            this.Renamed5487(_loc3_,param1);
            this.Renamed5448.Renamed2554(param1,_loc3_.text,null);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5488(param1:Renamed663, param2:String) : void
      {
         this.Renamed5489(param1);
         if(battleInfoService.isSpectatorMode())
         {
            this.Renamed5490(param1,param2);
         }
         else if(Boolean(this.Renamed3014) && Boolean(this.Renamed3014.teamType))
         {
            this.Renamed5491(param1,param2);
         }
         battleService.Renamed633.Renamed2316(this.Renamed5457);
      }
      
      private function Renamed5490(param1:Renamed663, param2:String) : void
      {
         var _loc3_:Renamed5425 = null;
         var _loc4_:Renamed5425 = null;
         if(param2)
         {
            _loc3_ = this.Renamed5485(Renamed5445,param1);
            this.Renamed5487(_loc3_,param2);
            this.Renamed5448.Renamed2554(param2,_loc3_.text,null);
         }
         else
         {
            _loc4_ = param1 == Renamed663.BLUE ? this.Renamed5454 : this.Renamed5455;
            this.Renamed5448.Renamed2561(_loc4_.color,_loc4_.text);
         }
      }
      
      private function Renamed5491(param1:Renamed663, param2:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:* = this.Renamed3014.teamType == param1;
         var _loc5_:Renamed5425 = this.Renamed5486(Renamed5445,_loc4_);
         if(param2)
         {
            this.Renamed5487(_loc5_,param2);
            this.Renamed5448.Renamed2554(param2,_loc5_.text,null);
         }
         else
         {
            _loc3_ = _loc4_ ? this.Renamed5452 : this.Renamed5453;
            this.Renamed5448.Renamed2561(_loc5_.color,_loc3_);
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5492(param1:Renamed603, param2:Renamed663) : void
      {
         var _loc3_:Renamed4556 = this.Renamed5479(param2);
         this.Renamed5493(_loc3_);
         this.Renamed5448.Renamed2557(_loc3_.teamType);
         this.Renamed5494(_loc3_);
         _loc3_.Renamed5423(new Vector3(param1.x,param1.y,param1.z));
      }
      
      private function Renamed5494(param1:Renamed4556) : void
      {
         var _loc2_:Renamed4556 = null;
         if(this.Renamed3014 == null)
         {
            return;
         }
         if(param1.Renamed5417 == null)
         {
            return;
         }
         if(this.Renamed3014.Renamed1017(param1.teamType))
         {
            this.Renamed5495(null);
         }
         if(param1.Renamed5417 == this.Renamed3014)
         {
            if(this.Renamed5447)
            {
               this.Renamed5447 = false;
               battleService.Renamed619().Renamed815(new Renamed4558(this,getTimer() + Renamed5442));
            }
            _loc2_ = this.Renamed5496(param1.teamType);
            if(_loc2_.state == Renamed5410.AT_BASE)
            {
               this.Renamed5482(_loc2_);
            }
         }
         else
         {
            this.Renamed5483(param1);
         }
      }
      
      private function Renamed5493(param1:Renamed4556) : void
      {
         if(param1.Renamed5417 == null)
         {
            return;
         }
         var _loc2_:Renamed5425 = this.Renamed5497(param1.teamType);
         if(_loc2_ != null)
         {
            this.Renamed5487(_loc2_,param1.Renamed5417.tankData.userName);
            this.Renamed5448.Renamed2554(param1.Renamed5417.tankData.userName,_loc2_.text,null);
            battleService.Renamed633.Renamed2316(this.Renamed5456);
         }
      }
      
      private function Renamed5497(param1:Renamed663) : Renamed5425
      {
         var _loc2_:Boolean = false;
         if(battleInfoService.isSpectatorMode())
         {
            return this.Renamed5485(Renamed5444,Renamed5467(param1));
         }
         if(Boolean(this.Renamed3014) && Boolean(this.Renamed3014.teamType))
         {
            _loc2_ = this.Renamed3014.Renamed1017(param1);
            return this.Renamed5486(Renamed5444,_loc2_);
         }
         return null;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5498(param1:Renamed663, param2:String) : void
      {
         var _loc3_:Tank = null;
         var _loc4_:Renamed5425 = null;
         this.Renamed5489(Renamed668.Renamed675(param1));
         if(this.Renamed3014 != null || battleInfoService.isSpectatorMode())
         {
            _loc3_ = this.Renamed5460[param2];
            if(_loc3_ != null)
            {
               if(battleInfoService.isSpectatorMode())
               {
                  _loc4_ = this.Renamed5485(Renamed5446,param1);
               }
               else
               {
                  _loc4_ = this.Renamed5486(Renamed5446,this.Renamed3014.teamType == param1);
               }
               this.Renamed5487(_loc4_,param2);
               this.Renamed5448.Renamed2554(param2,_loc4_.text,null);
               battleService.Renamed633.Renamed2316(this.Renamed5459);
            }
         }
      }
      
      public function Renamed5393() : void
      {
         this.Renamed2798.Renamed2941(Renamed1626.MINE,Renamed2740.Renamed2942,true);
      }
      
      public function Renamed5394() : void
      {
         this.Renamed2798.Renamed2941(Renamed1626.MINE,Renamed2740.Renamed2942,false);
      }
      
      public function Renamed5395(param1:Renamed4556) : void
      {
         this.Renamed5482(param1);
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
      }
      
      public function Renamed5396() : void
      {
         var _loc1_:Renamed4556 = this.Renamed5496(this.Renamed3014.teamType);
         if(_loc1_.state != Renamed5410.CARRIED)
         {
            this.Renamed5483(_loc1_);
         }
      }
      
      private function Renamed5471(param1:Renamed663, param2:Renamed5436, param3:BitmapData, param4:Tanks3DSResource) : void
      {
         var _loc5_:Renamed4556 = null;
         var _loc6_:Vector3 = null;
         if(param3 == null)
         {
            param3 = new BitmapData(Renamed5439,Renamed5440,false,param1 == Renamed663.RED ? uint(11141120) : uint(170));
         }
         var _loc7_:Renamed843 = GraphicsUtils.getTextureAnimation(Renamed1368,param3,Renamed5439,param3.height,0,false);
         var _loc8_:Vector3 = new Vector3(param2.Renamed5499.x,param2.Renamed5499.y,param2.Renamed5499.z);
         var _loc9_:Renamed610 = battleService.Renamed621();
         _loc5_ = new Renamed4556(param1,_loc8_,Renamed5439,Renamed5440,_loc7_,battleService.Renamed619().Renamed692(),this);
         this.flags[param1] = _loc5_;
         _loc5_.addToScene();
         if(param2.Renamed5500 != null)
         {
            this.Renamed5481(_loc5_,param2.Renamed5500,this.Renamed5460[param2.Renamed5500]);
            this.Renamed5448.Renamed2556(param1);
         }
         else if(param2.Renamed5406 != null)
         {
            (_loc6_ = new Vector3()).x = param2.Renamed5406.x;
            _loc6_.y = param2.Renamed5406.y;
            _loc6_.z = param2.Renamed5406.z;
            _loc5_.Renamed5423(_loc6_);
            this.Renamed5448.Renamed2557(param1);
         }
         _loc9_.Renamed1287(_loc5_,1);
         _loc9_.Renamed1377.add(_loc5_);
         this.Renamed5501(param4,param2);
      }
      
      private function Renamed5501(param1:Tanks3DSResource, param2:Renamed5436) : void
      {
         var _loc3_:Object3D = Renamed5098(param1);
         var _loc4_:Vector3 = Renamed668.Renamed681(param2.Renamed5499);
         _loc4_.z -= Renamed5438;
         _loc3_.x = _loc4_.x;
         _loc3_.y = _loc4_.y;
         _loc3_.z = _loc4_.z;
         battleService.Renamed621().Renamed1258(_loc3_);
         var _loc5_:Renamed665 = battleService.Renamed619().Renamed692();
         var _loc6_:Renamed5398 = new Renamed5398(_loc4_,this.Renamed114.Renamed5502(),this,_loc5_);
         this.Renamed5461.push(_loc6_);
         battleService.Renamed619().Renamed803(_loc6_);
      }
      
      private function Renamed5489(param1:Renamed663) : void
      {
         var _loc2_:Renamed4556 = null;
         this.Renamed5447 = false;
         var _loc3_:Renamed4556 = this.Renamed5479(param1);
         _loc3_.Renamed5422();
         if(Boolean(this.Renamed3014) && Boolean(this.Renamed3014.teamType))
         {
            if(this.Renamed3014.Renamed1017(param1))
            {
               this.Renamed5495(null);
               _loc2_ = this.Renamed5496(param1);
               if(_loc2_.Renamed5417 == this.Renamed3014)
               {
                  this.Renamed5483(_loc3_);
               }
               else
               {
                  this.Renamed5482(_loc3_);
               }
            }
            else
            {
               this.Renamed5483(_loc3_);
            }
         }
         this.Renamed5448.Renamed2555(param1);
      }
      
      private function Renamed5468() : void
      {
         this.Renamed5449 = {};
         this.Renamed5451 = {};
         this.Renamed5450 = {};
         this.Renamed5503();
         Renamed5466(this.Renamed5451,MessageColor.BLUE);
         Renamed5466(this.Renamed5450,MessageColor.RED);
         this.Renamed5452 = localeService.getText(TanksLocale.TEXT_CTF_OUR_FLAG_RETURNED);
         this.Renamed5453 = localeService.getText(TanksLocale.TEXT_CTF_ENEMY_FLAG_RETURNED);
         this.Renamed5454 = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_BLUE_FLAG_RETURNED),MessageColor.BLUE);
         this.Renamed5455 = new Renamed5425(localeService.getText(TanksLocale.TEXT_CTF_RED_FLAG_RETURNED),MessageColor.RED);
      }
      
      private function Renamed5503() : void
      {
         this.Renamed5504(Renamed5443,TanksLocale.TEXT_CTF_GOT_ENEMY_FLAG,MessageColor.Renamed5388,TanksLocale.TEXT_CTF_GOT_OUR_FLAG,MessageColor.Renamed5389);
         this.Renamed5504(Renamed5444,TanksLocale.TEXT_CTF_LOST_OUR_FLAG,MessageColor.Renamed5388,TanksLocale.TEXT_CTF_LOST_ENEMY_FLAG,MessageColor.Renamed5389);
         this.Renamed5504(Renamed5445,TanksLocale.TEXT_CTF_RETURNED_OUR_FLAG,MessageColor.Renamed5388,TanksLocale.TEXT_CTF_RETURNED_ENEMY_FLAG,MessageColor.Renamed5389);
         this.Renamed5504(Renamed5446,TanksLocale.TEXT_CTF_CAPTURED_ENEMY_FLAG,MessageColor.Renamed5388,TanksLocale.TEXT_CTF_CAPTURED_OUR_FLAG,MessageColor.Renamed5389);
      }
      
      private function Renamed5504(param1:String, param2:String, param3:uint, param4:String, param5:uint) : void
      {
         var _loc6_:Renamed5425 = new Renamed5425(localeService.getText(param2),param3);
         var _loc7_:Renamed5425 = new Renamed5425(localeService.getText(param4),param5);
         this.Renamed5449[param1] = new Renamed5505(_loc6_,_loc7_);
      }
      
      private function Renamed5486(param1:String, param2:Boolean) : Renamed5425
      {
         var _loc3_:Renamed5505 = this.Renamed5449[param1];
         return param2 ? _loc3_.positive : _loc3_.negative;
      }
      
      private function Renamed5485(param1:String, param2:Renamed663) : Renamed5425
      {
         var _loc3_:Object = param2 == Renamed663.BLUE ? this.Renamed5451 : this.Renamed5450;
         return _loc3_[param1];
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
         var _loc1_:Renamed4556 = null;
         if(battleService.Renamed646() && !Renamed2384.Renamed728() && this.Renamed3014 != null && !this.Renamed5447)
         {
            _loc1_ = this.Renamed5496(this.Renamed3014.teamType);
            if(_loc1_.Renamed5417 == this.Renamed3014)
            {
               this.Renamed5447 = true;
               this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
               server.Renamed5507(this.Renamed3014);
            }
         }
      }
      
      private function Renamed5487(param1:Renamed5425, param2:String) : void
      {
         var _loc3_:String = param2 != null ? userInfoService.Renamed2300(param2) : null;
         if(_loc3_)
         {
            this.Renamed5448.Renamed2561(param1.color,_loc3_ + " " + param1.text);
         }
      }
      
      private function Renamed5463(param1:Renamed889) : void
      {
         this.Renamed5460[param1.tank.tankData.userName] = param1.tank;
         if(param1.isLocal)
         {
            this.Renamed3014 = param1.tank;
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         var _loc2_:Body = null;
         var _loc3_:BodyState = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Tank = param1.tank;
         var _loc6_:Renamed4556 = this.Renamed5496(_loc5_.teamType);
         if(_loc6_.Renamed5417 == _loc5_)
         {
            _loc2_ = _loc5_.Renamed696();
            _loc3_ = _loc2_.state;
            _loc4_ = _loc3_.position;
            this.Renamed5492(Renamed668.Renamed677(_loc4_),_loc6_.teamType);
         }
         delete this.Renamed5460[_loc5_.tankData.userName];
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         var _loc2_:Renamed4556 = null;
         for each(_loc2_ in this.flags)
         {
            if(_loc2_.state == Renamed5410.CARRIED && _loc2_.Renamed5418 == param1.tank.tankData.userName)
            {
               this.Renamed5481(_loc2_,_loc2_.Renamed5418,param1.tank);
               this.Renamed5482(_loc2_);
               break;
            }
         }
      }
      
      private function Renamed5464(param1:Object) : void
      {
         var _loc2_:Renamed659 = null;
         var _loc3_:Renamed4556 = this.Renamed5479(this.Renamed3014.teamType);
         if(_loc3_.state == Renamed5410.DROPPED)
         {
            this.Renamed5483(_loc3_);
         }
         var _loc4_:Renamed4556 = this.Renamed5496(this.Renamed3014.teamType);
         if(_loc4_.state != Renamed5410.CARRIED)
         {
            this.Renamed5483(_loc4_);
         }
         for each(_loc2_ in this.Renamed5462)
         {
            _loc2_.Renamed833(this.Renamed3014.teamType);
         }
      }
      
      private function Renamed5465(param1:Renamed2761) : void
      {
         var _loc2_:Renamed4556 = null;
         if(this.Renamed3014 != null && this.Renamed3014 == param1.Renamed5508)
         {
            for each(_loc2_ in this.flags)
            {
               this.Renamed5482(_loc2_);
            }
         }
      }
      
      private function Renamed2831(param1:Object) : void
      {
         var _loc2_:Renamed5398 = null;
         this.Renamed5489(Renamed663.BLUE);
         this.Renamed5489(Renamed663.RED);
         for each(_loc2_ in this.Renamed5461)
         {
            _loc2_.reset();
         }
      }
      
      private function Renamed2830(param1:Object) : void
      {
         var _loc2_:Renamed4556 = null;
         this.Renamed5447 = false;
         for each(_loc2_ in this.flags)
         {
            this.Renamed5482(_loc2_);
         }
      }
      
      private function Renamed5483(param1:Renamed4556) : void
      {
         if(this.Renamed3014 != null && this.Renamed3014.state == Renamed841.Renamed854 && battleService.Renamed646())
         {
            battleService.Renamed619().Renamed803(param1);
         }
      }
      
      private function Renamed5482(param1:Renamed4556) : void
      {
         battleService.Renamed619().Renamed805(param1);
      }
      
      private function Renamed5480(param1:Renamed4556, param2:String, param3:Tank) : void
      {
         param1.Renamed5419(param2,param3);
         this.Renamed5509(param1,param3);
      }
      
      private function Renamed5481(param1:Renamed4556, param2:String, param3:Tank) : void
      {
         param1.Renamed5421(param2,param3);
         this.Renamed5509(param1,param3);
      }
      
      private function Renamed5509(param1:Renamed4556, param2:Tank) : void
      {
         if(param2 != null && this.Renamed3014 != null && this.Renamed3014.Renamed1017(param1.teamType))
         {
            this.Renamed5495(param2.Renamed696());
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
      
      private function Renamed5495(param1:Body) : void
      {
         var _loc2_:Renamed659 = null;
         for each(_loc2_ in this.Renamed5462)
         {
            _loc2_.Renamed661(param1);
         }
      }
      
      private function Renamed5479(param1:Renamed663) : Renamed4556
      {
         return this.flags[param1];
      }
      
      private function Renamed5496(param1:Renamed663) : Renamed4556
      {
         return this.flags[Renamed668.Renamed675(param1)];
      }
      
      public function Renamed649() : Renamed617
      {
         var _loc1_:Renamed5437 = new Renamed5437();
         this.Renamed5462.push(_loc1_);
         return _loc1_;
      }
   }
}

