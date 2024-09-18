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
      
      private var §default set var§:Vector.<ByteArray>;
      
      private var loaders:Dictionary;
      
      private var §each catch break§:int;
      
      private var override:int;
      
      private var §]!#§:int;
      
      private var §continue var each§:Boolean;
      
      private var §true package switch§:int;
      
      public function BatchImageConstructor()
      {
         this.loaders = new Dictionary();
         super();
      }
      
      public function §default var implements§(param1:Vector.<ByteArray>, param2:int) : void
      {
         if(this.§continue var each§)
         {
            throw new Error("Already running");
         }
         if(param1 == null)
         {
            throw new ArgumentError("Parameter imageDatas is null");
         }
         this.§default set var§ = param1;
         this.§each catch break§ = param2;
         this.§continue var each§ = true;
         this.images = new Vector.<BitmapData>(param1.length);
         this.§true package switch§ = 0;
         this.override = 0;
         this.§]!#§ = 0;
         if(param1.length > 0)
         {
            this.§include package use§();
         }
         else
         {
            setTimeout(this.complete,0);
         }
      }
      
      private function §include package use§() : void
      {
         var _loc1_:ImageLoader = null;
         while(this.override < this.§each catch break§ && this.§]!#§ < this.§default set var§.length)
         {
            _loc1_ = this.createLoader(this.§]!#§);
            this.loaders[_loc1_] = true;
            ++this.override;
            ++this.§]!#§;
         }
      }
      
      private function onImageComplete(param1:Event) : void
      {
         var _loc2_:ImageLoader = ImageLoader(LoaderInfo(param1.target).loader);
         --this.override;
         ++this.§true package switch§;
         delete this.loaders[_loc2_];
         this.images[_loc2_.index] = Bitmap(_loc2_.content).bitmapData;
         if(this.§true package switch§ == this.§default set var§.length)
         {
            this.complete();
         }
         else
         {
            this.§include package use§();
         }
      }
      
      private function createLoader(param1:int) : ImageLoader
      {
         var _loc2_:ImageLoader = new ImageLoader(param1);
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onImageComplete);
         _loc2_.loadBytes(this.§default set var§[this.§]!#§]);
         return _loc2_;
      }
      
      private function complete() : void
      {
         this.§continue var each§ = false;
         this.§default set var§ = null;
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

