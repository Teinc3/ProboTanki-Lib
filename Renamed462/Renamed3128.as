package Renamed462
{
   import Renamed23.Renamed24;
   import Renamed1181.Renamed1182;
   import Renamed1.Renamed6982;
   import Renamed1.Renamed3265;
   import Renamed1.set;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1185;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import Renamed356.Renamed616;
   import Renamed396.Renamed4693;
   
   public class Renamed3128
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed9223:Number = 0.1;
      
      private static const Renamed9224:Number = 50;
      
      private static const Renamed9225:Number = 0.001;
      
      private static const Renamed9226:Number = 15;
      
      private static const Renamed9227:Number = 0.59;
      
      private static const Renamed9228:Number = 0.1;
      
      private static const POW:Number = 3;
      
      private var Renamed1197:Renamed1182;
      
      private var Renamed1198:Renamed1182;
      
      private var Renamed1199:Renamed1182;
      
      private var Renamed1200:Renamed1182;
      
      private var spinUpTime:Number;
      
      private var spinDownTime:Number;
      
      private var sfxData:Renamed3075;
      
      private var turret:Object3D;
      
      private var Renamed5852:Vector3;
      
      private var Renamed9229:Renamed4720;
      
      private var Renamed9230:Renamed6982;
      
      private var Renamed633:Renamed4693;
      
      private var Renamed9175:Boolean = false;
      
      private var Renamed9176:Boolean;
      
      private var Renamed9231:Number;
      
      private var Renamed9232:Number = 0;
      
      private var Renamed9233:Boolean = false;
      
      public function Renamed3128(param1:Renamed925, param2:Renamed24, param3:Renamed3075)
      {
         this.Renamed1530 = new Vector3();
         super();
         var _loc4_:Renamed917 = param1.Renamed1075();
         var _loc5_:Renamed1185 = _loc4_.Renamed1270();
         this.turret = _loc4_.Renamed1020();
         this.spinUpTime = param2.spinUpTime;
         this.spinDownTime = param2.spinDownTime;
         this.Renamed5852 = param1.Renamed1071();
         this.sfxData = param3;
         this.Renamed1197 = _loc5_.Renamed1197;
         this.Renamed1198 = _loc5_.Renamed1198;
         this.Renamed1199 = _loc5_.Renamed1199;
         this.Renamed1200 = _loc5_.Renamed1200;
         this.Renamed633 = new Renamed4693(this.turret,param3,this.spinUpTime);
         this.Renamed9231 = 0;
      }
      
      public function Renamed3099(param1:Vector3, param2:Boolean) : void
      {
         this.Renamed9175 = true;
         this.Renamed9176 = param2;
         this.Renamed1530.copy(param1);
         this.Renamed633.Renamed8501(param1,param2);
         if(this.Renamed9229 != null)
         {
            this.Renamed9229.Renamed3099(param1,param2);
         }
      }
      
      public function Renamed3100(param1:Boolean) : void
      {
         this.Renamed9175 = false;
         this.Renamed633.Renamed8503();
         if(this.Renamed9229 != null)
         {
            this.Renamed9229.Renamed3100(param1);
         }
      }
      
      public function update(param1:int, param2:Number, param3:Boolean) : void
      {
         this.Renamed2316(param2,param3);
         var _loc4_:* = param2 == 1;
         var _loc5_:Number = param1 / 1000;
         this.Renamed9231 += _loc5_;
         if(_loc4_)
         {
            this.Renamed9234(_loc5_);
         }
         else
         {
            this.Renamed9235();
         }
         this.Renamed9236(_loc5_,param2);
      }
      
      public function destroy() : void
      {
         this.Renamed9237();
         this.Renamed9238();
         this.Renamed633.destroy();
         this.Renamed633 = null;
         this.Renamed5852 = null;
         this.turret = null;
         this.sfxData = null;
         this.Renamed1197 = null;
         this.Renamed1198 = null;
         this.Renamed1199 = null;
         this.Renamed1200 = null;
      }
      
      private function Renamed2316(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            if(param1 == 1)
            {
               this.Renamed633.Renamed8497();
               this.Renamed9233 = true;
            }
            else
            {
               this.Renamed633.Renamed8496(this.spinUpTime * param1);
            }
         }
         else if(param1 == 0)
         {
            this.Renamed9233 = false;
            this.Renamed633.Renamed2317();
         }
         else if(this.Renamed9233)
         {
            this.Renamed633.Renamed8498();
         }
         else
         {
            this.Renamed633.Renamed8499(param1 * this.spinDownTime);
         }
      }
      
      private function Renamed9234(param1:Number) : void
      {
         this.Renamed9239();
         this.Renamed9240();
         if(this.Renamed9175 && this.Renamed9231 >= Renamed9223)
         {
            this.Renamed9231 = 0;
            this.Renamed9241();
         }
         this.Renamed9232 += param1;
         var _loc2_:Number = this.Renamed9232 % Renamed9228;
         var _loc3_:int = this.Renamed9232 / Renamed9228;
         var _loc4_:Number = _loc3_ * Renamed9227 + Renamed9227 * this.ease(_loc2_ / Renamed9228,POW);
         this.Renamed1199.reset();
         this.Renamed1200.reset();
         this.Renamed1199.rotate(_loc4_ % Renamed9227);
         this.Renamed1200.rotate(-_loc4_ * 0.7);
      }
      
      private function Renamed9239() : void
      {
         if(this.Renamed9229 == null)
         {
            this.Renamed9229 = Renamed4720(battleService.Renamed618().getObject(Renamed4720));
            this.Renamed9229.init(this.turret,this.Renamed5852,this.sfxData);
            battleService.Renamed636(this.Renamed9229);
         }
      }
      
      private function Renamed9240() : void
      {
         var _loc1_:Renamed616 = null;
         var _loc2_:Renamed3265 = null;
         if(this.Renamed9230 == null)
         {
            _loc1_ = battleService.Renamed618();
            this.Renamed9230 = Renamed6982(_loc1_.getObject(Renamed6982));
            _loc2_ = Renamed3265(_loc1_.getObject(Renamed3265));
            _loc2_.init(this.turret,this.Renamed5852);
            this.Renamed9230.init(_loc2_,this.sfxData.Renamed9242,this.sfxData.Renamed9243);
            battleService.Renamed636(this.Renamed9230);
         }
      }
      
      private function Renamed9241() : void
      {
         var _loc1_:set = null;
         var _loc2_:Renamed9214 = null;
         if(!this.Renamed9176)
         {
            _loc1_ = set(battleService.Renamed618().getObject(set));
            _loc1_.init(this.Renamed1530,Renamed9224);
            _loc2_ = Renamed9214(battleService.Renamed618().getObject(Renamed9214));
            _loc2_.init(_loc1_,this.sfxData);
            battleService.Renamed636(_loc2_);
         }
      }
      
      private function ease(param1:Number, param2:Number) : Number
      {
         if(param1 < 0.5)
         {
            param1 *= 2;
            param1 = Math.pow(param1,param2);
            return param1 / 2;
         }
         param1 = 1 - (param1 - 0.5) * 2;
         param1 = Math.pow(param1,param2);
         return (1 - param1) / 2 + 0.5;
      }
      
      private function Renamed9235() : void
      {
         this.Renamed3100(false);
         this.Renamed9237();
         this.Renamed9238();
         this.Renamed9232 = 0;
      }
      
      private function Renamed9237() : void
      {
         if(this.Renamed9229 != null)
         {
            this.Renamed9229.stop();
            this.Renamed9229 = null;
         }
      }
      
      private function Renamed9238() : void
      {
         if(this.Renamed9230 != null)
         {
            this.Renamed9230.stop();
            this.Renamed9230 = null;
         }
      }
      
      private function Renamed9236(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = Renamed9226 * param2;
         if(_loc3_ > Renamed9225)
         {
            this.Renamed1197.rotate(_loc3_ * param1);
            this.Renamed1198.rotate(_loc3_ * param1);
         }
      }
   }
}

