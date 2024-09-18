package alternativa.tanks.service.itempropertyparams
{
   import alternativa.tanks.gui.ItemPropertyIcon;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class §else package implements§
   {
      private var §import native§:int;
      
      private var _bitmapData:BitmapData;
      
      private var _name:String;
      
      private var properties:Vector.<ItemProperty>;
      
      private var §if set final§:§8!+§;
      
      private var _icon:ItemPropertyIcon;
      
      private var §2f§:Number;
      
      public function §else package implements§(param1:int, param2:BitmapData, param3:String, param4:Vector.<ItemProperty>, param5:§8!+§, param6:Number)
      {
         super();
         this.§import native§ = param1;
         this._bitmapData = param2;
         this._name = param3;
         this.properties = param4;
         this.§if set final§ = param5;
         this.§2f§ = param6;
         this._icon = new ItemPropertyIcon(param2);
      }
      
      public function get §switch const else§() : int
      {
         return this.§import native§;
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
      
      public function §+#_§() : Bitmap
      {
         return new Bitmap(this.bitmapData);
      }
      
      public function getProperties() : Vector.<ItemProperty>
      {
         return this.properties;
      }
      
      public function §catch package implements§() : §8!+§
      {
         return this.§if set final§;
      }
      
      public function §>8§() : Number
      {
         return this.§2f§;
      }
   }
}

