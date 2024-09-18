package Renamed225
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Renamed5522
   {
      private var Renamed6364:int;
      
      private var Renamed6365:int;
      
      private var Renamed6366:Boolean;
      
      private var Renamed6367:ImageResource;
      
      private var Renamed6368:ImageResource;
      
      public function Renamed5522(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:ImageResource = null, param5:ImageResource = null)
      {
         super();
         this.Renamed6364 = param1;
         this.Renamed6365 = param2;
         this.Renamed6366 = param3;
         this.Renamed6367 = param4;
         this.Renamed6368 = param5;
      }
      
      public function get Renamed6369() : int
      {
         return this.Renamed6364;
      }
      
      public function set Renamed6369(param1:int) : void
      {
         this.Renamed6364 = param1;
      }
      
      public function get Renamed6370() : int
      {
         return this.Renamed6365;
      }
      
      public function set Renamed6370(param1:int) : void
      {
         this.Renamed6365 = param1;
      }
      
      public function get Renamed6371() : Boolean
      {
         return this.Renamed6366;
      }
      
      public function set Renamed6371(param1:Boolean) : void
      {
         this.Renamed6366 = param1;
      }
      
      public function get Renamed6372() : ImageResource
      {
         return this.Renamed6367;
      }
      
      public function set Renamed6372(param1:ImageResource) : void
      {
         this.Renamed6367 = param1;
      }
      
      public function get Renamed6373() : ImageResource
      {
         return this.Renamed6368;
      }
      
      public function set Renamed6373(param1:ImageResource) : void
      {
         this.Renamed6368 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "WeeklyQuestDescription [";
         _loc1_ += "currentQuestLevel = " + this.Renamed6369 + " ";
         _loc1_ += "currentQuestStreak = " + this.Renamed6370 + " ";
         _loc1_ += "doneForToday = " + this.Renamed6371 + " ";
         _loc1_ += "questImage = " + this.Renamed6372 + " ";
         _loc1_ += "rewardImage = " + this.Renamed6373 + " ";
         return _loc1_ + "]";
      }
   }
}

