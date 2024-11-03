package Renamed475
{
   import Renamed136.Renamed663;
   import Renamed142.Renamed1626;
   import Renamed142.Renamed2740;
   import Renamed142.Renamed2741;
   import Renamed4553.Renamed4554;
   import Renamed4553.Renamed5127;
   import Renamed206.Renamed4573;
   import Renamed206.Renamed6103;
   import Renamed206.Renamed6120;
   import Renamed206.Renamed5125;
   import Renamed29.Renamed7379;
   import Renamed29.Renamed7383;
   import Renamed29.Renamed5432;
   import Renamed4607.Renamed7117;
   import Renamed4607.Renamed4608;
   import Renamed289.Renamed6109;
   import Renamed4643.Renamed4644;
   import Renamed4643.Renamed9363;
   import Renamed4643.Renamed9364;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed660;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.Renamed885;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed901;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.types.Long;
   import Renamed329.Renamed2761;
   import Renamed63.Renamed617;
   import Renamed63.Renamed7382;
   import flash.utils.Dictionary;
   import Renamed392.Renamed8443;
   import Renamed405.Renamed5126;
   import Renamed405.Renamed8583;
   import Renamed408.Renamed8610;
   import Renamed408.Renamed4705;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Renamed4630 extends Renamed6120 implements Renamed4573, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, Renamed4631, Renamed511
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed4728:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed2423:BattleGUIService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private var Renamed5462:Vector.<Renamed660>;
      
      private var Renamed5448:Renamed2553;
      
      private var Renamed2798:Renamed2741;
      
      private var Renamed9365:Dictionary;
      
      private var Renamed5461:Vector.<Renamed9366>;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed6350:Renamed4705;
      
      private var Renamed9367:Renamed8443;
      
      private var Renamed3014:Tank;
      
      private var Renamed2546:Dictionary;
      
      private var Renamed3695:IGameObject;
      
      private var Renamed9368:Renamed9369;
      
      private var Renamed9370:Renamed9364;
      
      private var Renamed9371:Renamed4644;
      
      private var Renamed974:Renamed8583;
      
      public function Renamed4630()
      {
         this.Renamed9365 = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed901,this.Renamed2831);
         this.Renamed2432.Renamed904(Renamed885,this.Renamed9372);
         this.Renamed2432.Renamed904(Renamed889,this.Renamed5463);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed904(Renamed2761,this.Renamed5465);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
      }
      
      private static function Renamed9373(param1:IGameObject, param2:Long) : IGameObject
      {
         return param1.space.getObject(param2);
      }
      
      private static function Renamed9374(param1:Renamed5125) : Renamed663
      {
         if(param1 == Renamed5125.RED)
         {
            return Renamed663.RED;
         }
         if(param1 == Renamed5125.BLUE)
         {
            return Renamed663.BLUE;
         }
         throw new Error();
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         this.Renamed2546[param1.tank.tankData.userName] = param1.tank;
         var _loc2_:int = this.Renamed9375().Renamed9376(param1.tank.tankData.userName);
         if(_loc2_ >= 0)
         {
            this.Renamed9377(_loc2_,param1.tank,this.Renamed9370);
         }
      }
      
      private function Renamed9378(param1:Class) : Object
      {
         Model.object = this.Renamed3695;
         var _loc2_:Object = getData(param1);
         Model.popObject();
         return _loc2_;
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         var _loc2_:Tank = param1.tank;
         this.Renamed9379().Renamed1070(_loc2_);
         delete this.Renamed2546[_loc2_];
      }
      
      private function Renamed5463(param1:Renamed889) : void
      {
         if(param1.isLocal)
         {
            this.Renamed3014 = param1.tank;
            this.Renamed6350.show();
            this.Renamed9367.visible = true;
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         if(param1.tank == this.Renamed3014)
         {
            this.Renamed3014 = null;
         }
      }
      
      private function Renamed5465(param1:Renamed2761) : void
      {
         this.Renamed9379().Renamed1070(param1.Renamed5508);
      }
      
      private function Renamed9379() : Renamed4644
      {
         return this.Renamed9371;
      }
      
      private function Renamed9372(param1:Object) : void
      {
         var _loc2_:Renamed660 = null;
         var _loc3_:Renamed663 = Renamed885(param1).tank.teamType;
         for each(_loc2_ in this.Renamed5462)
         {
            _loc2_.Renamed833(_loc3_);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.Renamed3695 = Model.object;
         this.Renamed5448 = Renamed2553(OSGi.getInstance().getService(Renamed2553));
         this.Renamed2798 = Renamed2741(modelRegistry.getModelsByInterface(Renamed2741)[0]);
         this.Renamed5461 = new Vector.<Renamed9366>();
         this.Renamed2546 = new Dictionary();
         this.Renamed2432.Renamed905();
         this.Renamed9368 = new Renamed9369();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost() : void
      {
         this.Renamed5469();
         this.Renamed9380();
         this.Renamed9370 = new Renamed9364(Renamed4728,getInitParam().resources);
         this.Renamed9371 = new Renamed4644();
         this.Renamed974 = new Renamed8583(battleService.Renamed633,getInitParam().Renamed974);
      }
      
      private function Renamed5469() : void
      {
         this.Renamed5462 = new Vector.<Renamed660>();
         var _loc1_:Renamed7383 = new Renamed7383();
         battleService.Renamed625(_loc1_);
         this.Renamed5462.push(_loc1_);
         var _loc2_:Renamed5432 = new Renamed5432();
         battleService.Renamed628(_loc2_);
         this.Renamed5462.push(_loc2_);
         var _loc3_:Renamed7379 = new Renamed7379();
         battleService.Renamed630(_loc3_);
         this.Renamed5462.push(_loc3_);
         var _loc4_:Renamed7382 = new Renamed7382();
         battleService.Renamed650(_loc4_);
         this.Renamed5462.push(_loc4_);
      }
      
      private function Renamed9380() : void
      {
         var _loc1_:Renamed6103 = null;
         var _loc2_:Renamed5127 = null;
         var _loc3_:Renamed9366 = null;
         var _loc4_:Renamed9369 = null;
         var _loc5_:String = null;
         this.Renamed6350 = new Renamed4705(battleService.Renamed621().Renamed739());
         battleService.Renamed621().Renamed1287(this.Renamed6350,0);
         var _loc6_:Vector.<Renamed5127> = new Vector.<Renamed5127>();
         for each(_loc1_ in getInitParam().Renamed6119)
         {
            _loc2_ = this.Renamed9381(_loc1_);
            this.Renamed9365[_loc1_.id] = _loc2_;
            battleService.Renamed619().Renamed815(_loc2_);
            _loc6_.push(_loc2_);
            _loc3_ = new Renamed9366(_loc2_.getPosition(),Renamed668.Renamed674(getInitParam().Renamed6116),Renamed668.Renamed674(getInitParam().Renamed6118),_loc1_.id,this,battleService.Renamed619().Renamed692(),getInitParam().Renamed6117);
            this.Renamed5461.push(_loc3_);
            battleService.Renamed619().Renamed803(_loc3_);
            this.Renamed6350.Renamed1383(new Renamed8610(_loc2_));
            _loc4_ = this.Renamed9375();
            for each(_loc5_ in _loc1_.Renamed6107)
            {
               _loc4_.add(_loc5_,_loc1_.id);
            }
         }
         this.Renamed9367 = new Renamed8443(_loc6_);
         this.Renamed9367.visible = false;
         Renamed2423.Renamed2575().addChild(this.Renamed9367);
         battleService.Renamed621().Renamed1287(this.Renamed9367,0);
         this.Renamed5448.Renamed2563(this.Renamed9367);
         if(battleInfoService.isSpectatorMode())
         {
            this.Renamed6350.show();
            this.Renamed9367.visible = true;
         }
      }
      
      private function Renamed9381(param1:Renamed6103) : Renamed5127
      {
         var _loc2_:Renamed4554 = new Renamed4554(param1.name,battleService.Renamed621(),getInitParam().resources);
         var _loc3_:Vector3 = Renamed668.Renamed681(param1.position);
         var _loc4_:Renamed6109 = getInitParam().Renamed974;
         var _loc5_:Renamed5126 = new Renamed5126(battleService,_loc4_.Renamed7362.sound,_loc4_.Renamed7361.sound);
         var _loc6_:Renamed5127;
         (_loc6_ = new Renamed5127(param1.id,param1.name,_loc3_,battleService,this,_loc5_,_loc2_)).Renamed5135 = param1.Renamed6107.length;
         _loc6_.Renamed5136(param1.state);
         _loc6_.Renamed5138(param1.score,param1.Renamed6106);
         return _loc6_;
      }
      
      private function Renamed9375() : Renamed9369
      {
         return this.Renamed9368;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.Renamed5462 = null;
         battleService.Renamed625(null);
         battleService.Renamed628(null);
         battleService.Renamed630(null);
         battleService.Renamed650(null);
         this.Renamed2432.Renamed906();
         this.Renamed9367.removeFromParent();
         this.Renamed9367 = null;
         this.Renamed2546 = null;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6100(param1:int, param2:String) : void
      {
         var _loc3_:Renamed5127 = this.Renamed9365[param1];
         ++_loc3_.Renamed5135;
         var _loc4_:Tank = this.Renamed2546[param2];
         if(_loc4_ != null)
         {
            this.Renamed9377(param1,_loc4_,this.Renamed9370);
         }
         else
         {
            this.Renamed9375().add(param2,param1);
         }
      }
      
      private function Renamed9377(param1:int, param2:Tank, param3:Renamed9364) : void
      {
         var _loc4_:Renamed9363 = Renamed9363(battleService.Renamed618().getObject(Renamed9363));
         var _loc5_:Renamed5127 = this.Renamed9365[param1];
         var _loc6_:Vector3 = new Vector3();
         _loc5_.readPosition(_loc6_);
         _loc4_.init(param2.Renamed1075().Renamed1268(),_loc6_,param3.Renamed9382(param2.teamType),battleService.Renamed647());
         this.Renamed9379().Renamed1121(param2,_loc4_);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6101(param1:int, param2:String) : void
      {
         var _loc3_:Renamed5127 = this.Renamed9365[param1];
         --_loc3_.Renamed5135;
         var _loc4_:Tank = this.Renamed2546[param2];
         if(_loc4_ != null)
         {
            this.Renamed9379().Renamed1070(_loc4_);
         }
         else
         {
            this.Renamed9375().remove(param2);
         }
      }
      
      public function Renamed2525() : Renamed2395
      {
         return Renamed2395.Renamed2396;
      }
      
      public function Renamed649() : Renamed617
      {
         var _loc1_:Renamed7382 = new Renamed7382();
         this.Renamed5462.push(_loc1_);
         return _loc1_;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6097(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:Renamed5127 = this.Renamed9365[param1];
         _loc4_.Renamed5138(param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6098(param1:int, param2:Renamed5125) : void
      {
         var _loc3_:Renamed5127 = this.Renamed9365[param1];
         var _loc4_:Renamed5125 = _loc3_.Renamed5137();
         _loc3_.Renamed5136(param2);
         if(param2 == Renamed5125.NEUTRAL)
         {
            this.Renamed9383(_loc3_,_loc4_);
         }
         else
         {
            this.Renamed9384(_loc3_);
         }
      }
      
      private function Renamed9383(param1:Renamed5127, param2:Renamed5125) : void
      {
         var _loc3_:Renamed663 = Renamed9374(param2);
         var _loc4_:Renamed4608 = this.Renamed9385(_loc3_);
         var _loc5_:String = _loc4_.getMessage(param1.getName());
         this.Renamed5448.Renamed2561(_loc4_.color,_loc5_);
         this.Renamed5448.Renamed2562(_loc5_);
         this.Renamed9386().Renamed8588(_loc3_);
      }
      
      private function Renamed9385(param1:Renamed663) : Renamed4608
      {
         if(this.Renamed3014 == null)
         {
            return Renamed7117.Renamed7129(param1);
         }
         if(param1 == this.Renamed3014.teamType)
         {
            return Renamed7117.Renamed7120;
         }
         return Renamed7117.Renamed7121;
      }
      
      private function Renamed9384(param1:Renamed5127) : void
      {
         var _loc2_:Renamed663 = Renamed9374(param1.Renamed5137());
         var _loc3_:Renamed4608 = this.Renamed7128(_loc2_);
         var _loc4_:String = _loc3_.getMessage(param1.getName());
         this.Renamed5448.Renamed2561(_loc3_.color,_loc4_);
         this.Renamed5448.Renamed2562(_loc4_);
         this.Renamed9386().Renamed8587(_loc2_);
      }
      
      private function Renamed7128(param1:Renamed663) : Renamed4608
      {
         if(this.Renamed3014 == null)
         {
            return Renamed7117.Renamed7128(param1);
         }
         if(param1 == this.Renamed3014.teamType)
         {
            return Renamed7117.Renamed7118;
         }
         return Renamed7117.Renamed7119;
      }
      
      private function Renamed9387() : void
      {
         var _loc1_:Renamed5127 = null;
         for each(_loc1_ in this.Renamed9365)
         {
            _loc1_.reset();
         }
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6095(param1:Renamed663) : void
      {
         this.Renamed9386().Renamed8585(param1);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6096(param1:Renamed663) : void
      {
         this.Renamed9386().Renamed8586(param1);
      }
      
      private function Renamed9386() : Renamed8583
      {
         return this.Renamed974;
      }
      
      public function Renamed6326(param1:int) : void
      {
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
      }
      
      public function Renamed6327(param1:int) : void
      {
         this.Renamed2432.dispatchEvent(Renamed869.Renamed871);
      }
      
      public function Renamed9388(param1:int) : void
      {
         this.Renamed2798.Renamed2941(Renamed1626.MINE,Renamed2740.Renamed2942,true);
      }
      
      public function Renamed9389(param1:int) : void
      {
         this.Renamed2798.Renamed2941(Renamed1626.MINE,Renamed2740.Renamed2942,false);
      }
      
      private function Renamed2831(param1:Object) : void
      {
         this.reset();
      }
      
      private function reset() : void
      {
         this.Renamed9387();
         this.Renamed9390();
      }
      
      private function Renamed9390() : void
      {
         var _loc1_:Renamed9366 = null;
         for each(_loc1_ in this.Renamed5461)
         {
            _loc1_.reset();
         }
      }
      
      public function Renamed5144(param1:int) : void
      {
         var _loc2_:int = param1;
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6099() : void
      {
         this.reset();
      }
   }
}

