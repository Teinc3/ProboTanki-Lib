package projects.tanks.clients.flash.resources.resource
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Clipping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.loaders.Parser3DS;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.display.BitmapData;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.SafeURLLoader;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import projects.tanks.clients.flash.resources.resource.loaders.BatchTextureLoader;
   import projects.tanks.clients.flash.resources.resource.loaders.TextureInfo;
   import projects.tanks.clients.flash.resources.resource.loaders.events.BatchTextureLoaderErrorEvent;
   
   public class Tanks3DSResource extends Resource
   {
      [Inject]
      public static var resourceLocalStorage:IResourceLocalStorage;
      
      public static const TYPE:int = 17;
      
      private static const LOADING_STATE_INFO:int = 1;
      
      private static const LOADING_STATE_TEXTURE_INFO:int = LOADING_STATE_INFO + 1;
      
      private static const LOADING_STATE_TEXTURES:int = LOADING_STATE_INFO + 2;
      
      private static const LOADING_STATE_3DS:int = LOADING_STATE_INFO + 3;
      
      protected static const BIT_LOADED_WITH_ERROR:int = 1 << 2;
      
      protected static const BIT_LOCAL:int = 1 << 3;
      
      private static const IMAGES_FILE:String = "images.xml";
      
      private static const MODEL_FILE:String = "object.3ds";
      
      public var textures:Object;
      
      public var objects:Vector.<Object3D>;
      
      public var parents:Vector.<Object3D>;
      
      private var urlLoader:SafeURLLoader;
      
      private var batchTextureLoader:BatchTextureLoader;
      
      private var resourceData:ResourceData;
      
      private var _modelBytes:ByteArray;
      
      private var loadingState:int = -1;
      
      public function Tanks3DSResource(param1:ResourceInfo)
      {
         this.resourceData = new ResourceData();
         super(param1);
      }
      
      override public function get description() : String
      {
         return "3DS";
      }
      
      public function getTextureForObject(param1:int) : BitmapData
      {
         var _loc2_:Mesh = this.objects[param1] as Mesh;
         if(_loc2_ == null || _loc2_.alternativa3d::faceList == null)
         {
            return null;
         }
         var _loc3_:TextureMaterial = _loc2_.alternativa3d::faceList.material as TextureMaterial;
         if(_loc3_ == null)
         {
            return null;
         }
         return this.textures[_loc3_.diffuseMapURL];
      }
      
      public function getObjectsByName(param1:RegExp) : Vector.<Object3D>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = null;
         var _loc4_:int = int(this.objects.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.objects[_loc5_];
            if(_loc2_.name != null && _loc2_.name.match(param1) != null)
            {
               if(_loc3_ == null)
               {
                  _loc3_ = new Vector.<Object3D>();
               }
               _loc3_.push(_loc2_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      override public function close() : void
      {
         switch(this.loadingState)
         {
            case LOADING_STATE_TEXTURE_INFO:
               this.urlLoader.close();
               this.destroyTextureInfoLoader();
               break;
            case LOADING_STATE_TEXTURES:
               this.batchTextureLoader.close();
               break;
            case LOADING_STATE_3DS:
               this.urlLoader.close();
         }
         this.textures = null;
         this.batchTextureLoader = null;
         this.urlLoader = null;
      }
      
      override public function unload() : void
      {
         var _loc1_:BitmapData = null;
         if(this.textures != null)
         {
            for each(_loc1_ in this.textures)
            {
               _loc1_.dispose();
            }
         }
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         this.loadTextureInfo();
      }
      
      override protected function doReload() : void
      {
         switch(this.loadingState)
         {
            case LOADING_STATE_TEXTURE_INFO:
               this.urlLoader.close();
               this.destroyTextureInfoLoader();
               this.loadTextureInfo();
               break;
            case LOADING_STATE_TEXTURES:
               this.batchTextureLoader.reload();
               break;
            case LOADING_STATE_3DS:
               this.urlLoader.close();
               this.destroyModelLoader();
               this.loadModel();
         }
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:ByteArray = null;
         var _loc6_:int = 0;
         var _loc7_:ByteArray = null;
         this.listener = param2;
         var _loc8_:int = param1.readInt();
         this.resourceData.modelData = new ByteArray();
         param1.readBytes(this.resourceData.modelData,0,_loc8_);
         this._modelBytes = this.resourceData.modelData;
         var _loc9_:int = param1.readInt();
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc3_ = param1.readUTF();
            _loc4_ = param1.readInt();
            _loc5_ = new ByteArray();
            param1.readBytes(_loc5_,0,_loc4_);
            _loc6_ = param1.readInt();
            _loc7_ = null;
            if(_loc6_ > 0)
            {
               _loc7_ = new ByteArray();
               param1.readBytes(_loc7_,0,_loc6_);
            }
            this.resourceData.imageData.push(new ImageData(_loc3_,new TextureByteData(_loc5_,_loc7_)));
            _loc10_++;
         }
         this.buildResourceData();
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
         var _loc2_:ImageData = null;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(this.resourceData.modelData.length);
         _loc3_.writeBytes(this.resourceData.modelData);
         var _loc4_:uint = this.resourceData.imageData.length;
         _loc3_.writeInt(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.resourceData.imageData[_loc5_];
            _loc3_.writeUTF(_loc2_.name);
            _loc3_.writeInt(_loc2_.data.diffuseData.length);
            _loc3_.writeBytes(_loc2_.data.diffuseData);
            if(_loc2_.data.opacityData == null)
            {
               _loc3_.writeInt(0);
            }
            else
            {
               _loc3_.writeInt(_loc2_.data.opacityData.length);
               _loc3_.writeBytes(_loc2_.data.opacityData);
            }
            _loc5_++;
         }
         this.resourceData = null;
         param1.onSerializationComplete(this,_loc3_);
      }
      
      private function loadTextureInfo() : void
      {
         this.urlLoader = new SafeURLLoader();
         this.urlLoader.addEventListener(Event.OPEN,this.onImagesXMLLoadingOpen);
         this.urlLoader.addEventListener(Event.COMPLETE,this.onImagesXMLLoadingComplete);
         this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onFatalError);
         this.urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onFatalError);
         this.urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.onHttpStatus);
         this.urlLoader.load(new URLRequest(baseUrl + IMAGES_FILE));
         startTimeoutTracking();
         this.loadingState = LOADING_STATE_TEXTURE_INFO;
      }
      
      private function onHttpStatus(param1:HTTPStatusEvent) : *
      {
      }
      
      private function onImagesXMLLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function onImagesXMLLoadingComplete(param1:Event) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = XML(this.urlLoader.data);
         this.destroyTextureInfoLoader();
         if(_loc3_.name() != "images")
         {
            throw new Error("Invalid map.xml contents. ResourceId=" + this.id);
         }
         var _loc4_:Object = {};
         var _loc5_:int = 0;
         for each(_loc2_ in _loc3_.image)
         {
            _loc5_++;
            _loc4_[_loc2_.@name] = new TextureInfo(_loc2_.attribute("new-name"),_loc2_.@alpha);
         }
         if(_loc5_ > 0)
         {
            this.batchTextureLoader = new BatchTextureLoader(_loc4_);
            this.batchTextureLoader.addEventListener(Event.OPEN,this.onBitmapsLoadingOpen);
            this.batchTextureLoader.addEventListener(Event.COMPLETE,this.onTexturesLoadingComplete);
            this.batchTextureLoader.addEventListener(BatchTextureLoaderErrorEvent.LOADER_ERROR,this.onBatchLoadingError);
            this.batchTextureLoader.load(baseUrl);
            this.loadingState = LOADING_STATE_TEXTURES;
            startTimeoutTracking();
         }
         else
         {
            this.loadModel();
         }
      }
      
      private function onBatchLoadingError(param1:BatchTextureLoaderErrorEvent) : void
      {
         setFlags(BIT_LOADED_WITH_ERROR);
      }
      
      private function onBitmapsLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function onTexturesLoadingComplete(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Object = this.batchTextureLoader.textures.data;
         for(_loc2_ in _loc3_)
         {
            this.resourceData.imageData.push(new ImageData(_loc2_,this.batchTextureLoader.textures.getValue(_loc2_)));
         }
         this.destroyBatchLoader();
         this.loadModel();
      }
      
      private function loadModel() : void
      {
         this.urlLoader = new SafeURLLoader();
         this.urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         this.urlLoader.addEventListener(Event.OPEN,this.onModelLoadingOpen);
         this.urlLoader.addEventListener(Event.COMPLETE,this.onModelLoadingComplete);
         this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onFatalError);
         this.urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onFatalError);
         this.urlLoader.load(new URLRequest(baseUrl + MODEL_FILE));
         this.loadingState = LOADING_STATE_3DS;
         startTimeoutTracking();
      }
      
      private function onModelLoadingOpen(param1:Event) : void
      {
         updateLastActivityTime();
      }
      
      private function onModelLoadingComplete(param1:Event) : void
      {
         this.resourceData.modelData = this.urlLoader.data;
         this._modelBytes = this.resourceData.modelData;
         this.destroyModelLoader();
         this.buildResourceData();
      }
      
      private function buildResourceData() : void
      {
         var _loc1_:Mesh = null;
         var _loc2_:Parser3DS = new Parser3DS();
         _loc2_.parse(this.resourceData.modelData);
         this.objects = _loc2_.objects;
         this.parents = _loc2_.parents;
         var _loc3_:int = 0;
         while(_loc3_ < this.objects.length)
         {
            _loc1_ = this.objects[_loc3_] as Mesh;
            if(_loc1_ != null)
            {
               this.initMesh(_loc1_);
            }
            _loc3_++;
         }
         if(this.resourceData.imageData.length > 0)
         {
            this.resourceData.batchConstructor.addEventListener(Event.COMPLETE,this.onTexturesComplete);
            this.resourceData.batchConstructor.run(4,this.resourceData.imageData);
         }
         else
         {
            this.completeResourceLoading(false);
         }
      }
      
      private function onTexturesComplete(param1:Event) : void
      {
         this.textures = this.resourceData.batchConstructor.textures;
         this.completeResourceLoading(true);
      }
      
      private function completeResourceLoading(param1:Boolean) : void
      {
         if(hasAnyFlags(BIT_LOADED_WITH_ERROR | BIT_LOCAL) || !resourceLocalStorage.enabled)
         {
         }
         if(param1)
         {
            completeLoading();
         }
         else
         {
            setTimeout(completeLoading,0);
         }
      }
      
      private function initMesh(param1:Mesh) : void
      {
         param1.weldVertices(0.001,0.0001);
         param1.weldFaces(0.01,0.001,0.01);
         param1.calculateVerticesNormalsByAngle(ResourceParams.ANGLE_THRESHOLD,0.01);
         param1.clipping = Clipping.FACE_CLIPPING;
         param1.sorting = Sorting.AVERAGE_Z;
         param1.calculateBounds();
      }
      
      private function onFatalError(param1:ErrorEvent) : void
      {
         listener.onResourceLoadingFatalError(this,param1.text);
      }
      
      private function destroyTextureInfoLoader() : void
      {
         if(this.urlLoader != null)
         {
            this.urlLoader.removeEventListener(Event.OPEN,this.onImagesXMLLoadingOpen);
            this.urlLoader.removeEventListener(Event.COMPLETE,this.onImagesXMLLoadingComplete);
            this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onFatalError);
            this.urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onFatalError);
            this.urlLoader = null;
         }
      }
      
      private function destroyBatchLoader() : void
      {
         if(this.batchTextureLoader != null)
         {
            this.batchTextureLoader.removeEventListener(Event.OPEN,this.onBitmapsLoadingOpen);
            this.batchTextureLoader.removeEventListener(Event.COMPLETE,this.onTexturesLoadingComplete);
            this.batchTextureLoader.removeEventListener(BatchTextureLoaderErrorEvent.LOADER_ERROR,this.onBatchLoadingError);
            this.batchTextureLoader = null;
         }
      }
      
      private function destroyModelLoader() : void
      {
         if(this.urlLoader != null)
         {
            this.urlLoader.removeEventListener(Event.OPEN,this.onModelLoadingOpen);
            this.urlLoader.removeEventListener(Event.COMPLETE,this.onModelLoadingComplete);
            this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onFatalError);
            this.urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onFatalError);
            this.urlLoader = null;
         }
      }
   }
}

