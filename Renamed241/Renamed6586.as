package Renamed6578
{
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import assets.icons.BattleInfoIcons;
   import Renamed312.Renamed1585;
   import Renamed322.Renamed6582;
   import Renamed322.Renamed6583;
   import controls.resultassets.WhiteFrame;
   import flash.display.Sprite;
   import Renamed415.Renamed6584;
   import Renamed415.Renamed6585;
   
   public class Renamed6586 extends Sprite
   {
      private static const Renamed6587:int = 1;
      
      private static const Renamed6588:int = 1;
      
      private static const Renamed6589:int = 3;
      
      private static const Renamed6590:int = 30;
      
      private var Renamed6591:Renamed2395;
      
      private var Renamed6592:WhiteFrame;
      
      private var Renamed6593:Renamed6579;
      
      private var Renamed6594:Renamed6583;
      
      private var Renamed6595:Renamed6585;
      
      private var Renamed6596:Renamed6584;
      
      private var Renamed6597:int;
      
      private var scoreLimit:int;
      
      public function Renamed6586(param1:Renamed2395, param2:int, param3:Renamed1585, param4:int, param5:Boolean)
      {
         super();
         this.Renamed6591 = param1;
         this.Renamed6597 = param3.timeLimitInSec;
         this.scoreLimit = param3.scoreLimit;
         this.Renamed6592 = new WhiteFrame();
         addChild(this.Renamed6592);
         this.Renamed6593 = new Renamed6579(BattleInfoIcons.MONEY);
         this.Renamed6593.Renamed6580(param2);
         addChild(this.Renamed6593);
         this.Renamed6598(param5);
         if(this.Renamed6597 > 0)
         {
            this.Renamed6595 = new Renamed6585(Renamed6590,BattleInfoIcons.TIME_LIMIT,Renamed6582.instance,false);
            this.Renamed6595.value = param4;
            addChild(this.Renamed6595);
         }
      }
      
      private function Renamed6599() : int
      {
         switch(this.Renamed6591)
         {
            case Renamed2395.CTF:
               return BattleInfoIcons.CTF;
            case Renamed2395.Renamed2396:
            case Renamed2395.AS:
               return BattleInfoIcons.Renamed3916;
            default:
               return BattleInfoIcons.KILL_LIMIT;
         }
      }
      
      public function Renamed6600(param1:int) : void
      {
         if(this.Renamed6594 != null)
         {
            if(param1 >= this.scoreLimit - this.Renamed6601())
            {
               this.Renamed6594.Renamed6602();
            }
         }
      }
      
      private function Renamed6601() : int
      {
         switch(this.Renamed6591)
         {
            case Renamed2395.CTF:
               return Renamed6587;
            case Renamed2395.Renamed2396:
               return Renamed6588;
            default:
               return Renamed6589;
         }
      }
      
      public function Renamed6603(param1:int) : void
      {
         this.Renamed6593.Renamed6580(param1);
      }
      
      public function reset() : void
      {
         if(this.Renamed6594 != null)
         {
            this.Renamed6594.value = this.scoreLimit;
         }
         if(this.Renamed6595 != null)
         {
            this.Renamed6595.value = this.Renamed6597;
         }
         if(this.Renamed6596 != null)
         {
            this.Renamed6604();
         }
      }
      
      public function Renamed6605() : void
      {
         if(this.Renamed6594 != null)
         {
            this.Renamed6594.Renamed6605();
         }
         if(this.Renamed6595 != null)
         {
            this.Renamed6595.value = 0;
            this.Renamed6595.Renamed6605();
         }
         if(this.Renamed6596 != null)
         {
            this.Renamed6596.value = 0;
            this.Renamed6596.Renamed6605();
         }
      }
      
      public function Renamed6606() : void
      {
         this.Renamed6593.x = 14;
         this.Renamed6593.y = 11;
         var _loc1_:Number = this.Renamed6593.width + this.Renamed6593.x;
         if(this.Renamed6594 != null)
         {
            this.Renamed6594.x = _loc1_ + 6;
            this.Renamed6594.y = 11;
            _loc1_ = this.Renamed6594.width + this.Renamed6594.x;
         }
         if(this.Renamed6595 != null)
         {
            this.Renamed6595.x = _loc1_ + 10;
            this.Renamed6595.y = 11;
            _loc1_ = this.Renamed6595.width + this.Renamed6595.x;
         }
         if(this.Renamed6596 != null)
         {
            if(this.Renamed6595 != null)
            {
               this.Renamed6596.x = this.Renamed6595.x;
               this.Renamed6596.y = this.Renamed6595.y;
            }
            else
            {
               this.Renamed6596.x = _loc1_ + 10;
               this.Renamed6596.y = 11;
               _loc1_ = this.Renamed6596.width + this.Renamed6596.x;
            }
         }
         this.Renamed6592.width = 12 + _loc1_;
      }
      
      public function Renamed6607(param1:int) : void
      {
         if(this.Renamed6595 != null)
         {
            this.Renamed6595.visible = false;
         }
         this.Renamed6596 = new Renamed6584(Renamed6590,BattleInfoIcons.TIME_LIMIT,Renamed6582.instance,false);
         this.Renamed6596.Renamed6608(param1);
         addChild(this.Renamed6596);
      }
      
      public function Renamed6604() : void
      {
         if(this.Renamed6595 != null)
         {
            this.Renamed6595.visible = true;
         }
         removeChild(this.Renamed6596);
         this.Renamed6596 = null;
      }
      
      public function Renamed6609(param1:int) : void
      {
         this.Renamed6595.Renamed6608(param1);
      }
      
      public function Renamed6610() : void
      {
         this.Renamed6595.Renamed6611();
      }
      
      public function Renamed6598(param1:Boolean) : void
      {
         if(this.Renamed6594 == null && param1 && this.scoreLimit > 0)
         {
            this.Renamed6594 = new Renamed6583(this.Renamed6601(),this.Renamed6599(),Renamed6582.instance);
            this.Renamed6594.value = this.scoreLimit;
            addChild(this.Renamed6594);
         }
      }
   }
}

