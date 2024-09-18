package Renamed188
{
   import Renamed1614.Renamed1615;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed5806
   {
      private var Renamed5808:int;
      
      private var _enabled:Boolean;
      
      private var Renamed4203:String;
      
      private var _mapName:String;
      
      private var _maxPeople:int;
      
      private var _preview:ImageResource;
      
      private var Renamed5809:Renamed1586;
      
      private var Renamed5810:Vector.<Renamed1587>;
      
      private var Renamed4205:Renamed1615;
      
      public function Renamed5806(param1:Boolean = false, param2:String = null, param3:String = null, param4:int = 0, param5:ImageResource = null, param6:Renamed1586 = null, param7:Vector.<Renamed1587> = null, param8:Renamed1615 = null)
      {
         super();
         this._enabled = param1;
         this.Renamed4203 = param2;
         this._mapName = param3;
         this._maxPeople = param4;
         this._preview = param5;
         this.Renamed5809 = param6;
         this.Renamed5810 = param7;
         this.Renamed4205 = param8;
      }
      
      public function get additionalCrystalsPercent() : int
      {
         return this.Renamed5808;
      }
      
      public function set additionalCrystalsPercent(param1:int) : void
      {
         this.Renamed5808 = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get mapId() : String
      {
         return this.Renamed4203;
      }
      
      public function set mapId(param1:String) : void
      {
         this.Renamed4203 = param1;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
      
      public function set mapName(param1:String) : void
      {
         this._mapName = param1;
      }
      
      public function get maxPeople() : int
      {
         return this._maxPeople;
      }
      
      public function set maxPeople(param1:int) : void
      {
         this._maxPeople = param1;
      }
      
      public function get preview() : ImageResource
      {
         return this._preview;
      }
      
      public function set preview(param1:ImageResource) : void
      {
         this._preview = param1;
      }
      
      public function get Renamed5629() : Renamed1586
      {
         return this.Renamed5809;
      }
      
      public function set Renamed5629(param1:Renamed1586) : void
      {
         this.Renamed5809 = param1;
      }
      
      public function get supportedModes() : Vector.<Renamed1587>
      {
         return this.Renamed5810;
      }
      
      public function set supportedModes(param1:Vector.<Renamed1587>) : void
      {
         this.Renamed5810 = param1;
      }
      
      public function get theme() : Renamed1615
      {
         return this.Renamed4205;
      }
      
      public function set theme(param1:Renamed1615) : void
      {
         this.Renamed4205 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "MapInfoCC [";
         _loc1_ += "additionalCrystalsPercent = " + this.additionalCrystalsPercent + " ";
         _loc1_ += "enabled = " + this.enabled + " ";
         _loc1_ += "mapId = " + this.mapId + " ";
         _loc1_ += "mapName = " + this.mapName + " ";
         _loc1_ += "maxPeople = " + this.maxPeople + " ";
         _loc1_ += "preview = " + this.preview + " ";
         _loc1_ += "rankLimit = " + this.Renamed5629 + " ";
         _loc1_ += "supportedModes = " + this.supportedModes + " ";
         _loc1_ += "theme = " + this.theme + " ";
         return _loc1_ + "]";
      }
   }
}

