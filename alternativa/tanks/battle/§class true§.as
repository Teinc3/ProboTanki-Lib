package alternativa.tanks.battle
{
   import §14§.§7"]§;
   import §14§.§package set for§;
   import §]J§.§%§;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.media.Sound;
   import flash.utils.getTimer;
   import §for set super§.§!"N§;
   import §for set super§.§#!!§;
   import §for set super§.§6"4§;
   import §for set super§.§=-§;
   import §override package get§.§3#F§;
   import §override package get§.§=!Z§;
   import §override package get§.§set const break§;
   import §override package get§.§switch for import§;
   
   public class §class true§
   {
      [Inject]
      public static var battleService:BattleService;
      
      public static const §@"r§:int = 33;
      
      public static const §2#e§:Number = 0.033;
      
      private static const §throw catch while§:EncryptedInt = new EncryptedIntImpl(1000);
      
      public var §!",§:§6"L§;
      
      private var time:int;
      
      private var §with package else§:int;
      
      private var §^!Z§:Vector.<§;!t§>;
      
      private var §@§:Boolean;
      
      private var §while const continue§:Vector.<§return const break§>;
      
      private var §%!Z§:Vector.<§4%§>;
      
      private var §in for override§:Vector.<§native var const§>;
      
      private var §;!O§:Vector.<§6!k§>;
      
      private var §?!R§:Body;
      
      private var §break for if§:Boolean;
      
      private var §&S§:§7"]§;
      
      private var physicsScene:§6"4§;
      
      public function §class true§(param1:Number, param2:Sound, param3:BattleEventDispatcher)
      {
         this.§[#+§ = new §%#1§();
         this.§!",§ = new §6"L§(30);
         this.§^!Z§ = new Vector.<§;!t§>();
         this.§;!O§ = new Vector.<§6!k§>();
         this.§while const continue§ = new Vector.<§return const break§>();
         this.§%!Z§ = new Vector.<§4%§>();
         this.§in for override§ = new Vector.<§native var const§>();
         super();
         this.time = getTimer();
         this.physicsScene = new §6"4§(this.time,param1,param3);
         this.§&S§ = §package set for§.§[# §(param2);
         this.§with package else§ = this.time;
         §#!!§.§catch const native§();
      }
      
      public function §'M§() : §7"]§
      {
         return this.§&S§;
      }
      
      public function §do set implements§(param1:Vector.<CollisionShape>) : void
      {
         this.physicsScene.§do set implements§(param1);
      }
      
      public function §const const true§() : §!"N§
      {
         return this.physicsScene.§const const true§();
      }
      
      public function §;!+§(param1:§`§) : void
      {
         this.§[#+§.add(param1);
      }
      
      public function §final const in§(param1:§`§) : void
      {
         this.§[#+§.remove(param1);
      }
      
      public function §set for get§(param1:§=-§) : void
      {
         this.physicsScene.addBody(param1);
      }
      
      public function §0#X§(param1:§=-§) : void
      {
         this.physicsScene.removeBody(param1);
         if(this.§?!R§ == param1.body)
         {
            this.§%"§(null);
         }
      }
      
      public function §%"§(param1:Body) : void
      {
         this.§?!R§ = param1;
      }
      
      public function shutdown() : void
      {
         this.§&S§.§return each§();
         this.§&S§.§return for get§();
         this.physicsScene.destroy();
      }
      
      public function §^c§(param1:§return const break§) : void
      {
         if(this.§break for if§)
         {
            this.§each catch dynamic§(new §set const break§(param1,true));
         }
         else if(this.§while const continue§.indexOf(param1) < 0)
         {
            this.§while const continue§.push(param1);
         }
      }
      
      public function tick() : void
      {
         var _loc1_:int = getTimer();
         var _loc2_:int = _loc1_ - this.time;
         this.time = _loc1_;
         this.§function const try§(§@"r§);
         battleService.§3l§().render(this.time,_loc2_);
         battleService.§7#P§().update();
         this.§&S§.§=#z§(_loc2_,battleService.§3l§().§super package§());
      }
      
      public function §%#9§(param1:§;!t§) : void
      {
         if(this.§@§)
         {
            this.§each catch dynamic§(new §=!Z§(param1,true));
         }
         else if(this.§^!Z§.indexOf(param1) < 0)
         {
            this.§^!Z§.push(param1);
         }
      }
      
      public function §%"7§(param1:§;!t§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§@§)
         {
            this.§each catch dynamic§(new §=!Z§(param1,false));
         }
         else
         {
            _loc2_ = int(this.§^!Z§.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.§^!Z§.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.§^!Z§[_loc3_] = this.§^!Z§[--_loc2_];
                  this.§^!Z§.length = _loc2_;
               }
            }
         }
      }
      
      private function §with catch extends§(param1:int) : void
      {
         var _loc2_:§;!t§ = null;
         var _loc3_:int = param1 - this.§with package else§;
         this.§with package else§ = param1;
         this.§@§ = true;
         var _loc4_:int = int(this.§^!Z§.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.§^!Z§[_loc5_];
            _loc2_.§var package implements§(param1,_loc3_);
            _loc5_++;
         }
         this.§@§ = false;
         this.§3#3§();
      }
      
      private function §function const try§(param1:int) : void
      {
         this.§!",§.§?""§();
         while(this.physicsScene.§]"d§() < this.time)
         {
            this.§`"$§();
            this.§with catch extends§(this.§]"d§());
            this.§break for if§ = true;
            this.§finally package case§(param1 / §throw catch while§.getInt());
            this.physicsScene.update(param1);
            this.§finally const null§(param1 / §throw catch while§.getInt());
            this.§[#+§.§5!t§(this.§?!R§);
            this.§break for if§ = false;
            this.§3#3§();
         }
         this.§!",§.§in catch else§();
         this.§static package static§();
      }
      
      private function §`"$§() : void
      {
         var _loc1_:§7!9§ = §7!9§.§8"-§;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.tank == null)
         {
            return;
         }
         _loc1_.tank.§each break§();
      }
      
      private function §3#3§() : void
      {
         var _loc1_:§6!k§ = null;
         while(_loc1_ = this.§;!O§.pop(), _loc1_ != null)
         {
            _loc1_.execute();
         }
      }
      
      private function §finally package case§(param1:Number) : void
      {
         var _loc2_:§return const break§ = null;
         var _loc3_:int = int(this.§while const continue§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.§while const continue§[_loc4_];
            _loc2_.runBeforePhysicsUpdate(param1);
            _loc4_++;
         }
      }
      
      private function §finally const null§(param1:Number) : void
      {
         var _loc2_:§4%§ = null;
         var _loc3_:int = int(this.§%!Z§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.§%!Z§[_loc4_];
            _loc2_.§function const static§(param1);
            _loc4_++;
         }
      }
      
      private function §static package static§() : void
      {
         var _loc1_:§native var const§ = null;
         var _loc2_:Number = 1 + (this.time - this.physicsScene.§]"d§()) / §@"r§;
         var _loc3_:int = int(this.§in for override§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this.§in for override§[_loc4_];
            _loc1_.interpolatePhysicsState(_loc2_);
            _loc4_++;
         }
      }
      
      private function §each catch dynamic§(param1:§6!k§) : void
      {
         this.§;!O§.push(param1);
      }
      
      public function §7`§(param1:§return const break§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§break for if§)
         {
            this.§each catch dynamic§(new §set const break§(param1,false));
         }
         else
         {
            _loc2_ = int(this.§while const continue§.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.§while const continue§.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.§while const continue§.splice(_loc3_,1);
               }
            }
         }
      }
      
      public function §true for implements§(param1:§4%§) : void
      {
         if(this.§break for if§)
         {
            this.§each catch dynamic§(new §3#F§(param1));
         }
         else if(this.§%!Z§.indexOf(param1) < 0)
         {
            this.§%!Z§.push(param1);
         }
      }
      
      public function §finally set throw§(param1:§4%§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§break for if§)
         {
            this.§each catch dynamic§(new §switch for import§(param1));
         }
         else
         {
            _loc2_ = int(this.§%!Z§.length);
            if(_loc2_ > 0)
            {
               _loc3_ = int(this.§%!Z§.indexOf(param1));
               if(_loc3_ >= 0)
               {
                  this.§%!Z§.splice(_loc3_,1);
               }
            }
         }
      }
      
      public function §,j§(param1:§native var const§) : void
      {
         if(this.§in for override§.indexOf(param1) < 0)
         {
            this.§in for override§.push(param1);
         }
      }
      
      public function §]#r§(param1:§native var const§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§in for override§.length);
         if(_loc3_ > 0)
         {
            _loc2_ = int(this.§in for override§.indexOf(param1));
            if(_loc2_ >= 0)
            {
               this.§in for override§[_loc2_] = this.§in for override§[--_loc3_];
               this.§in for override§.length = _loc3_;
            }
         }
      }
      
      public function §]"d§() : int
      {
         return this.physicsScene.§]"d§();
      }
      
      public function §16§() : Number
      {
         return this.physicsScene.§16§();
      }
   }
}

