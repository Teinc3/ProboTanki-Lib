package alternativa.tanks.models.tank
{
   import Renamed136.Renamed663;
   import Renamed142.Renamed1626;
   import Renamed142.Renamed2740;
   import Renamed142.Renamed2741;
   import Renamed143.Renamed2742;
   import Renamed148.Renamed2743;
   import Renamed148.Renamed2744;
   import Renamed150.Renamed2745;
   import Renamed200.Renamed2746;
   import Renamed200.Renamed2747;
   import Renamed200.Renamed2748;
   import Renamed200.Renamed2749;
   import Renamed200.Renamed2750;
   import Renamed200.Renamed2751;
   import Renamed209.Renamed2752;
   import Renamed264.Renamed508;
   import Renamed264.Renamed509;
   import Renamed1.Renamed909;
   import Renamed602.Renamed603;
   import Renamed479.Renamed2753;
   import Renamed479.Renamed2754;
   import Renamed479.Renamed2755;
   import Renamed479.Renamed2756;
   import Renamed479.Renamed914;
   import Renamed479.Renamed915;
   import Renamed2615.Renamed2757;
   import Renamed2615.Renamed2616;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.register.ClientClass;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.Renamed885;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed907;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed893;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed898;
   import alternativa.tanks.battle.events.Renamed901;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Renamed1136;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Renamed1140;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.battle.objects.tank.Renamed1158;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.display.usertitle.TitleConfigFlags;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.Renamed2417;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.models.tank.spawn.spawnhandlers.Renamed2758;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.initialeffects.Renamed2759;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.types.Long;
   import Renamed329.Renamed2760;
   import Renamed329.Renamed2761;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankParts;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankState;
   import com.alternativaplatform.projects.tanks.client.models.tank.ClientTank;
   import Renamed357.Renamed2762;
   import Renamed357.Renamed2763;
   import Renamed357.Renamed2764;
   import Renamed364.Renamed2765;
   import Renamed365.Renamed2766;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import Renamed373.Renamed666;
   import Renamed375.Renamed2767;
   import Renamed381.Renamed2768;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import Renamed79.Renamed2769;
   import scpacker.tanks.WeaponsManager;
   import Renamed446.Renamed2770;
   import Renamed446.Renamed2771;
   import Renamed461.Renamed2772;
   import Renamed461.Renamed2773;
   
   public class Renamed2407 extends Renamed2744 implements Renamed2743, Renamed2754, Renamed2774, Renamed511, IObjectLoadListener, Renamed2408
   {
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleUserInfoService:BattleUserInfoService;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var Renamed2776:IInitialEffectsService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const Renamed2777:Number = 0;
      
      private static const Renamed2778:Number = 135;
      
      private static const Renamed2779:Renamed603 = new Renamed603(0,0,0);
      
      private static const Renamed2780:int = 5;
      
      private static const Renamed2781:Number = 1250;
      
      private static const Renamed2782:Number = 80000;
      
      private static const Renamed2783:int = 4000;
      
      private static const Renamed2784:Number = -10000;
      
      private static const Renamed2785:int = 3000;
      
      private var Renamed1235:Renamed1231;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed2786:Renamed2787;
      
      private var Renamed2788:Renamed2789;
      
      private var Renamed2790:Number = 7000;
      
      private var Renamed2791:Number = 7050;
      
      private var Renamed2792:int;
      
      private var Renamed2793:Boolean;
      
      public var Renamed2794:int;
      
      private var Renamed2795:Dictionary;
      
      private var Renamed2796:Dictionary;
      
      private var Renamed2797:IModelService;
      
      private var battlefield:Renamed2417;
      
      private var Renamed2798:Renamed2741;
      
      public var Renamed2799:Renamed775;
      
      private var Renamed2800:int;
      
      private var Renamed2801:Boolean = true;
      
      private var Renamed2802:int;
      
      private var Renamed2803:Renamed603;
      
      private var Renamed2804:Renamed603;
      
      private var Renamed2805:Renamed603;
      
      private var Renamed2806:Renamed603;
      
      private var Renamed2807:Renamed2735;
      
      private var point:Vector3;
      
      private var Renamed1522:Vector3;
      
      private var Renamed2808:Vector3;
      
      private var Renamed1299:RayHit;
      
      public var Renamed2809:TankParts;
      
      private var Renamed2810:Renamed2756;
      
      private var Renamed2811:Renamed2764;
      
      private var Renamed2812:Renamed2813;
      
      private var Renamed2814:Renamed2770;
      
      private var Renamed2815:Renamed2816;
      
      private var Renamed2817:Renamed2742;
      
      private var Renamed2818:Renamed2737;
      
      private var Renamed2819:int;
      
      private var Renamed2820:int;
      
      private var Renamed2821:Renamed2772;
      
      private var Renamed2822:int;
      
      private var Renamed2823:int;
      
      private var Renamed2824:int;
      
      public function Renamed2407()
      {
         this.Renamed1235 = new Renamed1231();
         this.Renamed2825 = new Renamed2772(new Renamed603(0,0,0),0,new Renamed603(0,0,0),new Renamed603(0,0,0),new Renamed603(0,0,0));
         this.Renamed2826 = new Renamed2773(0,0);
         this.Renamed2546 = new Dictionary();
         this.Renamed2803 = new Renamed603(0,0,0);
         this.Renamed2804 = new Renamed603(0,0,0);
         this.Renamed2805 = new Renamed603(0,0,0);
         this.Renamed2806 = new Renamed603(0,0,0);
         this.Renamed2827 = new Quaternion();
         this.Renamed2828 = new Quaternion();
         this.Renamed2829 = new Vector3();
         this.point = new Vector3();
         this.Renamed1522 = new Vector3();
         this.Renamed2808 = new Vector3();
         this.Renamed1299 = new RayHit();
         this.Renamed2821 = new Renamed2772(new Renamed603(0,0,0),0,new Renamed603(0,0,0),new Renamed603(0,0,0),new Renamed603(0,0,0));
         super();
         this.Renamed2817 = new Renamed2742();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed894,this.Renamed2830);
         this.Renamed2432.Renamed904(Renamed901,this.Renamed2831);
         this.Renamed2432.Renamed904(Renamed893,this.onSettingsAccepted);
         this.Renamed2432.Renamed905();
         this.Renamed2807 = new Renamed2735();
         OSGi.getInstance().registerService(Renamed2408,this);
      }
      
      private static function Renamed2832(param1:UserTitle, param2:int, param3:String, param4:int, param5:Renamed663, param6:int) : void
      {
         param1.setHealth(param2);
         param1.setLabelText(param3);
         param1.setRank(param4);
         param1.setTeamType(param5);
         param1.setConfiguration(param6);
      }
      
      private static function Renamed2833(param1:TankParts) : Renamed909
      {
         var _loc2_:Renamed2767 = Renamed2767(param1.hullObject.adapt(Renamed2767));
         var _loc3_:Sound = _loc2_.Renamed2834().engineIdleSound.sound;
         var _loc4_:Sound = _loc2_.Renamed2834().engineStartMovingSound.sound;
         var _loc5_:Sound = _loc2_.Renamed2834().engineMovingSound.sound;
         var _loc6_:Sound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,242699))).sound;
         return new Renamed909(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      private static function Renamed2835(param1:Renamed2753) : void
      {
         param1.Renamed2836(settingsService.inverseBackDriving);
      }
      
      private static function Renamed2837(param1:Renamed775) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Renamed2408 = null;
         var _loc4_:UserTitle = null;
         var _loc5_:Renamed2759 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Vector.<Renamed2759> = Renamed2776.Renamed2838(param1.user.id);
         if(_loc8_ != null)
         {
            _loc2_ = getTimer();
            _loc4_ = param1.tank.title;
            for each(_loc5_ in _loc8_)
            {
               _loc6_ = _loc2_ - _loc5_.Renamed2839;
               _loc7_ = _loc5_.duration - _loc6_;
               if(_loc7_ > 0)
               {
                  _loc4_.showIndicator(_loc5_.effectId,_loc7_,false,_loc5_.effectLevel);
               }
            }
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function onTurretDirectionCorrection(param1:Boolean) : void
      {
         var _loc2_:Renamed915 = Renamed775.Renamed824.tank.Renamed1062();
         this.Renamed2840(_loc2_.getControl());
         this.Renamed2788.reset();
      }
      
      public function Renamed2841() : void
      {
         battleService.Renamed619().Renamed827(this.Renamed2786);
         this.Renamed2786.reset();
         battleService.Renamed619().Renamed827(this.Renamed2788);
         this.Renamed2788.reset();
      }
      
      public function Renamed2842(param1:int) : void
      {
         this.Renamed2840(param1);
         this.Renamed2788.reset();
      }
      
      public function readyToSpawn(param1:Tank) : void
      {
         if(param1.tankData.local)
         {
            Renamed2763(Renamed775.Renamed824.user.getParams(Renamed2764)).handleReadyToSpawn();
         }
         else
         {
            Renamed2762(param1.tankData.user.getParams(Renamed2764)).handleReadyToSpawn();
         }
      }
      
      private function Renamed2843() : void
      {
         var _loc1_:Renamed508 = Renamed508(OSGi.getInstance().getService(Renamed508));
         _loc1_.Renamed2843();
      }
      
      private function Renamed2840(param1:int) : void
      {
         var _loc2_:Renamed915 = this.Renamed1062(Renamed775.Renamed824.user);
         var _loc3_:Tank = Renamed775.Renamed824.tank;
         this.Renamed2844(param1);
         this.Renamed2826.angle = _loc2_.Renamed1013();
         this.Renamed2826.control = param1;
         server.rotateTurretCommand(battleService.Renamed619().Renamed653(),this.Renamed2826,_loc3_.incarnation);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed1095(param1:ClientObject, param2:Renamed2773) : void
      {
         this.Renamed2845(param1,param2.angle,param2.control);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2846(param1:ClientObject, param2:int) : void
      {
         this.Renamed2847(param1).Renamed2848(param2);
      }
      
      public function onReadyToActivate() : void
      {
         var _loc1_:Tank = null;
         if(this.Renamed2799 != null)
         {
            _loc1_ = this.Renamed2799.tank;
            if(_loc1_.Renamed1127() == 0)
            {
               server.Renamed2849();
               this.Renamed2850();
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2851(param1:ClientObject, param2:Renamed2772, param3:Number) : void
      {
         this.move(param1,param2);
         this.Renamed2845(param1,param3,param2.control);
      }
      
      public function Renamed2852(param1:ClientObject, param2:Renamed603, param3:Renamed603, param4:Renamed603, param5:Renamed603, param6:int) : void
      {
         var _loc7_:Tank = this.getTank(param1);
         if(_loc7_ != null)
         {
            if(Renamed668.Renamed676(param2) && Renamed668.Renamed676(param3) && Renamed668.Renamed676(param4) && Renamed668.Renamed676(param5))
            {
               _loc7_.Renamed1106(param2,param3,param4,param5);
            }
            this.Renamed2847(param1).Renamed2848(param6);
         }
      }
      
      public function Renamed2847(param1:ClientObject) : Renamed2756
      {
         return Renamed2756(param1.getParams(Renamed2756));
      }
      
      private function Renamed2845(param1:ClientObject, param2:Number, param3:int) : void
      {
         var _loc4_:Renamed915 = null;
         var _loc5_:Tank = this.getTank(param1);
         if(_loc5_ != null)
         {
            _loc4_ = _loc5_.Renamed1062();
            _loc4_.Renamed2853(param2);
            _loc4_.Renamed2848(param3);
         }
      }
      
      private function Renamed2844(param1:int) : void
      {
         if(this.Renamed2820 != param1)
         {
            this.Renamed2820 = param1;
            this.Renamed2843();
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.Renamed2817.objectUnloaded(param1);
         this.Renamed2854(param1);
         this.Renamed2855(param1);
      }
      
      private function Renamed2856(param1:ClientObject) : void
      {
         var _loc2_:Renamed2722 = this.Renamed2857(param1);
         if(_loc2_)
         {
            battleService.Renamed619().Renamed816(_loc2_);
            param1.removeParams(Renamed2722);
         }
      }
      
      private function Renamed2854(param1:ClientObject) : void
      {
         Renamed2775.removeUser(param1);
         if(Renamed2775.Renamed2858() == 0)
         {
            battleUserInfoService.Renamed2306(this.Renamed2807);
         }
      }
      
      private function Renamed2859(param1:Renamed775) : void
      {
         var Renamed2860:Renamed775 = param1;
         try
         {
            this.Renamed2432.dispatchEvent(new Renamed883(Renamed2860.tank,Renamed2860.local));
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function Renamed2855(param1:ClientObject) : void
      {
         var _loc2_:Tank = this.getTank(param1);
         this.Renamed2861(_loc2_);
         this.Renamed2862(_loc2_);
         this.Renamed2859(_loc2_.tankData);
         this.Renamed2863(_loc2_);
         _loc2_.destroy();
      }
      
      private function Renamed2863(param1:Tank) : void
      {
         if(Renamed2769(param1.Renamed695().getParams(Renamed2769)) != null)
         {
            Renamed2769(param1.Renamed695().getParams(Renamed2769)).close();
         }
         WeaponsManager.clearSFXModel(param1.Renamed695());
         UserTitle(param1.Renamed695().removeParams(UserTitle)).close();
         Renamed2756(param1.Renamed695().removeParams(Renamed2756)).close();
         if(param1.tankData.local)
         {
            Renamed2864(param1.Renamed695().removeParams(Renamed2864)).close();
            Renamed2748(param1.Renamed695().removeParams(Renamed2748)).close();
            Renamed2763(param1.Renamed695().getParams(Renamed2764)).close();
            if(param1.Renamed695().getParams(Renamed2758) != null)
            {
               Renamed2758(param1.Renamed695().removeParams(Renamed2758)).close();
            }
            Renamed2865(param1.Renamed695().removeParams(Renamed2865)).close();
            Renamed2746(param1.Renamed695().removeParams(Renamed2746)).close();
            Renamed2866.teamType = Renamed663.NONE;
            Renamed2751(param1.Renamed695().removeParams(Renamed2751)).close();
            Renamed2749(param1.Renamed695().removeParams(Renamed2749)).close();
            Renamed509(OSGi.getInstance().getService(Renamed508)).getPauseSupport().close();
            Renamed2750(param1.Renamed695().removeParams(Renamed2750)).close();
            Renamed2867(param1.Renamed695().removeParams(Renamed2867)).close();
            Renamed2747(param1.Renamed695().removeParams(Renamed2747)).close();
            Renamed914(param1.Renamed695().removeParams(Renamed914)).close();
            this.Renamed2850();
            this.Renamed2786 = null;
            this.Renamed2788 = null;
            this.Renamed2799.tank = null;
            Renamed775.Renamed824 = null;
         }
      }
      
      public function Renamed2868(param1:String, param2:String) : ClientObject
      {
         var _loc3_:ClientClass = new ClientClass(param1,null,param2);
         return new ClientObject(param1,_loc3_,param2,null);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:TankParts, param4:Number, param5:Number, param6:Number, param7:Number, param8:String = null) : void
      {
         this.Renamed2869(param1);
         param1.putParams(Renamed2737,new Renamed2737(battleUserInfoService.Renamed2300(param8),battleUserInfoService.Renamed2301(param8),true,battleUserInfoService.Renamed2303(param8)));
         this.createData(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      private function Renamed2869(param1:ClientObject) : void
      {
         Renamed2775.addUser(param1);
         if(Renamed2775.Renamed2858() == 1)
         {
            battleUserInfoService.Renamed2304(this.Renamed2807);
         }
      }
      
      private function createData(param1:ClientObject, param2:Number, param3:TankParts, param4:Number, param5:Number, param6:Number, param7:Number, param8:String = null) : void
      {
         var _loc9_:Renamed775;
         (_loc9_ = new Renamed775()).user = param1;
         _loc9_.userName = param8;
         _loc9_.mass = param2;
         _loc9_.hull = this.Renamed2868(param8 + "_hull",param8 + "_hull");
         _loc9_.turret = WeaponsManager.getObjectFor(param3.turretObject.name);
         WeaponsManager.Renamed2870(param1,_loc9_.turret,param4,param5,param6,param7);
         _loc9_.turretObject = param3.turretObject;
         param1.putParams(Renamed2407,_loc9_);
      }
      
      public function Renamed2871(param1:ClientObject, param2:ClientTank, param3:TankParts) : void
      {
         var _loc4_:Renamed775;
         (_loc4_ = this.getTankData(param1)).local = param2.self;
         _loc4_.Renamed2872 = param2.tankSpecification;
         var _loc5_:Renamed915 = this.Renamed2873(_loc4_);
         var _loc6_:Renamed914 = this.Renamed1085(param1);
         var _loc7_:UserTitle = this.Renamed2874(_loc4_);
         param1.putParams(UserTitle,_loc7_);
         var _loc8_:Renamed990 = this.Renamed2875(_loc4_);
         this.Renamed2876(_loc8_,_loc4_);
         var _loc9_:Tank = this.createTank(_loc5_,_loc6_,_loc8_,_loc4_,param3,_loc7_);
         this.Renamed2877(_loc9_);
         this.Renamed2878(_loc9_);
         this.Renamed2879(_loc9_);
         _loc4_.tank = _loc9_;
         _loc4_.user = param1;
         if(_loc4_.local)
         {
            this.Renamed2799 = _loc4_;
            this.Renamed2880();
            this.Renamed2881(_loc4_);
            param1.putParams(Renamed2764,new Renamed2763(_loc9_,server));
            _loc9_.Renamed1126(new Renamed1136(_loc9_));
         }
         else
         {
            param1.putParams(Renamed2764,new Renamed2762(_loc9_));
            _loc9_.Renamed1126(new Renamed1158(_loc9_));
         }
         this.Renamed2817.objectLoadedPost(param1);
         this.Renamed2882(_loc4_,param2.tankSpecification,true);
         this.Renamed2883(_loc4_);
         this.Renamed2432.dispatchEvent(new Renamed889(_loc4_.tank,_loc4_.local));
         if(this.Renamed2884(param2))
         {
            this.Renamed2885(_loc4_,param2);
         }
         if(_loc4_.local)
         {
            Renamed509(OSGi.getInstance().getService(Renamed508)).localTankLoaded();
            Renamed2766(modelRegistry.getModel(Long.getLong(1286074115,-176946994))).localTankLoaded(param1);
            this.Renamed2843();
         }
      }
      
      private function Renamed2877(param1:Tank) : void
      {
         if(param1.tankData.local)
         {
            Renamed775.Renamed824 = param1.tankData;
         }
         param1.Renamed695().putParams(Tank,param1);
      }
      
      private function Renamed2884(param1:ClientTank) : Boolean
      {
         return param1.tankState != null && param1.health > 0;
      }
      
      private function Renamed2880() : void
      {
         this.Renamed2432.Renamed906();
         this.Renamed2432.Renamed905();
      }
      
      private function Renamed2879(param1:Tank) : void
      {
         var _loc2_:DataUnitValidator = param1.Renamed1067();
         param1.Renamed695().putParams(Renamed2864,new Renamed2864(_loc2_));
      }
      
      private function Renamed2878(param1:Tank) : void
      {
         var _loc2_:Renamed2756 = null;
         var _loc3_:Renamed2753 = null;
         if(param1.tankData.local)
         {
            _loc3_ = new Renamed2753(param1,this);
            _loc3_.lock(Renamed1140.DEAD);
            Renamed2835(_loc3_);
            _loc2_ = _loc3_;
            param1.tankData.user.putParams(Renamed2749,new Renamed2749(_loc3_));
         }
         else
         {
            _loc2_ = new Renamed2756(param1);
            _loc2_.lock(Renamed1140.DEAD);
         }
         param1.Renamed695().putParams(Renamed2756,_loc2_);
      }
      
      public function Renamed2886(param1:ClientObject, param2:int) : void
      {
         this.Renamed2847(param1).lock(param2);
         this.Renamed1062(param1).lock(param2);
      }
      
      public function Renamed2887(param1:ClientObject, param2:int) : void
      {
         this.Renamed2847(param1).unlock(param2);
         this.Renamed1062(param1).unlock(param2);
      }
      
      public function Renamed1062(param1:ClientObject) : Renamed915
      {
         return Renamed915(param1.getParams(Renamed915));
      }
      
      public function Renamed1085(param1:ClientObject) : Renamed914
      {
         return Renamed914(param1.getParams(Renamed914));
      }
      
      private function Renamed2888(param1:ClientObject) : void
      {
         var _loc2_:Renamed2722 = new Renamed2722(this.getTank(param1),this.Renamed2889,4000,2000);
         param1.putParams(Renamed2722,_loc2_);
         battleService.Renamed619().Renamed815(_loc2_);
      }
      
      private function Renamed2889(param1:ClientObject, param2:Renamed603, param3:Renamed603) : void
      {
         this.Renamed2852(param1,param2,param3,Renamed2779,Renamed2779,0);
         this.getTank(param1).Renamed696().saveState();
      }
      
      private function Renamed2883(param1:Renamed775) : void
      {
         var _loc2_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         if(!_loc2_.isLoaded(param1.userName))
         {
            Renamed2757(OSGi.getInstance().getService(Renamed2553)).userConnect(_loc2_.getShortUserInfo(param1.userName));
         }
      }
      
      private function Renamed2873(param1:Renamed775) : Renamed915
      {
         var _loc2_:Renamed915 = null;
         var _loc3_:Renamed914 = null;
         if(param1.local)
         {
            _loc3_ = this.Renamed2890().Renamed1085(param1);
            _loc2_ = _loc3_.Renamed1062();
            _loc2_.setListener(this);
            param1.user.putParams(Renamed914,_loc3_);
         }
         else
         {
            _loc2_ = new Renamed915(true,param1);
         }
         param1.user.putParams(Renamed915,_loc2_);
         return _loc2_;
      }
      
      private function Renamed2875(param1:Renamed775) : Renamed990
      {
         var _loc2_:Renamed43 = Renamed99.Renamed124(param1.turret);
         if(param1.local)
         {
            return _loc2_.Renamed2891(param1.user);
         }
         return _loc2_.Renamed2892(param1.user);
      }
      
      private function Renamed2876(param1:Renamed990, param2:Renamed775) : void
      {
         if(param2.local)
         {
            param2.user.putParams(Renamed2712,new Renamed2893(param1));
         }
         else
         {
            param2.user.putParams(Renamed2712,new Renamed2711(param1));
         }
      }
      
      public function Renamed2894() : void
      {
         var _loc4_:Renamed775 = null;
         var _loc1_:ClientObject = null;
         var _loc2_:Renamed2408 = null;
         var _loc3_:Tank = null;
         for each(_loc1_ in Renamed2775.Renamed2895())
         {
            _loc4_ = this.getTankData(_loc1_);
            if(_loc4_ != Renamed775.Renamed824)
            {
               _loc3_ = _loc4_.tank;
               if(_loc3_ != null)
               {
                  this.Renamed2896(_loc4_);
                  Renamed2837(_loc4_);
               }
            }
         }
      }
      
      public function Renamed2896(param1:Renamed775) : void
      {
         var _loc2_:* = 0;
         var _loc3_:Renamed2737 = null;
         var _loc4_:Tank = null;
         var _loc5_:Tank = null;
         if(Renamed775.Renamed824 != null)
         {
            _loc5_ = Renamed775.Renamed824.tank;
            if(_loc5_.teamType != null)
            {
               _loc2_ = TitleConfigFlags.LABEL | TitleConfigFlags.EFFECTS;
               _loc3_ = this.Renamed2739(param1.user);
               _loc4_ = param1.tank;
               if(Renamed775.Renamed824 != null && _loc4_.Renamed1017(_loc5_.teamType))
               {
                  _loc2_ |= TitleConfigFlags.HEALTH;
               }
               Renamed2832(param1.tank.title,_loc4_.tankData.health,_loc3_.name,_loc3_.rank,_loc4_.teamType,_loc2_);
            }
         }
         if(battleInfoService.isSpectatorMode())
         {
            _loc2_ = TitleConfigFlags.LABEL | TitleConfigFlags.EFFECTS | TitleConfigFlags.HEALTH;
            _loc3_ = this.Renamed2739(param1.user);
            _loc4_ = param1.tank;
            Renamed2832(param1.tank.title,_loc4_.tankData.health,_loc3_.name,_loc3_.rank,_loc4_.teamType,_loc2_);
         }
      }
      
      private function Renamed2874(param1:Renamed775) : UserTitle
      {
         var _loc2_:UserTitle = null;
         var _loc3_:Renamed2737 = null;
         var _loc4_:Renamed610 = battleService.Renamed621();
         if(param1.local)
         {
            _loc2_ = new UserTitle(Renamed2777,_loc4_.Renamed1381(),10000,true);
            _loc3_ = this.Renamed2739(param1.user);
            _loc2_.setRank(_loc3_.rank);
            _loc2_.setLabelText(_loc3_.name);
            _loc2_.setConfiguration(TitleConfigFlags.HEALTH | TitleConfigFlags.WEAPON | TitleConfigFlags.EFFECTS);
         }
         else
         {
            _loc2_ = new UserTitle(Renamed2778,_loc4_.Renamed1382(),10000,false);
            _loc2_.setSuspicious(battleUserInfoService.Renamed2302(param1.userName));
         }
         return _loc2_;
      }
      
      public function getTitle(param1:ClientObject) : UserTitle
      {
         return UserTitle(param1.getParams(UserTitle));
      }
      
      public function Renamed2739(param1:ClientObject) : Renamed2737
      {
         return Renamed2737(param1.getParams(Renamed2737));
      }
      
      public function getTank(param1:ClientObject) : Tank
      {
         return Tank(param1.getParams(Tank));
      }
      
      public function Renamed2897(param1:ClientObject) : void
      {
         var _loc2_:Renamed775 = this.getTankData(param1);
         if(_loc2_ == null || _loc2_.tank == null)
         {
            return;
         }
         _loc2_.tank.Renamed1117();
         this.Renamed2898(param1).Renamed2715();
         this.Renamed2898(param1).Renamed2714(Renamed1140.DEAD | Renamed1140.DISABLED);
         if(_loc2_.local)
         {
            _loc2_.tank.Renamed1093(_loc2_.tank.Renamed1092() | Renamed666.Renamed1449);
            this.Renamed2432.dispatchEvent(new Renamed885(_loc2_.tank));
         }
         this.Renamed2432.dispatchEvent(new Renamed898(_loc2_.tank));
         this.Renamed2862(_loc2_.tank);
      }
      
      public function Renamed2898(param1:ClientObject) : Renamed2712
      {
         return Renamed2712(param1.getParams(Renamed2712));
      }
      
      public function Renamed1089(param1:ClientObject, param2:Number) : void
      {
         var _loc3_:Renamed775 = this.getTankData(param1);
         if(_loc3_.tank != null)
         {
            this.Renamed2899(_loc3_.tank,param2);
         }
      }
      
      public function getTankData(param1:ClientObject) : Renamed775
      {
         return Renamed775(param1.getParams(Renamed2407));
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function move(param1:ClientObject, param2:Renamed2772) : void
      {
         this.Renamed2900(param1,param2);
         this.Renamed2901(param1,param2);
      }
      
      private function Renamed2902(param1:ClientObject, param2:Renamed2772) : void
      {
         var _loc3_:Body = null;
         var _loc4_:Number = NaN;
         var _loc5_:Tank = this.getTankData(param1).tank;
         if(_loc5_ != null)
         {
            _loc3_ = _loc5_.Renamed696();
            _loc4_ = 0.5;
            this.Renamed2903(_loc4_,_loc3_.state.position,param2.position,param2.position);
            this.Renamed2903(_loc4_,_loc3_.state.velocity,param2.Renamed2904,param2.Renamed2904);
            this.Renamed2903(_loc4_,_loc3_.state.angularVelocity,param2.angularVelocity,param2.angularVelocity);
            this.Renamed2905(_loc4_,_loc3_.state.orientation,param2.orientation,param2.orientation);
         }
      }
      
      private function Renamed2901(param1:ClientObject, param2:Renamed2772) : void
      {
         this.Renamed2852(param1,param2.position,param2.orientation,param2.Renamed2904,param2.angularVelocity,param2.control);
      }
      
      private function Renamed2900(param1:ClientObject, param2:Renamed2772) : void
      {
         this.Renamed2902(param1,param2);
      }
      
      public function Renamed2857(param1:ClientObject) : Renamed2722
      {
         return Renamed2722(param1.getParams(Renamed2722));
      }
      
      private function Renamed2903(param1:Number, param2:Vector3, param3:Renamed603, param4:Renamed603) : void
      {
         param4.x = param2.x + (param3.x - param2.x) * param1;
         param4.y = param2.y + (param3.y - param2.y) * param1;
         param4.z = param2.z + (param3.z - param2.z) * param1;
      }
      
      private function Renamed2905(param1:Number, param2:Quaternion, param3:Renamed603, param4:Renamed603) : void
      {
         this.Renamed2827.setFromEulerAnglesXYZ(param3.x,param3.y,param3.z);
         this.Renamed2828.slerp(param2,this.Renamed2827,param1);
         this.Renamed2828.getEulerAngles(this.Renamed2829);
         param4.x = this.Renamed2829.x;
         param4.y = this.Renamed2829.y;
         param4.z = this.Renamed2829.z;
      }
      
      public function Renamed2906(param1:Tank) : void
      {
         var _loc2_:Dictionary = battleService.Renamed647();
         _loc2_[param1.Renamed1075().Renamed1020()] = true;
         _loc2_[param1.Renamed1075().Renamed1023()] = true;
      }
      
      private function Renamed2862(param1:Tank) : void
      {
         var _loc2_:Dictionary = battleService.Renamed647();
         delete _loc2_[param1.Renamed1075().Renamed1020()];
         delete _loc2_[param1.Renamed1075().Renamed1023()];
      }
      
      public function Renamed2907(param1:Tank) : void
      {
         this.Renamed2546[param1.tankData.userName] = param1;
         param1.Renamed1119(battleService);
         this.Renamed2432.dispatchEvent(new Renamed884(param1,param1.tankData.local));
      }
      
      public function Renamed2861(param1:Tank) : void
      {
         if(this.Renamed2546[param1.Renamed695().id])
         {
            delete this.Renamed2546[param1.Renamed695().id];
            param1.Renamed1068();
            battleEventDispatcher.dispatchEvent(new Renamed891(param1));
         }
      }
      
      private function Renamed2830(param1:Renamed894) : void
      {
         this.Renamed2908();
      }
      
      private function Renamed2908() : void
      {
         var _loc1_:ClientObject = null;
         var _loc2_:Tank = null;
         for each(_loc1_ in Renamed2775.Renamed2895())
         {
            _loc2_ = this.getTankData(_loc1_).tank;
            if(_loc2_ != null)
            {
               _loc2_.disable();
               this.Renamed2886(_loc2_.Renamed695(),Renamed1140.DISABLED);
               this.Renamed2898(_loc2_.Renamed695()).Renamed2713(Renamed1140.DISABLED,false);
            }
         }
      }
      
      private function Renamed2831(param1:Renamed901) : void
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Tank = null;
         for each(_loc2_ in Renamed2775.Renamed2895())
         {
            _loc3_ = this.getTankData(_loc2_).tank;
            this.Renamed2861(_loc3_);
         }
      }
      
      public function Renamed2909(param1:Renamed603, param2:Renamed603) : void
      {
         this.Renamed2812.Renamed2910(param1,param2);
         this.Renamed2911();
         this.Renamed2814 = new Renamed2770(battleService.Renamed656(),object);
         battleService.Renamed619().Renamed815(this.Renamed2814);
      }
      
      public function setReadyToPlace() : void
      {
         this.Renamed2911();
         server.setReadyToPlace();
      }
      
      private function Renamed2911() : void
      {
         if(this.Renamed2814)
         {
            battleService.Renamed619().Renamed816(this.Renamed2814);
            this.Renamed2814 = null;
         }
      }
      
      public function spawn(param1:ClientObject, param2:Renamed663, param3:Renamed603, param4:Renamed603, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Renamed2722 = null;
         var _loc9_:Renamed775 = this.getTankData(param1);
         if(_loc9_.local)
         {
            Renamed2866.teamType = param2;
         }
         var _loc10_:Tank = _loc9_.tank;
         this.Renamed2861(_loc10_);
         _loc10_.spawn(param2,param6);
         _loc10_.Renamed1113();
         this.Renamed2912(_loc9_,param5);
         this.Renamed2887(param1,Renamed1140.DEAD | Renamed1140.DISABLED);
         _loc7_ = this.Renamed2739(_loc9_.user).isLocal ? int(this.Renamed2847(param1).Renamed2913()) : int(0);
         this.Renamed2852(_loc9_.user,param3,param4,Renamed2779,Renamed2779,_loc7_);
         _loc8_ = this.Renamed2857(param1);
         if(_loc8_)
         {
            _loc8_.Renamed2734(param3,param4);
         }
         if(_loc9_.local)
         {
            this.Renamed2906(_loc10_);
            this.Renamed2841();
            this.Renamed2850();
            this.Renamed2815 = new Renamed2816(getTimer() + battleService.Renamed634(),param1);
            battleService.Renamed619().Renamed815(this.Renamed2815);
            battleService.Renamed641();
            battleService.Renamed639();
            battleService.Renamed619().Renamed808(_loc10_.Renamed696());
            this.getTitle(param1).show();
            this.Renamed2894();
         }
         else
         {
            this.Renamed2906(_loc10_);
            this.Renamed2896(_loc10_.tankData);
            this.Renamed1062(_loc10_.Renamed695()).Renamed2848(0);
         }
         this.Renamed2907(_loc9_.tank);
      }
      
      private function Renamed2850() : void
      {
         if(this.Renamed2815 != null)
         {
            battleService.Renamed619().Renamed816(this.Renamed2815);
            this.Renamed2815 = null;
         }
      }
      
      public function kill(param1:ClientObject, param2:String, param3:int) : void
      {
         this.Renamed2914(param1,param3);
         battleEventDispatcher.dispatchEvent(new Renamed2760(param2,param1.id));
      }
      
      public function Renamed2914(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed775 = this.getTankData(param1);
         if(_loc3_ == null || _loc3_.tank == null)
         {
            return;
         }
         if(_loc3_.local)
         {
            this.Renamed2915(true);
            battleService.Renamed640();
            battleService.Renamed643();
            battleEventDispatcher.dispatchEvent(Renamed907.EVENT);
         }
         _loc3_.health = 0;
         this.Renamed2898(_loc3_.user).Renamed2713(Renamed1140.DEAD,false);
         this.Renamed2898(_loc3_.user).Renamed2716();
         _loc3_.tank.kill();
         _loc3_.tank.disable();
         _loc3_.spawnState = Renamed841.DEAD;
         _loc3_.tank.Renamed1093(_loc3_.tank.Renamed1092() & ~Renamed666.Renamed1449);
         this.Renamed2886(param1,Renamed1140.DEAD);
         this.Renamed2916(_loc3_);
         battleService.Renamed619().Renamed815(new Renamed2771(getTimer() + param2,_loc3_.tank));
         battleEventDispatcher.dispatchEvent(new Renamed2761(_loc3_.tank));
      }
      
      public function setHealth(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed775 = this.getTankData(param1);
         if(_loc3_ != null)
         {
            this.Renamed2912(_loc3_,param2);
         }
      }
      
      public function Renamed2917(param1:ClientObject, param2:Number, param3:Number, param4:Number, param5:Number, param6:int) : void
      {
         var _loc7_:Renamed775 = this.getTankData(param1);
         if(_loc7_ != null)
         {
            this.Renamed2918(_loc7_,param2,param3,param4,param5,false);
            if(_loc7_.local)
            {
               Renamed2866.Renamed2919(param6);
            }
         }
      }
      
      private function Renamed2918(param1:Renamed775, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean) : void
      {
         param1.tank.Renamed1091(Renamed668.Renamed674(param2),param6);
         param1.tank.setMaxTurnSpeed(param3,param6);
         param1.tank.Renamed1107(Renamed668.Renamed674(param5));
         param1.tank.Renamed1062().setMaxTurnSpeed(param4,param6);
         param1.Renamed2872.acceleration = param5;
         param1.Renamed2872.speed = param2;
         param1.Renamed2872.turnSpeed = param3;
         param1.Renamed2872.turretRotationSpeed = param4;
      }
      
      public function Renamed2920() : Dictionary
      {
         return this.Renamed2546;
      }
      
      public function Renamed2921(param1:ClientObject, param2:int, param3:int, param4:Boolean, param5:int) : void
      {
         var _loc6_:UserTitle = null;
         var _loc7_:int = 0;
         var _loc8_:ClientObject = Renamed2775.Renamed695(param1.id);
         var _loc9_:Boolean = true;
         if(_loc8_ != null)
         {
            _loc6_ = this.getTitle(param1);
            if(_loc6_ != null)
            {
               if(_loc6_.hasAnyFlag(TitleConfigFlags.EFFECTS))
               {
                  _loc9_ = false;
                  _loc7_ = this.Renamed2922(param2,param3);
                  _loc6_.showIndicator(param2,_loc7_,param4,param5);
               }
            }
         }
         if(_loc9_)
         {
            Renamed2776.addInitialEffect(param1.id,param2,param3,param5);
         }
      }
      
      private function Renamed2922(param1:int, param2:int) : int
      {
         return int(param2);
      }
      
      public function Renamed2923(param1:ClientObject, param2:int, param3:Boolean) : void
      {
         var _loc4_:UserTitle = null;
         Renamed2776.Renamed2924(param1.id,param2);
         var _loc5_:ClientObject = Renamed2775.Renamed695(param1.id);
         if(_loc5_ != null)
         {
            _loc4_ = this.getTitle(param1);
            if(_loc4_ != null)
            {
               _loc4_.hideIndicator(param2,param3);
            }
         }
      }
      
      private function Renamed2925(param1:int) : Boolean
      {
         return param1 == Renamed1626.Renamed1627;
      }
      
      private function Renamed2885(param1:Renamed775, param2:ClientTank) : void
      {
         var _loc3_:TankState = param2.tankState;
         param1.tank.spawn(param2.teamType,param2.incarnationId);
         this.Renamed2912(param1,param2.health);
         if(param2.health <= 0)
         {
            param1.tank.Renamed1075().Renamed1266();
            param1.tank.title.hide();
            this.Renamed2886(param1.user,Renamed1140.DEAD);
         }
         else
         {
            this.Renamed2887(param1.user,Renamed1140.ALL);
            param1.tank.title.show();
            this.Renamed2896(param1);
            this.Renamed2898(param1.user).Renamed2715();
            this.Renamed2898(param1.user).Renamed2714(Renamed1140.ALL);
         }
         this.Renamed2852(param1.user,_loc3_.position,_loc3_.orientation,Renamed2779,Renamed2779,_loc3_.control);
         this.Renamed2845(param1.user,_loc3_.turretAngle,_loc3_.turretControl);
         switch(param2.spawnState)
         {
            case Renamed841.Renamed1114:
               param1.tank.Renamed1113();
               break;
            case Renamed841.Renamed854:
               param1.tank.Renamed1117();
         }
         this.Renamed2907(param1.tank);
      }
      
      private function Renamed2881(param1:Renamed775) : void
      {
         Renamed2745(modelRegistry.getModelsByInterface(Renamed2752)[0]).localTankLoaded(param1.tank);
         Renamed2835(Renamed2753(this.Renamed2847(param1.user)));
         this.Renamed2812 = new Renamed2813(battleService.Renamed655());
         if(battleService.Renamed655())
         {
            param1.user.putParams(Renamed2758,new Renamed2758(object,server));
         }
         this.Renamed2786 = new Renamed2787(param1.tank,this.Renamed2546);
         this.Renamed2788 = new Renamed2789(param1.tank);
         var _loc2_:Renamed2865 = new Renamed2865(param1.tank,this.Renamed2546);
         param1.user.putParams(Renamed2865,_loc2_);
         battleService.Renamed621().Renamed1410(_loc2_);
         battleService.Renamed635(param1.tank);
         param1.user.putParams(Renamed2751,new Renamed2751(param1.tank));
         param1.user.putParams(Renamed2747,new Renamed2747(param1.tank));
         param1.user.putParams(Renamed2750,new Renamed2750(param1.user));
         param1.user.putParams(Renamed2867,new Renamed2867(param1.user));
         battleService.Renamed654();
      }
      
      private function onSettingsAccepted(param1:Renamed893) : void
      {
         if(this.Renamed2847(Renamed775.Renamed824.user) != null)
         {
            Renamed2835(Renamed2753(this.Renamed2847(Renamed775.Renamed824.user)));
         }
      }
      
      public function Renamed2926() : void
      {
         battleService.Renamed619().Renamed828(this.Renamed2786);
         battleService.Renamed619().Renamed828(this.Renamed2788);
      }
      
      public function Renamed2927(param1:int) : void
      {
         this.Renamed2786.Renamed2928();
      }
      
      public function Renamed2915(param1:Boolean) : void
      {
         var _loc2_:Renamed2756 = this.Renamed2847(this.Renamed2799.user);
         this.Renamed2929(_loc2_.Renamed2913(),param1);
         this.Renamed2786.reset();
      }
      
      private function Renamed2929(param1:int, param2:Boolean) : void
      {
         var _loc3_:Tank = null;
         if(this.§ "GRenamed27557!9§.Renamed824.userName] != null)
         {
            _loc3_ = Renamed775.Renamed824.tank;
            this.Renamed2930(param1);
            _loc3_.Renamed1111(this.Renamed2825.position,this.Renamed2825.orientation,this.Renamed2825.Renamed2904,this.Renamed2825.angularVelocity);
            this.Renamed2825.control = param1 | this.Renamed1062(Renamed775.Renamed824.user).getControl();
            this.Renamed2931(battleService.Renamed619().Renamed653(),param2);
         }
      }
      
      private function Renamed2932(param1:int, param2:Boolean) : void
      {
         var _loc3_:Renamed2408 = null;
         var _loc4_:Tank = null;
         var _loc5_:int = 0;
         if(this.§ "GRenamed27557!9§.Renamed824.userName] != null)
         {
            _loc4_ = Renamed775.Renamed824.tank;
            this.Renamed2930(param1);
            _loc4_.Renamed1112(this.Renamed2825.position,this.Renamed2825.orientation,this.Renamed2825.Renamed2904,this.Renamed2825.angularVelocity);
            this.Renamed2825.control = param1;
            _loc5_ = battleService.Renamed619().Renamed653() - Renamed620.Renamed782;
            this.Renamed2931(_loc5_,param2);
         }
      }
      
      public function Renamed2933(param1:Boolean) : void
      {
         var _loc2_:Renamed2756 = this.Renamed2847(Renamed775.Renamed824.user);
         this.Renamed2932(_loc2_.Renamed2913(),true);
      }
      
      private function Renamed2930(param1:int) : void
      {
         if(this.Renamed2819 != param1)
         {
            this.Renamed2819 = param1;
            this.Renamed2843();
         }
      }
      
      private function Renamed2931(param1:int, param2:Boolean) : void
      {
         if(param1 <= this.Renamed2822)
         {
            return;
         }
         if(param2)
         {
            server.Renamed2934(param1,Renamed2866.Renamed2935(),this.Renamed2825,this.Renamed1062(Renamed775.Renamed824.user).Renamed1013());
            Renamed2732.Renamed2936(this.Renamed2825,this.Renamed2821);
            this.Renamed2822 = param1;
         }
         else if(Renamed2732.Renamed2937(this.Renamed2825,this.Renamed2821))
         {
            if(this.Renamed2825.control != this.Renamed2821.control)
            {
               this.Renamed2938(param1,this.Renamed2825.control);
            }
         }
         else
         {
            this.Renamed2939(param1,this.Renamed2825);
         }
      }
      
      private function Renamed2938(param1:int, param2:int) : void
      {
         if(param1 <= this.Renamed2823 || param1 <= this.Renamed2824)
         {
            return;
         }
         server.Renamed2940(param1,Renamed2866.Renamed2935(),param2);
         this.Renamed2821.control = param2;
         this.Renamed2824 = param1;
      }
      
      private function Renamed2939(param1:int, param2:Renamed2772) : void
      {
         if(param1 <= this.Renamed2823)
         {
            return;
         }
         server.moveCommand(param1,Renamed2866.Renamed2935(),param2);
         Renamed2732.Renamed2936(param2,this.Renamed2821);
         this.Renamed2823 = param1;
      }
      
      private function Renamed1017(param1:Renamed663, param2:Renamed663) : Boolean
      {
         return param1 != Renamed663.NONE && param1 == param2;
      }
      
      private function Renamed2916(param1:Renamed775) : void
      {
         battleService.Renamed621().Renamed636(new Renamed2765(param1));
      }
      
      private function Renamed2890() : Renamed2768
      {
         var _loc1_:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         return _loc1_.getModelsByInterface(Renamed2768)[0] as Renamed2768;
      }
      
      private function Renamed2912(param1:Renamed775, param2:int) : void
      {
         var _loc4_:Renamed2741 = null;
         param1.health = param2;
         this.getTitle(param1.user).setHealth(param2);
         var _loc3_:int = 10000;
         if(param1.local)
         {
            _loc4_ = Renamed2741(modelRegistry.getModelsByInterface(Renamed2741)[0]);
            _loc4_.Renamed2941(Renamed1626.Renamed1627,Renamed2740.Renamed2942,param2 >= _loc3_);
         }
      }
      
      private function Renamed2882(param1:Renamed775, param2:TankSpecification, param3:Boolean) : void
      {
         param1.tank.Renamed1108(Renamed668.Renamed674(param2.reverseAcceleration));
         param1.tank.Renamed1109(Renamed668.Renamed674(param2.sideAcceleration));
         param1.tank.setTurnAcceleration(param2.turnAcceleration);
         param1.tank.Renamed1110(param2.reverseTurnAcceleration);
         this.Renamed2918(param1,param2.speed,param2.turnSpeed,param2.turretRotationSpeed,param2.acceleration,true);
      }
      
      private function createTank(param1:Renamed915, param2:Renamed914, param3:Renamed990, param4:Renamed775, param5:TankParts, param6:UserTitle) : Tank
      {
         var _loc7_:Renamed909 = Renamed2833(param5);
         var _loc8_:Renamed917 = new Renamed917(param5.hullObject,param5.turretObject,param5.coloringObject,ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,97860))));
         var _loc9_:int = 10000;
         var _loc10_:Tank;
         (_loc10_ = new Tank(_loc8_,param1,_loc7_,param2,param3,param6,param4.mass,param4.local,battleEventDispatcher,_loc9_,param4.Renamed2872.dampingCoeff)).tankData = param4;
         return _loc10_;
      }
      
      private function Renamed2899(param1:Tank, param2:Number) : void
      {
         param1.Renamed1089(param2);
      }
   }
}

