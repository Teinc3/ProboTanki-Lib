package alternativa.tanks.models.weapon.machinegun
{
   import Renamed23.Renamed24;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3031;
   import Renamed349.Renamed3105;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   import Renamed381.Renamed3045;
   import Renamed462.Renamed3075;
   
   public class Renamed3106 implements Renamed768, Renamed990
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed2948:Number = 1000000;
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private static const Renamed3107:Renamed3031 = new Renamed3031();
      
      private var Renamed3077:Renamed664;
      
      private var Renamed3083:int;
      
      private var lastTime:int;
      
      private var params:Renamed24;
      
      private var target:Tank;
      
      private var Renamed3108:Vector3;
      
      private var Renamed3109:Boolean;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed3080:Renamed3081;
      
      private var Renamed3111:int;
      
      private var Renamed3112:Boolean;
      
      public function Renamed3106(param1:ClientObject, param2:Renamed24, param3:Renamed3075, param4:Renamed3045)
      {
         super();
         this.Renamed3080 = new Renamed3081(param1,param2,param3,param4);
         this.lastTime = 0;
         this.params = param2;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3080.init(param1);
         this.Renamed3110 = param1;
         battleService.Renamed619().Renamed815(this);
      }
      
      public function destroy() : void
      {
         this.Renamed3080.destroy();
         battleService.Renamed619().Renamed816(this);
      }
      
      public function deactivate() : void
      {
         this.disable(false);
      }
      
      public function start() : void
      {
         this.Renamed3080.start();
         this.Renamed3077 = this.Renamed3080.Renamed3087();
         this.Renamed3109 = true;
         this.Renamed3112 = false;
         this.lastTime = this.Renamed3113();
         this.Renamed3083 = this.lastTime + this.params.spinUpTime;
      }
      
      public function Renamed3114(param1:Vector3, param2:Vector.<Renamed3105>) : void
      {
         this.Renamed3077 = this.Renamed3080.Renamed3087();
         this.Renamed3108 = null;
         this.target = null;
         this.Renamed3112 = true;
         this.Renamed3111 = this.Renamed3113();
         var _loc3_:Boolean = false;
         if(param2.length == 0)
         {
            if(this.Renamed3115(param1))
            {
               this.Renamed3108 = Renamed1299.position;
               _loc3_ = Renamed668.Renamed687(Renamed1299.shape.body);
            }
         }
         else
         {
            _loc3_ = true;
            this.Renamed3108 = Renamed668.Renamed681(param2[0].Renamed3116);
            this.target = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTank(param2[0].target);
         }
         this.Renamed3117(_loc3_);
      }
      
      public function stop() : void
      {
         this.Renamed3080.stop();
         this.target = null;
         this.Renamed3109 = false;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         this.Renamed3080.Renamed3090(param2,this.Renamed3109);
         this.Renamed3077 = this.Renamed3080.Renamed3087();
         if(this.Renamed3109)
         {
            this.Renamed3118();
            _loc3_ = this.Renamed3080.Renamed3093(param2,this.lastTime,this.Renamed3083);
            if(_loc3_ > 0)
            {
               this.Renamed3080.Renamed3094(this.Renamed3077.direction,_loc3_);
               if(Boolean(this.target) && this.Renamed3111 + 500 < this.Renamed3113())
               {
                  this.target = null;
               }
               if(this.target != null && this.target.Renamed696() != null)
               {
                  this.Renamed3080.Renamed3096(this.target.Renamed696(),this.Renamed3108,this.Renamed3077.direction,_loc3_);
               }
            }
         }
         this.lastTime = param1;
      }
      
      public function activate() : void
      {
         this.Renamed3080.activate();
         if(this.params.started)
         {
            this.params.started = false;
            this.start();
            this.Renamed3083 = this.lastTime + this.params.spinUpTime * (1 - this.params.state);
            this.Renamed3114(this.Renamed3077.direction,new Vector.<Renamed3105>());
         }
      }
      
      public function enable() : void
      {
         this.Renamed3080.enable();
      }
      
      public function disable(param1:Boolean) : void
      {
         this.stop();
      }
      
      public function reset() : void
      {
         this.Renamed3080.reset();
         this.target = null;
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      private function Renamed3113() : int
      {
         return battleService.Renamed619().Renamed653();
      }
      
      private function Renamed3118() : void
      {
         var _loc1_:Boolean = false;
         if(this.Renamed3080.state == 1 && !this.Renamed3112)
         {
            this.Renamed3077 = this.Renamed3080.Renamed3087();
            _loc1_ = false;
            if(this.Renamed3115(this.Renamed3077.direction))
            {
               this.Renamed3108 = Renamed1299.position;
               _loc1_ = Renamed668.Renamed687(Renamed1299.shape.body);
            }
            else
            {
               this.Renamed3108 = null;
            }
            this.Renamed3117(_loc1_);
         }
      }
      
      private function Renamed3115(param1:Vector3) : Boolean
      {
         var _loc2_:Renamed665 = battleService.Renamed619().Renamed692();
         Renamed3107.Renamed3032 = this.Renamed3110.Renamed696();
         return _loc2_.raycast(this.Renamed3077.Renamed689,param1,Renamed666.WEAPON,Renamed2948,Renamed3107,Renamed1299);
      }
      
      private function Renamed3117(param1:Boolean) : void
      {
         if(this.Renamed3108 != null)
         {
            this.Renamed3080.Renamed3099(this.Renamed3108,param1);
         }
         else
         {
            this.Renamed3080.Renamed3100();
         }
      }
   }
}

