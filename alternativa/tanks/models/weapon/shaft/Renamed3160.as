package alternativa.tanks.models.weapon.shaft
{
   import Renamed1.Renamed3263;
   import Renamed1.Renamed3264;
   import Renamed1.Renamed1441;
   import Renamed1.Renamed3265;
   import Renamed1.Renamed1442;
   import Renamed1.set;
   import Renamed1.Renamed3266;
   import Renamed500.Renamed3267;
   import Renamed500.Renamed3268;
   import Renamed500.Renamed3256;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import Renamed356.Renamed616;
   import flash.media.SoundChannel;
   
   public class Renamed3160
   {
      public static const Renamed3260:Number = 200;
      
      public static const Renamed3261:Number = 200;
      
      private static const Renamed3269:Number = 110;
      
      private static const Renamed3270:Number = 0.4;
      
      private static const Renamed3271:Number = 0.8;
      
      private static const Renamed3272:Number = 0.35;
      
      private static const Renamed3273:int = 1000;
      
      private static const Renamed3274:Vector3 = new Vector3();
      
      private static const Renamed3275:int = 300;
      
      private var sfxData:Renamed3186;
      
      private var battleService:BattleService;
      
      private var Renamed3276:SoundChannel;
      
      private var Renamed3277:Renamed3263;
      
      public function Renamed3160(param1:Renamed3186, param2:BattleService)
      {
         super();
         this.sfxData = param1;
         this.battleService = param2;
      }
      
      public function Renamed3278(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.Renamed3276 == null)
            {
               this.Renamed3276 = this.battleService.Renamed633.Renamed2316(this.sfxData.targetingSound,0,9999);
            }
         }
         else if(this.Renamed3276 != null)
         {
            this.battleService.Renamed633.Renamed2317(this.Renamed3276);
            this.Renamed3276 = null;
         }
      }
      
      public function Renamed3200(param1:Object3D) : void
      {
         var _loc2_:Renamed1442 = null;
         if(this.Renamed3277 == null)
         {
            this.Renamed3277 = Renamed3263(this.battleService.Renamed618().getObject(Renamed3263));
            _loc2_ = Renamed1442.create(this.sfxData.zoomModeSound,Renamed3272);
            this.Renamed3277.init(_loc2_,param1,0,9999);
            this.battleService.Renamed637(this.Renamed3277);
         }
      }
      
      public function Renamed3201() : void
      {
         if(this.Renamed3277 != null)
         {
            this.Renamed3277.kill();
            this.Renamed3277 = null;
         }
      }
      
      public function Renamed3219() : void
      {
         if(this.Renamed3277 != null)
         {
            this.Renamed3277.Renamed3279(Renamed3273);
         }
      }
      
      public function Renamed3203(param1:Vector3) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.shotSound,Renamed3270);
         var _loc3_:Renamed1441 = Renamed1441.create(param1,_loc2_);
         this.battleService.Renamed637(_loc3_);
      }
      
      public function Renamed3202(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed616 = this.battleService.Renamed618();
         var _loc4_:Renamed3265 = Renamed3265(_loc3_.getObject(Renamed3265));
         _loc4_.init(param2,param1,10);
         var _loc5_:Renamed3264 = Renamed3264(_loc3_.getObject(Renamed3264));
         _loc5_.init(Renamed3260,Renamed3260,this.sfxData.Renamed3187,0,_loc4_);
         this.battleService.Renamed636(_loc5_);
         this.Renamed3280(param1,param2);
      }
      
      public function Renamed3280(param1:Vector3, param2:Object3D) : void
      {
         var _loc3_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc4_:Renamed3265 = Renamed3265(this.battleService.Renamed618().getObject(Renamed3265));
         _loc4_.init(param2,param1);
         _loc3_.init(_loc4_,this.sfxData.Renamed3192);
         this.battleService.Renamed636(_loc3_);
      }
      
      public function Renamed3205(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3, param4:Vector3, param5:Vector3) : void
      {
         var _loc6_:Vector3 = null;
         if(param1 != null)
         {
            this.Renamed3281(param1,param3,param4,param5,false);
         }
         if(param2 != null)
         {
            for each(_loc6_ in param2)
            {
               if(_loc6_ != null)
               {
                  this.Renamed3281(_loc6_,param3,param4,param5,true);
               }
            }
         }
      }
      
      private function Renamed3281(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3, param5:Boolean) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = this.sfxData.Renamed3191;
         Renamed3274.diff(param1,param2);
         if(Renamed3274.dot(param3) > 0)
         {
            _loc6_ = Renamed3274.length();
            if(_loc6_ > _loc7_)
            {
               _loc6_ = _loc7_;
            }
            this.Renamed3282(Renamed3256,param1,param4,_loc6_,_loc6_ / _loc7_);
            if(param5)
            {
               this.Renamed3282(Renamed3267,param1,param4,_loc6_,0.5);
            }
         }
         this.Renamed3283(param1);
         this.Renamed3284(param1);
      }
      
      private function Renamed3283(param1:Vector3) : void
      {
         var _loc2_:set = set(this.battleService.Renamed618().getObject(set));
         _loc2_.init(param1,Renamed3269);
         var _loc3_:Renamed3264 = Renamed3264(this.battleService.Renamed618().getObject(Renamed3264));
         _loc3_.init(Renamed3261,2.5 * Renamed3261,this.sfxData.Renamed3188,0,_loc2_);
         this.battleService.Renamed636(_loc3_);
         this.Renamed3285(param1);
      }
      
      private function Renamed3285(param1:Vector3) : void
      {
         var _loc2_:Renamed3266 = Renamed3266(this.battleService.Renamed618().getObject(Renamed3266));
         var _loc3_:set = set(this.battleService.Renamed618().getObject(set));
         _loc3_.init(param1,Renamed3269);
         _loc2_.init(_loc3_,this.sfxData.Renamed3194);
         this.battleService.Renamed636(_loc2_);
      }
      
      private function Renamed3284(param1:Vector3) : void
      {
         var _loc2_:Renamed1442 = Renamed1442.create(this.sfxData.explosionSound,Renamed3271);
         var _loc3_:Renamed1441 = Renamed1441(this.battleService.Renamed618().getObject(Renamed1441));
         _loc3_.init(param1,_loc2_,100);
         this.battleService.Renamed637(_loc3_);
      }
      
      private function Renamed3282(param1:Class, param2:Vector3, param3:Vector3, param4:Number, param5:Number) : void
      {
         var _loc6_:Renamed3268 = Renamed3268(this.battleService.Renamed618().getObject(param1));
         _loc6_.init(param2,param3,param4,param5,this.sfxData.Renamed3189,Renamed3275);
         this.battleService.Renamed636(_loc6_);
      }
      
      public function destroy() : void
      {
         if(this.Renamed3276 != null)
         {
            this.battleService.Renamed633.Renamed2317(this.Renamed3276);
            this.Renamed3276 = null;
         }
         this.Renamed3201();
      }
      
      public function Renamed3204(param1:Vector3, param2:Vector3) : void
      {
         if(param2 != null)
         {
            this.battleService.Renamed621().addDecal(param2,param1,50,this.sfxData.Renamed3190);
         }
      }
   }
}

