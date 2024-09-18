package platform.client.fp10.core.resource.types
{
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.display.BitmapData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.Renamed4105;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceFlags;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   
   public class LocalizedImageResource extends Resource
   {
      [Inject]
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const STATE_LOADING_DIFFUSE:int = 0;
      
      private static const STATE_LOADING_ALPHA:int = 1;
      
      private static const CHAR_I:int = 73;
      
      private static const CHAR_M:int = 77;
      
      private static const CHAR_G:int = 71;
      
      private static const BINARY_VERSION:int = 2;
      
      private var state:int;
      
      private var lastFileSize:int;
      
      private var loader:SafeURLLoader;
      
      private var byteData:ImageByteData;
      
      private var imageBuilder:ImageBuilder;
      
      private var _data:BitmapData;
      
      private var Renamed4111:Boolean;
      
      private var Renamed4112:String;
      
      private var Renamed4113:int;
      
      private var Renamed4114:String;
      
      private var Renamed4115:String;
      
      public function LocalizedImageResource(param1:ResourceInfo)
      {
         super(param1);
         this.Renamed4114 = localeService.language.toLowerCase();
         this.Renamed4115 = localeService.defaultLanguage.toLowerCase();
         this.Renamed4112 = this.Renamed4116();
         this.Renamed4111 = param1.Renamed4108(this.Renamed4112 + "_alpha.jpg") != null;
      }
      
      public function get data() : BitmapData
      {
         return this._data;
      }
      
      override public function get description() : String
      {
         return "Image";
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         if(param1.bytesAvailable < 4 || param1.readByte() != CHAR_I || param1.readByte() != CHAR_M || param1.readByte() != CHAR_G || param1.readByte() != BINARY_VERSION)
         {
            return false;
         }
         this.listener = param2;
         var _loc3_:ImageByteData = new ImageByteData();
         var _loc4_:int = param1.readInt();
         _loc3_.diffuseData = new ByteArray();
         param1.readBytes(_loc3_.diffuseData,0,_loc4_);
         var _loc5_:int = param1.readInt();
         if(_loc5_ > 0)
         {
            _loc3_.opacityData = new ByteArray();
            param1.readBytes(_loc3_.opacityData,0,_loc5_);
         }
         this.imageBuilder = new ImageBuilder();
         this.imageBuilder.build(_loc3_,this.onImageComplete);
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(CHAR_I);
         _loc2_.writeByte(CHAR_M);
         _loc2_.writeByte(CHAR_G);
         _loc2_.writeByte(BINARY_VERSION);
         _loc2_.writeInt(this.byteData.diffuseData.length);
         _loc2_.writeBytes(this.byteData.diffuseData);
         if(this.byteData.opacityData != null)
         {
            _loc2_.writeInt(this.byteData.opacityData.length);
            _loc2_.writeBytes(this.byteData.opacityData);
         }
         else
         {
            _loc2_.writeInt(0);
         }
         this.byteData = null;
         param1.onSerializationComplete(this,_loc2_);
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.loadDiffuseData();
      }
      
      override protected function doReload() : void
      {
         this.loader.close();
         switch(this.state)
         {
            case STATE_LOADING_DIFFUSE:
               this.loadDiffuseData();
               break;
            case STATE_LOADING_ALPHA:
               this.loadOpacityData();
         }
      }
      
      override protected function createDummyData() : Boolean
      {
         this._data = new StubBitmapData(16711680);
         return true;
      }
      
      private function onLoadingComplete(param1:Event) : void
      {
         stopTimeoutTracking();
         switch(this.state)
         {
            case STATE_LOADING_DIFFUSE:
               this.processDiffuseData(this.loader.data);
               break;
            case STATE_LOADING_ALPHA:
               this.processAlphaData(this.loader.data);
         }
      }
      
      private function loadDiffuseData() : void
      {
         this.state = STATE_LOADING_DIFFUSE;
         this.loader = this.createLoader(true);
         this.loader.load(new URLRequest(baseUrl + this.Renamed4117()));
         startTimeoutTracking();
         status = "Diffuse map requested";
      }
      
      private function loadOpacityData() : void
      {
         this.state = STATE_LOADING_ALPHA;
         this.loader = this.createLoader(false);
         this.loader.load(new URLRequest(baseUrl + this.Renamed4118()));
         status = "Opacity map requested";
         startTimeoutTracking();
      }
      
      private function processDiffuseData(param1:ByteArray) : void
      {
         this.byteData = new ImageByteData();
         this.byteData.diffuseData = param1;
         this.lastFileSize = resourceInfo.Renamed4108(this.Renamed4117()).Renamed4109;
         if(this.Renamed4111)
         {
            this.loadOpacityData();
         }
         else
         {
            this.completeRemoteLoading();
         }
      }
      
      private function processAlphaData(param1:ByteArray) : void
      {
         this.byteData.opacityData = param1;
         this.completeRemoteLoading();
      }
      
      private function completeRemoteLoading() : void
      {
         this.loader = null;
         this.imageBuilder = new ImageBuilder();
         this.imageBuilder.build(this.byteData,this.onImageComplete);
      }
      
      private function onImageComplete(param1:ImageBuilder) : void
      {
         this._data = param1.image;
         if(hasAllFlags(ResourceFlags.LOCAL) || !resourceLocalStorage.enabled)
         {
            this.byteData = null;
         }
         this.completeLoading();
      }
      
      override protected function completeLoading() : void
      {
         super.completeLoading();
         this.imageBuilder = null;
         baseUrl = null;
      }
      
      private function onLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
         listener.onResourceLoadingStart(this);
      }
      
      private function onLoadingError(param1:ErrorEvent) : void
      {
         stopTimeoutTracking();
         if(this.state == STATE_LOADING_DIFFUSE)
         {
            this._data = new StubBitmapData(16711680);
         }
         setFlags(ResourceFlags.LOADED);
         baseUrl = null;
         this.byteData = null;
         listener.onResourceLoadingError(this,param1.toString());
      }
      
      private function onLoadingProgress(param1:ProgressEvent) : void
      {
         updateLastActivityTime();
      }
      
      private function createLoader(param1:Boolean) : SafeURLLoader
      {
         var _loc2_:SafeURLLoader = new SafeURLLoader();
         _loc2_.dataFormat = URLLoaderDataFormat.BINARY;
         if(param1)
         {
            _loc2_.addEventListener(Event.OPEN,this.onLoadingOpen);
         }
         _loc2_.addEventListener(ProgressEvent.PROGRESS,this.onLoadingProgress);
         _loc2_.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadingError);
         _loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadingError);
         return _loc2_;
      }
      
      private function Renamed4117() : String
      {
         return this.Renamed4112 + ".jpg";
      }
      
      private function Renamed4118() : String
      {
         return this.Renamed4112 + "_alpha.jpg";
      }
      
      private function Renamed4116() : String
      {
         var _loc1_:String = null;
         var _loc2_:Renamed4105 = resourceInfo.Renamed4108(this.Renamed4114 + ".jpg");
         if(_loc2_ == null)
         {
            _loc2_ = resourceInfo.Renamed4108(this.Renamed4115 + ".jpg");
            if(_loc2_ == null)
            {
               _loc1_ = this.getFileName("_alpha.jpg");
               if(_loc1_ != null)
               {
                  return _loc1_.substr(0,_loc1_.length - "_alpha.jpg".length);
               }
               _loc1_ = this.getFileName(".jpg");
               return _loc1_.substr(0,_loc1_.length - ".jpg".length);
            }
            return this.Renamed4115;
         }
         return this.Renamed4114;
      }
      
      private function getFileName(param1:String) : String
      {
         var _loc2_:Renamed4105 = resourceInfo.Renamed4108(this.Renamed4114 + param1);
         if(_loc2_ == null)
         {
            _loc2_ = resourceInfo.Renamed4108(this.Renamed4115 + param1);
            if(_loc2_ == null)
            {
               return this.Renamed4119(param1);
            }
         }
         return _loc2_.Renamed4107;
      }
      
      private function Renamed4119(param1:String) : String
      {
         var _loc2_:Renamed4105 = null;
         var _loc3_:String = null;
         for each(_loc2_ in resourceInfo.Renamed4104)
         {
            _loc3_ = _loc2_.Renamed4107;
            if(_loc3_.length >= param1.length && _loc3_.substr(_loc3_.length - param1.length,param1.length) == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}

import flash.utils.ByteArray;

class ImageByteData
{
   public var diffuseData:ByteArray;
   
   public var opacityData:ByteArray;
   
   public function ImageByteData()
   {
      super();
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.utils.ByteArray;
import platform.client.fp10.core.resource.ResourceUtils;

class ImageBuilder
{
   public var image:BitmapData;
   
   private var byteData:ImageByteData;
   
   private var callback:Function;
   
   private var loader:Loader;
   
   public function ImageBuilder()
   {
      super();
   }
   
   public function build(param1:ImageByteData, param2:Function) : void
   {
      this.byteData = param1;
      this.callback = param2;
      this.load(param1.diffuseData,this.onDiffuseComplete);
   }
   
   private function onDiffuseComplete(param1:Event) : void
   {
      this.image = Bitmap(this.loader.content).bitmapData;
      if(this.byteData.opacityData != null)
      {
         this.load(this.byteData.opacityData,this.onOpacityComplete);
      }
      else
      {
         this.complete();
      }
   }
   
   private function onOpacityComplete(param1:Event) : void
   {
      var _loc2_:BitmapData = Bitmap(this.loader.content).bitmapData;
      this.image = ResourceUtils.mergeBitmapAlpha(this.image,_loc2_,true);
      this.complete();
   }
   
   private function load(param1:ByteArray, param2:Function) : void
   {
      this.loader = new Loader();
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,param2);
      this.loader.loadBytes(param1);
   }
   
   private function complete() : void
   {
      this.loader = null;
      this.callback.call(null,this);
   }
}

