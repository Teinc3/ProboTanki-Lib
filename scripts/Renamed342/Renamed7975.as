package Renamed342
{
   import alternativa.tanks.engine3d.IndexedTextureConstructor;
   import alternativa.utils.TextureMaterialRegistry;
   import alternativa.utils.textureutils.ITextureConstructorListener;
   import alternativa.utils.textureutils.TextureConstructor;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class Renamed7975 extends EventDispatcher implements ITextureConstructorListener
   {
      private var Renamed1368:TextureMaterialRegistry;
      
      private var maxBatchSize:int;
      
      private var totalCounter:int;
      
      private var Renamed8015:int;
      
      private var Renamed8016:Vector.<Renamed7939>;
      
      private var constructors:Vector.<IndexedTextureConstructor>;
      
      private var Renamed3363:Boolean;
      
      private var textures:Vector.<BitmapData>;
      
      public function Renamed7975(param1:TextureMaterialRegistry, param2:int)
      {
         this.textures = new Vector.<BitmapData>();
         super();
         this.Renamed1368 = param1;
         this.maxBatchSize = param2;
      }
      
      public function destroy() : void
      {
         var _loc1_:BitmapData = null;
         this.Renamed3363 = true;
         this.Renamed8016 = null;
         this.constructors = null;
         for each(_loc1_ in this.textures)
         {
            _loc1_.dispose();
         }
         this.textures = null;
      }
      
      public function run(param1:Vector.<Renamed7939>) : void
      {
         this.Renamed8016 = param1.concat();
         this.totalCounter = 0;
         this.Renamed8015 = 0;
         this.Renamed8017();
         this.Renamed8018();
      }
      
      private function Renamed8017() : void
      {
         this.constructors = new Vector.<IndexedTextureConstructor>(this.maxBatchSize);
         var _loc1_:int = 0;
         while(_loc1_ < this.maxBatchSize)
         {
            this.constructors[_loc1_] = new IndexedTextureConstructor();
            _loc1_++;
         }
      }
      
      private function Renamed8018() : void
      {
         var _loc1_:IndexedTextureConstructor = null;
         for each(_loc1_ in this.constructors)
         {
            this.Renamed8019(_loc1_);
         }
      }
      
      private function Renamed8019(param1:IndexedTextureConstructor) : void
      {
         var _loc2_:Renamed7939 = null;
         if(this.Renamed8015 < this.Renamed8016.length)
         {
            param1.index = this.Renamed8015;
            _loc2_ = this.Renamed8016[this.Renamed8015++];
            param1.createTexture(_loc2_.Renamed7940(),this);
         }
      }
      
      [Obfuscation(rename="false")]
      public function onTextureReady(param1:TextureConstructor) : void
      {
         var _loc2_:IndexedTextureConstructor = IndexedTextureConstructor(param1);
         if(this.Renamed3363)
         {
            _loc2_.Renamed1634();
         }
         else
         {
            this.textures.push(_loc2_.texture);
            this.Renamed8020(_loc2_);
            ++this.totalCounter;
            if(this.totalCounter == this.Renamed8016.length)
            {
               this.complete();
            }
            else
            {
               this.Renamed8019(_loc2_);
            }
         }
      }
      
      private function Renamed8020(param1:IndexedTextureConstructor) : void
      {
         var _loc2_:Renamed7939 = this.Renamed8016[param1.index];
         _loc2_.Renamed1179(this.Renamed1368.getMaterial(param1.texture));
      }
      
      private function complete() : void
      {
         this.Renamed8016 = null;
         this.constructors = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function Renamed7989() : Vector.<BitmapData>
      {
         return this.textures;
      }
   }
}