import flash.utils.ByteArray;

class ResourceData
{
   public var modelData:ByteArray;
   
   public var imageData:Vector.<ImageData>;
   
   public var batchConstructor:BatchTextureConstructor;
   
   public function ResourceData()
   {
      this.imageData = new Vector.<ImageData>();
      this.batchConstructor = new BatchTextureConstructor();
      super();
   }
}

import alternativa.utils.textureutils.TextureByteData;

class ImageData
{
   public var name:String;
   
   public var data:alternativa.utils.textureutils.TextureByteData;
   
   public function ImageData(param1:String, param2:alternativa.utils.textureutils.TextureByteData)
   {
      this.data = new alternativa.utils.textureutils.TextureByteData();
      super();
      this.name = param1;
      this.data = param2;
   }
}

import alternativa.utils.textureutils.ITextureConstructorListener;
import alternativa.utils.textureutils.TextureConstructor;
import flash.events.Event;
import flash.events.EventDispatcher;

class BatchTextureConstructor extends EventDispatcher implements ITextureConstructorListener
{
   public var textures:Object;
   
   private var entries:Vector.<ImageData>;
   
   private var maxBatchSize:int;
   
   private var batchSize:int;
   
   private var firstBatchIndex:int;
   
   private var batchCouner:int;
   
