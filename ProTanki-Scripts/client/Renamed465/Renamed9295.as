package Renamed465
{
   import Renamed136.Renamed663;
   import Renamed6578.Renamed6586;
   import Renamed253.Renamed6739;
   import alternativa.tanks.models.battle.battlefield.Renamed2395;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2654;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2552;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.Renamed2659;
   import assets.icons.BattleInfoIcons;
   import Renamed312.Renamed1585;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class Renamed9295 extends Sprite implements Renamed2552
   {
      private var Renamed6591:Renamed2395;
      
      private var Renamed9296:Renamed6586;
      
      private var Renamed9297:Renamed9298;
      
      private var Renamed9299:Renamed2658;
      
      private var Renamed9058:String;
      
      private var Renamed9300:Renamed2654;
      
      public function Renamed9295(param1:String, param2:int, param3:Renamed1585, param4:int, param5:Renamed2395, param6:Boolean)
      {
         super();
         this.Renamed6591 = param5;
         this.Renamed9058 = param1;
         this.Renamed9301(param2,param3,param4,param6);
      }
      
      public function Renamed2656(param1:Renamed2654) : void
      {
         this.Renamed9300 = param1;
         this.Renamed6606();
      }
      
      public function Renamed2555(param1:Renamed663) : void
      {
         Renamed2659(this.Renamed9299).showFlagAtBase(param1);
      }
      
      public function Renamed2556(param1:Renamed663) : void
      {
         Renamed2659(this.Renamed9299).showFlagCarried(param1);
      }
      
      public function Renamed2557(param1:Renamed663) : void
      {
         Renamed2659(this.Renamed9299).showFlagDropped(param1);
      }
      
      public function Renamed2560() : void
      {
         Renamed6739(this.Renamed9299).showFlagDropped();
      }
      
      public function Renamed2558() : void
      {
         Renamed6739(this.Renamed9299).showFlagAtBase();
      }
      
      public function Renamed2559() : void
      {
         Renamed6739(this.Renamed9299).showFlagCarried();
      }
      
      private function Renamed9301(param1:int, param2:Renamed1585, param3:int, param4:Boolean) : void
      {
         this.Renamed9302(param1,param2,param3,param4);
         this.Renamed9303(0,0);
         this.Renamed6606();
      }
      
      private function Renamed9302(param1:int, param2:Renamed1585, param3:int, param4:Boolean) : void
      {
         this.Renamed9296 = new Renamed6586(this.Renamed6591,param1,param2,param3,param4);
         addChild(this.Renamed9296);
      }
      
      private function Renamed9303(param1:int, param2:int) : void
      {
         if(this.Renamed6591 == Renamed2395.DM)
         {
            this.Renamed9297 = new Renamed9298(BattleInfoIcons.KILL_LIMIT);
            addChild(this.Renamed9297);
         }
         else
         {
            this.Renamed9299 = this.Renamed9304();
            this.Renamed2693(Renamed663.BLUE,param1);
            this.Renamed2693(Renamed663.RED,param2);
            addChild(DisplayObject(this.Renamed9299));
         }
      }
      
      private function Renamed9304() : Renamed2658
      {
         switch(this.Renamed6591)
         {
            case Renamed2395.TDM:
               return new Renamed9305();
            case Renamed2395.CTF:
               return new Renamed2659();
            case Renamed2395.Renamed2396:
               return new Renamed9306();
            case Renamed2395.AS:
               return new Renamed6739();
            default:
               throw new Error();
         }
      }
      
      public function Renamed5662(param1:String, param2:int) : void
      {
         if(this.Renamed6591 == Renamed2395.DM || this.Renamed6591 == Renamed2395.TDM)
         {
            this.Renamed9296.Renamed6600(param2);
            if(this.Renamed6591 == Renamed2395.DM && param1 == this.Renamed9058)
            {
               this.Renamed9297.Renamed2685(param2);
            }
            this.Renamed6606();
         }
      }
      
      public function Renamed2693(param1:Renamed663, param2:int) : void
      {
         this.Renamed9299.Renamed2693(param1,param2);
         this.Renamed9296.Renamed6600(param2);
         this.Renamed6606();
      }
      
      public function Renamed9307(param1:int) : void
      {
         this.Renamed9296.Renamed6603(param1);
         this.Renamed6606();
      }
      
      public function Renamed9308() : void
      {
         this.Renamed9296.reset();
         if(this.Renamed6591 == Renamed2395.DM)
         {
            this.Renamed9297.Renamed2685(0);
         }
         else
         {
            this.Renamed9299.Renamed2685(0,0);
         }
         this.Renamed6606();
      }
      
      public function Renamed9309(param1:Boolean) : void
      {
         this.Renamed9308();
         this.Renamed9296.Renamed6598(param1);
         this.Renamed6606();
      }
      
      public function Renamed9059() : void
      {
         this.Renamed9296.Renamed6605();
         this.Renamed6606();
      }
      
      public function Renamed6606() : void
      {
         this.Renamed9296.Renamed6606();
         var _loc1_:DisplayObject = this.Renamed6591 == Renamed2395.DM ? this.Renamed9297 : DisplayObject(this.Renamed9299);
         _loc1_.x = this.Renamed9296.width + 10;
         if(this.Renamed9300 != null)
         {
            this.Renamed9300.Renamed2655(this);
         }
      }
      
      public function Renamed6607(param1:int) : void
      {
         this.Renamed9296.Renamed6607(param1);
         this.Renamed6606();
      }
      
      public function Renamed6604() : void
      {
         this.Renamed9296.Renamed6604();
         this.Renamed6606();
      }
      
      public function Renamed6609(param1:int) : void
      {
         this.Renamed9296.Renamed6609(param1);
      }
      
      public function Renamed6610() : void
      {
         this.Renamed9296.Renamed6610();
      }
   }
}

