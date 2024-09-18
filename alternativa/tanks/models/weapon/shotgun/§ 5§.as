package alternativa.tanks.models.weapon.shotgun
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§4"z§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import alternativa.tanks.models.weapon.shared.§%#e§;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   import §super var native§.§return for while§;
   
   public class § 5§
   {
      [Inject]
      public static var battleService:BattleService;
      
      public static const §@!c§:Vector3 = new Vector3();
      
      private static const §with for break§:Number = 90;
      
      private static const §throw for try§:Number = 0.001;
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private static const §;"y§:Vector3 = new Vector3();
      
      private static const §8!#§:Vector3 = new Vector3();
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private var targets:Vector.<§default for break§>;
      
      private var §null for use§:Vector.<§default for break§>;
      
      private var §throw for true§:Number;
      
      private var §=C§:§throw implements§;
      
      private var §@x§:int;
      
      private var collisionDetector:§!"N§;
      
      private var §5#k§:§%#e§;
      
      private var §3!<§:§4"z§;
      
      private var weapon:§extends for final§;
      
      public function § 5§(param1:§throw implements§, param2:§extends for final§)
      {
         this.targets = new Vector.<§default for break§>();
         this.§null for use§ = new Vector.<§default for break§>();
         this.§3!<§ = new §4"z§();
         super();
         this.§=C§ = param1;
         this.weapon = param2;
         this.§@x§ = this.§0#x§(param2);
         this.collisionDetector = battleService.§'x§().§const const true§();
         this.§5#k§ = battleService.§static const continue§();
      }
      
      public function §else const implements§(param1:§ !8§, param2:Body, param3:Vector3) : Vector.<§default for break§>
      {
         var _loc20_:§default for break§ = null;
         var _loc21_:BodyState = null;
         var _loc4_:Vector.<Vector3> = null;
         var _loc5_:Number = NaN;
         var _loc6_:Vector3 = null;
         var _loc7_:Tank = null;
         var _loc8_:Vector.<§default for break§> = null;
         this.§=C§.next();
         this.§throw for true§ = -1e+100;
         this.§3!<§.§@"n§ = param2;
         var _loc9_:§return for while§ = this.weapon.§final each§();
         var _loc10_:Number = _loc9_.§static var return§();
         var _loc11_:Number = _loc9_.§2!H§();
         var _loc12_:Number = this.weapon.§use package dynamic§().§6T§();
         var _loc13_:Number = this.weapon.§use package dynamic§().§package finally§();
         var _loc14_:Number = -_loc10_;
         var _loc15_:Number = (_loc10_ + _loc11_) / (this.§@x§ - 1);
         var _loc16_:Number = Math.max(_loc10_,_loc11_);
         var _loc17_:Vector3 = param1.§false var try§;
         matrix.fromAxisAngle(_loc17_,_loc14_);
         matrix.transformVector(param1.direction,§;"y§);
         matrix.fromAxisAngle(_loc17_,_loc15_);
         var _loc18_:Number = -1;
         var _loc19_:int = 0;
         while(_loc19_ < this.§@x§)
         {
            _loc4_ = this.§=C§.§@!9§(_loc17_,§;"y§);
            this.targets.length = 0;
            _loc5_ = -Math.abs(_loc14_) / _loc16_ * §throw for try§;
            for each(_loc6_ in _loc4_)
            {
               if(this.collisionDetector.raycast(param1.§if package var§,_loc6_,§super const continue§.WEAPON,_loc12_,this.§3!<§,§extends const default§))
               {
                  _loc7_ = §extends const default§.shape.body.tank as Tank;
                  if(_loc7_ != null)
                  {
                     _loc21_ = _loc7_.§0"t§().state;
                     _loc21_.orientation.getEulerAngles(§@!c§);
                     this.targets.push(new §default for break§(§+$%§.§,i§(§@!c§),§+$%§.§,i§(_loc21_.position),_loc7_.§if for with§(),_loc7_.§set const implements§(),§+$%§.§,i§(§extends const default§.position.clone())));
                     _loc5_ += this.§5#k§.§case var try§(§extends const default§.shape.body,§extends const default§.t,_loc14_,_loc13_,_loc16_);
                  }
               }
            }
            if(_loc18_ < _loc5_)
            {
               _loc18_ = _loc5_;
               param3.copy(§;"y§);
               _loc8_ = this.targets;
               this.targets = this.§null for use§;
               this.§null for use§ = _loc8_;
            }
            if(_loc19_ + 1 < this.§@x§)
            {
               §8!#§.copy(§;"y§);
               matrix.transformVector(§8!#§,§;"y§);
               _loc14_ += _loc15_;
            }
            _loc19_++;
         }
         this.targets.length = 0;
         for each(_loc20_ in this.§null for use§)
         {
            this.targets.push(_loc20_);
         }
         this.§null for use§.length = 0;
         return this.targets;
      }
      
      private function §0#x§(param1:§extends for final§) : int
      {
         var _loc2_:§return for while§ = param1.§final each§();
         var _loc3_:Number = param1.§use package dynamic§().§package finally§();
         var _loc4_:Number = _loc2_.§static var return§() + _loc2_.§2!H§();
         return Math.ceil(_loc4_ / (2 * Math.atan(§with for break§ / (2 * _loc3_)))) + 1;
      }
   }
}

