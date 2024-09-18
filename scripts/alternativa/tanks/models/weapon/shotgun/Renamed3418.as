package alternativa.tanks.models.weapon.shotgun
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3031;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   import Renamed85.Renamed86;
   
   public class Renamed3418
   {
      [Inject]
      public static var battleService:BattleService;
      
      public static const Renamed669:Vector3 = new Vector3();
      
      private static const Renamed3419:Number = 90;
      
      private static const Renamed3420:Number = 0.001;
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private static const Renamed3421:Vector3 = new Vector3();
      
      private static const Renamed3422:Vector3 = new Vector3();
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private var targets:Vector.<Renamed667>;
      
      private var Renamed3423:Vector.<Renamed667>;
      
      private var Renamed3424:Number;
      
      private var Renamed3425:Renamed3426;
      
      private var Renamed860:int;
      
      private var collisionDetector:Renamed665;
      
      private var Renamed3427:Renamed613;
      
      private var Renamed3107:Renamed3031;
      
      private var weapon:Renamed3046;
      
      public function Renamed3418(param1:Renamed3426, param2:Renamed3046)
      {
         this.targets = new Vector.<Renamed667>();
         this.Renamed3423 = new Vector.<Renamed667>();
         this.Renamed3107 = new Renamed3031();
         super();
         this.Renamed3425 = param1;
         this.weapon = param2;
         this.Renamed860 = this.Renamed3428(param2);
         this.collisionDetector = battleService.Renamed619().Renamed692();
         this.Renamed3427 = battleService.Renamed624();
      }
      
      public function Renamed3376(param1:Renamed664, param2:Body, param3:Vector3) : Vector.<Renamed667>
      {
         var _loc20_:Renamed667 = null;
         var _loc21_:BodyState = null;
         var _loc4_:Vector.<Vector3> = null;
         var _loc5_:Number = NaN;
         var _loc6_:Vector3 = null;
         var _loc7_:Tank = null;
         var _loc8_:Vector.<Renamed667> = null;
         this.Renamed3425.next();
         this.Renamed3424 = -1e+100;
         this.Renamed3107.Renamed3032 = param2;
         var _loc9_:Renamed86 = this.weapon.Renamed3047();
         var _loc10_:Number = _loc9_.Renamed3053();
         var _loc11_:Number = _loc9_.Renamed3051();
         var _loc12_:Number = this.weapon.Renamed3058().Renamed3429();
         var _loc13_:Number = this.weapon.Renamed3058().Renamed3430();
         var _loc14_:Number = -_loc10_;
         var _loc15_:Number = (_loc10_ + _loc11_) / (this.Renamed860 - 1);
         var _loc16_:Number = Math.max(_loc10_,_loc11_);
         var _loc17_:Vector3 = param1.Renamed3025;
         matrix.fromAxisAngle(_loc17_,_loc14_);
         matrix.transformVector(param1.direction,Renamed3421);
         matrix.fromAxisAngle(_loc17_,_loc15_);
         var _loc18_:Number = -1;
         var _loc19_:int = 0;
         while(_loc19_ < this.Renamed860)
         {
            _loc4_ = this.Renamed3425.Renamed3431(_loc17_,Renamed3421);
            this.targets.length = 0;
            _loc5_ = -Math.abs(_loc14_) / _loc16_ * Renamed3420;
            for each(_loc6_ in _loc4_)
            {
               if(this.collisionDetector.raycast(param1.Renamed689,_loc6_,Renamed666.WEAPON,_loc12_,this.Renamed3107,Renamed1299))
               {
                  _loc7_ = Renamed1299.shape.body.tank as Tank;
                  if(_loc7_ != null)
                  {
                     _loc21_ = _loc7_.Renamed696().state;
                     _loc21_.orientation.getEulerAngles(Renamed669);
                     this.targets.push(new Renamed667(Renamed668.Renamed677(Renamed669),Renamed668.Renamed677(_loc21_.position),_loc7_.Renamed695(),_loc7_.Renamed697(),Renamed668.Renamed677(Renamed1299.position.clone())));
                     _loc5_ += this.Renamed3427.Renamed3385(Renamed1299.shape.body,Renamed1299.t,_loc14_,_loc13_,_loc16_);
                  }
               }
            }
            if(_loc18_ < _loc5_)
            {
               _loc18_ = _loc5_;
               param3.copy(Renamed3421);
               _loc8_ = this.targets;
               this.targets = this.Renamed3423;
               this.Renamed3423 = _loc8_;
            }
            if(_loc19_ + 1 < this.Renamed860)
            {
               Renamed3422.copy(Renamed3421);
               matrix.transformVector(Renamed3422,Renamed3421);
               _loc14_ += _loc15_;
            }
            _loc19_++;
         }
         this.targets.length = 0;
         for each(_loc20_ in this.Renamed3423)
         {
            this.targets.push(_loc20_);
         }
         this.Renamed3423.length = 0;
         return this.targets;
      }
      
      private function Renamed3428(param1:Renamed3046) : int
      {
         var _loc2_:Renamed86 = param1.Renamed3047();
         var _loc3_:Number = param1.Renamed3058().Renamed3430();
         var _loc4_:Number = _loc2_.Renamed3053() + _loc2_.Renamed3051();
         return Math.ceil(_loc4_ / (2 * Math.atan(Renamed3419 / (2 * _loc3_)))) + 1;
      }
   }
}

