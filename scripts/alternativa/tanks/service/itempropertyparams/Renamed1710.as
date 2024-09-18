package alternativa.tanks.service.itempropertyparams
{
   import alternativa.tanks.gui.ItemPropertyIcon;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class Renamed1710
   {
      private var Renamed3711:int;
      
      private var _bitmapData:BitmapData;
      
      private var _name:String;
      
      private var properties:Vector.<ItemProperty>;
      
      private var Renamed3712:Renamed2149;
      
      private var _icon:ItemPropertyIcon;
      
      private var Renamed3713:Number;
      
      public function Renamed1710(param1:int, param2:BitmapData, param3:String, param4:Vector.<ItemProperty>, param5:Renamed2149, param6:Number)
      {
         super();
         this.Renamed3711 = param1;
         this._bitmapData = param2;
         this._name = param3;
         this.properties = param4;
         this.Renamed3712 = param5;
         this.Renamed3713 = param6;
         this._icon = new ItemPropertyIcon(param2);
      }
      
      public function get Renamed2154() : int
      {
         return this.Renamed3711;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get icon() : ItemPropertyIcon
      {
         return this._icon;
      }
      
      public function Renamed2003() : Bitmap
      {
         return new Bitmap(this.bitmapData);
      }
      
      public function getProperties() : Vector.<ItemProperty>
      {
         return this.properties;
      }
      
      public function Renamed2150() : Renamed2149
      {
         return this.Renamed3712;
      }
      
      public function Renamed2153() : Number
      {
         return this.Renamed3713;
      }
   }
}

