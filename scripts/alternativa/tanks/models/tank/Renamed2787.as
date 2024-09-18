package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.Renamed752;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed907;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import Renamed373.Renamed2944;
   
   public class Renamed2787 extends Renamed832 implements Renamed752
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const Renamed2945:Number = 2;
      
      private static const Renamed2946:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const Renamed2947:EncryptedInt = new EncryptedIntImpl(2000);
      
      private static const Renamed2948:Number = 500;
      
      private static const Renamed2949:Number = 200;
      
      private static const Renamed2950:Number = Renamed2948 * Renamed2948;
      
      private static const Renamed2951:Number = 300000;
      
      private var tank:Tank;
      
      private var Renamed2952:int;
      
      private var Renamed2953:Vector3;
      
      private var Renamed2954:Number;
      
      private var Renamed2546:Dictionary;
      
      private var Renamed2955:int;
      
      private var Renamed2956:Boolean;
      
      private var Renamed2957:Boolean;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed2958:Boolean = false;
      
      public function Renamed2787(param1:Tank, param2:Dictionary)
      {
         this.Renamed2953 = new Vector3();
         super();
         this.tank = param1;
         this.Renamed2546 = param2;
         this.Renamed2957 = true;
         this.Renamed2432 = new Renamed902(battleEventDispatcher);
         this.Renamed2432.Renamed904(Renamed907,this.Renamed2959);
         this.Renamed2432.Renamed905();
      }
      
      private function Renamed2959(param1:Object) : void
      {
         this.Renamed2957 = true;
      }
      
      public function reset() : void
      {
         this.Renamed2952 = Renamed619().Renamed653();
         this.Renamed2953.copy(this.Renamed2960());
         this.Renamed2955 = this.tank.Renamed856().Renamed1217 + this.tank.Renamed857().Renamed1217;
         this.Renamed2956 = this.tank.Renamed1007() || this.tank.Renamed1009();
         this.Renamed2954 = this.Renamed2961();
      }
      
      public function Renamed753(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Boolean = this.Renamed2962() || this.Renamed2957;
         this.Renamed2957 = false;
         if(this.tank.Renamed1009())
         {
            for each(_loc2_ in this.tank.Renamed1011())
            {
            }
         }
         if(this.Renamed2963() || this.tank.Renamed1128())
         {
            this.Renamed2964();
         }
         if(_loc3_ || this.Renamed2965())
         {
            this.Renamed2966(_loc3_);
            this.Renamed2958 = false;
         }
      }
      
      private function Renamed2963() : Boolean
      {
         return Renamed2943.Renamed2967(this.Renamed2953,this.tank.Renamed696().state.position);
      }
      
      private function Renamed2964() : void
      {
         this.Renamed2952 = Renamed619().Renamed653() - Renamed620.Renamed782;
         this.Renamed2953.copy(this.Renamed2968());
         this.Renamed2969().Renamed2933(true);
      }
      
      private function Renamed2968() : Vector3
      {
         return this.tank.Renamed696().prevState.position;
      }
      
      private function Renamed2965() : Boolean
      {
         return this.Renamed2970() || this.Renamed2958;
      }
      
      private function Renamed2962() : Boolean
      {
         return this.Renamed2971() || this.Renamed2972() || this.Renamed2973() || this.Renamed2974() || this.Renamed2975() || this.Renamed2976() || this.tank.Renamed1129() || this.tank.Renamed1130();
      }
      
      public function Renamed2928() : void
      {
         this.Renamed2958 = true;
      }
      
      private function Renamed2975() : Boolean
      {
         var _loc1_:Boolean = this.tank.Renamed1007() || this.tank.Renamed1009();
         return _loc1_ != this.Renamed2956;
      }
      
      private function Renamed2974() : Boolean
      {
         var _loc1_:int = this.tank.Renamed856().Renamed1217 + this.tank.Renamed857().Renamed1217;
         return this.Renamed2955 == 0 && _loc1_ != 0 || this.Renamed2955 != 0 && _loc1_ == 0;
      }
      
      private function Renamed2970() : Boolean
      {
         return Renamed619().Renamed653() - this.Renamed2952 >= Renamed2947.getInt();
      }
      
      private function Renamed2971() : Boolean
      {
         return this.Renamed2953.distanceToXYSquared(this.Renamed2960()) > Renamed2950;
      }
      
      private function Renamed2972() : Boolean
      {
         return Math.abs(this.Renamed2953.z - this.Renamed2960().z) > Renamed2949;
      }
      
      private function Renamed2966(param1:Boolean) : void
      {
         this.reset();
         this.Renamed2969().Renamed2915(param1);
      }
      
      private function Renamed2960() : Vector3
      {
         return this.tank.Renamed696().state.position;
      }
      
      private function Renamed2976() : Boolean
      {
         var _loc1_:Number = this.Renamed2961() - this.Renamed2954;
         return _loc1_ > Renamed2951;
      }
      
      private function Renamed2973() : Boolean
      {
         var _loc1_:int = Renamed2946.getInt();
         return this.Renamed2977() && getTimer() - this.Renamed2952 > _loc1_;
      }
      
      private function Renamed2961() : Number
      {
         var _loc1_:BodyState = this.tank.Renamed696().state;
         var _loc2_:Number = _loc1_.position.z * Math.abs(Renamed619().Renamed831());
         var _loc3_:Number = _loc1_.velocity.length();
         var _loc4_:Number = _loc3_ * _loc3_ * 0.5;
         return _loc4_ + _loc2_;
      }
      
      private function Renamed2977() : Boolean
      {
         var _loc1_:Tank = null;
         var _loc2_:Body = null;
         var _loc3_:BodyState = null;
         var _loc4_:Body = this.tank.Renamed696();
         var _loc5_:BodyState = _loc4_.state;
         var _loc6_:Number = this.tank.Renamed852();
         var _loc7_:Number = Renamed2945;
         for each(var _loc10_ in this.Renamed2546)
         {
            _loc1_ = _loc10_;
            _loc10_;
            if(this.tank != _loc1_)
            {
               _loc2_ = _loc1_.Renamed696();
               _loc3_ = _loc2_.state;
               if(Renamed2944.test(_loc5_.position,_loc5_.velocity,_loc6_,_loc3_.position,_loc3_.velocity,_loc1_.Renamed852(),_loc7_))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function Renamed2969() : Renamed2407
      {
         return Renamed2407(OSGi.getInstance().getService(Renamed2408));
      }
   }
}

