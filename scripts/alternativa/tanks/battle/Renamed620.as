package alternativa.tanks.battle
{
   import Renamed235.Renamed607;
   import Renamed235.Renamed773;
   import Renamed486.Renamed774;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.media.Sound;
   import flash.utils.getTimer;
   import Renamed373.Renamed665;
   import Renamed373.Renamed776;
   import Renamed373.Renamed777;
   import Renamed373.Renamed606;
   import Renamed409.Renamed778;
   import Renamed409.Renamed779;
   import Renamed409.Renamed780;
   import Renamed409.Renamed781;
   
   public class Renamed620
   {
      [Inject]
      public static var battleService:BattleService;
      
      public static const Renamed782:int = 33;
      
      public static const Renamed783:Number = 0.033;
      
      private static const Renamed784:EncryptedInt = new EncryptedIntImpl(1000);
      
      public var Renamed785:Renamed755;
      
      private var time:int;
      
      private var Renamed786:int;
      
      private var Renamed787:Vector.<Renamed768>;
      
      private var Renamed788:Boolean;
      
      private var Renamed789:Vector.<Renamed790>;
      
      private var Renamed791:Vector.<Renamed752>;
      
      private var Renamed792:Vector.<Renamed793>;
      
      private var Renamed794:Vector.<Renamed754>;
      
      private var Renamed795:Body;
      
      private var Renamed796:Boolean;
      
      private var Renamed633:Renamed607;
      
      private var physicsScene:Renamed777;
      
      public function Renamed620(param1:Number, param2:Sound, param3:BattleEventDispatcher)
      {
         this.Renamed797 = new Renamed798();
         this.Renamed785 = new Renamed755(30);
         this.Renamed787 = new Vector.<Renamed768>();
         this.Renamed794 = new Vector.<Renamed754>();
         this.Renamed789 = new Vector.<Renamed790>();
         this.Renamed791 = new Vector.<Renamed752>();
         this.Renamed792 = new Vector.<Renamed793>();
         super();
         this.time = getTimer();
         this.physicsScene = new Renamed777(this.time,param1,param3);
         this.Renamed633 = Renamed773.Renamed799(param2);
         this.Renamed786 = this.time;
         Renamed776.Renamed800();
      }
      
      public function Renamed801() : Renamed607
      {
         return this.Renamed633;
      }
      
      public function Renamed802(param1:Vector.<CollisionShape>) : void
      {
         this.physicsScene.Renamed802(param1);
      }
      
      public function Renamed692() : Renamed665
      {
         return this.physicsScene.Renamed692();
      }
      
      public function Renamed803(param1:Renamed804) : void
      {
         this.Renamed797.add(param1);
      }
      
      public function Renamed805(param1:Renamed804) : void
      {
         this.Renamed797.remove(param1);
      }
      
      public function Renamed806(param1:Renamed606) : void
      {
         this.physicsScene.addBody(param1);
      }
      
      public function Renamed807(param1:Renamed606) : void
      {
         this.physicsScene.removeBody(param1);
         if(this.Renamed795 == param1.body)
         {
            this.Renamed808(null);
         }
      }
      
      public function Renamed808(param1:Body) : void
      {
         this.Renamed795 = param1;
      }
      
      public function shutdown() : void
      {
         this.Renamed633.Renamed809();
         this.Renamed633.Renamed810();
         this.physicsScene.destroy();
      }
      
      public function Renamed811(param1:Renamed790) : void
      {
         if(this.Renamed796)
         {
            this.Renamed812(new Renamed780(param1,true));
         }
         else if(this.Renamed789.indexOf(param1) < 0)
         {
            this.Renamed789.push(param1);
         }
      }
      
      public function tick() : void
      {
         var _loc1_:int = getTimer();
         var _loc2_:int = _loc1_ - this.time;
         this.time = _loc1_;
         this.Renamed813(Renamed782);
         battleService.Renamed621().render(this.time,_loc2_);
         battleService.Renamed622().update();
         this.Renamed633.Renamed814(_loc2_,battleService.Renamed621().Renamed739());
      }
      
      public function Renamed815(param1:Renamed768) : void
      {
         if(this.Renamed788)
         {
            this.Renamed812(new Renamed779(param1,true));
         }
         else if(this.Renamed787.indexOf(param1) < 0)
         {
            this.Renamed787.push(param1);
         }
      }
      
      public function Renamed816(param1:Renamed768) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.Renamed788)
         {
            this.Renamed812(new Renamed779(param1,false));
         }
         else
         {
            _loc2_ = int(this.Renamed787.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.Renamed787.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.Renamed787[_loc3_] = this.Renamed787[--_loc2_];
                  this.Renamed787.length = _loc2_;
               }
            }
         }
      }
      
      private function Renamed817(param1:int) : void
      {
         var _loc2_:Renamed768 = null;
         var _loc3_:int = param1 - this.Renamed786;
         this.Renamed786 = param1;
         this.Renamed788 = true;
         var _loc4_:int = int(this.Renamed787.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.Renamed787[_loc5_];
            _loc2_.Renamed769(param1,_loc3_);
            _loc5_++;
         }
         this.Renamed788 = false;
         this.Renamed818();
      }
      
      private function Renamed813(param1:int) : void
      {
         this.Renamed785.Renamed762();
         while(this.physicsScene.Renamed653() < this.time)
         {
            this.Renamed819();
            this.Renamed817(this.Renamed653());
            this.Renamed796 = true;
            this.Renamed820(param1 / Renamed784.getInt());
            this.physicsScene.update(param1);
            this.Renamed821(param1 / Renamed784.getInt());
            this.Renamed797.Renamed822(this.Renamed795);
            this.Renamed796 = false;
            this.Renamed818();
         }
         this.Renamed785.Renamed763();
         this.Renamed823();
      }
      
      private function Renamed819() : void
      {
         var _loc1_:Renamed775 = Renamed775.Renamed824;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.tank == null)
         {
            return;
         }
         _loc1_.tank.Renamed825();
      }
      
      private function Renamed818() : void
      {
         var _loc1_:Renamed754 = null;
         while(_loc1_ = this.Renamed794.pop(), _loc1_ != null)
         {
            _loc1_.execute();
         }
      }
      
      private function Renamed820(param1:Number) : void
      {
         var _loc2_:Renamed790 = null;
         var _loc3_:int = int(this.Renamed789.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.Renamed789[_loc4_];
            _loc2_.runBeforePhysicsUpdate(param1);
            _loc4_++;
         }
      }
      
      private function Renamed821(param1:Number) : void
      {
         var _loc2_:Renamed752 = null;
         var _loc3_:int = int(this.Renamed791.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.Renamed791[_loc4_];
            _loc2_.Renamed753(param1);
            _loc4_++;
         }
      }
      
      private function Renamed823() : void
      {
         var _loc1_:Renamed793 = null;
         var _loc2_:Number = 1 + (this.time - this.physicsScene.Renamed653()) / Renamed782;
         var _loc3_:int = int(this.Renamed792.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this.Renamed792[_loc4_];
            _loc1_.interpolatePhysicsState(_loc2_);
            _loc4_++;
         }
      }
      
      private function Renamed812(param1:Renamed754) : void
      {
         this.Renamed794.push(param1);
      }
      
      public function Renamed826(param1:Renamed790) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.Renamed796)
         {
            this.Renamed812(new Renamed780(param1,false));
         }
         else
         {
            _loc2_ = int(this.Renamed789.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.Renamed789.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.Renamed789.splice(_loc3_,1);
               }
            }
         }
      }
      
      public function Renamed827(param1:Renamed752) : void
      {
         if(this.Renamed796)
         {
            this.Renamed812(new Renamed778(param1));
         }
         else if(this.Renamed791.indexOf(param1) < 0)
         {
            this.Renamed791.push(param1);
         }
      }
      
      public function Renamed828(param1:Renamed752) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.Renamed796)
         {
            this.Renamed812(new Renamed781(param1));
         }
         else
         {
            _loc2_ = int(this.Renamed791.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.Renamed791.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.Renamed791.splice(_loc3_,1);
               }
            }
         }
      }
      
      public function Renamed829(param1:Renamed793) : void
      {
         if(this.Renamed792.indexOf(param1) < 0)
         {
            this.Renamed792.push(param1);
         }
      }
      
      public function Renamed830(param1:Renamed793) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.Renamed792.length);
         if(_loc3_ > 0)
         {
            _loc2_ = int(this.Renamed792.indexOf(param1));
            if(_loc2_ >= 0)
            {
               this.Renamed792[_loc2_] = this.Renamed792[--_loc3_];
               this.Renamed792.length = _loc3_;
            }
         }
      }
      
      public function Renamed653() : int
      {
         return this.physicsScene.Renamed653();
      }
      
      public function Renamed831() : Number
      {
         return this.physicsScene.Renamed831();
      }
   }
}

