package fl.data
{
   public dynamic class TileListCollectionItem
   {
      public var source:String;
      
      public var label:String;
      
      public function TileListCollectionItem()
      {
         super();
      }
      
      public function toString() : String
      {
         return "[TileListCollectionItem: " + label + "," + source + "]";
      }
   }
}

