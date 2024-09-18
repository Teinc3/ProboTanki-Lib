package §>#m§
{
   import alternativa.types.Long;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.dailyquest.§native const in§;
   
   public class §5!"§
   {
      private var §1#4§:Boolean;
      
      private var _description:String;
      
      private var §implements var dynamic§:int;
      
      private var _image:ImageResource;
      
      private var §3!^§:Vector.<§native const in§>;
      
      private var _progress:int;
      
      private var §dynamic set throw§:Long;
      
      private var §4!Z§:int;
      
      public function §5!"§(param1:Boolean = false, param2:String = null, param3:int = 0, param4:ImageResource = null, param5:Vector.<§native const in§> = null, param6:int = 0, param7:Long = null, param8:int = 0)
      {
         super();
         this.§1#4§ = param1;
         this._description = param2;
         this.§implements var dynamic§ = param3;
         this._image = param4;
         this.§3!^§ = param5;
         this._progress = param6;
         this.§dynamic set throw§ = param7;
         this.§4!Z§ = param8;
      }
      
      public function get §6#J§() : Boolean
      {
         return this.§1#4§;
      }
      
      public function set §6#J§(param1:Boolean) : void
      {
         this.§1#4§ = param1;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(param1:String) : void
      {
         this._description = param1;
      }
      
      public function get §2!O§() : int
      {
         return this.§implements var dynamic§;
      }
      
      public function set §2!O§(param1:int) : void
      {
         this.§implements var dynamic§ = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
      }
      
      public function get §,"5§() : Vector.<§native const in§>
      {
         return this.§3!^§;
      }
      
      public function set §,"5§(param1:Vector.<§native const in§>) : void
      {
         this.§3!^§ = param1;
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
         return this.§dynamic set throw§;
      }
      
      public function set questId(param1:Long) : void
      {
         this.§dynamic set throw§ = param1;
      }
      
      public function get §6#6§() : int
      {
         return this.§4!Z§;
      }
      
      public function set §6#6§(param1:int) : void
      {
         this.§4!Z§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DailyQuestInfo [";
         _loc1_ += "canSkipForFree = " + this.§6#J§ + " ";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "finishCriteria = " + this.§2!O§ + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "prizes = " + this.§,"5§ + " ";
         _loc1_ += "progress = " + this.progress + " ";
         _loc1_ += "questId = " + this.questId + " ";
         _loc1_ += "skipCost = " + this.§6#6§ + " ";
         return _loc1_ + "]";
      }
   }
}

