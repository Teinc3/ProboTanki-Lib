package platform.client.fp10.core.resource
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public class BatchImageConstructor extends EventDispatcher
   {
      public var images:Vector.<BitmapData>;
      
      private var Renamed4097:Vector.<ByteArray>;
      
      private var loaders:Dictionary;
      
      private var Renamed4098:int;
      
      private var override:int;
      
      private var Renamed4099:int;
      
      private var Renamed4100:Boolean;
      
      private var Renamed4101:int;
      
      public function BatchImageConstructor()
      {
         this.loaders = new Dictionary();
         super();
      }
      
      public function Renamed4102(param1:Vector.<ByteArray>, param2:int) : void
      {
         if(this.Renamed4100)
         {
            throw new Error("Already running");
         }
         if(param1 == null)
         {
            throw new ArgumentError("Parameter imageDatas is null");
         }
         this.Renamed4097 = param1;
         this.Renamed4098 = param2;
         this.Renamed4100 = true;
         this.images = new Vector.<BitmapData>(param1.length);
         this.Renamed4101 = 0;
         this.override = 0;
         this.Renamed4099 = 0;
         if(param1.length > 0)
         {
            this.Renamed4103();
         }
         else
         {
            setTimeout(this.complete,0);
         }
      }
      
      private function Renamed4103() : void
      {
         var _loc1_:ImageLoader = null;
         while(this.override < this.Renamed4098 && this.Renamed4099 < this.Renamed4097.length)
         {
            _loc1_ = this.createLoader(this.Renamed4099);
            this.loaders[_loc1_] = true;
            ++this.override;
            ++this.Renamed4099;
         }
      }
      
      private function onImageComplete(param1:Event) : void
      {
         var _loc2_:ImageLoader = ImageLoader(LoaderInfo(param1.target).loader);
         --this.override;
         ++this.Renamed4101;
         delete this.loaders[_loc2_];
         this.images[_loc2_.index] = Bitmap(_loc2_.content).bitmapData;
         if(this.Renamed4101 == this.Renamed4097.length)
         {
            this.complete();
         }
         else
         {
            this.Renamed4103();
         }
      }
      
      private function createLoader(param1:int) : ImageLoader
      {
         var _loc2_:ImageLoader = new ImageLoader(param1);
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onImageComplete);
         _loc2_.loadBytes(this.Renamed4097[this.Renamed4099]);
         return _loc2_;
      }
      
      private function complete() : void
      {
         this.Renamed4100 = false;
         this.Renamed4097 = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

import flash.display.Loader;

class ImageLoader extends Loader
{
   public var index:int;
   
   public function ImageLoader(param1:int)
   {
      super();
      this.index = param1;
   }
}

