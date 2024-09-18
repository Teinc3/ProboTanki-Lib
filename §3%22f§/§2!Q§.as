package §3"f§
{
   import alternativa.tanks.models.battle.battlefield.§for catch while§;
   import assets.icons.BattleInfoIcons;
   import §break for null§.§'B§;
   import §catch for null§.§!#Q§;
   import §catch for null§.§6#`§;
   import controls.resultassets.WhiteFrame;
   import flash.display.Sprite;
   import §return set null§.§case var set§;
   import §return set null§.§switch for default§;
   
   public class §2!Q§ extends Sprite
   {
      private static const §1h§:int = 1;
      
      private static const §-"a§:int = 1;
      
      private static const §8!?§:int = 3;
      
      private static const §switch const while§:int = 30;
      
      private var §#!X§:§for catch while§;
      
      private var §while package while§:WhiteFrame;
      
      private var §extends set class§:§%"d§;
      
      private var §@!#§:§6#`§;
      
      private var §static var do§:§switch for default§;
      
      private var §static const false§:§case var set§;
      
      private var §case const each§:int;
      
      private var scoreLimit:int;
      
      public function §2!Q§(param1:§for catch while§, param2:int, param3:§'B§, param4:int, param5:Boolean)
      {
         super();
         this.§#!X§ = param1;
         this.§case const each§ = param3.timeLimitInSec;
         this.scoreLimit = param3.scoreLimit;
         this.§while package while§ = new WhiteFrame();
         addChild(this.§while package while§);
         this.§extends set class§ = new §%"d§(BattleInfoIcons.MONEY);
         this.§extends set class§.§?#2§(param2);
         addChild(this.§extends set class§);
         this.§[F§(param5);
         if(this.§case const each§ > 0)
         {
            this.§static var do§ = new §switch for default§(§switch const while§,BattleInfoIcons.TIME_LIMIT,§!#Q§.instance,false);
            this.§static var do§.value = param4;
            addChild(this.§static var do§);
         }
      }
      
      private function §?!G§() : int
      {
         switch(this.§#!X§)
         {
            case §for catch while§.CTF:
               return BattleInfoIcons.CTF;
            case §for catch while§.§static switch§:
            case §for catch while§.AS:
               return BattleInfoIcons.§import set super§;
            default:
               return BattleInfoIcons.KILL_LIMIT;
         }
      }
      
      public function §1E§(param1:int) : void
      {
         if(this.§@!#§ != null)
         {
            if(param1 >= this.scoreLimit - this.§for var function§())
            {
               this.§@!#§.§"!V§();
            }
         }
      }
      
      private function §for var function§() : int
      {
         switch(this.§#!X§)
         {
            case §for catch while§.CTF:
               return §1h§;
            case §for catch while§.§static switch§:
               return §-"a§;
            default:
               return §8!?§;
         }
      }
      
      public function §>?§(param1:int) : void
      {
         this.§extends set class§.§?#2§(param1);
      }
      
      public function reset() : void
      {
         if(this.§@!#§ != null)
         {
            this.§@!#§.value = this.scoreLimit;
         }
         if(this.§static var do§ != null)
         {
            this.§static var do§.value = this.§case const each§;
         }
         if(this.§static const false§ != null)
         {
            this.§"#"§();
         }
      }
      
      public function §default var extends§() : void
      {
         if(this.§@!#§ != null)
         {
            this.§@!#§.§default var extends§();
         }
         if(this.§static var do§ != null)
         {
            this.§static var do§.value = 0;
            this.§static var do§.§default var extends§();
         }
         if(this.§static const false§ != null)
         {
            this.§static const false§.value = 0;
            this.§static const false§.§default var extends§();
         }
      }
      
      public function §in const each§() : void
      {
         this.§extends set class§.x = 14;
         this.§extends set class§.y = 11;
         var _loc1_:Number = this.§extends set class§.width + this.§extends set class§.x;
         if(this.§@!#§ != null)
         {
            this.§@!#§.x = _loc1_ + 6;
            this.§@!#§.y = 11;
            _loc1_ = this.§@!#§.width + this.§@!#§.x;
         }
         if(this.§static var do§ != null)
         {
            this.§static var do§.x = _loc1_ + 10;
            this.§static var do§.y = 11;
            _loc1_ = this.§static var do§.width + this.§static var do§.x;
         }
         if(this.§static const false§ != null)
         {
            if(this.§static var do§ != null)
            {
               this.§static const false§.x = this.§static var do§.x;
               this.§static const false§.y = this.§static var do§.y;
            }
            else
            {
               this.§static const false§.x = _loc1_ + 10;
               this.§static const false§.y = 11;
               _loc1_ = this.§static const false§.width + this.§static const false§.x;
            }
         }
         this.§while package while§.width = 12 + _loc1_;
      }
      
      public function §const package null§(param1:int) : void
      {
         if(this.§static var do§ != null)
         {
            this.§static var do§.visible = false;
         }
         this.§static const false§ = new §case var set§(§switch const while§,BattleInfoIcons.TIME_LIMIT,§!#Q§.instance,false);
         this.§static const false§.§'!z§(param1);
         addChild(this.§static const false§);
      }
      
      public function §"#"§() : void
      {
         if(this.§static var do§ != null)
         {
            this.§static var do§.visible = true;
         }
         removeChild(this.§static const false§);
         this.§static const false§ = null;
      }
      
      public function §#d§(param1:int) : void
      {
         this.§static var do§.§'!z§(param1);
      }
      
      public function §do package final§() : void
      {
         this.§static var do§.§3!-§();
      }
      
      public function §[F§(param1:Boolean) : void
      {
         if(this.§@!#§ == null && param1 && this.scoreLimit > 0)
         {
            this.§@!#§ = new §6#`§(this.§for var function§(),this.§?!G§(),§!#Q§.instance);
            this.§@!#§.value = this.scoreLimit;
            addChild(this.§@!#§);
         }
      }
   }
}

