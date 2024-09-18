package Renamed4567
{
   import Renamed155.Renamed5176;
   import Renamed155.Renamed4555;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.Renamed793;
   import alternativa.tanks.battle.Renamed790;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import Renamed356.Renamed616;
   import flash.errors.IllegalOperationError;
   import Renamed373.Renamed666;
   
   public class Renamed4568 extends Renamed1444 implements Renamed790, Renamed919, Renamed793, IRayCollisionFilter
   {
      [Inject]
      public static var battleService:BattleService;
      
      protected static const thousandth:EncryptedInt = new EncryptedIntImpl(1000);
      
      protected static const Renamed6050:Matrix3 = new Matrix3();
      
      protected static const Renamed672:RayHit = new RayHit();
      
      protected static const Renamed6051:Vector3 = new Vector3();
      
      private static const Renamed6052:Vector3 = new Vector3();
      
      private static const Renamed6053:Vector3 = new Vector3();
      
      private var shotId:int;
      
      protected var Renamed6054:Boolean;
      
      protected var Renamed6055:Boolean;
      
      protected var Renamed6056:Body;
      
      protected var Renamed1469:Number = 0;
      
      protected var Renamed6057:Vector3;
      
      protected var Renamed6058:Vector3;
      
      protected var Renamed1148:Vector3;
      
      protected var Renamed689:Vector3;
      
      protected var Renamed969:Vector3;
      
      protected var Renamed6059:Vector.<Vector3>;
      
      protected var Renamed6060:Renamed4555;
      
      public function Renamed4568(param1:Renamed1443)
      {
         this.Renamed6061 = 2 * Math.PI / this.Renamed6062();
         this.Renamed6057 = new Vector3();
         this.Renamed6058 = new Vector3();
         this.Renamed1148 = new Vector3();
         this.Renamed689 = new Vector3();
         this.Renamed969 = new Vector3();
         super(param1);
         this.Renamed6059 = new Vector.<Vector3>(this.Renamed6062(),true);
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed6062())
         {
            this.Renamed6059[_loc2_] = new Vector3();
            _loc2_++;
         }
      }
      
      private static function Renamed6063(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = 10000000000;
         var _loc5_:Number = param1.x < 0 ? Number(-param1.x) : Number(param1.x);
         if(_loc5_ < _loc4_)
         {
            _loc4_ = _loc5_;
            _loc3_ = 0;
         }
         _loc5_ = param1.y < 0 ? Number(-param1.y) : Number(param1.y);
         if(_loc5_ < _loc4_)
         {
            _loc4_ = _loc5_;
            _loc3_ = 1;
         }
         _loc5_ = param1.z < 0 ? Number(-param1.z) : Number(param1.z);
         if(_loc5_ < _loc4_)
         {
            _loc3_ = 2;
         }
         if(_loc3_ == 0)
         {
            param2.reset(0,param1.z,-param1.y);
         }
         else if(_loc3_ == 1)
         {
            param2.reset(-param1.z,0,param1.x);
         }
         else if(_loc3_ == 2)
         {
            param2.reset(param1.y,-param1.x,0);
         }
      }
      
      protected function Renamed6064() : Renamed4555
      {
         if(this.Renamed6054)
         {
            return Renamed5176.INSTANCE;
         }
         return Renamed4555(battleService.Renamed618().getObject(Renamed4555));
      }
      
      public function Renamed6065(param1:Renamed664, param2:Vector3, param3:Body, param4:int = -1) : void
      {
         this.Renamed1469 = 0;
         this.Renamed6055 = true;
         this.shotId = param4;
         this.Renamed6054 = param4 == -1;
         this.Renamed689.copy(param1.Renamed689);
         this.Renamed6058.copy(param1.Renamed693);
         this.Renamed1148.copy(param1.Renamed693);
         this.Renamed6057.copy(param2);
         this.Renamed6056 = param3;
         battleService.Renamed619().Renamed811(this);
         battleService.Renamed619().Renamed829(this);
         battleService.Renamed621().Renamed1287(this,0);
         this.Renamed6060 = this.Renamed6064();
         this.Renamed6060.start(this.Renamed6058,param2);
      }
      
      public function runBeforePhysicsUpdate(param1:Number) : void
      {
         if(this.Renamed6055)
         {
            this.Renamed6055 = false;
            this.Renamed6066(param1);
         }
         else
         {
            this.update(param1);
         }
      }
      
      private function Renamed6066(param1:Number) : void
      {
         if(!this.Renamed6067())
         {
            this.Renamed6068(this.Renamed6058,this.Renamed6057);
            this.update(param1);
         }
      }
      
      protected function Renamed6067() : Boolean
      {
         var _loc1_:Body = null;
         var _loc2_:Vector3 = null;
         var _loc3_:CollisionDetector = battleService.Renamed619().Renamed692();
         Renamed6053.diff(this.Renamed6058,this.Renamed689);
         var _loc4_:Number = Renamed6053.length();
         Renamed6053.normalize();
         if(_loc3_.raycast(this.Renamed689,Renamed6053,Renamed666.WEAPON,_loc4_,this,Renamed672))
         {
            _loc1_ = Renamed672.shape.body;
            if(_loc1_.tank == null)
            {
               Renamed672.position.subtract(Renamed6053);
            }
            this.Renamed6069(_loc1_,Renamed672.position,Renamed6053,_loc4_);
            return true;
         }
         this.Renamed6068(this.Renamed689,Renamed6053);
         var _loc5_:int = 0;
         while(_loc5_ < this.Renamed6062())
         {
            _loc2_ = this.Renamed6059[_loc5_];
            if(_loc3_.raycast(_loc2_,Renamed6053,Renamed666.WEAPON,_loc4_,this,Renamed672))
            {
               _loc1_ = Renamed672.shape.body;
               if(Renamed668.Renamed687(_loc1_))
               {
                  Renamed6051.copy(this.Renamed689).addScaled(Renamed672.t,Renamed6053);
                  this.Renamed6069(_loc1_,Renamed6051,Renamed6053,_loc4_);
                  return true;
               }
            }
            _loc5_++;
         }
         return false;
      }
      
      protected function destroy() : void
      {
         battleService.Renamed619().Renamed826(this);
         battleService.Renamed619().Renamed830(this);
         battleService.Renamed621().Renamed1289(this,0);
         this.Renamed6060.destroy();
         recycle();
      }
      
      protected function Renamed6068(param1:Vector3, param2:Vector3) : void
      {
         Renamed6063(param2,Renamed6052);
         Renamed6052.normalize().scale(this.Renamed6070());
         Renamed6050.fromAxisAngle(param2,this.Renamed6061);
         Vector3(this.Renamed6059[0]).sum(param1,Renamed6052);
         var _loc3_:int = 1;
         while(_loc3_ < this.Renamed6062())
         {
            Renamed6052.transform3(Renamed6050);
            Vector3(this.Renamed6059[_loc3_]).sum(param1,Renamed6052);
            _loc3_++;
         }
      }
      
      public function interpolatePhysicsState(param1:Number) : void
      {
         this.Renamed969.interpolate(param1,this.Renamed1148,this.Renamed6058);
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.Renamed6056 != param1;
      }
      
      public function Renamed6071() : int
      {
         return this.shotId;
      }
      
      protected function Renamed6062() : int
      {
         return 8;
      }
      
      protected function update(param1:Number) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function Renamed6072(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:int) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function Renamed6073(param1:Number) : int
      {
         return Math.round(Renamed672.t / param1 * Renamed620.Renamed782);
      }
      
      protected function Renamed6069(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         this.Renamed6072(param1,param2,param3,this.Renamed1469 + Renamed672.t,this.Renamed6073(param4));
      }
      
      protected function Renamed6070() : Number
      {
         throw new IllegalOperationError();
      }
      
      public function render(param1:int, param2:int) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function Renamed2460() : Renamed616
      {
         return battleService.Renamed618();
      }
      
      protected function Renamed1496() : Renamed610
      {
         return battleService.Renamed621();
      }
   }
}

