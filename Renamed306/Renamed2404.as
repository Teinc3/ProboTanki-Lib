package Renamed306
{
   import Renamed602.Renamed603;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Renamed2404
   {
      private var Renamed7543:Renamed1344;
      
      private var Renamed7544:Renamed2405;
      
      private var Renamed7545:Renamed2406;
      
      private var Renamed7546:Number;
      
      private var Renamed7547:MapResource;
      
      private var Renamed7548:Renamed603;
      
      private var Renamed7549:Number;
      
      private var Renamed7550:Renamed2521;
      
      private var Renamed7551:int;
      
      public function Renamed2404(param1:Renamed1344 = null, param2:Renamed2405 = null, param3:Renamed2406 = null, param4:Number = 0, param5:MapResource = null, param6:Renamed603 = null, param7:Number = 0, param8:Renamed2521 = null, param9:int = 0)
      {
         super();
         this.Renamed7543 = param1;
         this.Renamed7544 = param2;
         this.Renamed7545 = param3;
         this.Renamed7546 = param4;
         this.Renamed7547 = param5;
         this.Renamed7548 = param6;
         this.Renamed7549 = param7;
         this.Renamed7550 = param8;
         this.Renamed7551 = param9;
      }
      
      public function get Renamed2491() : Renamed1344
      {
         return this.Renamed7543;
      }
      
      public function set Renamed2491(param1:Renamed1344) : void
      {
         this.Renamed7543 = param1;
      }
      
      public function get Renamed2474() : Renamed2405
      {
         return this.Renamed7544;
      }
      
      public function set Renamed2474(param1:Renamed2405) : void
      {
         this.Renamed7544 = param1;
      }
      
      public function get fogParams() : Renamed2406
      {
         return this.Renamed7545;
      }
      
      public function set fogParams(param1:Renamed2406) : void
      {
         this.Renamed7545 = param1;
      }
      
      public function get gravity() : Number
      {
         return this.Renamed7546;
      }
      
      public function set gravity(param1:Number) : void
      {
         this.Renamed7546 = param1;
      }
      
      public function get Renamed7552() : MapResource
      {
         return this.Renamed7547;
      }
      
      public function set Renamed7552(param1:MapResource) : void
      {
         this.Renamed7547 = param1;
      }
      
      public function get Renamed2499() : Renamed603
      {
         return this.Renamed7548;
      }
      
      public function set Renamed2499(param1:Renamed603) : void
      {
         this.Renamed7548 = param1;
      }
      
      public function get Renamed2500() : Number
      {
         return this.Renamed7549;
      }
      
      public function set Renamed2500(param1:Number) : void
      {
         this.Renamed7549 = param1;
      }
      
      public function get Renamed2498() : Renamed2521
      {
         return this.Renamed7550;
      }
      
      public function set Renamed2498(param1:Renamed2521) : void
      {
         this.Renamed7550 = param1;
      }
      
      public function get ssaoColor() : int
      {
         return this.Renamed7551;
      }
      
      public function set ssaoColor(param1:int) : void
      {
         this.Renamed7551 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleMapCC [";
         _loc1_ += "dynamicShadowParams = " + this.Renamed2474 + " ";
         _loc1_ += "fogParams = " + this.fogParams + " ";
         _loc1_ += "gravity = " + this.gravity + " ";
         _loc1_ += "mapResource = " + this.Renamed7552 + " ";
         _loc1_ += "skyBoxRevolutionAxis = " + this.Renamed2499 + " ";
         _loc1_ += "skyBoxRevolutionSpeed = " + this.Renamed2500 + " ";
         _loc1_ += "skybox = " + this.Renamed2498 + " ";
         _loc1_ += "ssaoColor = " + this.ssaoColor + " ";
         return _loc1_ + "]";
      }
   }
}

