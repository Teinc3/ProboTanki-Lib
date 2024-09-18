package §7"j§
{
   import § w§.§ [§;
   import § w§.§+!a§;
   import § w§.§static for get§;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import §for set super§.§super const continue§;
   import forms.ranks.BigRankIcon;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class §'#h§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var §@#R§:TextureMaterialRegistry;
      
      private static const §9L§:Class = §false break§;
      
      private static const §final const native§:BitmapData = new §9L§().bitmapData;
      
      private static const §2!j§:Class = §2"8§;
      
      private static const §`!S§:BitmapData = new §2!j§().bitmapData;
      
      private static const §&Z§:Class = §;"J§;
      
      private static const §var native§:BitmapData = new §&Z§().bitmapData;
      
      private static const origin:Vector3 = new Vector3();
      
      private static const §3!D§:Vector3 = new Vector3(0,0,1);
      
      private static const §extends const default§:RayHit = new RayHit();
      
      public function §'#h§()
      {
         super();
      }
      
      private static function §implements catch dynamic§(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         origin.reset(param1,param2,param3);
         var _loc5_:CollisionDetector = battleService.§'x§().§const const true§();
         if(_loc5_.raycastStatic(origin,§3!D§,§super const continue§.§finally catch while§,param4,null,§extends const default§))
         {
            return §extends const default§.t;
         }
         return param4;
      }
      
      public function §&N§(param1:Tank, param2:int) : void
      {
         var _loc3_:Object3D = param1.§in package default§().§&K§();
         var _loc4_:Number = this.§^h§(_loc3_.x,_loc3_.y,_loc3_.z);
         this.§else set native§(_loc4_,_loc3_);
         this.createLabel(param1.tankData.userName,_loc4_,param2,_loc3_);
         this.§for class§(_loc4_,_loc3_);
         this.§>!8§(_loc3_);
      }
      
      private function §^h§(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = 500;
         var _loc5_:Number = 2000;
         var _loc6_:Number = §implements catch dynamic§(param1,param2,param3,_loc5_);
         return Math.max(_loc4_,_loc6_);
      }
      
      private function §else set native§(param1:Number, param2:Object3D) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:§+!a§ = null;
         var _loc6_:int = 6;
         var _loc7_:Number = 90;
         var _loc8_:Number = 0;
         var _loc9_:Number = Math.PI * 2 / _loc6_;
         var _loc10_:TextureMaterial = §@#R§.getMaterial(§final const native§);
         var _loc11_:int = 0;
         while(_loc11_ < _loc6_)
         {
            _loc3_ = Math.sin(_loc8_) * _loc7_;
            _loc4_ = Math.cos(_loc8_) * _loc7_;
            _loc5_ = §+!a§(battleService.§class while§().getObject(§+!a§));
            _loc5_.init(500,200,30,param1,0.8,0.5,_loc3_,_loc4_,-50,param2,_loc10_);
            battleService.§3l§().§7"0§(_loc5_);
            _loc8_ += _loc9_;
            _loc11_++;
         }
      }
      
      private function createLabel(param1:String, param2:Number, param3:int, param4:Object3D) : void
      {
         var _loc5_:BigRankIcon = new BigRankIcon();
         var _loc6_:Boolean = userInfoService.hasPremium(param1);
         _loc5_.init(_loc6_,param3);
         var _loc7_:BitmapData = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         _loc7_.draw(_loc5_);
         var _loc8_:TextureMaterial = new TextureMaterial(_loc7_,false,true,MipMapping.PER_PIXEL,1);
         var _loc9_:§static for get§ = §static for get§(battleService.§class while§().getObject(§static for get§));
         _loc9_.init(500,270,270,0,param2 * 0.8,param2 * 0.15,0.35,0,0,50,param4,_loc8_,BlendMode.NORMAL);
         battleService.§3l§().§7"0§(_loc9_);
      }
      
      private function §for class§(param1:Number, param2:Object3D) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:TextureMaterial = null;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:§static for get§ = null;
         if(GPUCapabilities.gpuEnabled)
         {
            _loc3_ = 15;
            _loc4_ = 100;
            _loc5_ = §@#R§.getMaterial(§`!S§);
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc7_ = Math.PI * 2 * Math.random();
               _loc8_ = Math.sin(_loc7_) * _loc4_;
               _loc9_ = Math.cos(_loc7_) * _loc4_;
               _loc10_ = -110 * _loc6_ - 50;
               _loc11_ = §static for get§(battleService.§class while§().getObject(§static for get§));
               _loc11_.init(400,150,150,_loc7_,param1 * 0.7,param1 * 0.15,0.7,_loc8_,_loc9_,_loc10_,param2,_loc5_,BlendMode.ADD);
               battleService.§3l§().§7"0§(_loc11_);
               _loc6_++;
            }
         }
      }
      
      private function §>!8§(param1:Object3D) : void
      {
         var _loc2_:TextureMaterial = §@#R§.getMaterial(§var native§);
         var _loc3_:§ [§ = § [§(battleService.§class while§().getObject(§ [§));
         _loc3_.init(900,220,3,true,param1,_loc2_);
         battleService.§3l§().§7"0§(_loc3_);
      }
   }
}

