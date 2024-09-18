package projects.tanks.client.panel.model.dailyquest
{
   public class §native const in§
   {
      private var _count:int;
      
      private var _name:String;
      
      public function §native const in§(param1:int = 0, param2:String = null)
      {
         super();
         this._count = param1;
         this._name = param2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DailyQuestPrizeInfo [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "name = " + this.name + " ";
         return _loc1_ + "]";
      }
   }
}