   private var totalCounter:int;
   
   private var constructors:Vector.<IndexedTextureConstructor>;
   
   public function BatchTextureConstructor()
   {
      super();
   }
   
   public function run(param1:int, param2:Vector.<ImageData>) : void
   {
      this.maxBatchSize = param1;
      this.entries = param2;
      this.textures = {};
      this.constructors = new Vector.<IndexedTextureConstructor>(param1);
      var _loc3_:int = 0;
      while(_loc3_ < param1)
      {
         this.constructors[_loc3_] = new IndexedTextureConstructor();
         _loc3_++;
      }
      this.totalCounter = 0;
      this.firstBatchIndex = 0;
      this.createBatch();
   }
   
   private function createBatch() : void
   {
      var _loc1_:IndexedTextureConstructor = null;
      this.batchCouner = 0;
      var _loc2_:int = this.firstBatchIndex + this.maxBatchSize;
      if(_loc2_ > this.entries.length)
      {
         _loc2_ = int(this.entries.length);
      }
      this.batchSize = _loc2_ - this.firstBatchIndex;
      var _loc3_:int = 0;
      while(_loc3_ < this.batchSize)
      {
         _loc1_ = this.constructors[_loc3_];
         _loc1_.index = this.firstBatchIndex + _loc3_;
         _loc1_.createTexture(this.entries[_loc1_.index].data,this);
         _loc3_++;
      }
      this.firstBatchIndex = _loc2_;
   }
   
   private function complete() : void
   {
      this.constructors = null;
      this.entries = null;
      dispatchEvent(new Event(Event.COMPLETE));
   }
   
   public function onTextureReady(param1:alternativa.utils.textureutils.TextureConstructor) : void
   {
      var _loc2_:IndexedTextureConstructor = IndexedTextureConstructor(param1);
      this.textures[this.entries[_loc2_.index].name.toLowerCase()] = _loc2_.texture;
      ++this.totalCounter;
      ++this.batchCouner;
      if(this.totalCounter == this.entries.length)
      {
         this.complete();
      }
      else if(this.batchCouner == this.batchSize)
      {
         this.createBatch();
      }
   }
}

import alternativa.utils.textureutils.TextureConstructor;

class IndexedTextureConstructor extends alternativa.utils.textureutils.TextureConstructor
{
   public var index:int;
   
   public function IndexedTextureConstructor()
   {
      super();
   }
}

