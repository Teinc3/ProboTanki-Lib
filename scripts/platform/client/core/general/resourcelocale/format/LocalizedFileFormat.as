package platform.client.core.general.resourcelocale.format
{
   public class LocalizedFileFormat
   {
      private var Renamed4056:Vector.<Renamed4057>;
      
      private var Renamed4058:Vector.<Renamed4059>;
      
      private var _images:Vector.<ImagePair>;
      
      private var Renamed4060:Vector.<Renamed4061>;
      
      private var Renamed4062:Vector.<Renamed4063>;
      
      private var Renamed4064:String;
      
      private var _strings:Vector.<StringPair>;
      
      public function LocalizedFileFormat(param1:Vector.<Renamed4057> = null, param2:Vector.<Renamed4059> = null, param3:Vector.<ImagePair> = null, param4:Vector.<Renamed4061> = null, param5:Vector.<Renamed4063> = null, param6:String = null, param7:Vector.<StringPair> = null)
      {
         super();
         this.Renamed4056 = param1;
         this.Renamed4058 = param2;
         this._images = param3;
         this.Renamed4060 = param4;
         this.Renamed4062 = param5;
         this.Renamed4064 = param6;
         this._strings = param7;
      }
      
      public function get booleans() : Vector.<Renamed4057>
      {
         return this.Renamed4056;
      }
      
      public function set booleans(param1:Vector.<Renamed4057>) : void
      {
         this.Renamed4056 = param1;
      }
      
      public function get Renamed4065() : Vector.<Renamed4059>
      {
         return this.Renamed4058;
      }
      
      public function set Renamed4065(param1:Vector.<Renamed4059>) : void
      {
         this.Renamed4058 = param1;
      }
      
      public function get images() : Vector.<ImagePair>
      {
         return this._images;
      }
      
      public function set images(param1:Vector.<ImagePair>) : void
      {
         this._images = param1;
      }
      
      public function get ints() : Vector.<Renamed4061>
      {
         return this.Renamed4060;
      }
      
      public function set ints(param1:Vector.<Renamed4061>) : void
      {
         this.Renamed4060 = param1;
      }
      
      public function get movies() : Vector.<Renamed4063>
      {
         return this.Renamed4062;
      }
      
      public function set movies(param1:Vector.<Renamed4063>) : void
      {
         this.Renamed4062 = param1;
      }
      
      public function get Renamed4066() : String
      {
         return this.Renamed4064;
      }
      
      public function set Renamed4066(param1:String) : void
      {
         this.Renamed4064 = param1;
      }
      
      public function get strings() : Vector.<StringPair>
      {
         return this._strings;
      }
      
      public function set strings(param1:Vector.<StringPair>) : void
      {
         this._strings = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LocalizedFileFormat [";
         _loc1_ += "booleans = " + this.booleans + " ";
         _loc1_ += "doubles = " + this.Renamed4065 + " ";
         _loc1_ += "images = " + this.images + " ";
         _loc1_ += "ints = " + this.ints + " ";
         _loc1_ += "movies = " + this.movies + " ";
         _loc1_ += "prefix = " + this.Renamed4066 + " ";
         _loc1_ += "strings = " + this.strings + " ";
         return _loc1_ + "]";
      }
   }
}

