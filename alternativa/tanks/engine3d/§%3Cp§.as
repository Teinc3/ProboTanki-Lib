package alternativa.tanks.engine3d
{
   import alternativa.tanks.services.colortransform.§]#y§;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import org1.osflash.signals.Signal;
   
   public class §<p§ implements §package var else§
   {
      private static const §extends catch var§:ColorTransform = new ColorTransform();
      
      private var colorTransform:ColorTransform;
      
      public function §<p§()
      {
         this.§default catch function§ = new Signal();
         this.textures = new Dictionary();
         super();
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:BitmapData = null;
         if(this.colorTransform == null)
         {
            clearDictionary(this.textures);
         }
         else
         {
            _loc1_ = 0;
            for(_loc2_ in this.textures)
            {
               _loc3_ = this.textures[_loc2_];
               _loc3_.dispose();
               delete this.textures[_loc2_];
               _loc1_++;
            }
         }
      }
      
      public function getTexture(param1:BitmapData, param2:Boolean = true) : BitmapData
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         var _loc3_:BitmapData = this.textures[param1];
         if(_loc3_ == null)
         {
            _loc3_ = this.§return import§(param1,param2);
            this.textures[param1] = _loc3_;
         }
         return _loc3_;
      }
      
      private function §return import§(param1:BitmapData, param2:Boolean = true) : BitmapData
      {
         if(this.colorTransform == null)
         {
            return param1;
         }
         if(param2)
         {
            return §]#y§.§for const try§(param1,this.colorTransform);
         }
         return param1.clone();
      }
      
      public function §^^§(param1:Function) : void
      {
         this.§default catch function§.add(param1);
      }
      
      public function setColorTransform(param1:ColorTransform) : void
      {
         var _loc2_:ColorTransform = this.§null const throw§(param1);
         if(!§]#y§.§0"]§(this.colorTransform,_loc2_))
         {
            this.colorTransform = _loc2_;
            this.§,"Y§();
            this.§default catch function§.dispatch();
         }
      }
      
      private function §null const throw§(param1:ColorTransform) : ColorTransform
      {
         var _loc2_:ColorTransform = §]#y§.clone(param1);
         if(§]#y§.§0"]§(_loc2_,§extends catch var§))
         {
            return null;
         }
         return _loc2_;
      }
      
      private function §,"Y§() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:BitmapData = null;
         var _loc3_:int = 0;
         for(_loc1_ in this.textures)
         {
            _loc2_ = this.textures[_loc1_];
            if(_loc2_ != _loc1_)
            {
               _loc2_.dispose();
               _loc3_++;
            }
            this.textures[_loc1_] = this.§return import§(_loc1_);
         }
      }
   }
}

