package Renamed4808
{
   import alternativa.types.Long;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.dailyquest.Renamed4365;
   
   public class Renamed5536
   {
      private var Renamed5539:Boolean;
      
      private var _description:String;
      
      private var Renamed5540:int;
      
      private var _image:ImageResource;
      
      private var Renamed5541:Vector.<Renamed4365>;
      
      private var _progress:int;
      
      private var Renamed5542:Long;
      
      private var Renamed5543:int;
      
      public function Renamed5536(param1:Boolean = false, param2:String = null, param3:int = 0, param4:ImageResource = null, param5:Vector.<Renamed4365> = null, param6:int = 0, param7:Long = null, param8:int = 0)
      {
         super();
         this.Renamed5539 = param1;
         this._description = param2;
         this.Renamed5540 = param3;
         this._image = param4;
         this.Renamed5541 = param5;
         this._progress = param6;
         this.Renamed5542 = param7;
         this.Renamed5543 = param8;
      }
      
      public function get Renamed5544() : Boolean
      {
         return this.Renamed5539;
      }
      
      public function set Renamed5544(param1:Boolean) : void
      {
         this.Renamed5539 = param1;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(param1:String) : void
      {
         this._description = param1;
      }
      
      public function get Renamed5545() : int
      {
         return this.Renamed5540;
      }
      
      public function set Renamed5545(param1:int) : void
      {
         this.Renamed5540 = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
      }
      
      public function get Renamed5546() : Vector.<Renamed4365>
      {
         return this.Renamed5541;
      }
      
      public function set Renamed5546(param1:Vector.<Renamed4365>) : void
      {
         this.Renamed5541 = param1;
      }
      
      public function get progress() : int
      {
         return this._progress;
      }
      
      public function set progress(param1:int) : void
      {
         this._progress = param1;
      }
      
      public function get questId() : Long
      {
         return this.Renamed5542;
      }
      
      public function set questId(param1:Long) : void
      {
         this.Renamed5542 = param1;
      }
      
      public function get Renamed5547() : int
      {
         return this.Renamed5543;
      }
      
      public function set Renamed5547(param1:int) : void
      {
         this.Renamed5543 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DailyQuestInfo [";
         _loc1_ += "canSkipForFree = " + this.Renamed5544 + " ";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "finishCriteria = " + this.Renamed5545 + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "prizes = " + this.Renamed5546 + " ";
         _loc1_ += "progress = " + this.progress + " ";
         _loc1_ += "questId = " + this.questId + " ";
         _loc1_ += "skipCost = " + this.Renamed5547 + " ";
         return _loc1_ + "]";
      }
   }
}

